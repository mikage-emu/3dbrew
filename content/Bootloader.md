+++
title = 'Bootloader'
+++

The bootloader is the binary code stored in the ARM9 and ARM11 boot ROMs
and hence is ran when the 3DS is powered on. Its purpose is initializing
hardware and loading the [system firmware](FIRM "wikilink") from the
internal [NAND memory](Flash_Filesystem "wikilink")..

Besides NATIVE_FIRM, the bootloader is also capable of booting other
firmwares (such as TWL_FIRM and AGB_FIRM). However, this will result
either in a Japanese error screen or a system shutdown, directly after
FIRM Launching.

## Boot ROM

Upon boot, parts of the ARM9 and ARM11 boot ROMs are protected by
writing to [CFG_SYSPROT9](CONFIG#CFG_SYSPROT9 "wikilink") and
[CFG_SYSPROT11](CONFIG#CFG_SYSPROT11 "wikilink"), respectively. The ARM9
and ARM11 boot ROMs are identical for all 3DS consoles (3DS, 3DS XL,
2DS, New 3DS, New 3DS XL, New 2DS XL)

## NAND FIRM boot

Boot9 is not hardcoded to only handle 2 FIRM partitions: it parses all 8
NCSD partitions for this. Boot9 will attempt to use every partition
listed in the NCSD which is an actual FIRM partition, in the same order
listed in the NCSD, until booting one of them succeeds. Among the
not-yet-processed partitions, the FIRM which has the highest value at
u32 firmhdr+4 will have a FIRM-boot attempted first. Since that value is
normally 0x0, the order of FIRM-partition processing is normally
identical to the order of the NCSD partitions.

Boot9 is hard-coded for using [AES](AES_Registers "wikilink") keyslot
0x6 for NAND crypto.

## Non-NAND FIRM boot

Boot9 can also boot from non-NAND. For this, a different set of RSA
pubks are used(separate pubks for retail/devunit like NAND). The
spiflash FIRM image for this is also encrypted with AES-CBC using a
normal key stored in prot_boot9(separate for retail/devunit). This
encryption is basically used instead of what is used for
NAND-firm-partitions. This encryption is only used for the FIRM
sections, the FIRM header is used raw. The AES keyslot for this is only
overwritten afterwards when booting from non-NAND fails. AES keyslot
0x3F is used for this.

```
 CTR_word[0] = firmimageoffset;//FIRM section offset from FIRM header
 CTR_word[1] = outbufaddr;//FIRM section load addr
 CTR_word[2] = readsize;//FIRM section size
 CTR_word[3] = readsize;//FIRM section size
```

When booting from NAND fails, boot9 will then attempt to boot from Wifi
SPI-flash(this only triggers when the wifi module hw is properly
accessible/connected, which is normally the case). The base offset for
spiflash FIRM is 0x400. Note that this region(all data prior to offset
0x1F300) is write-protected by the spiflash(not writable from 3DS-mode /
DS-mode).

Additionally, if the shell is closed and a special key combination
(Start + Select + X) is held, boot9 will attempt to boot from an
inserted NTR cartridge before booting from NAND. Note: While normally on
O3DS/2DS the console will not turn on if the shell is closed (or this is
faked by holding a magnet to the console), when this special key
combination is held holding down the power button will cause boot to
occur anyway.

For non-NAND booting, NCSD / FIRM-backup is not used.

## SDMMC

Boot9 has code implemented for using SD(HC) cards, but the input
deviceids used by boot9 for those functions are hard-coded for NAND.
However, it is possible to use an SD(HC) card in place of the NAND if
the NAND chip is first disconnected, and an SD card connected to the
bus. Due to the CID being different, partitions will need to be
re-encrypted and TWL mode will not work, due to the MBR being in the
NCSD header. Using sighax, it may be possible to replace the NCSD
header.

## Boot9 RSA keyslots

The following are initialized during main() startup, by
initialize_rsakeyslots_pubk(). Each of these, for the ones which are
actually set, have different keydata for retail/devunit.

- 0: Not set.
- 1: Used for the NAND FIRM signature.
- 2: Used for the non-NAND-FIRM signature.
- 3: Used for the NAND-NCSD FIRM signature.

When FIRM loading is successful,
initialize_x07ffbd00_x07ffc100_rsakeyslotsprivk() is called, right
before calling the final function in main(). Besides ITCM writing, this
overwrites all 4 RSA keyslots with modulus + private-exponents loaded
from boot9 data.

initialize_x07ffbd00_x07ffc100_rsakeyslotsprivk(): This initializes the
4 0x100-byte/0x200-byte chunks at
0x07ffb800+0x500(0x07ffbd00)/0x07ffb800+0x900(0x07ffc100). End address
of the first section is 0x07ffc100(start addr of the second section),
end address of the second section is 0x07ffc900. Hence, the first
section total size is 0x400-bytes, while the second section total size
is 0x800-bytes.

These are initialized using via the boot9 data image, with ptrs from
DTCM. Seperate keydata is used for retail/devunit.

When initializing the first ITCM area: rsa_setkeyslot_privk() is called
for all 4 RSA keyslots. The modulo for each one is also copied to
(index\*0x100) + 0x07ffb800 + 0x500. The private exponent is not copied
into ITCM.

The second ITCM area is initialized by copying 4 0x200-byte entries in a
loop. These are RSA pubks+privks, which Boot9 doesn't use itself at all
besides this copy loop.

## Boot9 image data memory layout

0xffffb088 is the beginning of the boot9 image data section.

- 0xffffb088 size 0x38-bytes: This is the array used during
  FIRM-section-loading for the memory-range blacklist for FIRM sections.
- 0xffffb0c0(end-addr of the above area) size 0x20-bytes: Unknown.
- 0xffffb0e0(end-addr of the above area) size 0x2f80-bytes: This is
  \*all\* of the keys stored in the image.
- 0xffffe060(end addr of the above key-area) size 0x230-bytes: This is
  the initial DTCM image @ 0xFFF00000, see below.
- 0xffffe290(DTCM_image_end) - {boot9 image end}: All-zero.

Layout of the 0x2f80-byte key-area at 0xffffb0e0:

- 0xffffb0e0 size 0x2600-bytes: This is the RSA key-data, see below.
- 0xffffd6e0(end-addr of the above area) size 0x40-bytes: This is the
  keydata used for crypting the entire OTP with keyslot 0x3f, used by
  main(). The first 0x20-bytes is for retail, the remaining 0x20-bytes
  starting at 0xffffd700 is for devunit. Chunk+0(retail=0xffffd6e0
  devunit=0xffffd700) is the normalkey, chunk+0x10(retail=0xffffd6f0
  devunit=0xffffd710) is the AES-IV.
- ...
- 0xffffd760: size 0x100-bytes: First 0x80-bytes is for retail, the
  remaining 0x80-bytes at 0xffffd7e0 is for devunit. This 0x80-byte
  block is copied to 0x07ffcd00 by a Boot9 function, however, that code
  actually does the copy in two 0x40-bytes chunks.
- 0xffffd860(end-addr of the above area) size 0x400-bytes: This is the
  bootrom_dataptr passed to the aes-keyinit function for retail. See the
  below Tools section for how this is processed.
- 0xffffdc60(end-addr of the above area) size 0x400-bytes: This is the
  devunit version of the above the 0x400-byte chunk. This is very last
  chunk of data in the boot9 data-section key-area: end addr for this
  area is 0xffffe060.

Layout of the 0x2600-byte RSA key-data at 0xffffb0e0: First 0x1300-bytes
is for retail, the remaining 0x1300-bytes starting at 0xffffc3e0 is for
devunit.

- +0x0 retail=0xffffb0e0 devunit=0xffffc3e0: RSA modulo for keyslot3,
  initialized by initialize_rsakeyslots_pubk().
- +0x100 retail=0xffffb1e0 devunit=0xffffc4e0: RSA modulo for keyslot1,
  initialized by initialize_rsakeyslots_pubk().
- +0x200 retail=0xffffb2e0 devunit=0xffffc5e0: RSA modulo for keyslot2,
  initialized by initialize_rsakeyslots_pubk().
- +0x300 size 0x200, retail=0xffffb3e0 devunit=0xffffc6e0: First
  0x100-bytes is the RSA modulo, then the following 0x100-bytes is the
  RSA privk(private-exponent). This is for RSA-engine keyslot0 with
  initialize_x07ffbd00_x07ffc100_rsakeyslotsprivk(), which also copies
  this modulo to the array starting at 0x07ffbd00.
- +0x500 size 0x200, retail=0xffffb5e0 devunit=0xffffc8e0: Used the same
  as the above block except for slot1.
- +0x700 size 0x200, retail=0xffffb7e0 devunit=0xffffcae0: Used the same
  as the above block except for slot2.
- +0x900 size 0x200, retail=0xffffb9e0 devunit=0xffffcce0: Used the same
  as the above block except for slot3.
- +0xb00 size 0x200, retail=0xffffbbe0 devunit=0xffffcee0: First
  0x100-bytes is the RSA modulo, then the following 0x100-bytes is the
  RSA privk(private-exponent). The 0x200-bytes here is copied to slot0
  in the array at 0x07ffc100 by
  initialize_x07ffbd00_x07ffc100_rsakeyslotsprivk().
- +0xd00 size 0x200, retail=0xffffbde0 devunit=0xffffd0e0: Used the same
  as the above block except for slot1.
- +0xf00 size 0x200, retail=0xffffbfe0 devunit=0xffffd2e0: Used the same
  as the above block except for slot2.
- +0x1100 size 0x200, retail=0xffffc1e0 devunit=0xffffd4e0: Used the
  same as the above block except for slot3.

## Boot9 DTCM layout

Most of this is just ptrs / other unknown data, not actual keys.
However, there is an unknown 0x10-byte block @ +0x124(there's a ptr
initialized for this block elsewhere).

## Boot11 image data memory layout

- 0x0001817c..0x000181f4 size 0x78-bytes: This is the bootrom error
  screen font gfx data. This begins at the exact end-address of the crt0
  code, the rest of the protected boot11 code begins at this
  end-address(0x000181f4). To extract the font gfx data from there, the
  30 dwords at this address need to be converted to big endian. The
  correct resolution (when displayed as raw) is 32x30x1. The bootrom
  font looks very similar to [this
  font](https://robey.lag.net/2010/01/23/tiny-monospace-font.html).
- 0x00019400 is the beginning of the boot11 data area, the first 8-bytes
  here are unknown.
- 0x00019408..0x0001b498 size 0x2090-bytes: This is the blowfish keydata
  which gets copied to arm9itcm_twlkeydata+0x3e0 later.
- 0x0001c498..0x0001c4f8 size 0x60-bytes: This is the data which
  eventually gets copied to arm9itcm_twlkeydata+0x380.
- 0x0001c4f8..0x0001c538 size 0x40-bytes: This is the data which
  eventually gets copied to arm9itcm_twlkeydata+0x340.
- 0x0001c538..0x0001c578 size 0x40-bytes: This is the data which
  eventually gets copied to arm9itcm_twlkeydata+0x300.
- 0x0001c578..0x0001c5f8 size 0x80-bytes: This is the data which
  eventually gets copied to arm9itcm_twlkeydata+0x280.
- 0x0001c5f8..0x0001c678 size 0x80-bytes: This is the data which
  eventually gets copied to arm9itcm_twlkeydata+0x0.
- 0x0001c678..0x0001c878 size 0x200-bytes: This is the data which
  eventually gets copied to arm9itcm_twlkeydata+0x80.
- 0x0001c878..0x0001d078 size 0x800-bytes: These are the 3DS RSA-2048
  modulus which are eventually copied to arm9_itcm+0x4900: on retail the
  first 4 are copied there by boot9, on devunit the last 4 are copied to
  itcm.
- 0x0001d078 size 0x120-bytes is the initial data for the .data section
  @ 0x1ffe8000, this is the very end of the protected arm11-bootrom.

## AES keys

See the Tools section for how Boot9 initializes the keyslots.

See also [here](AES_Registers "wikilink").

For an issue with console-unique key-init, see
[here](OTP_Registers "wikilink").

## BootROM Errors

Sample error-screen(where firm0+firm1 RSA signatures were corrupted):

```
 BOOTROM 8046
 ERRCODE: 00F800FF
 DEDEFFFF FFFFFFFF
 00000000 00000000
```

- 1st line is:
  `print_string(..., "BOOTROM %X", 0x8046);//This last param comes from the .pool.`
- 2nd line is:
  `print_string(..., "ERRCODE: %08X", *((unsigned int*)(0x1FFFE000+0xC)));//See below memory notes.`
- 3rd line is:
  `` print_string(..., "%08X %08X", *((unsigned int*)(0x1FFFE000+0x10))`, `*((unsigned int*)(0x1fffe000+0x14)));//See below memory notes. ``
- 4th line is:
  `` print_string(..., "%08X %08X",*((unsigned int*)(0x1FFFE000+0x18))`, `*((unsigned int*)(0x1fffe000+0x1C)));//See below memory notes. ``

## 0x1FFFE000 memory

This memory is used by boot9 mainly for sending info to the arm11 for
the error-screen. The data in this region is still stored in memory by
the time the ARM9+ARM11 jumps to FIRM.

Among boot9/boot11, the 3 words at 0x1FFFE000 seem to be *only* accessed
by the boot11 function initializing those words.

- u32 0x1FFFE000+0: ARM11 MPCore "Cycle Counter Register (CCNT)".
- u32 0x1FFFE000+4: ARM11 MPCore "Count Register 0 (PMN0)".
- u32 0x1FFFE000+8: ARM11 MPCore "Count Register 1 (PMN0)".
- 8bit-entry-array 0x1FFFE000+0xC: 8bit status-codes initialized by
  boot9 main(), for the FIRM-boot devices. +0 is NAND, +1 is NTRCARD and
  +2 is wifi-spiflash.
- ...
- 8bit-entry-array 0x1FFFE000+0x10: Status-codes originally from
  nand_findfirmpartition_loadfirm(), for each of the 8 NCSD partitions.

## BootROM Status Codes

| Value     | Description                                                                                                                                                                                                             |
|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00      | Success                                                                                                                                                                                                                 |
| 0xEE(~17) | NCSD header validation function failed: NCSD magicnum is invalid or RSA verification failed.                                                                                                                            |
| 0xDE(~33) | FIRM header validation function failed: FIRM magicnum is invalid or RSA verification failed.                                                                                                                            |
| 0xDF(~32) | Failed to read sector data from the device.                                                                                                                                                                             |
| 0xCF(~48) | FIRM section validation function failed: FIRM section is invalid.                                                                                                                                                       |
| 0xF7(~8)  | A NAND FIRM from another partition was already found with a priority(firmhdr+4) \>= to the value for the current partition's FIRM priority.                                                                             |
| 0xF8(~7)  | The FIRM magicnum(firmhdr+0) is invalid.                                                                                                                                                                                |
| 0xFF(~0)  | Initial value for each entry in the 8-entry array of status-codes for the NAND NCSD partitions. Indicates that the partition is not a FIRM partition(partition fs type isn't 0x3 or partition fs crypt-type isn't 0x2). |

## Boot9 startup

0xffff0000 jumps to 0xffff8000. 0xffff8000 is crt0:

- Very first thing this does is clear u8 register 0x10000002
  ([CFG_RST11](CONFIG_Registers#CFG_RST11 "wikilink")) bit 0 to zero.
- Then sp is initialized for each cpumode, IRQs/FIQs are disabled during
  the first mode-switch.
- Order of mode-switches + sp initialization: svc-mode = 0xfff04000,
  irq-mode = 0xfff03f00, system-mode = 0xfff03b00. Hence, the rest of
  the code following this runs in system-mode.
- Then L_ffff80cc/mpu_init() is called.
- Then L_ffff0038() is called, which initializes the exception-handler
  addresses @ 0x08000000.
- Then L_ffff81b8() is called(r4 + lr are saved on the DTCM stack),
  which after calling a memclear function which doesn't do anything, it
  then clears 0x08000030 size 0x10. Here the DTCM at 0xfff00000 size
  0x4000 is cleared.
- Then L_ffff81b4() is called, which branches to DTCM_init(). This
  copies the initial DTCM data from the Boot9 data image into boot9,
  then it clears 0xFFF00230 - 0xFFF01AC0.
- Then LT_ffff8228/main is jumped to, with LR set to the address of an
  infinite-branch-loop instruction.

mpu_init():

- Bitmask 0x000f9005 is cleared in the cp15 control register. MCR
  instructions which do then following are then executed: flush entire
  instruction cache, flush entire data cache, and drain write buffer.
- Then the 8 [MPU](Memory_layout "wikilink") memregions are initialized.
- ITCM memregion reg = 0x24: baseaddr=0x0, size = 128MB(0x08000000).
- DTCM memregion reg = 0xfff0000a: baseaddr=0xfff00000,
  size=16KB(0x00004000).
- Then instruction cachable and data cachable/bufferable bits for the
  MPU regions are setup.
- Then the instruction/data access permissions for the MPU regions are
  setup.
- Lastly bitmask 0x0005707d is orred in the cp15 control register.

## Boot9 main()

```
 The following functions are called: LT_ffff2024(), LT_ffff1ff8(), pxi_init(), rsa_init(), initialize_rsakeyslots_pubk(), crypto_initialize(), and aesengine_reset().
 Then AES keyslot 0x3F is setup: aesengine_setnormalkey(0x3f, 5, ptr) is called. ptr on retail(CFG_UNITINFO check) is 0xffffd6e0, 0xffffd700 for devunit. Then essentially, aesengine_setctr(5, ptr+0x10) is executed.
 Then AES keyslot 0x3f is selected.
 When calling the following functions, if any of them return zero, it will immediately jump to setting ptr to 0x10012000(otp), otherwise when all of them return non-zero ptr = sp+0x94. otp_decrypt(sp+4), otp_verify(sp+4), initialize_consoleunique_itcm(sp+4, 0x07ffb800).
 Then the following is executed: initialize_aeskeys_wrap(ptr, 0x70);
 Then sp+4 size 0x100 is cleared to zero.
 
 ...
 
 NAND firm-boot code-block is described below. Note that boot9 is basically hard-coded to use deviceid NAND, not SD.
 {
   timer_updatestoredstate() is called, then the AES keyslot for NAND-FIRM is selected(0x6).
   Then LT_ffff56c8() is called, if that returns non-zero the statuscode variable is set to ~2 then it jumps to NAND_BOOTEND.
   Then LT_ffff5774(0x201) is called, if that returns non-zero the statuscode variable is set to ~1 then it jumps to NAND_BOOTEND.
   Then fsdriver_setup_mmc() is called. Then nand_findfirmpartition_loadfirm(0) is called, with the statuscode variable set to the retval.
   Executes a loop which runs 8 times: write the output from get_errorcode_arrayentry_xfff005e8(loopindex) to u8 0x1fffe000+0x10+loopindex(copy the array of 32bit error-codes for all 8 NCSD partitions initialized by nand_findfirmpartition_loadfirm() to the array of 8bit entries at 0x1fffe000+0x10).
 
   NAND_BOOTEND:
   Then the statuscode variable is written to u8 0x1fffe000+0xc.
   Then LT_ffff5690(0x201, 0x1fffe018, 0x1fffe01c) is called.
   Then LT_ffff5644() is called.
   Then timer_updatestoredstate() is called.
   When statuscode==0 for success, it jumps to FIRMLOAD_END. Otherwise, it continues to the next code-block.
 }
 
 Wifi spi-flash firm-boot code-block, executed when no FIRM was loaded successfully so far.
 {
   timer_updatestoredstate() is called.
 
   Then spi_wififlash_cmdgetstatusreg(sp+0x100) is executed. When bit0 of the output u8 at sp+0x100 is clear, it will continue this code-block, otherwise it will set the statuscode variable to ~1 then jump to SPIFLASH_BOOTEND.
   Then fsdriver_setup_wififlash() is called.
   Here read_firmhdr_validate_loadfirm(0, 2) is called, with the statuscode variable set to the retval.
 
   SPIFLASH_BOOTEND:
   Then the statuscode variable is written to u8 0x1fffe000+0xe.
   Then timer_updatestoredstate() is called.
   When statuscode==0 for success, it jumps to FIRMLOAD_END. Otherwise, it executes writenormalkey_keyslot3f(), then jumps to FIRMLOAD_FAILURE.
 }
 
 FIRMLOAD_END:
 Here it calls firmhdr_getarm11_entrypoint() and firmhdr_getarm9_entrypoint(). Immediately after calling each function it checks if the retval is 0, if so it then jumps to FIRMLOAD_FAILURE.
 After calling initialize_x07ffbd00_x07ffc100_rsakeyslotsprivk(), it jumps to FIRMLOAD_EXIT.
 
 FIRMLOAD_FAILURE:
 Here it clears 0x07ffb800 size 0x3c70 to zero, endaddr = 0x07fff470.
 Then it continues to FIRMLOAD_EXIT.
 
 FIRMLOAD_EXIT:
 Here firmboot() is called, which should never return. The instruction after this bl is a call for panic().
```

## Boot11

- ...

main():

```
 LT_1263c();
 ...
 LT_13944()
 ...
 pxi_init();
 initializefuncptr_firmboot_start(firmbootbegin_funcptr);
 firmboot();
 return;
```

LT_12220/initializefuncptr_firmboot_start

```
 inr0=funcptr
 This writes inr0 to address 0x1ffe8028, then returns.
 This initializes the funcptr which firmboot() can call after the very first func-call.
```

LT_13944

```
 if(`[`i2cmcu_readregf`](I2C_Registers "wikilink")`(sp+0)==0)
 {
   return (*((u8*)0x10147000) >> 4) & 1;//Reads `[`GPIO`](GPIO_Registers "wikilink")` when reading I2C fails.
 }
 Here it basically does "return <byte loaded from sp+0> ^ 0x2". Hence in this case, it will return 0x2 when the system shell is closed(sleep-mode), otherwise 0x0 is returned.
```

LT_12454/firmboot

```
 This is the arm11 version of the boot9 firmboot() function, like boot9 this is the final function called from main(). The functionality for these two functions are identical, minus addresses.
 ptr = firmboot_loadentrypoint11();
 funcptr = *(0x1ffe8028);
 if(funcptr)funcptr(ptr);
 LT_11ffc(ptr);
 return;
```

## Boot Procedure

- 0 seconds - unit is powered on. The ARM9 and ARM11
  [bootroms](Memory_layout "wikilink") begin execution.
- \<= ~1 second - BootROMs fully run, load FIRM, etc. The loaded FIRM
  begins running.
  - The ARM11 sysmodules included with FIRM are launched by
    ARM11-kernel, etc.
  - The [PM](Process_Manager_Services "wikilink") module launches
    [NS](NS "wikilink").
  - If [auto-booting](Home_Menu#Auto-Boot_Function "wikilink") is
    needed, NS will [auto-boot](NS#Auto-boot "wikilink") titles.
  - Otherwise, NS will instead launch [ErrDisp](ErrDisp "wikilink") and
    the [current active
    menu](Configuration_Memory#ACTIVEMENUTID "wikilink") via the PM
    module. For retail units, this menu is usually the [Home
    Menu](Home_Menu "wikilink"). Note that the PM module first launches
    the module dependencies when launching a process, prior to actually
    launching the process.
  - The further Home Menu startup process is described
    [here](Home_Menu#Home_Menu_startup "wikilink"). This includes Home
    Menu manually launching various sysmodules.

<!-- -->

- 4 seconds - the LCD screens are initialized.

<!-- -->

- 7 seconds - [Home Menu](Home_Menu "wikilink") is fully
  initialized/loaded.

## NAND Reads during Boot

During a successful boot on 6.x, the bootloader (and firm) reads the
following sectors from NAND (in this order):

```
00000000 (NCSD Partition Table)
```

```
Only verify 'FIRM' magic? (A second Header-read will be attempted even if everything except the magic is 0xFF...)
0B130000 (FIRM Partition)
0B530000 (Secondary FIRM Partition)
```

```
Verify RSA signature and parse Header:
0B130000 (FIRM: Header)
0B130200 (FIRM: Section 1)
0B163E00 (FIRM: Section 2)
0B193E00 (FIRM: Section 3)
```

```
00013000 .. Below is probably NATIVE_FIRM booting ..
00014000
00015000
00016000
00017000
```

```
09011A00
09011C00
09012000
09012400
...
```

## Error Codes

When the 3DS does not find the NAND chip, the following error is
displayed:

<figure>
<img src="../CTR_Bootrom_Error.jpg" title="CTR_Bootrom_Error.jpg"
width="240" />
<figcaption>CTR_Bootrom_Error.jpg</figcaption>
</figure>

| Error                                          | Description                                                                                  |
|------------------------------------------------|----------------------------------------------------------------------------------------------|
| `00F800FE 00000000 00000000 00000200 00000000` | Error when having SD-card reader connected to NAND during boot.                              |
| `00F800FE 00000000 00000000 00000400 00000000` | NAND not found error (?)                                                                     |
| `00F800FE FFFFFFFF FFFFFFFF 00000080 00800000` | NAND error when DAT1 was used as DAT0.                                                       |
| `00F800FE FFFFFFFF FFFFFFFF 00000005 00800000` | NAND error when DAT2 was used as DAT0.                                                       |
| `00F800FE FFFFFFFF FFFFFFFF 00000005 00000000` | NAND error when DAT3 was used as DAT0.                                                       |
| `00F800FF F8F8FFFF FFFFFFFF 00000000 00000000` | Both the firm0 and firm1 partitions are corrupt (failed signature checks).                   |
| `00F800FF DEDEFFFF FFFFFFFF 00000000 00000000` | Both the firm0 and firm1 partitions are corrupt (possibly related to certain flags missing?) |
| `00F800FF CFCFFFFF FFFFFFFF 00000000 00000000` | Both the firm0 and firm1 partitions are corrupt                                              |
| `00F800EE FFFFFFFF FFFFFFFF 00000000 00000000` | [NCSD](NCSD "wikilink") header in sector 0 is corrupt (failed signature check).              |

## Hardware Failure indications

When a hardware failure is detected, a LED indicator is shown.

If you replace a Nintendo 3ds console's screen with another Nintendo 3ds
model's screen, the console powers on, the screens stays black, but
after a minute, the wireless LED blinks four times, stays on for a
second, then powers off. The blue led stays on, though.

We do not have much information about this as usually, when a hardware
failure is detected, the console crashes or powers off immediately.

## Tools

- [boot9_tools](https://github.com/yellows8/boot9_tools)

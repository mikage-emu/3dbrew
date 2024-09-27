+++
title = 'FIRM'
+++

This page describes the file format for the [3DS'
Firmware](Title_list#00040138_-_System_Firmware "wikilink"), it contains
up to four 'sections' of data comprising the ARM9 and ARM11 kernels, and
some fundamental processes. The firmware sections are not encrypted. In
a nutshell, a FIRM contains all the data required to set up the ARM9 and
ARM11 kernels, and basic operating functionality.

The ARM9 section contains the ARM9 kernel (and loader) and the Process9
NCCH (which is the only process run in user mode on the ARM9). The ARM11
sections contain the ARM11 kernel (and loader), and various ARM11
process NCCHs. For NATIVE_FIRM/SAFE_MODE_FIRM these ARM11 processes are
sm, fs, pm, loader, and pxi. Normally the 4th section is not used. The
code loaded from FIRM is constantly running on the system until another
FIRM is launched. The ARM11 kernel is hard-coded to always decompress
the ExeFS .code of embedded ARM11 NCCHs without checking the exheader
compression bit.

## FIRM Header

| OFFSET | SIZE             | DESCRIPTION                                                                                                                                                                                                                                                     |
|--------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000  | 4                | Magic 'FIRM'                                                                                                                                                                                                                                                    |
| 0x004  | 4                | Boot priority (highest value = max prio), this is normally zero.                                                                                                                                                                                                |
| 0x008  | 4                | ARM11 Entrypoint                                                                                                                                                                                                                                                |
| 0x00C  | 4                | ARM9 Entrypoint                                                                                                                                                                                                                                                 |
| 0x010  | 0x030            | Reserved                                                                                                                                                                                                                                                        |
| 0x040  | 0x0C0 (0x030\*4) | Firmware Section Headers                                                                                                                                                                                                                                        |
| 0x100  | 0x100            | RSA-2048 signature of the FIRM header's SHA-256 hash. The signature is checked when bootrom/Process9 are doing FIRM-launch (with the public key being hardcoded in each). The signature is not checked when installing FIRM to the NAND firm0/firm1 partitions. |

## Firmware Section Headers

| OFFSET | SIZE  | DESCRIPTION                                                                                                                                                                                                                                                                                                                      |
|--------|-------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000  | 4     | Byte offset                                                                                                                                                                                                                                                                                                                      |
| 0x004  | 4     | Physical address where the section is loaded to.                                                                                                                                                                                                                                                                                 |
| 0x008  | 4     | Byte-size. While loading FIRM this is the field used to determine whether the section exists or not, by checking for value 0x0.                                                                                                                                                                                                  |
| 0x00C  | 4     | Copy-method (0 = NDMA, 1 = XDMA, 2 = CPU mem-copy), Process9 ignores this field. Boot9 doesn't immediately throw an error when this isn't 0..2. In that case it will jump over section-data-loading which then results in the hash verification with the below hash being done with the hash already stored in the SHA hardware. |
| 0x010  | 0x020 | SHA-256 Hash of Firmware Section                                                                                                                                                                                                                                                                                                 |

The contents of individual sections *may* be encrypted if the FIRM is
not meant to be booted from NAND, i.e. if it is meant to be booted from
SPI flash or NTR cartridge. If hash checks fail for all FIRM sections if
treated as plaintext, it may be worth trying to check if the sections
are encrypted. The encryption is detailed on [the bootloader
page](Bootloader#Non-NAND_FIRM_boot "wikilink").

## [New_3DS](New_3DS "wikilink") FIRM

For New3DS firmwares (NATIVE_FIRM, TWL_FIRM, ..), the ARM9 FIRM binary
has an additional layer of crypto. At the end of each ARM9 binary,
there's a plaintext loader. The format of the FIRM header is identical
to regular 3DS FIRM(the RSA modulo is the same as regular 3DS too).

Before checking [CFG_SYSPROT9](CONFIG_Registers "wikilink") the loader
main() does the following:

- On [9.5.0-X](9.5.0-22 "wikilink"): executes a nop instruction with
  r0=0 and r1=\<address of arm9binhdr+0x50\>.
- Clears bit6 in [REG_AESKEYCNT](AES_Registers "wikilink").

If [CFG_SYSPROT9](CONFIG_Registers#CFG_SYSPROT9 "wikilink") bit 1 is
clear (which means the OTP area is unlocked and so it knows that this is
a hard reboot), it does the following things:

- Clears 0x200-bytes on the stack, then reads
  [NAND](Flash_Filesystem "wikilink") sector 0x96(NAND image offset
  0x12C00), with size 0x200-bytes into that stack buffer.
- Checks [CFG_SYSPROT9](CONFIG_Registers#CFG_SYSPROT9 "wikilink") bit 1
  again, if it's set then it executes a panic function(set r0-r2=0,
  execute nop instruction, then execute instruction "bkpt 0x99").
- Hashes data from the OTP region
  [0x10012000-0x10012090](IO_Registers "wikilink") using SHA256 via the
  [SHA](SHA_Registers "wikilink") hardware.
- Clears bit6 in [REG_AESKEYCNT](AES_Registers "wikilink"). Initializes
  AES keyslot 0x11 keyX, keyY to the lower and higher portion of the
  above hash, respectively. Due to the above hashed data, the keyX+keyY
  here are console-unique.
- Decrypts the first 0x10-byte block in the above read NAND sector with
  keyslot 0x11 using AES-ECB. [9.6.0-X](9.6.0-24 "wikilink"): Then it
  decrypts the 0x10-bytes at offset 0x10 in the sector with keyslot
  0x11.
- Then the normalkey, keyX, and keyY, for keyslot 0x11 are cleared to
  zero. Runs the TWL key-init/etc code which was originally in the
  ARM9-kernel, then writes 0x2 to
  [CFG_SYSPROT9](CONFIG_Registers "wikilink") to disable the OTP area.
- Then it uses the above decrypted block from sector+0 to set the
  normalkey for keyslot 0x11. Decrypts arm9_bin_buf+0 using keyslot 0x11
  with AES-ECB, and initialises keyX for keyslot 0x15 with it.
- [9.6.0-X](9.6.0-24 "wikilink"): Then it uses the above decrypted block
  from sector+0 to set the normalkey for keyslot 0x11. Decrypts a
  0x10-byte block from arm9loader .(ro)data using keyslot 0x11 with
  AES-ECB, and initializes keyX for keyslot 0x18 with it(same block as
  previous versions).
- [9.6.0-X](9.6.0-24 "wikilink"): Starting with this version keyslot
  0x16 keyX init was moved here, see below for details on this. The code
  for this is same as [9.5.0-X](9.5.0-22 "wikilink"), except the
  decrypted normalkey from sector+0x10 is used for keyslot 0x11 instead.
- Initialises KeyX for keyslots 0x18..0x1F(0x19..0x1F with
  [9.6.0-X](9.6.0-24 "wikilink")) with the output of decrypting a
  0x10-byte block with AES-ECB using keyslot 0x11. This block was
  changed to a new one separate from keyslot 0x18, starting with
  [9.6.0-X](9.6.0-24 "wikilink"). The last byte in this 0x10-byte input
  block is increased by 0x01 after initializing each keyslot. Before
  doing the crypto each time, the loader sets the normal-key for keyslot
  0x11 to the plaintext normalkey from sector+0(+0x10 with
  [9.6.0-X](9.6.0-24 "wikilink")). These are New3DS-specific keys.
- [9.5.0-X](9.5.0-22 "wikilink")(moved to above with
  [9.6.0-X](9.6.0-24 "wikilink")): Sets the normal-key for keyslot 0x11
  to the same one already decrypted on the stack. Decrypts the 0x10-byte
  block at arm9binhdr+0x60 with AES-ECB using keyslot 0x11, then sets
  the keyX for keyslot 0x16 to the output data.
- [9.5.0-X](9.5.0-22 "wikilink"): The normalkey, keyX, and keyY, for
  keyslot 0x11 are then cleared to zero.

When [CFG_SYSPROT9](CONFIG_Registers#CFG_SYSPROT9 "wikilink") bit 1 is
set(which means this happens only when this loader runs again for
firm-launch), the normalkey, keyX, and keyY, for keyslot 0x11 are
cleared to zero.

It sets KeyY for keyslot 0x15(0x16 with [9.5.0-X](9.5.0-22 "wikilink"))
to arm9_bin_buf+16, the CTR to arm9_bin_buf+32 (both are unique for
every version). It then proceeds to decrypt the binary with AES-CTR.
When done, it sets the normal-key for the keyslot used for binary
decryption to zeros. It then decrypts arm9_bin_buf+64 using an hardcoded
keyY for keyslot
0x15([9.5.0-X](9.5.0-22 "wikilink")/[9.6.0-X](9.6.0-24 "wikilink") also
uses keyslot 0x15), sets the normal-key for this keyslot to zeros again,
then makes sure the output block is all zeroes. If it is, it does some
cleanup then it jumps to the entrypoint for the decrypted binary.
Otherwise it will clear the keyX, keyY, and normal-key for each of the
keyslots initialized by this loader (on [9.6.0-X](9.6.0-24 "wikilink")+,
on older versions this was bugged and cleared keys 0x00..0x07 instead of
0x18..0x1F), do cleanup(same cleanup as when the decrypted block is
all-zero) then just loop forever.

Thus, the ARM9 binary has the following header:

<table>
<thead>
<tr class="header">
<th><p>OFFSET</p></th>
<th><p>SIZE</p></th>
<th><p>DESCRIPTION</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x000</p></td>
<td><p>16</p></td>
<td><p>Encrypted KeyX (same for all FIRM's)</p></td>
</tr>
<tr class="even">
<td><p>0x010</p></td>
<td><p>16</p></td>
<td><p>KeyY</p></td>
</tr>
<tr class="odd">
<td><p>0x020</p></td>
<td><p>16</p></td>
<td><p>CTR</p></td>
</tr>
<tr class="even">
<td><p>0x030</p></td>
<td><p>8</p></td>
<td><p>Size of encrypted binary, as ASCII text?</p></td>
</tr>
<tr class="odd">
<td><p>0x038</p></td>
<td><p>8</p></td>
<td><p>?</p></td>
</tr>
<tr class="even">
<td><p>0x040</p></td>
<td><p>16</p></td>
<td><p>Control block</p></td>
</tr>
<tr class="odd">
<td><p>0x050</p></td>
<td><p>16</p></td>
<td><p>Added with <a href="../9.5.0-22" title="wikilink">9.5.0-X</a>. Only
used for hardware debugging: a nop instruction is executed with r0=0 and
r1=</p>
<address of this data>
<p>.</p></td>
</tr>
<tr class="even">
<td><p>0x060</p></td>
<td><p>16</p></td>
<td><p>Added with <a href="../9.5.0-22" title="wikilink">9.5.0-X</a>.
Encrypted keyX for keyslot 0x16.</p></td>
</tr>
</tbody>
</table>

Originally the padding after the header before offset 0x800(start of
actual ARM9-binary) was 0xFF bytes, with [9.5.0-X](9.5.0-22 "wikilink")
this was changed to 0x0.

For the New3DS NATIVE_FIRM arm9-section header, the only difference
between the [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") version and the
[9.0.0-20](9.0.0-20 "wikilink") version is that the keyY, CTR, and the
block at 0x30 in the header were updated.

### New3DS ARM9 binary loader versions

| FIRM system version(s)                                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") - [9.3.0-X](9.3.0-21 "wikilink") | Initial version.                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| [9.5.0-X](9.5.0-22 "wikilink")                                               | Added keyX initialization for keyslot 0x16(see above), and added code for clearing keyslot 0x11 immediately after the code finishes using keyslot 0x11. The keyslot used for arm9bin decryption was changed from 0x15 to 0x16. Added code for clearing keyslot 0x16 when control-block decryption fails. Added code for using arm9bin_hdr+0x50 with a nop instruction, at the very beginning of the main arm9-loader function. Added two new 0x10-blocks to the arm9bin-hdr. |
| [9.6.0-X](9.6.0-24 "wikilink") - [11.3.0-X](11.3.0-36 "wikilink")            | See above and [here](9.6.0-24 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                   |

### New3DS ARM9 kernel

The only actual code-difference for the Old3DS/New3DS ARM9-kernels'
crt0, besides TWL AES / [0x10012000](IO_Registers "wikilink") related
code, is that the New3DS ARM9-kernel writes 0x1 to
[REG_EXTMEMCNT9](CONFIG_Registers "wikilink") in the crt0.

### New3DS Process9

The following is all of the differences for Old3DS/New3DS Process9 with
[9.3.0-X](9.3.0-21 "wikilink"):

- The FIRM-launch code called at the end of the New3DS proc9 main() has
  different mem-range checks.
- In the New3DS proc9, the v6.0/v7.0 keyinit function at the very
  beginning(before the original code) had additional code added for
  setting [CTRNAND](Flash_Filesystem "wikilink")
  [keyslot](AES_Registers "wikilink") 0x5, with keydata from .data.
  After setting the keyY, the keyY in .data is cleared.
- In New3DS proc9, the functions for getting the gamecard crypto
  keyslots / NCCH keyslot can return New3DS keyslots when New3DS
  flags(NCSD/NCCH) are set.
- The code/data for the binary near the end of arm9mem is slightly
  different, because of memory-region sizes.
- The only difference in .data(besides the above code binary) is that
  the New3DS proc9 has an additional 0x10-byte block for the keyslot 0x5
  keyY, see above.

## Variations

There exists different official firmwares for the 3DS: The default one
(NATIVE_FIRM) is used to run all 3DS content and boots by default, while
backwards compatibility is handled by TWL_FIRM and AGB_FIRM. There
furthermore is a rescue mode provided by SAFE_MODE_FIRM.

### NATIVE_FIRM

NATIVE_FIRM is the FIRM which is installed to the
[NAND](Flash_Filesystem "wikilink") firm partitions, which is loaded by
bootrom.

Version history:

| System version                                                       | old 3DS title version | old 3DS hex title contentID | Kernel/FIRM version (old 3DS/new 3DS) | FIRM ARM11-sysmodule Product Code |
|----------------------------------------------------------------------|-----------------------|-----------------------------|---------------------------------------|-----------------------------------|
| [Factory](Factory_Setup "wikilink") FIRM (titleID 00040001-00000002) | v0                    | 00                          | 2.3-0                                 |                                   |
| Pre-1.0. Referenced in the v1.0 Home Menu NCCH plain-region.         |                       |                             | 2.23-X                                |                                   |
| [1.0.0](1.0.0-0 "wikilink")                                          | v432                  | 00                          | 2.27-0                                |                                   |
| [1.1.0](1.1.0-1 "wikilink")                                          | v1472                 | 02                          | 2.28-0                                |                                   |
| [2.0.0](2.0.0-2 "wikilink")                                          | v2516                 | 09                          | 2.29-7                                |                                   |
| [2.1.0](2.1.0-3 "wikilink")                                          | v3553                 | 0B                          | 2.30-18                               | 0608builder                       |
| [2.2.0](2.2.0-X "wikilink")                                          | v4595                 | 0F                          | 2.31-40                               | 0909builder                       |
| [3.0.0](3.0.0-5 "wikilink")                                          | v5647                 | 18                          | 2.32-15                               | 1128builder                       |
| [4.0.0](4.0.0-7 "wikilink")                                          | v6677                 | 1D                          | 2.33-4                                | 0406builder                       |
| [4.1.0](4.1.0-8 "wikilink")                                          | v7712                 | 1F                          | 2.34-0                                | 0508builder                       |
| [5.0.0](5.0.0-11 "wikilink")                                         | v8758                 | 25                          | 2.35-6                                | 0228builder                       |
| [5.1.0](5.1.0-11 "wikilink")                                         | v9792                 | 26                          | 2.36-0                                | 0401builder                       |
| [6.0.0](6.0.0-11 "wikilink")                                         | v10833                | 29                          | 2.37-0                                | 0520builder                       |
| [6.1.0](6.1.0-11 "wikilink")                                         | v11872                | 2A                          | 2.38-0                                | 0625builder                       |
| [7.0.0](7.0.0-13 "wikilink")                                         | v12916                | 2E                          | 2.39-4                                | 1125builder                       |
| [7.2.0](7.2.0-17 "wikilink")                                         | v13956                | 30                          | 2.40-0                                | 0404builder                       |
| [8.0.0](8.0.0-18 "wikilink")                                         | v15047                | 37                          | 2.44-6                                | 0701builder                       |
| [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")                          | N/A                   | N/A                         | 2.45-5                                |                                   |
| [9.0.0](9.0.0-20 "wikilink")                                         | v17120                | 38                          | 2.46-0                                | 0828builder                       |
| [9.3.0](9.3.0-21 "wikilink")                                         | v18182                | 3F                          | 2.48-3                                | 1125builder                       |
| [9.5.0](9.5.0-22 "wikilink")                                         | v19216                | 40                          | 2.49-0                                | 0126builder                       |
| [9.6.0](9.6.0-24 "wikilink")                                         | v20262                | 49                          | 2.50-1                                | 0311builder                       |
| [10.0.0](10.0.0-27 "wikilink")                                       | v21288                | 4B                          | 2.50-7                                | 0812builder                       |
| [10.2.0](10.2.0-28 "wikilink")                                       | v22313                | 4C                          | 2.50-9                                | 1009builder                       |
| [10.4.0](10.4.0-29 "wikilink")                                       | v23341                | 50                          | 2.50-11                               | 1224builder                       |
| [11.0.0](11.0.0-33 "wikilink")                                       | v24368                | 52                          | 2.51-0                                | 0406builder                       |
| [11.1.0](11.1.0-34 "wikilink")                                       | v25396                | 56                          | 2.51-2                                | 0805builder                       |
| [11.2.0](11.2.0-35 "wikilink")                                       | v26432                | 58                          | 2.52-0                                | 1015builder                       |
| [11.3.0](11.3.0-36 "wikilink")                                       | v27476                | 5C                          | 2.53-0                                | 0126builder                       |
| [11.4.0](11.4.0-37 "wikilink")                                       | v28512                | 5E                          | 2.54-0                                | 0314builder                       |
| [11.8.0](11.8.0-41 "wikilink")                                       | v29557                | 64                          | 2.55-0                                | 0710pseg-ciuser                   |
| [11.12.0](11.12.0-44 "wikilink")                                     | v30593                | 66                          | 2.56-0                                | 1021pseg-ciuser                   |
| [11.14.0](11.14.0-46 "wikilink")                                     | v31633                | 69                          | 2.57-0                                | 0929pseg-ciuser                   |
| [11.16.0](11.16.0-48 "wikilink")                                     | v32673                | 6C                          | 2.58-0                                | 0701pseg-ciuser                   |

The above kernel/FIRM versions are in the format:
<KERNEL_VERSIONMAJOR>.<KERNEL_VERSIONMINOR>-<KERNEL_VERSIONREVISION>.

### SAFE_MODE_FIRM

SAFE_MODE is used for running the [System
Updater](System_Settings#System_Updater "wikilink"). SAFE_MODE_FIRM and
NATIVE_FIRM for the initial versions are exactly the same, except for
the system core version fields. Kernel/FIRM versions for SAFE_MODE_FIRM
are: (old3ds) v432 = 3.27-0, v5632 = 3.32-0, (new3ds) v16081 = 3.45-3.

### TWL_FIRM

TWL_FIRM handles DS(i) backwards compatibility.

The 3DS-mode ARM9 core seems to switch into DSi-mode(for running
DSi-mode ARM9 code) by writing to a [PDN](PDN "wikilink") register(this
changes the memory layout to DSi-mode / etc, therefore this register
poke \*must\* be executed from ITCM). This is the final 3DS-mode
register poke before the ARM9 switches into DSi-mode. DS(i)-mode ARM7
code is run on the internal [ARM7](ARM7 "wikilink") core, which is
started up during TWL_FIRM boot. Trying to read from the
exception-vector region(address 0x0) under this DSi-mode ARM7 seems to
only return 0x00/0xFF data. Also note that this DSi-mode ARM7 runs
code(stored in TWL_FIRM) which pokes some DSi-mode registers that on the
DSi were used for disabling access to the DSi bootROMs, however these
registers do not affect the 3DS DSi-mode ARM9/ARM7 "bootrom"
region(exceptionvector region + 0x8000) at all.

For shutting down the system, TWL_FIRM writes u8 value 8 to
[I2C](I2C "wikilink") MCU register 0x20. For returning to 3DS-mode,
TWL_FIRM writes value 4 to that MCU register to trigger a hardware
system reboot.

The TWL_FIRM ARM11-process includes a TWL bootloader, see
[here](http://dsibrew.org/wiki/Bootloader) and
[here](Memory_layout#Detailed_TWL_FIRM_ARM11_Memory "wikilink") for
details.

TWL_FIRM verifies all TWL RSA padding with the following. This is
different from the DSi "BIOS" code.

- The first byte must be 0x0.
- The second byte must be 0x1 or 0x2.
- Executes a while(<value of byte at current pos in RSA message>). When
  the second_byte in the message is 0x1, the byte at curpos must be
  0xFF(otherwise the non-zero value of the byte at curpos doesn't
  matter). This loop must find a zero byte before offset 0x7F in the
  message otherwise an error is returned.
- Returns an address for msg_curpos+1.

totalhashdatasize = rsasig_bytesize - above position in the message for
the hashdata. The actual "totalhashdatasize" in the RSA message must be
\<= <expected hashdata_size>(0x74 for bootloader). The TWL_FIRM code
copies the RSA "hashdata" to the output buffer, using the actual size of
the RSA "hashdata".

### AGB_FIRM

AGB_FIRM handles running GBA VC titles. The ARM9 FIRM section for
TWL_FIRM and AGB_FIRM are exactly the same (for TWL_FIRM and AGB_FIRM
versions which were updated with the same system-update).

## FIRM Launch Parameters

The FIRM-launch parameters structure is located at FCRAM+0, size
0x1000-bytes. The ARM11-kernel copies this structure elsewhere, then
clears the 0x1000-bytes at FCRAM+0. It will not handle an existing
structure at FCRAM+0 if
[CFG_BOOTENV](CONFIG_Registers#CFG_BOOTENV "wikilink") is zero. The ARM9
kernel [writes some values](Configuration_Memory#0x1FF80016 "wikilink")
about the boot environment to AXI WRAM during init to enable this.

Note: it seems NATIVE_FIRM ARM11-kernel didn't parse this during boot
until [3.0.0-X](3.0.0-5 "wikilink")?

| OFFSET | SIZE  | DESCRIPTION                                                                                                                                                                                                                                                                                                                              |
|--------|-------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000  | 0x300 | TWL auto-load parameters, passed as-is onto the new title. NS will only read the oldTitleId field from it and add it to the TWL title list if it's a CTR titleId                                                                                                                                                                         |
| 0x300  | 0x100 | 'TLNC' block created by TWL applications, handled by NS for backwards-compatibility purposes. See [here](NS#Auto-boot "wikilink") for more info.                                                                                                                                                                                         |
| 0x400  | 0x4   | Flags                                                                                                                                                                                                                                                                                                                                    |
| 0x410  | 0xC   | This is used for overriding the FIRM_\* fields in [Configuration_Memory](Configuration_Memory "wikilink"), when the flag listed below is set, in the following order(basically just data-copy from here to 0x1FF80060): "FIRM_?", FIRM_VERSIONREVISION, FIRM_VERSIONMINOR, FIRM_VERSIONMAJOR, FIRM_SYSCOREVER, and FIRM_CTRSDKVERSION. |
| 0x438  | 0x4   | The kernel checks this field for value 0xFFFF, if it matches the kernel uses the rest of these parameter fields, otherwise FIRM-launch parameters fields are ignored by the kernel.                                                                                                                                                      |
| 0x43C  | 0x4   | CRC32, this is calculated starting at FIRM-params offset 0x400, with size 0x140(with this field cleared to zero during calculation). When invalid the kernel clears the entire buffer used for storing the FIRM-params, therefore no actual FIRM-params are handled after that.                                                          |
| 0x440  | 0x10  | Titleinfo [Program Info](Filesystem_services#ProgramInfo "wikilink"), used by NS during NS startup, to launch the specified title when the below flag is set.                                                                                                                                                                            |
| 0x450  | 0x10  | Titleinfo [Program Info](Filesystem_services#ProgramInfo "wikilink"). This might be used for returning to the specified title, once the above launched title terminates?                                                                                                                                                                 |
| 0x460  | 0x4   | Bit0: 0 = titleinfo structure isn't set, 1 = titleinfo structure is set.                                                                                                                                                                                                                                                                 |
| 0x480  | 0x20  | This can be set via buf1 for [<APT:SendDeliverArg>](APT:SendDeliverArg "wikilink")/[<APT:StartApplication>](APT:StartApplication "wikilink").                                                                                                                                                                                            |
| 0x4A0  | 0x10  | This can be set by [NSS:SetWirelessRebootInfo](NSS:SetWirelessRebootInfo "wikilink").                                                                                                                                                                                                                                                    |
| 0x4B0  | 0x14  | SHA1-HMAC of the banner for TWL/NTR titles. This can be set by [NSS:SetTWLBannerHMAC](NSS:SetTWLBannerHMAC "wikilink").                                                                                                                                                                                                                  |
| 0x500  | 0x40  | This is used by [<APT:LoadSysMenuArg>](APT:LoadSysMenuArg "wikilink") and [<APT:StoreSysMenuArg>](APT:StoreSysMenuArg "wikilink").                                                                                                                                                                                                       |
| 0xD50  | 0x20  | Atheros WiFi configuration struct                                                                                                                                                                                                                                                                                                        |
| 0xD70  | 0x290 | [Config](Config_Savegame "wikilink") data struct for LGY FIRM.                                                                                                                                                                                                                                                                           |

Flags from offset 0x400:

| OFFSET | SIZE | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                               |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1  | This can be used for overriding the default FCRAM [memory-regions](Memory_layout "wikilink") allocation sizes(APPLICATION, SYSTEM, and BASE). The values for this is the same as [Configmem-APPMEMTYPE](Configuration_Memory#APPMEMTYPE "wikilink"). Values 0-1 are handled the same way by the kernel. However for NS, 0=titleinfo structure for launching a title isn't set, while non-zero=titleinfo structure is set. |
| 0x1    | 0x3  | Setting bit0 here enables overriding the FIRM_\* fields in [Configuration_Memory](Configuration_Memory "wikilink").                                                                                                                                                                                                                                                                                                      |

Atheros WiFi configuration struct for booting TWL_FIRM, from offset
0xD50. This struct is copied directly to 0x20005E0 in DSi memory. Since
DSi cartridge ROMs include SDIO drivers for the wireless card and can't
be updated, this structure allows interoperability between the original
DSi wireless cards (AR6002/DWM-W015 and AR6013/DWM-W024) as well as the
3DS's AR6014/DWM-W028.

| OFFSET | SIZE | DESCRIPTION                                                       |
|--------|------|-------------------------------------------------------------------|
| 0x0    | 0x1  | WiFi Board Type (1=DWM-W015, 2=DWM-W024, 3=DWM-W028; 0x03 on 3DS) |
| 0x1    | 0x1  | Unknown (0x00)                                                    |
| 0x2    | 0x2  | CRC16 from 0x4 to 0x20 (0x1C bytes)                               |
| 0x4    | 0x4  | Atheros RAM Vars/Host Interest address (0x520000 on 3DS)          |
| 0x8    | 0x4  | Atheros RAM base (0x520000 on 3DS)                                |
| 0xC    | 0x4  | Atheros RAM size (0x20000 on 3DS)                                 |
| 0x10   | 0x10 | Unknown (Zeroed)                                                  |

[Config](Config_Savegame "wikilink") struct for booting LGY FIRMs from
offset 0xD70:

| OFFSET | SIZE  | DESCRIPTION                                                                                                                    |
|--------|-------|--------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1   | RTC compensation value (config block 0x30000).                                                                                 |
| 0x1    | 0x1   | Sound output mode (config block 0x70001).                                                                                      |
| 0x2    | 0x1   | System language (config block 0xA0002).                                                                                        |
| 0x3    | 0x1   | [Region from SecureInfo](Cfg:SecureInfoGetRegion "wikilink") ("pseudo-block" 0x140000 in LGY FIRM).                            |
| 0x4    | 0xF   | [Serial number from SecureInfo](CfgS:SecureInfoGetSerialNo "wikilink") ("pseudo-block" 0x140001 in LGY FIRM).                  |
| 0x13   | 0x1   | TWL country code (config block 0x100002).                                                                                      |
| 0x14   | 0x10  | TWL "movable" UID, used for DSiWare exports (config block 0x100003).                                                           |
| 0x24   | 0x2   | TWL EULA info (config block 0x100000).                                                                                         |
| 0x26   | 0x1   | Cleared to zero.                                                                                                               |
| 0x27   | 0x1   | Cleared to zero.                                                                                                               |
| 0x28   | 0x94  | TWL parental control data (config block 0x100001).                                                                             |
| 0xBC   | 0x2   | LCD flicker calibration data (config block 0x50000).                                                                           |
| 0xBE   | 0x2   | Backlight data (config block 0x50001).                                                                                         |
| 0xC0   | 0x38  | Backlight PWM table (config block 0x50002).                                                                                    |
| 0xF8   | 0x20  | Power saving mode (ABL) calibration (config block 0x50004).                                                                    |
| 0x118  | 0x134 | CODEC calibration data (config block 0x20000).                                                                                 |
| 0x24C  | 0x10  | Touch screen calibration data (config block 0x40000).                                                                          |
| 0x25C  | 0x1C  | Analog stick calibration data (config block 0x40001).                                                                          |
| 0x278  | 0x4   | Cleared to zero.                                                                                                               |
| 0x27C  | 0x4   | Cleared to zero.                                                                                                               |
| 0x280  | 0x8   | User time offset (config block 0x30001).                                                                                       |
| 0x288  | 0x2   | CRC16 over the above fields from offset 0x0, size 0x288. If not valid, LGY FIRM uses dummy data from .(ro)data.                |
| 0x28A  | 0x2   | Version, maybe? If non-zero, the size (below) is hardcoded (currently) to value 0x288, otherwise the size field below is used. |
| 0x28C  | 0x4   | Value 0x288 (size used for verifying the CRC16).                                                                               |

"Cleared to zero" fields above are not read at all by LGY FIRM.

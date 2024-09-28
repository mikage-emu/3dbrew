+++
title = 'Memory Layout'
+++

# Physical Memory

## ARM11

| Old 3DS | Address    | Size       | Description                                                   |
|---------|------------|------------|---------------------------------------------------------------|
| Yes     | 0x00000000 | 0x00010000 | Bootrom (super secret code/data @ 0x8000)                     |
| Yes     | 0x00010000 | 0x00010000 | Bootrom mirror                                                |
| Yes     | 0x10000000 | ?          | [IO](IO_Registers "wikilink") memory                          |
| Yes     | 0x17E00000 | 0x00002000 | MPCore private memory region                                  |
| No      | 0x17E10000 | 0x00001000 | L2C-310 r3p3 Level 2 Cache Controller (2MB)                   |
| Yes     | 0x18000000 | 0x00600000 | VRAM (divided in two areas VRAM A and B, four banks in total) |
| No      | 0x1F000000 | 0x00400000 | [New_3DS](New_3DS "wikilink") additional memory               |
| Yes     | 0x1FF00000 | 0x00080000 | DSP memory                                                    |
| Yes     | 0x1FF80000 | 0x00080000 | AXI WRAM                                                      |
| Yes     | 0x20000000 | 0x08000000 | FCRAM                                                         |
| No      | 0x28000000 | 0x08000000 | [New_3DS](New_3DS "wikilink") FCRAM extension                 |
| Yes     | 0xFFFF0000 | 0x00010000 | Bootrom mirror                                                |

### 0x17E10000

The 32-bit register at `0x17E10000`+`0x100` only has bit 0 set when, on
New 3DS,
[PTMSYSM:ConfigureNew3DSCPU](PTMSYSM:ConfigureNew3DSCPU "wikilink") was
used with bit 1 set for the input value (the L2 cache flag). All other
bits in this register are normally all-zero. Therefore, bit 0 set = new
cache hardware enabled, bit 0 clear = new cache hardware disabled. This
bit is how the ARM11 kernel checks whether the additional cache hardware
is enabled).

To enable the additional cache hardware, the following is used by the
ARM11 kernel:

- Sets bit 0 in 32-bit register `0x17E10000`+`0x100`.

To disable the additional cache hardware, the following is used by the
ARM11 kernel:

- Writes value `0xFFFF` to 32-bit register `0x17E10000`+`0x77C`.
- Waits for bit 0 in 32-bit register `0x17E10000`+`0x730` to become
  clear.
- Writes value `0x0` to 32-bit register `0x17E10000`+`0x0`.
- Clears bit 0 in 32-bit register `0x17E10000`+`0x100`.

### `0x1F000000` ([New 3DS](New_3DS "wikilink") only)

This area is used by [QTM Services](QTM_Services "wikilink") and
Kernel11,starting at offset `0x200000`, size `0x180000`. This area is
not accessible to the GPU on the old 3DS. The old 3DS and New 3DS GSP
module has `vaddr->physaddr` conversion code for this entire region. On
the New 3DS, only the first `0x200000` bytes (half of this memory) are
accessible to the GPU.

## ARM9

| Old 3DS | Address    | Size       | Description                                                                                                                           |
|---------|------------|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Yes     | 0x00000000 | 0x08000000 | Instruction TCM, repeating each 0x8000 bytes.                                                                                         |
| Yes     | 0x01FF8000 | 0x00008000 | Instruction TCM (Accessed by the kernel and process by this address)                                                                  |
| Yes     | 0x07FF8000 | 0x00008000 | Instruction TCM (Accessed by bootrom by this address)                                                                                 |
| Yes     | 0x08000000 | 0x00100000 | ARM9-only internal memory (ARM7's internal regions are mapped here as well)                                                           |
| No      | 0x08100000 | 0x00080000 | [New_3DS](New_3DS "wikilink") ARM9-only extension, only enabled when a certain [CONFIG](CONFIG_Registers "wikilink") register is set. |
| Yes     | 0x10000000 | 0x08000000 | [IO](IO_Registers "wikilink") memory                                                                                                  |
| Yes     | 0x18000000 | 0x00600000 | VRAM (divided in two banks, VRAM and VRAMB)                                                                                           |
| Yes     | 0x1FF00000 | 0x00080000 | DSP memory                                                                                                                            |
| Yes     | 0x1FF80000 | 0x00080000 | AXI WRAM                                                                                                                              |
| Yes     | 0x20000000 | 0x08000000 | FCRAM                                                                                                                                 |
| No      | 0x28000000 | 0x08000000 | [New_3DS](New_3DS "wikilink") FCRAM extension                                                                                         |
| Yes     | 0xFFF00000 | 0x00004000 | Data TCM (Mapped during bootrom). Enabled at the time Boot9 jumps to FIRM, however Kernel9+arm9loader disables it.                    |
| Yes     | 0xFFFF0000 | 0x00010000 | Bootrom, the main region is at +0x8000, which is disabled during system boot.                                                         |

## ARM9 MPU Regions

For the below instruction permissions: RO = memory is executable, while
None = not-executable.

### NATIVE_FIRM/SAFE_MODE_FIRM ARM9 kernel

| Region | Address    | Size                                                                                          | Privileged-mode data permissions | User-mode data permissions | Privileged-mode instruction permissions | User-mode instruction permissions |
|--------|------------|-----------------------------------------------------------------------------------------------|----------------------------------|----------------------------|-----------------------------------------|-----------------------------------|
| 0      | 0xFFFF0000 | 32KB/0x8000                                                                                   | RO                               | None                       | RO                                      | None                              |
| 1      | 0x01FF8000 | 32KB/0x8000                                                                                   | RW                               | RW                         | RO                                      | RO                                |
| 2      | 0x08000000 | 1MB/0x100000. \>=[8.0.0-X](8.0.0-18 "wikilink"): 2MB/0x200000.                                | RW                               | RW                         | RO                                      | RO                                |
| 3      | 0x10000000 | 128KB/0x20000                                                                                 | RW                               | RW                         | None                                    | None                              |
| 4      | 0x10100000 | 512KB/0x80000                                                                                 | RW                               | RW                         | None                                    | None                              |
| 5      | 0x20000000 | 128MB/0x8000000. \>=[8.0.0-X](8.0.0-18 "wikilink"): 256MB/0x10000000.                         | RW                               | RW                         | None                                    | None                              |
| 6      | 0x08000000 | 128KB/0x20000                                                                                 | RW                               | None                       | RO                                      | None                              |
| 7      | 0x08020000 | \<[3.0.0-5](3.0.0-5 "wikilink"): 64KB/0x10000. \>=[3.0.0-5](3.0.0-5 "wikilink"): 32KB/0x8000. | RW                               | None                       | RO                                      | None                              |

The above is the MPU region settings setup by the ARM9-kernel in the
crt0.

The New3DS ARM9-kernel MPU region settings are the same as the Old3DS
MPU region settings for \>=[8.0.0-X](8.0.0-18 "wikilink").

At the start of the Process9 function executed in kernel-mode via svc7b
during firm-launching, it changes some MPU region settings. At the end
of that function, before it uses the ARM9/ARM11 entrypoint fields, it
disables MPU.

### New3DS [ARM9-loader](FIRM "wikilink")

| Region | Address    | Size          | Privileged-mode data permissions | User-mode data permissions | Privileged-mode instruction permissions | User-mode instruction permissions |
|--------|------------|---------------|----------------------------------|----------------------------|-----------------------------------------|-----------------------------------|
| 0      | 0xFFFF0000 | 32KB/0x8000   | RO                               | None                       | RO                                      | None                              |
| 1      | 0x01FF8000 | 32KB/0x8000   | RW                               | None                       | RO                                      | None                              |
| 2      | 0x08000000 | 2MB/0x200000  | RW                               | None                       | RO                                      | None                              |
| 3      | 0x10000000 | 128KB/0x20000 | RW                               | None                       | None                                    | None                              |

MPU regions 4-7 are disabled. Note that the entire ARM9-loader runs in
SVC-mode.

### TWL_FIRM/AGB_FIRM ARM9 kernel

| Region | Address    | Size                                                                                            | Privileged-mode data permissions | User-mode data permissions | Privileged-mode instruction permissions | User-mode instruction permissions |
|--------|------------|-------------------------------------------------------------------------------------------------|----------------------------------|----------------------------|-----------------------------------------|-----------------------------------|
| 0      | 0xFFFF0000 | 32KB/0x8000                                                                                     | RO                               | None                       | RO                                      | None                              |
| 1      | 0x01FF8000 | 32KB/0x8000                                                                                     | RW                               | RW                         | RO                                      | RO                                |
| 2      | 0x08000000 | 1MB/0x100000. New3DS: 2MB/0x200000.                                                             | RW                               | RW                         | RO                                      | RO                                |
| 3      | 0x10000000 | 2MB/0x200000.                                                                                   | RW                               | RW                         | None                                    | None                              |
| 4      | 0x1FF00000 | 512KB/0x80000                                                                                   | RW                               | RW                         | None                                    | None                              |
| 5      | 0x20000000 | 128MB/0x8000000. New3DS: 256MB/0x10000000.                                                      | RW                               | RW                         | None                                    | None                              |
| 6      | 0x08000000 | \<[3.0.0-X](3.0.0-5 "wikilink"): 256KB/0x40000. \>=[3.0.0-X](3.0.0-5 "wikilink"): 128KB/0x20000 | RW                               | None                       | RO                                      | None                              |
| 7      | 0x08080000 | 128KB/0x20000                                                                                   | RW                               | RW                         | RO                                      | RO                                |

### [Boot9](Bootloader "wikilink")

| Region | Address    | Size       | Privileged-mode data permissions | User-mode data permissions | Privileged-mode instruction permissions | User-mode instruction permissions |
|--------|------------|------------|----------------------------------|----------------------------|-----------------------------------------|-----------------------------------|
| 0      | 0x20000000 | 0x08000000 | None                             | None                       | None                                    | None                              |
| 1      | 0x10000000 | 0x10000000 | RW                               | RW                         | None                                    | None                              |
| 2      | 0x08000000 | 0x00100000 | RW                               | RW                         | None                                    | None                              |
| 3      | 0x08000000 | 0x00000400 | RW                               | RW                         | RO                                      | RO                                |
| 4      | 0xFFF00000 | 0x00004000 | RW                               | RW                         | None                                    | None                              |
| 5      | 0x07FF8000 | 0x00008000 | RW                               | RW                         | RO                                      | RO                                |
| 6      | 0xFFFF0000 | 0x00010000 | RO                               | RO                         | RO                                      | RO                                |
| 7      | 0x1FFFE000 | 0x00000800 | RW                               | RW                         | None                                    | None                              |

- Instruction cachable bits = 0x40(only enabled for region6).
- Data cachable bits = 0x44(only enabled for region2 and region6).
- Data bufferable bits = 0x44(only enabled for region2 and region6).

These are the same for both Old3DS/New3DS.

## ARM9 ITCM

<table>
<thead>
<tr class="header">
<th>ITCM mirror address</th>
<th>ITCM bootrom mirror address</th>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x01FF8000</td>
<td></td>
<td>0x0</td>
<td>0x3700</td>
<td>Uninitialized memory.</td>
</tr>
<tr class="even">
<td>0x01FFB700</td>
<td>0x07FFB700</td>
<td>0x3700</td>
<td>0x100</td>
<td>The unprotected ARM9-bootrom code copies code from unprotected
bootrom to 0x07FFB700(ITCM mirror) size 0x100, then calls the code at
0x07FFB700. The code located here is the code used for disabling access
to the bootroms.</td>
</tr>
<tr class="odd">
<td>0x01FFB800</td>
<td></td>
<td>0x3800</td>
<td>0x100</td>
<td>This is the first 0x90 bytes of <a
{{% href "../OTP_Registers" %}} title="wikilink">plaintext OTP</a>
when OTP hash verification is successful. The remaining 0x70 bytes are
cleared.</td>
</tr>
<tr class="even">
<td>0x01FFB880</td>
<td></td>
<td>0x3890</td>
<td>0x70</td>
<td>This is all zeros; boot ROM does not reveal the console-specific
keys or the OTP hash in ITCM.</td>
</tr>
<tr class="odd">
<td>0x01FFB900</td>
<td></td>
<td>0x3900</td>
<td>0x200</td>
<td>This is the 0x200-bytes from NAND sector0.</td>
</tr>
<tr class="even">
<td>0x01FFBB00</td>
<td></td>
<td>0x3B00</td>
<td>0x200</td>
<td>This is the 0x200-bytes from the plaintext FIRM header for the
FIRM which was loaded by <a {{% href "../Bootloader" %}}
title="wikilink">Boot9</a>. This is the only location Boot9 uses for
storing the loaded FIRM headers internally, it's not stored anywhere
else.</td>
</tr>
<tr class="odd">
<td>0x01FFBD00</td>
<td></td>
<td>0x3D00</td>
<td>0x100</td>
<td>This is the RSA-2048 modulus for <a {{% href "../RSA_Registers" %}}
title="wikilink">RSA</a>-engine slot0 set by bootrom.</td>
</tr>
<tr class="even">
<td>0x01FFBE00</td>
<td></td>
<td>0x3E00</td>
<td>0x100</td>
<td>This is the RSA-2048 modulus for RSA-engine slot1 set by
bootrom.</td>
</tr>
<tr class="odd">
<td>0x01FFBF00</td>
<td></td>
<td>0x3F00</td>
<td>0x100</td>
<td>This is the RSA-2048 modulus for RSA-engine slot2.</td>
</tr>
<tr class="even">
<td>0x01FFC000</td>
<td></td>
<td>0x4000</td>
<td>0x100</td>
<td>This is the RSA-2048 modulus for RSA-engine slot3.</td>
</tr>
<tr class="odd">
<td>0x01FFC100</td>
<td></td>
<td>0x4100</td>
<td>0x800</td>
<td>These are RSA-2048 keys: 4 slots, each slot is 0x200-bytes.
Slot+0 is the modulus, slot+0x100 is the private exponent. This can be
confirmed by RSA-decrypting a message into a signature, then
RSA-encrypting the signature back into a message, and comparing the
original message with the output from the last operation.</p>
<p><a {{% href "../FIRM" %}} title="wikilink">FIRM</a> doesn't seem to ever use
these. None of these are related to RSA-keyslot0 used for v6.0/v7.0 key
generation. These moduli are separate from all other moduli used
elsewhere.</td>
</tr>
<tr class="even">
<td>0x01FFC900</td>
<td>0x07FFC900</td>
<td>0x4900</td>
<td>0x400</td>
<td>The unprotected ARM9-bootrom copies data to 0x07FFC900(mirror of
0x01FFC900) size 0x400. This data is copied from AXI WRAM, initialized
by ARM11-bootrom(the addr used for the src is determined by <a
{{% href "../CONFIG_Registers" %}} title="wikilink">REG_UNITINFO</a>). These are
RSA moduli: retailsrcptr = 0x1FFFD000, devsrvptr = 0x1FFFD400.</p>
<ul>
<li>The first 0x100-bytes here is the RSA-2048 modulus for the CFA NCCH
header, and for the gamecard NCSD header.</li>
<li>0x01FFCA00 is the RSA-2048 modulus for the CXI accessdesc signature,
written to rsaengine keyslot1 by NATIVE_FIRM.</li>
<li>0x01FFCB00 size 0x200 is unknown, probably RSA related, these aren't
used by <a {{% href "../FIRM" %}} title="wikilink">FIRM</a>(these are not
console-unique).</li>
</ul></td>
</tr>
<tr class="odd">
<td>0x01FFCD00</td>
<td></td>
<td>0x4D00</td>
<td>0x80</td>
<td>Unknown, not used by <a {{% href "../FIRM" %}} title="wikilink">FIRM</a>.
This isn't console-unique. The first 0x10-bytes are checked by the
v6.0/v7.0 NATIVE_FIRM keyinit function, when non-zero it clears this
block and continues to do the key generation. Otherwise when this block
was already all-zero, it immediately returns. This memclear was probably
an attempt at destroying the RSA slot0 modulus, that missed (exactly
0x1000-bytes away). Even though they "failed" here, one would still need
to derive the private exponent, which would require obtaining a
ciphertext and plaintext.</td>
</tr>
<tr class="even">
<td>0x01FFCD80</td>
<td></td>
<td>0x4D80</td>
<td>0x64</td>
<td>0x01FFCD84 size 0x10-bytes is the NAND CID(the 0x64-byte region
at 0x01FFCD80 is initialized by Process9 + ARM9-bootrom). The u32 at
0x01FFCDC4 is the total number of NAND sectors, read from a MMC
command.</td>
</tr>
<tr class="odd">
<td>0x01FFCDE4</td>
<td></td>
<td>0x4DE4</td>
<td>0x21C</td>
<td>Uninitialized memory.</td>
</tr>
<tr class="even">
<td>0x01FFD000</td>
<td>0x07FFD000</td>
<td>0x5000</td>
<td>0x2470</td>
<td>The unprotected ARM9-bootrom copies 0x1FFFA000(AXIWRAM mem
initialized by ARM11-bootrom) size 0x2470 to 0x07FFD000(mirror of
0x01FFD000). This block contains DSi keys.</p>
<ul>
<li>0x01FFD000 is the RSA-1024 modulus for the retail System Menu</li>
<li>0x01FFD080 is the RSA-1024 modulus for DSi Wifi firmware and DSi
Sound</li>
<li>0x01FFD100 is the RSA-1024 modulus for base DSi apps (Settings,
Shop, etc.)</li>
<li>0x01FFD180 is the RSA-1024 modulus for DSiWare and RSA-signed
cartridge headers</li>
<li>0x01FFD210 is the keyY for per-console-encrypted ES blocks</li>
<li>0x01FFD220 is the keyY for fixed-keyX ES blocks</li>
<li>0x01FFD300 is the DSi common (normal)key</li>
<li>0x01FFD350 is a normalkey set on keyslot 0x02, and is likely only
used during boot</li>
<li>0x01FFD380 is the keyslot 0x00 keyX and the first half of the retail
keyX for modcrypt crypto "Nintendo"</li>
<li>0x01FFD398 is the keyX used for 'Tad' crypto, usually in keyslot
0x02 "Nintendo DS", ..</li>
<li>0x01FFD3A8 is set as the middle two words of keyslot 0x03's keyX,
before being overwritten "NINTENDO"</li>
<li>0x01FFD3BC is the keyY for keyslot 0x01, see below</li>
<li>0x01FFD3C8 is the fixed keyY used for eMMC partition crypto on
retail DSi, see below (keyslot 0x03)</li>
<li>0x01FFD3E0 is the 0x1048-byte Blowfish data for DSi cart crypto</li>
<li>0x01FFE428 is the 0x1048-byte Blowfish data for DS cart crypto</li>
</ul>
<p>On the 3DS, keyslots 0x01 and 0x03 have the last word set as
0xE1A00005 instead of the next word in ITCM. This is consistent with
retail DSis.</td>
</tr>
<tr class="odd">
<td>0x01FFF470</td>
<td></td>
<td>0x7470</td>
<td>0xB90</td>
<td>Uninitialized memory.</td>
</tr>
<tr class="even">
<td>0x01FFFC00</td>
<td></td>
<td>0x7C00</td>
<td>0x100</td>
<td>Starting with <a {{% href "../9.5.0-22" %}} title="wikilink">9.5.0-X</a> is
the FIRM header used during FIRM-launching.</td>
</tr>
</tbody>
</table>

# Memory map by firmware

- [Virtual address mapping
  FW0B](Virtual_address_mapping_FW0B "wikilink")
- [Virtual address mapping
  FW1F](Virtual_address_mapping_FW1F "wikilink")
- [Virtual address mapping
  FW25](Virtual_address_mapping_FW25 "wikilink")
- [Virtual address mapping
  FW2E](Virtual_address_mapping_FW2E "wikilink")
- [Virtual address mapping
  FW37](Virtual_address_mapping_FW37 "wikilink")
- [Virtual address mapping
  FW38](Virtual_address_mapping_FW38 "wikilink")
- [Virtual address mapping
  FW3F](Virtual_address_mapping_FW3F "wikilink")
- FW49([9.6.0-X](9.6.0-24 "wikilink")) and
  [10.0.0-X](10.0.0-27 "wikilink") ARM11-kernel vmem mapping is
  identical to FW40([9.5.0-X](9.5.0-22 "wikilink")).

<!-- -->

- [Virtual address mapping
  TWLFIRM04](Virtual_address_mapping_TWLFIRM04 "wikilink")

<!-- -->

- [Virtual address mapping New3DS
  v8.1](Virtual_address_mapping_New3DS_v8.1 "wikilink")
- [Virtual address mapping New3DS
  v9.0](Virtual_address_mapping_New3DS_v9.0 "wikilink")
- [Virtual address mapping New3DS
  v9.2](Virtual_address_mapping_New3DS_v9.2 "wikilink")
- [Virtual address mapping New3DS
  v11.1](Virtual_address_mapping_New3DS_v11.1 "wikilink")

# ARM11 Detailed physical memory map

```
18000000 - 18600000: VRAM
```

```
1FF80000 - 1FFAB000: Kernel code
1FFAB000 - 1FFF0000: SlabHeap [temporarily contains boot processes]
1FFF0000 - 1FFF1000: ?
1FFF1000 - 1FFF2000: ?
1FFF2000 - 1FFF3000: ?
1FFF3000 - 1FFF4000: ?
1FFF4000 - 1FFF5000: Exception vectors
1FFF5000 - 1FFF5800: Unused?
1FFF5800 - 1FFF5C00: 256-entry L2 MMU table for VA FF4xx000
1FFF5C00 - 1FFF6000: 256-entry L2 MMU table for VA FF5xx000
1FFF6000 - 1FFF6400: 256-entry L2 MMU table for VA FF6xx000
1FFF6400 - 1FFF6800: 256-entry L2 MMU table for VA FF7xx000
1FFF6800 - 1FFF6C00: 256-entry L2 MMU table for VA FF8xx000
1FFF6C00 - 1FFF7000: 256-entry L2 MMU table for VA FF9xx000
1FFF7000 - 1FFF7400: 256-entry L2 MMU table for VA FFAxx000
1FFF7400 - 1FFF7800: 256-entry L2 MMU table for VA FFBxx000
1FFF7800 - 1FFF7C00: MMU table but unused?
1FFF7C00 - 1FFF8000: 256-entry L2 MMU table for VA FFFxx000 
1FFF8000 - 1FFFC000: 4096-entry L1 MMU table for VA xxx00000 (CPU 0)
1FFFC000 - 20000000: 4096-entry L1 MMU table for VA xxx00000 (CPU 1)
20000000 - 28000000: Main memory
```

The entire FCRAM is cleared during NATIVE_FIRM boot. This is done by the
ARM11 kernel in order by region as it initializes after loading
[FIRM](FIRM "wikilink") launch parameters from FCRAM.

## FCRAM memory-regions layout

FCRAM is partitioned into three regions of memory (APPLICATION, SYSTEM,
and BASE). Most applications can only allocate memory from one of these
regions (which is encoded in the [process kernel
flags](NCCH/Extended_Header#arm11_kernel_flags "wikilink")). There is a
fixed set of possible size of each memory region, determined by the
APPMEMTYPE value in [configuration
memory](Configuration_Memory#appmemtype "wikilink") (which in turn is
set up according to the [firmware launch
parameters](FIRM#firm_launch_parameters "wikilink")).

Support for APPMEMTYPEs 6 and 7 (and 8?) was implemented in
[NS](NS "wikilink") with [8.0.0-18](8.0.0-18 "wikilink"). These
configurations are only supported in the [New_3DS](New_3DS "wikilink")
ARM11-kernel, and are in fact the only ones supported there at all.
Applications only get access to the larger memory regions when this is
specified in their [extended
header](NCCH/Extended_Header#new3ds_system_mode "wikilink").

| APPMEMTYPE                                                                                                                              | APPLICATION starting address (relative to FCRAM) | APPLICATION region size | SYSTEM starting address (relative to FCRAM) | SYSTEM region size | BASE starting address (relative to FCRAM) | BASE region size |
|-----------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|-------------------------|---------------------------------------------|--------------------|-------------------------------------------|------------------|
| 0 (default with regular 3DS kernel, used when the type is not 2-5)                                                                      | 0x0                                              | 0x04000000(64MB)        | 0x04000000                                  | 0x02C00000         | 0x06C00000                                | 0x01400000       |
| 2                                                                                                                                       | 0x0                                              | 0x06000000(96MB)        | 0x06000000                                  | 0x00C00000         | 0x06C00000                                | 0x01400000       |
| 3                                                                                                                                       | 0x0                                              | 0x05000000(80MB)        | 0x05000000                                  | 0x01C00000         | 0x06C00000                                | 0x01400000       |
| 4                                                                                                                                       | 0x0                                              | 0x04800000(72MB)        | 0x04800000                                  | 0x02400000         | 0x06C00000                                | 0x01400000       |
| 5                                                                                                                                       | 0x0                                              | 0x02000000(32MB)        | 0x02000000                                  | 0x04C00000         | 0x06C00000                                | 0x01400000       |
| 6 and 8 (6 is the default on New3DS. With [New_3DS](New_3DS "wikilink") kernel this is the type used when the value is neither 7 nor 8) | 0x0                                              | 0x07C00000(124MB)       | 0x07C00000                                  | 0x06400000         | 0x0E000000                                | 0x02000000       |
| 7                                                                                                                                       | 0x0                                              | 0x0B200000(178MB)       | 0x0B200000                                  | 0x02E00000         | 0x0E000000                                | 0x02000000       |

The SYSTEM mem-region size is calculated with: size = FCRAMTOTALSIZE -
(APPLICATION_MEMREGIONSIZE + BASE_MEMREGIONSIZE).

All memory allocated by the kernel itself for kernel use is located
under BASE. Most system-modules run under the BASE memregion too.

Free/used memory on [4.5.0-10](4.5.0-10 "wikilink") with Home Menu /
Internet Browser, with the default APPMEMTYPE on retail:

| Region      | Base address relative to FCRAM+0 | Region size | Used memory once [Home Menu](Home_Menu "wikilink") finishes loading for system boot, on [4.5.0-10](4.5.0-10 "wikilink") | Used memory with [Internet Browser](Internet_Browser "wikilink") running instead of [Home Menu](Home_Menu "wikilink"), on [4.5.0-10](4.5.0-10 "wikilink") | Free memory once [Home Menu](Home_Menu "wikilink") finishes loading for system boot, on [4.5.0-10](4.5.0-10 "wikilink") | Free memory with [Internet Browser](Internet_Browser "wikilink") running instead of [Home Menu](Home_Menu "wikilink"), on [4.5.0-10](4.5.0-10 "wikilink") |
|-------------|----------------------------------|-------------|-------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| APPLICATION | 0x0                              | 0x04000000  | 0x0                                                                                                                     |                                                                                                                                                           | 0x04000000                                                                                                              |                                                                                                                                                           |
| SYSTEM      | 0x04000000                       | 0x02C00000  | 0x01488000                                                                                                              | 0x02A50000                                                                                                                                                | 0x01778000                                                                                                              | 0x001B0000                                                                                                                                                |
| BASE        | 0x06C00000                       | 0x01400000  | 0x01202000                                                                                                              | 0x01236000                                                                                                                                                | 0x001FE000                                                                                                              | 0x001CA000                                                                                                                                                |

# ARM11 Detailed virtual memory map

(valid only for FW0B, see [Memory map by
firmware](#memory_map_by_firmware "wikilink") for subsequent versions)

```
E8000000 - E8600000: mapped VRAM (18000000 - 18600000)
```

```
EFF00000 - F0000000: mapped Internal memory (1FF00000 - 20000000)
F0000000 - F8000000: mapped Main memory
```

```
FF401000 - FF402000: mapped ? (27FC7000 - 27FC8000)
```

```
FF403000 - FF404000: mapped ? (27FC2000 - 27FC3000)
```

```
FF405000 - FF406000: mapped ? (27FBB000 - 27FBC000)
```

```
FF407000 - FF408000: mapped ? (27FB3000 - 27FB4000)
```

```
FF409000 - FF40A000: mapped ? (27F8E000 - 27F8F000)
```

```
FFF00000 - FFF45000: mapped SlabHeap 
```

```
FFF60000 - FFF8B000: mapped Kernel code
```

```
FFFCC000 - FFFCD000: mapped IO `[`I2C`](I2C "wikilink")` second bus (10144000 - 10145000)
```

```
FFFCE000 - FFFCF000: mapped IO PDC(`[`LCD`](LCD "wikilink")`) (10400000 - 10401000)
```

```
FFFD0000 - FFFD1000: mapped IO PDN (10141000 - 10142000)
```

```
FFFD2000 - FFFD3000: mapped IO PXI (10163000 - 10164000)
```

```
FFFD4000 - FFFD5000: mapped IO PAD (10146000 - 10147000)
```

```
FFFD6000 - FFFD7000: mapped IO LCD (10202000 - 10203000)
```

```
FFFD8000 - FFFD9000: mapped IO DSP (10140000 - 10141000)
```

```
FFFDA000 - FFFDB000: mapped IO XDMA (10200000 - 10201000)
```

```
FFFDC000 - FFFE0000: mapped ? (1FFF8000 - 1FFFC000)
```

```
FFFE1000 - FFFE2000: mapped ? (1FFF0000 - 1FFF1000)
```

```
FFFE3000 - FFFE4000: mapped ? (1FFF2000 - 1FFF3000)
```

```
FFFE5000 - FFFE9000: mapped L1 MMU table for VA xxx00000
```

```
FFFEA000 - FFFEB000: mapped ? (1FFF1000 - 1FFF2000)
```

```
FFFEC000 - FFFED000: mapped ? (1FFF3000 - 1FFF4000)
```

```
FFFEE000 - FFFF0000: mapped IO IRQ (17E00000 - 17E02000)
```

```
FFFF0000 - FFFF1000: mapped Exception vectors
```

```
FFFF2000 - FFFF6000: mapped L1 MMU table for VA xxx00000
```

```
FFFF7000 - FFFF8000: mapped ? (1FFF1000 - 1FFF2000)
```

```
FFFF9000 - FFFFA000: mapped ? (1FFF3000 - 1FFF4000)
```

```
FFFFB000 - FFFFE000: mapped L2 MMU tables (1FFF5000 - 1FFF8000)
```

## 0xFF4XX000

Each [thread](KThread "wikilink") is allocated a 0x1000-byte page in
this region for the [thread context](KThreadContext "wikilink"): the
first page at 0xFF401000 is for the first created thread, 0xFF403000 for
the second thread. This region is used to store the SVC-mode stack for
the thread, and thread context data used for context switching. When the
IRQ handler, prefetch/data abort handlers, and undefined instruction
handler are entered where the SPSR-mode=user, these handlers then store
LR+SPSR for the current mode on the SVC-mode stack, then these handlers
switch to SVC-mode.

This page does not contain a dedicated block for storing R0-PC(etc). For
user-mode, the user-mode regs are instead saved on the SVC-mode stack
when IRQs such as timers for context switching are triggered.

For NATIVE_FIRM the memory pages for this region are located in FCRAM,
however for TWL_FIRM these are located in AXI WRAM. For TWL_FIRM v6704
the first thread's page for this region is located at physical address
0x1FF93000, the next one at 0x1FF92000, etc.

## IO Process virtual addressing equivalence

It seems an IO register's process virtual address can be calculated by
adding 0xEB00000 to its physical address. However for kernel mappings
there is no fixed address equivalence.

# ARM11 User-land memory regions

## NATIVE_FIRM/SAFE_MODE_FIRM Userland Memory

| Virtual Address Base    | Physical Address Base                                                         | Region Max Size                                                | Address-range available for svcMapMemoryBlock | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|-------------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00100000 / 0x14000000 |                                                                               | 0x03F00000                                                     | No                                            | The [ExeFS](ExeFS "wikilink"):/.code is loaded here, executables must be loaded to the 0x00100000 region when the exheader "special memory" flag is clear. The 0x03F00000-byte size restriction only applies when this flag is clear. Executables are usually loaded to 0x14000000 when the exheader "special memory" flag is set, however this address can be arbitrary.                                                                                             |
| 0x04000000              | ?                                                                             | ?                                                              | No                                            | Used for mapping buffers during IPC, see [IPC Command Structure](IPC_Command_Structure "wikilink").                                                                                                                                                                                                                                                                                                                                                                   |
| 0x08000000              | Main stack physaddr - \<heap size for the allocated vaddr 0x08000000 memory\> | 0x08000000                                                     | Yes                                           | Heap mapped by [ControlMemory](SVC "wikilink")                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 0x10000000-StackSize    | .bss physical address - total stack pages                                     | StackSize from process exheader                                |                                               | Stack for the main-thread, initialized by the ARM11 kernel. The StackSize from the exheader is usually 0x4000, therefore the stack-bottom is usually 0x0FFFC000. The stack for the other threads is normally located in the process .data section however this can be arbitrary.                                                                                                                                                                                      |
| 0x10000000              |                                                                               | 0x04000000                                                     | Yes                                           | [Shared](SVC "wikilink") memory                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0x14000000              | FCRAM+0                                                                       | 0x08000000                                                     | No                                            | Can be mapped by [ControlMemory](SVC "wikilink"), this is used for processes' [LINEAR](SVC "wikilink")/GSP heap.                                                                                                                                                                                                                                                                                                                                                      |
| 0x1E800000              | 0x1F000000                                                                    | 0x00400000                                                     | No                                            | [New_3DS](New_3DS "wikilink") additional memory, access to this is specified by the exheader. Added with [8.0.0-18](8.0.0-18 "wikilink"), see above section regarding this memory.                                                                                                                                                                                                                                                                                    |
| 0x1EC00000              | 0x10100000                                                                    | 0x00400000                                                     | No                                            | [IO](IO_Registers "wikilink") registers, the mapped IO pages which each process can access is specified in the [exheader](NCCH/Extended_Header "wikilink"). (Applications normally don't have access to registers in this range)                                                                                                                                                                                                                                      |
| 0x1F000000              | 0x18000000                                                                    | 0x00600000                                                     | No                                            | VRAM, access to this is specified by the exheader.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 0x1FF00000              | 0x1FF00000                                                                    | 0x00080000                                                     | No                                            | DSP memory, access to this is specified by the exheader.                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x1FF80000              | FCRAM memory page allocated by the ARM11 kernel.                              | 0x1000                                                         | No                                            | [Configuration Memory](Configuration_Memory "wikilink"), all processes have read-only access to this.                                                                                                                                                                                                                                                                                                                                                                 |
| 0x1FF81000              | FCRAM memory page allocated by the ARM11 kernel.                              | 0x1000                                                         | No                                            | [Shared](Configuration_Memory "wikilink") page, all processes have read-access to this. Write access to this is specified by the exheader "Shared page writing" kernel flag.                                                                                                                                                                                                                                                                                          |
| 0x1FF82000              | Dynamically taken from the BASE region of FCRAM                               | Number of threads \* 0x1000 / 8                                | No                                            | [Thread Local Storage](Thread_Local_Storage "wikilink")                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x30000000              | FCRAM+0                                                                       | 0x08000000(Old3DS) / 0x10000000([New_3DS](New_3DS "wikilink")) | No                                            | This LINEAR memory mapping was added with [8.0.0-18](8.0.0-18 "wikilink"), see [here](SVC#enum_memoryoperation "wikilink"). This replaces the original 0x14000000 mapping, for system(memory-region=BASE)/newer titles. The Old3DS kernel uses size 0x08000000 for LINEAR-memory address range checks, while the New3DS kernel uses size 0x10000000 for those range checks. Old3DS/New3DS system-module code doing vaddr-\>phys-addr conversion uses size 0x10000000. |
| 0x20000000 / 0x40000000 |                                                                               |                                                                |                                               | This is the end-address of userland memory, memory under this address is process-unique. Memory starting at this address is only accessible in privileged-mode. This address was changed from 0x20000000 to 0x40000000 with [8.0.0-18](8.0.0-18 "wikilink").                                                                                                                                                                                                          |

All executable pages are read-only, and data pages have the
execute-never permission set. Normally .text from the loaded
ExeFS:/.code is the only mapped executable memory. Executable
[CROs](RO_Services "wikilink") can be loaded into memory, once loaded
the CRO .text section memory page permissions are changed via
[ControlProcessMemory](SVC "wikilink") from RW- to R-X. The address and
size of each ExeFS:/.code section is stored in the exheader, the
permissions for each section is: .text R-X, .rodata R--, .data RW-, and
.bss RW-. The loaded .code is mapped to the addresses specified in the
exheader by the ARM11 kernel. The stack permissions is initialized by
the ARM11 kernel: RW-. The heap permissions is normally RW-.

All userland memory is mapped with RW permissions for privileged-mode.
However, normally the ARM11 kernel only uses userland read/write
instructions(or checks that the memory can be written from userland
first) for accessing memory specified by [SVCs](SVC "wikilink").

Processes can't directly access memory for other processes. When service
[commands](Services_API "wikilink") are used, the kernel maps memory in
the destination process for input/output buffers, where the addresses in
the command received by the process is replaced by this mapped memory.
When this is an input buffer, the buffer data is copied to the mapped
memory. When this is an output buffer, the data stored in the mapped
memory is copied to the destination buffer specified in the command.

The physical address which memory for the application memory-type is
mapped to begins at FCRAM+0, the total memory allocated for this
memory-type is stored in
[Configuration_Memory](Configuration_Memory "wikilink"). Applications'
.text + .rodata + .data under the application memory-type is mapped at
FCRAM + APPMEMALLOC - (aligned page-size for .text + .rodata + .data).
The application .bss is mapped at CODEADDR - .bss size aligned down to
the page size.

## TWL_FIRM Userland Memory

| Virtual Address Base | Physical Address Base                                                        | Size       | Description                                                                                               |
|----------------------|------------------------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------|
| 0x00100000           | 0x1FFAB000 (with newer TWL_FIRM such as v6704 this is located at 0x1FFAC000) | 0x00055000 | Code + .(ro)data copied from the process 0x00300000 region is located here(.bss is located here as well). |
| 0x00155000           | 0x18555000                                                                   | 0x000AB000 |                                                                                                           |
| 0x00200000           | 0x18500000                                                                   | 0x00100000 |                                                                                                           |
| 0x00300000           | 0x24000000                                                                   | 0x04000000 | The beginning of the ARM11 process .text is located here.                                                 |
| 0x08000000           | 0x20000000                                                                   | 0x07E00000 |                                                                                                           |
| 0x1EC00000           | 0x10100000                                                                   | 0x00400000 | [IO](IO_Registers "wikilink")                                                                             |
| 0x1F000000           | 0x18000000                                                                   | 0x00600000 | VRAM                                                                                                      |
| 0x1FF00000           | 0x1FF00000                                                                   | 0x00080000 | This is mapped to the DSP memory.                                                                         |

The above regions are mapped by the ARM11 kernel. Later when the ARM11
process uses [svcKernelSetState](SVC "wikilink") with type4, the kernel
unmaps(?) the following regions: 0x00300000..0x04300000,
0x08000000..0x0FE00000, and 0x10000000..0xF8000000.

### Detailed TWL_FIRM ARM11 Memory

| Process Virtual Address | Physical Address | Size          | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|-------------------------|------------------|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x08000000              | 0x20000000       | 0x01000000\*4 | DS(i) 0x02000000 RAM. Vaddr = (DSRAMOffset\*4) + 0x08000000, where DSRAMOffset is DSRAMAddr-0x02000000.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x0FC00000              | 0x27C00000       |               | Loaded SRL binary, initially the dev DSi launcher SRL is located here(copied here by the ARM11 process).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 0x0FD00000              | 0x27D00000       |               | The data located here is copied to here by the ARM11 process. The data located here is a TWL NAND [bootloader](http://dsibrew.org/wiki/Bootloader) image, using the same format+encryption/verification methods as the DSi NAND bootloader(stage2). The keyX for this bootloader keyslot is initially set to the retail DSi key-data, however when TWL_FIRM is launched this keyX key-data is replaced with a separate keyX. TWL_FIRM can use either the retail DSi bootloader RSA-1024 modulus, or a seperate modulus: normally only the latter is used(the former is only used when loading the image from FS instead of FCRAM). When using the image from FCRAM(default code-path), TWL_FIRM will not calculate+check the hashes for the bootloader code binaries(this is done when loading from FS however). |
| 0x0FDF7000              | 0x27DF7000       | 0x1000        | SRL header                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

# System memory details

```
0xFFFF9000 Pointer to the current KThread instance
0xFFFF9004 Pointer to the current KProcess instance
0xFFFF9008 Pointer to the current KScheduler instance
0xFFFF900C Pointer to the current KSchedulableInterruptEventLinkedList instance
0xFFFF9010 Pointer to the last KThread to encounter an exception
```

```
0x8000040 Pointer to the current KThread instance on the ARM9
0x8000044 Pointer to the current KProcess instance on the ARM9
0x8000048 Pointer to the current KScheduler instance on the ARM9
```

# VRAM Map While Running System Applets

- 0x1E6000-0x22C500 -- top screen 3D left framebuffer 0(240x400x3) (The
  "3D right first-framebuf" addr stored in the LCD register is set to
  this, when the 3D is set to "off")
- 0x22C800-0x272D00 -- top screen 3D right framebuffer 0(240x400x3)
- 0x273000-0x2B9500 -- top screen 3D left framebuffer 1(240x400x3)
- 0x2B9800-0x2FFD00 -- top screen 3D right framebuffer 1(240x400x3)
- 0x48F000-0x4C7400 -- bottom screen framebuffer 0(240x320x3)
- 0x4C7800-0x4FF800 -- bottom screen framebuffer 1(240x320x3)

These LCD framebuffer addresses are not changed by the system when
launching regular applications, the application itself handles that if
needed. These VRAM framebuffers are cleared when launching regular
applications.

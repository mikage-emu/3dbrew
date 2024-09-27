+++
title = 'OTP Registers'
+++

This region (0x10012000-0x10012100) is used as persistent storage on SoC
and for passing the TWL console ID around (0x10012100-0x10012108).

## Overview

Console-unique keys are derived from here. Access to this region is
disabled once the ARM9 writes 0x2 to [REG_SYSPROT9](CONFIG "wikilink").

This is the console-unique data store, including
[CTCert](CTCert "wikilink") etc, that ends up in ITCM at 0x01FFB800.
After decryption, the first 0x90-bytes of plaintext are copied to
0x01FFB800 if hash verification passes. Refer to
[Memory_layout#ARM9_ITCM](Memory_layout#ARM9_ITCM "wikilink") for what
is contained in the decrypted OTP.

On [FIRM](FIRM "wikilink") versions prior to
[3.0.0-X](3.0.0-6 "wikilink"), this region was left unprotected. On
versions since [3.0.0-X](3.0.0-6 "wikilink"), this has been fixed, and
the region disable is now done by Kernel9 after doing console-unique TWL
keyinit, by setting bit 1 of [REG_SYSPROT9](CONFIG "wikilink"). However,
with the [New_3DS](New_3DS "wikilink") FIRM ARM9 binary this is now done
in the [FIRM](FIRM "wikilink") ARM9 binary loader, which also uses the
0x10012000 region for New 3DS key generation.

On development units ([UNITINFO](CONFIG "wikilink") != 0) ARM9 uses the
first 8-bytes from 0x10012000 for the TWL Console ID. This region
doesn't seem to be used by NATIVE_FIRM on retail at all, besides New3DS
key-generation in the [ARM9-loader](FIRM "wikilink").

Normally [Boot9](Bootloader "wikilink") will pass plaintext_otp+0x90 to
the AES keyinit function, but when hash verification fails it will pass
0x10012000(otp+0) instead.

## Sections

| Offset | Size  | Description                                                                                                                                                                                                                          |
|--------|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x100 | Console-unique data encrypted with AES-CBC. The normalkey and IV are stored in Boot9(retail/devunit have seperate normalkey+IV for this). The last 0x20-bytes of plaintext are a SHA256 hash over the first 0xE0-bytes of plaintext. |
| 0x100  | 0x8   | Before writing REG_SYSPROT9 bit1, the ARM9 copies the 8-byte TWL Console ID here. This sets the registers at 0x4004D00 for ARM7.                                                                                                     |

## Plaintext OTP

<table>
<thead>
<tr class="header">
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x4</p></td>
<td><p>This is always 0xDEADB00F.</p></td>
</tr>
<tr class="even">
<td><p>0x4</p></td>
<td><p>0x4</p></td>
<td><p>This is the u32 DeviceId.</p></td>
</tr>
<tr class="odd">
<td><p>0x8</p></td>
<td><p>0x10</p></td>
<td><p>This is the fall-back keyY used for movable.sed keyY when
movable.sed doesn't exist in NAND(the first two words here are used on
retail for generating console-unique TWL keydata/etc). This is also used
for "LocalFriendCodeSeed", etc.</p></td>
</tr>
<tr class="even">
<td><p>0x18</p></td>
<td><p>0x1</p></td>
<td><p>OTP version</p></td>
</tr>
<tr class="odd">
<td><p>0x19</p></td>
<td><p>0x1</p></td>
<td><p>This determines if the OTP is for a dev system; it indicates the
<a href="../CTCert" title="wikilink">CTCert</a> issuer type: 0 = retail
"Nintendo CA - G3_NintendoCTR2prod", non-zero = dev "Nintendo CA -
G3_NintendoCTR2dev".</p></td>
</tr>
<tr class="even">
<td><p>0x1A</p></td>
<td><p>0x6</p></td>
<td><p>Manufacturing date (of the SoC?). Usually month(s) before the
dates in the logs stored in <a href="../Flash_Filesystem"
title="wikilink">TWLNAND</a>. Each byte is one field: year, month, day,
hour, minute, second. Year is encoded as year-1900 so that it fits in
one byte. This order matches up with the layout of a
<code>struct tm</code>.</p></td>
</tr>
<tr class="odd">
<td><p>0x20</p></td>
<td><p>0x4</p></td>
<td><p>This is the CTCert expiry time as UNIX timestamp, this is
specified in big endian if the OTP version is &lt;5.</p></td>
</tr>
<tr class="even">
<td><p>0x24</p></td>
<td><p>0x20</p></td>
<td><p>This is the CTCert ECDSA privk.</p></td>
</tr>
<tr class="odd">
<td><p>0x44</p></td>
<td><p>0x3C</p></td>
<td><p>This is the CTCert ECDSA signature (sect233r1?/SHA-256).</p></td>
</tr>
<tr class="even">
<td><p>0x80</p></td>
<td><p>0x10</p></td>
<td><p>This is all-zero.</p></td>
</tr>
<tr class="odd">
<td><p>0x90</p></td>
<td><p>0x70</p></td>
<td><p>Used by Boot9 for generating the console-unique AES <a
href="../AES_Registers" title="wikilink">keyXs</a>. However, due to a
bug(?) in Boot9, only the first 0x1C-bytes here actually affect
console-unique key generation. The rest of the data is used for hashing,
but that output hash only gets overwritten without being used
afterwards.</p>
<p>Note that the size passed to the Boot9 keyinit code for
console-unique-buffer-size is 0x70, hence this includes the below OTP
hash.</p></td>
</tr>
<tr class="even">
<td><p>0xE0</p></td>
<td><p>0x20</p></td>
<td><p>SHA256 hash over the previous 0xE0-bytes.</p></td>
</tr>
</tbody>
</table>

+++
title = 'PSPXI:EncryptDecryptAes'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000401C4\] |
| 1          | Size in bytes              |
| 2-5        | IV / CTR                   |
| 6          | u8 Algorithm Type (0..5)   |
| 7          | u8 Key Type (0..7)         |
| 8          | (size\<\<8) \| 0x4         |
| 9          | Source pointer             |
| 10         | (size\<\<8) \| 0x14        |
| 11         | Destination pointer        |

# Response

| Index Word | Description                                                                                       |
|------------|---------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00040140\]                                                                        |
| 1          | Result code                                                                                       |
| 2-5        | Output IV / CTR: this is the IV/CTR which would be used if the crypto operation were to continue. |

## Algorithm Types

| Type | Description |
|------|-------------|
| 0    | CBC Encrypt |
| 1    | CBC Decrypt |
| 2    | CTR Encrypt |
| 3    | CTR Decrypt |
| 4    | CCM Encrypt |
| 5    | CCM Decrypt |

## Key Types

<table>
<thead>
<tr class="header">
<th><p>Type</p></th>
<th><p><a href="AES" title="wikilink">AES</a> Engine Keyslot</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>0x0D</p></td>
<td><p>Used to decrypt the SSL client cert/private-key stored in <a
href="ClCertA" title="wikilink">ClCertA</a>.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>0x2D</p></td>
<td><p>Used to generate the UDS <a href="NWM_Services"
title="wikilink">local-WLAN</a> CCMP key.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>0x31</p></td>
<td><p>This is used by <a href="NS" title="wikilink">NS</a> for the APT
AES-CCM Wrap/Unwrap commands. These two NS commands are used by the <a
href="Mii_Maker" title="wikilink">Mii Maker</a> application for the
encrypted Mii data in the Mii QR codes.</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>0x38</p></td>
<td><p><a href="SpotPass" title="wikilink">BOSS</a></p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>0x32</p></td>
<td><p>?</p></td>
</tr>
<tr class="even">
<td><p>5</p></td>
<td><p>0x39</p></td>
<td><p>This is used by the <a href="Download_Play"
title="wikilink">Download Play</a> module for calculating a 32bit
checksum over the entire UDS application data-fames, stored in the DLP
data-frame header.</p></td>
</tr>
<tr class="odd">
<td><p>6</p></td>
<td><p>0x2E</p></td>
<td><p>This is used by the <a href="StreetPass"
title="wikilink">StreetPass</a> CECD module to generate the CCMP key
passed to <a href="NWM_Services" title="wikilink">nwm::CEC</a> commands,
when beginning StreetPass communications.</p></td>
</tr>
<tr class="even">
<td><p>7</p></td>
<td></td>
<td><p>Invalid</p></td>
</tr>
<tr class="odd">
<td><p>8</p></td>
<td><p>0x36</p></td>
<td><p>This is used by the friends module.</p>
<p>Support for this keytype was added with the NATIVE_FIRM updated with
<a href="2.2.0-X" title="wikilink">2.2.0-X</a>. When the running
NATIVE_FIRM doesn't support this keytype, the result is the same as
using keytype7.</p></td>
</tr>
<tr class="even">
<td><p>9</p></td>
<td><p>0x39</p></td>
<td><p>This is used by the NFC module.</p>
<p>Support for this keytype was added with the NATIVE_FIRM updated with
<a href="9.3.0-21" title="wikilink">9.3.0-X</a>. When the running
NATIVE_FIRM doesn't support this keytype, the result is the same as
using keytype7. Before selecting this keyslot, Process9 writes a keyY
from the Process9 .(ro)data section(keydata is different for retail/dev
units) to this keyslot. Once finished with crypto, Process9 restores the
original keyY to this keyslot.</p></td>
</tr>
<tr class="odd">
<td><p>&gt;=10</p></td>
<td></td>
<td><p>Invalid, same as keytype7.</p></td>
</tr>
</tbody>
</table>

# Description

This is used to encrypt/decrypt data via the [AES](AES "wikilink")
engine. AES-CCM is not supported by this command,
[PSPXI:EncryptSignDecryptVerifyAesCcm](PSPXI:EncryptSignDecryptVerifyAesCcm "wikilink")
must be used for AES-CCM instead.
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
<th>Type</th>
<th><a href="../AES" title="wikilink">AES</a> Engine Keyslot</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>0x0D</td>
<td>Used to decrypt the SSL client cert/private-key stored in <a
href="../ClCertA" title="wikilink">ClCertA</a>.</td>
</tr>
<tr class="even">
<td>1</td>
<td>0x2D</td>
<td>Used to generate the UDS <a href="../NWM_Services"
title="wikilink">local-WLAN</a> CCMP key.</td>
</tr>
<tr class="odd">
<td>2</td>
<td>0x31</td>
<td>This is used by <a href="../NS" title="wikilink">NS</a> for the APT
AES-CCM Wrap/Unwrap commands. These two NS commands are used by the <a
href="../Mii_Maker" title="wikilink">Mii Maker</a> application for the
encrypted Mii data in the Mii QR codes.</td>
</tr>
<tr class="even">
<td>3</td>
<td>0x38</td>
<td><a href="../SpotPass" title="wikilink">BOSS</a></td>
</tr>
<tr class="odd">
<td>4</td>
<td>0x32</td>
<td>?</td>
</tr>
<tr class="even">
<td>5</td>
<td>0x39</td>
<td>This is used by the <a href="../Download_Play"
title="wikilink">Download Play</a> module for calculating a 32bit
checksum over the entire UDS application data-fames, stored in the DLP
data-frame header.</td>
</tr>
<tr class="odd">
<td>6</td>
<td>0x2E</td>
<td>This is used by the <a href="../StreetPass"
title="wikilink">StreetPass</a> CECD module to generate the CCMP key
passed to <a href="../NWM_Services" title="wikilink">nwm::CEC</a> commands,
when beginning StreetPass communications.</td>
</tr>
<tr class="even">
<td>7</td>
<td></td>
<td>Invalid</td>
</tr>
<tr class="odd">
<td>8</td>
<td>0x36</td>
<td>This is used by the friends module.</p>
<p>Support for this keytype was added with the NATIVE_FIRM updated with
<a href="../2.2.0-X" title="wikilink">2.2.0-X</a>. When the running
NATIVE_FIRM doesn't support this keytype, the result is the same as
using keytype7.</td>
</tr>
<tr class="even">
<td>9</td>
<td>0x39</td>
<td>This is used by the NFC module.</p>
<p>Support for this keytype was added with the NATIVE_FIRM updated with
<a href="../9.3.0-21" title="wikilink">9.3.0-X</a>. When the running
NATIVE_FIRM doesn't support this keytype, the result is the same as
using keytype7. Before selecting this keyslot, Process9 writes a keyY
from the Process9 .(ro)data section(keydata is different for retail/dev
units) to this keyslot. Once finished with crypto, Process9 restores the
original keyY to this keyslot.</td>
</tr>
<tr class="odd">
<td>&gt;=10</td>
<td></td>
<td>Invalid, same as keytype7.</td>
</tr>
</tbody>
</table>

# Description

This is used to encrypt/decrypt data via the [AES](AES "wikilink")
engine. AES-CCM is not supported by this command,
[PSPXI:EncryptSignDecryptVerifyAesCcm](PSPXI:EncryptSignDecryptVerifyAesCcm "wikilink")
must be used for AES-CCM instead.

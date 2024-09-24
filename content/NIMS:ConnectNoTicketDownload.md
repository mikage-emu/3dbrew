+++
title = 'NIMS:ConnectNoTicketDownload'
+++

# Request

<table>
<thead>
<tr class="header">
<th><p>Index Word</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Header code [0x00570082]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Pointer to a buffer</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Length of the buffer</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>(size &lt;&lt; 4)}} for mapping a <a
href="../IPC#Buffer_Mapping_Translation" title="wikilink">write-only
buffer</a> in the target process</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>Pointer to a buffer (same as input word 1)</p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Connects [NIM](NIM_Services "wikilink") to the network for further use.
This is *required* before any actual actions, such as
[NIMS:RegisterTask](NIMS:RegisterTask "wikilink") or
[NIMS:StartDownload](NIMS:StartDownload "wikilink") can be taken.

The buffer is a scratch buffer for nim. [eShop](EShop "wikilink")
provides a buffer of 0x20000 bytes.

This command does not appear to affect tickets.
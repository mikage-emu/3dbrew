+++
title = 'NIMS:ConnectNoTicketDownload'
+++

# Request

<table>
<thead>
<tr class="header">
<th>Index Word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>Header code [0x00570082]</td>
</tr>
<tr class="even">
<td>1</td>
<td>Pointer to a buffer</td>
</tr>
<tr class="odd">
<td>2</td>
<td>Length of the buffer</td>
</tr>
<tr class="even">
<td>3</td>
<td>(size &lt;&lt; 4)}} for mapping a <a
href="../IPC#Buffer_Mapping_Translation" title="wikilink">write-only
buffer</a> in the target process</td>
</tr>
<tr class="odd">
<td>4</td>
<td>Pointer to a buffer (same as input word 1)</td>
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

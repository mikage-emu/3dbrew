+++
title = 'GSPGPU:WriteHWRegs'
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
<td><p>Header code [0x00010082]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p><a href="GPU" title="wikilink">GPU</a> address based at
0x1EB00000, must be word-aligned</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Size, must be &lt;=0x80 and word-aligned</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>Data pointer</p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes the input data to the specified GPU register address. The
GPU register offset must be \<0x420000.
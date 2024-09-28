+++
title = 'GSPGPU:WriteHWRegs'
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
<td>Header code [0x00010082]</td>
</tr>
<tr class="even">
<td>1</td>
<td><a {{% href "/categories/GPU" "broken" %}} title="wikilink">GPU</a> address based at
0x1EB00000, must be word-aligned</td>
</tr>
<tr class="odd">
<td>2</td>
<td>Size, must be &lt;=0x80 and word-aligned</td>
</tr>
<tr class="even">
<td>3</td>
<td></td>
</tr>
<tr class="odd">
<td>4</td>
<td>Data pointer</td>
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

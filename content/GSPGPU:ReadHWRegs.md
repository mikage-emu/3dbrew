+++
title = 'GSPGPU:ReadHWRegs'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x00040080\]                                              |
| 1          | [GPU](categories/GPU "wikilink") address based at 0x1EB00000, must be word-aligned |
| 2          | Size, must be \<=0x80 and word-aligned                                  |

The following is located 0x100-bytes after the beginning of the above
command buffer:

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
<td></td>
</tr>
<tr class="even">
<td>1</td>
<td>Output buffer address</td>
</tr>
</tbody>
</table>

# Response

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
<td>Header code</td>
</tr>
<tr class="even">
<td>1</td>
<td>Result code</td>
</tr>
<tr class="odd">
<td>2</td>
<td></td>
</tr>
<tr class="even">
<td>3</td>
<td>Output data pointer</td>
</tr>
</tbody>
</table>

# Description

The GPU register offset must be \<0x420000.

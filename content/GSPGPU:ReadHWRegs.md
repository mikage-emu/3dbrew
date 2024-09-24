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
<th><p>Index Word</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Output buffer address</p></td>
</tr>
</tbody>
</table>

# Response

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
<td><p>Header code</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Result code</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Output data pointer</p></td>
</tr>
</tbody>
</table>

# Description

The GPU register offset must be \<0x420000.

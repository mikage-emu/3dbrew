+++
title = 'DSP Binary'
categories = ["File formats","DSP"]
+++

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
<td>0x0</td>
<td>0x100</td>
<td>RSA Signature over bytes 0x100-0x300</td>
</tr>
<tr class="even">
<td>0x100</td>
<td>4</td>
<td>Magic ('DSP1')</td>
</tr>
<tr class="odd">
<td>0x104</td>
<td>4</td>
<td>DSP binary size</td>
</tr>
<tr class="even">
<td>0x108</td>
<td>2</td>
<td>Memory layout (bits 0-7: Program ram, 8-15: Data ram). Each bit
represents a memory region. The region is always 0x8000 bytes in size
(the first region starts at 0x1FF00000; the next is a 0x1FF08000 and so
on). The HW registers for DSP memory configuration are <a
{{% href "../CONFIG11_Registers" %}}
title="wikilink">CFG11_SHAREDWRAM_32K_DATA</a> and <a
{{% href "../CONFIG11_Registers" %}}
title="wikilink">CFG11_SHAREDWRAM_32K_CODE</a>, located at physical
address 0x10140000 (mapped to 0x1EC40000).</td>
</tr>
<tr class="odd">
<td>0x10C</td>
<td>1</td>
<td>?</td>
</tr>
<tr class="even">
<td>0x10D</td>
<td>1</td>
<td>Special segment memory type (0=1=0x1FF00000(Program
ram)+,2=0x1FF40000(Data ram)+)</td>
</tr>
<tr class="odd">
<td>0x10E</td>
<td>1</td>
<td>Num segments (must be 1-10)</td>
</tr>
<tr class="even">
<td>0x10F</td>
<td>1</td>
<td>Flags:</p>
<p>bit0: if set, DSP module calls <a {{% href "../DSP:RecvData" %}}
title="wikilink">DSP:RecvData</a> on all three registers and expects
them to reply value 1</p>
<p>bit1: if set, load special segment</td>
</tr>
<tr class="odd">
<td>0x110</td>
<td>4</td>
<td>Special segment Start address in 16-bit words</td>
</tr>
<tr class="even">
<td>0x114</td>
<td>4</td>
<td>Special segment size in bytes</td>
</tr>
<tr class="odd">
<td>0x118</td>
<td>8</td>
<td>Zero</td>
</tr>
<tr class="even">
<td>0x120</td>
<td>0x30*10</td>
<td>Segment records</td>
</tr>
</tbody>
</table>

If "special segment" flag is set, 0x214 bytes are read from
[CfgS:GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink") block
0x70000, and then copied to the special segment given. If the reading
fails, zeroes are written in its place. The purpose of this segment is
currently unknown.

Each segment record:

| Offset | Size | Description                                                                            |
|--------|------|----------------------------------------------------------------------------------------|
| 0      | 4    | Offset data                                                                            |
| 4      | 4    | Start address in 16-bit words (must be \< 0x20000 for type 0, \< 0x10000 for type 1,2) |
| 8      | 4    | Size in bytes                                                                          |
| 15     | 1    | Memory type (0=1=0x1FF00000 (Program ram)+,2=0x1FF40000 (Data ram)+)                   |
| 16     | 32   | SHA256 hash of segment                                                                 |

The normal ending of this files is \*.cdc

[Category:File formats](Category:File_formats "wikilink")
[Category:DSP](Category:DSP "wikilink")

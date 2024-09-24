+++
title = 'DSP Binary'
categories = ["File formats","DSP"]
+++

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x100</p></td>
<td><p>RSA Signature over bytes 0x100-0x300</p></td>
</tr>
<tr class="even">
<td><p>0x100</p></td>
<td><p>4</p></td>
<td><p>Magic ('DSP1')</p></td>
</tr>
<tr class="odd">
<td><p>0x104</p></td>
<td><p>4</p></td>
<td><p>DSP binary size</p></td>
</tr>
<tr class="even">
<td><p>0x108</p></td>
<td><p>2</p></td>
<td><p>Memory layout (bits 0-7: Program ram, 8-15: Data ram). Each bit
represents a memory region. The region is always 0x8000 bytes in size
(the first region starts at 0x1FF00000; the next is a 0x1FF08000 and so
on). The HW registers for DSP memory configuration are <a
href="CONFIG11_Registers#CFG11_SHAREDWRAM_32K_DATA"
title="wikilink">CFG11_SHAREDWRAM_32K_DATA</a> and <a
href="CONFIG11_Registers#CFG11_SHAREDWRAM_32K_CODE"
title="wikilink">CFG11_SHAREDWRAM_32K_CODE</a>, located at physical
address 0x10140000 (mapped to 0x1EC40000).</p></td>
</tr>
<tr class="odd">
<td><p>0x10C</p></td>
<td><p>1</p></td>
<td><p>?</p></td>
</tr>
<tr class="even">
<td><p>0x10D</p></td>
<td><p>1</p></td>
<td><p>Special segment memory type (0=1=0x1FF00000(Program
ram)+,2=0x1FF40000(Data ram)+)</p></td>
</tr>
<tr class="odd">
<td><p>0x10E</p></td>
<td><p>1</p></td>
<td><p>Num segments (must be 1-10)</p></td>
</tr>
<tr class="even">
<td><p>0x10F</p></td>
<td><p>1</p></td>
<td><p>Flags:</p>
<p>bit0: if set, DSP module calls <a href="DSP:RecvData"
title="wikilink">DSP:RecvData</a> on all three registers and expects
them to reply value 1</p>
<p>bit1: if set, load special segment</p></td>
</tr>
<tr class="odd">
<td><p>0x110</p></td>
<td><p>4</p></td>
<td><p>Special segment Start address in 16-bit words</p></td>
</tr>
<tr class="even">
<td><p>0x114</p></td>
<td><p>4</p></td>
<td><p>Special segment size in bytes</p></td>
</tr>
<tr class="odd">
<td><p>0x118</p></td>
<td><p>8</p></td>
<td><p>Zero</p></td>
</tr>
<tr class="even">
<td><p>0x120</p></td>
<td><p>0x30*10</p></td>
<td><p>Segment records</p></td>
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
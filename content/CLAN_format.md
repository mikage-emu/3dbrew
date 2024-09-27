+++
title = 'CLAN Format'
categories = ["File formats"]
+++

CLAN (.bclan) is the layout animation format used on the 3DS. It stands
for (**B**inary) **C**TR **L**ayout **An**imation, and is similar to the
RLAN format used on the Wii.

## Header

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (CLAN) |
| 0x04   | 0x2  | UInt16 | Byte Order Mark  |
| 0x06   | 0x2  | UInt16 | Header Length    |
| 0x08   | 0x4  | UInt32 | Revision         |
| 0x0C   | 0x4  | UInt32 | File Size        |
| 0x10   | 0x4  | UInt32 | Nr Sections      |

## pat1 (Pattern 1)

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (pat1) |
| 0x04   | 0x4  | UInt32 | Section Size     |
| 0x08   | 0x4  | UInt32 | Flags?           |
| 0x0C   | 0x4  | UInt32 | ?                |
| 0x10   | 0x4  | Int32  | ?                |
| 0x14   | 0x4  | UInt32 | ?                |
| 0x18   | 0x10 | String | Pattern name     |

## pai1 (Pattern Instruction? 1)

| Offset | Size | Type   | Description                       |
|--------|------|--------|-----------------------------------|
| 0x00   | 0x4  | String | Signature (pai1)                  |
| 0x04   | 0x4  | UInt32 | Section Size                      |
| 0x08   | 0x4  | UInt32 | ?                                 |
| 0x0C   | 0x4  | UInt32 | Flags?                            |
| 0x10   | 0x4  | UInt32 | Nr entries?                       |
| 0x14   | 0x4  | UInt32 | Entries offset (relative to pai1) |

### Instruction? entry

| Offset | Size | Type   | Description                                |
|--------|------|--------|--------------------------------------------|
| 0x00   | 0x14 | String | Target panel name                          |
| 0x14   | 0x4  | UInt32 | Flags?                                     |
| 0x18   | 0x4  | UInt32 | Animation entry offset (relative to entry) |
| 0x1C   | 0x4  | UInt32 | ? (if flag bit 1 is set)                   |

### Animation entry

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Type</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>0x4</p></td>
<td><p>String</p></td>
<td><p>Animation type</p>
<table>
<thead>
<tr class="header">
<th><p>Name</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>CLPA</p></td>
<td><p><strong>C</strong>TR <strong>L</strong>ayout
<strong>PA</strong>ne SRT (Scale/Rotate/Translate) animation.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>CLTS</p></td>
<td><p><strong>C</strong>TR <strong>L</strong>ayout
<strong>T</strong>exture <strong>S</strong>RT animation.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>CLVI</p></td>
<td><p><strong>C</strong>TR <strong>L</strong>ayout
<strong>VI</strong>sibility animation.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>CLVC</p></td>
<td><p><strong>C</strong>TR <strong>L</strong>ayout
<strong>V</strong>ertex <strong>C</strong>olor animation.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>CLMC</p></td>
<td><p><strong>C</strong>TR <strong>L</strong>ayout
<strong>M</strong>aterial <strong>C</strong>olor animation.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>CLTP</p></td>
<td><p><strong>C</strong>TR <strong>L</strong>ayout
<strong>T</strong>exture <strong>P</strong>attern animation.</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Nr of animations</p></td>
</tr>
<tr class="odd">
<td><p>0x05</p></td>
<td><p>0x3</p></td>
<td><p>UInt8[3]</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>?</p></td>
</tr>
</tbody>
</table>

## See also

- <http://wiki.tockdom.com/wiki/BRLAN>
- <http://wiibrew.org/wiki/Wii_Animations#Animations_.28.2A.brlan.29>

[Category:File formats](Category:File_formats "wikilink")
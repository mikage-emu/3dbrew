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
<th>Offset</th>
<th>Size</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x00</td>
<td>0x4</td>
<td>String</td>
<td>Animation type</p>
<table>
<thead>
<tr class="header">
<th>Name</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>CLPA</td>
<td><strong>C</strong>TR <strong>L</strong>ayout
<strong>PA</strong>ne SRT (Scale/Rotate/Translate) animation.</td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>CLTS</td>
<td><strong>C</strong>TR <strong>L</strong>ayout
<strong>T</strong>exture <strong>S</strong>RT animation.</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>CLVI</td>
<td><strong>C</strong>TR <strong>L</strong>ayout
<strong>VI</strong>sibility animation.</td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>CLVC</td>
<td><strong>C</strong>TR <strong>L</strong>ayout
<strong>V</strong>ertex <strong>C</strong>olor animation.</td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>CLMC</td>
<td><strong>C</strong>TR <strong>L</strong>ayout
<strong>M</strong>aterial <strong>C</strong>olor animation.</td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>CLTP</td>
<td><strong>C</strong>TR <strong>L</strong>ayout
<strong>T</strong>exture <strong>P</strong>attern animation.</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td>0x04</td>
<td>0x1</td>
<td>UInt8</td>
<td>Nr of animations</td>
</tr>
<tr class="odd">
<td>0x05</td>
<td>0x3</td>
<td>UInt8[3]</td>
<td>Padding</td>
</tr>
<tr class="even">
<td>?</td>
<td>?</td>
<td>?</td>
<td>?</td>
</tr>
</tbody>
</table>

## See also

- <http://wiki.tockdom.com/wiki/BRLAN>
- <http://wiibrew.org/wiki/Wii_Animations#Animations_.28.2A.brlan.29>

[Category:File formats](Category:File_formats "wikilink")

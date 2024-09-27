+++
title = 'CLYT Format'
categories = ["File formats"]
+++

**CLYT** (.bclyt) is the layout format used on the 3DS. It stands for
(**B**inary) **C**TR **L**a**y**ou**t**, and is similar to the RLYT
format used on the Wii.

## Header

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (CLYT) |
| 0x04   | 0x2  | UInt16 | Byte Order Mark  |
| 0x06   | 0x2  | UInt16 | Header Length    |
| 0x08   | 0x4  | UInt32 | Revision         |
| 0x0C   | 0x4  | UInt32 | File Size        |
| 0x10   | 0x2  | UInt16 | Nr Sections      |
| 0x12   | 0x2  | UInt16 | Padding          |

## lyt1 (Layout 1)

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
<td>Signature (lyt1)</td>
</tr>
<tr class="even">
<td>0x04</td>
<td>0x4</td>
<td>UInt32</td>
<td>Section Size</td>
</tr>
<tr class="odd">
<td>0x08</td>
<td>0x4</td>
<td>UInt32</td>
<td>Origin type</p>
<table>
<thead>
<tr class="header">
<th>Value</th>
<th>Meaning</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>Classic</td>
</tr>
<tr class="even">
<td>1</td>
<td>Normal</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td>0x0C</td>
<td>0x8</td>
<td>Vector2</td>
<td>Canvas Size</td>
</tr>
</tbody>
</table>

## txl1 (Texture List 1)

| Offset | Size   | Type       | Description                                                |
|--------|--------|------------|------------------------------------------------------------|
| 0x00   | 0x4    | String     | Signature (txl1)                                           |
| 0x04   | 0x4    | UInt32     | Section Size                                               |
| 0x08   | 0x4    | UInt32     | Nr Textures = N                                            |
| 0x0C   | N \* 4 | UInt32\[\] | Texture Name Offsets (relative to the start of this array) |

After this, the null terminated names follow.

## fnl1 (Font List 1)

| Offset | Size   | Type       | Description                                             |
|--------|--------|------------|---------------------------------------------------------|
| 0x00   | 0x4    | String     | Signature (fnl1)                                        |
| 0x04   | 0x4    | UInt32     | Section Size                                            |
| 0x08   | 0x4    | UInt32     | Nr Fonts = N                                            |
| 0x0C   | N \* 4 | UInt32\[\] | Font Name Offsets (relative to the start of this array) |

After this, the null terminated names follow.

## mat1 (Materials 1)

| Offset | Size   | Type       | Description                                                    |
|--------|--------|------------|----------------------------------------------------------------|
| 0x00   | 0x4    | String     | Signature (mat1)                                               |
| 0x04   | 0x4    | UInt32     | Section Size                                                   |
| 0x08   | 0x4    | UInt32     | Nr Materials = N                                               |
| 0x0C   | N \* 4 | UInt32\[\] | Material Entry Offsets (relative to the start of this section) |

After this, the material entries follow.

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
<td>0x14</td>
<td>String</td>
<td>Material Name</td>
</tr>
<tr class="even">
<td>0x14</td>
<td>0x4</td>
<td>RGBA8</td>
<td>Tev Color (Buffer Color?)</td>
</tr>
<tr class="odd">
<td>0x18</td>
<td>0x18</td>
<td>RGBA8[6]</td>
<td>Tev Constant Colors</td>
</tr>
<tr class="even">
<td>0x30</td>
<td>0x4</td>
<td>UInt32</td>
<td>Flags / bitfield</p>
<table>
<thead>
<tr class="header">
<th>Bit</th>
<th>Flag / data</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0-1</td>
<td>Nr texMap</td>
</tr>
<tr class="even">
<td>2-3</td>
<td>Nr texMatrix</td>
</tr>
<tr class="odd">
<td>4-5</td>
<td>Nr texCoordGen</td>
</tr>
<tr class="even">
<td>6-8</td>
<td>Nr tevStage</td>
</tr>
<tr class="odd">
<td>9</td>
<td>Has alphaCompare</td>
</tr>
<tr class="even">
<td>10</td>
<td>Has blendMode</td>
</tr>
<tr class="odd">
<td>11</td>
<td>Use Texture Only</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

### Texture Map Entry

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
<td>0x2</td>
<td>UInt16</td>
<td>Texture Index</td>
</tr>
<tr class="even">
<td>0x02</td>
<td>0x1</td>
<td>Byte</td>
<td>Bitfield</p>
<table>
<thead>
<tr class="header">
<th>Bit</th>
<th>Data</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0-1</td>
<td>Wrap S (Clamp = 0, Repeat = 1, Mirror = 2)</td>
</tr>
<tr class="even">
<td>2-3</td>
<td>Min Filter (0 = Near, 1 = Linear)</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="odd">
<td>0x03</td>
<td>0x1</td>
<td>Byte</td>
<td>Bitfield</p>
<table>
<thead>
<tr class="header">
<th>Bit</th>
<th>Data</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0-1</td>
<td>Wrap T (Clamp = 0, Repeat = 1, Mirror = 2)</td>
</tr>
<tr class="even">
<td>2-3</td>
<td>Mag Filter (0 = Near, 1 = Linear)</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

### Texture Matrix Entry

| Offset | Size | Type    | Description |
|--------|------|---------|-------------|
| 0x00   | 0x8  | Vector2 | Translation |
| 0x08   | 0x4  | Single  | Rotation    |
| 0x0C   | 0x8  | Vector2 | Scale       |

### Texture Coordinate Generation Entry

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
<td>0x1</td>
<td>UInt8</td>
<td>Type</p>
<table>
<thead>
<tr class="header">
<th>Value</th>
<th>Meaning</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>2x4 matrix</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td>0x01</td>
<td>0x1</td>
<td>UInt8</td>
<td>Source (N = Tex N, max 2)</td>
</tr>
<tr class="odd">
<td>0x02</td>
<td>0x2</td>
<td>UInt8[]</td>
<td>Padding</td>
</tr>
</tbody>
</table>

TODO: tevStage, alphaCompare, blendMode, etc...

## pan1(Pane 1)

Defines a Null pane, used mostly to keep panes grouped in hierarchies or
to control the children of a given pan1 without having to do so
individually.

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
<td>Signature (pan1)</td>
</tr>
<tr class="even">
<td>0x04</td>
<td>0x4</td>
<td>UInt32</td>
<td>Section Size</td>
</tr>
<tr class="odd">
<td>0x08</td>
<td>0x1</td>
<td>UInt8</td>
<td>Flags</p>
<table>
<thead>
<tr class="header">
<th>Bit</th>
<th>Flag</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>Visible</td>
</tr>
<tr class="even">
<td>1</td>
<td>InfluencedAlpha</td>
</tr>
<tr class="odd">
<td>2</td>
<td>LocationAdjust</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td>0x09</td>
<td>0x1</td>
<td>UInt8</td>
<td>Origin (1 = centered, 2 = right, 3 = left, )</td>
</tr>
<tr class="odd">
<td>0x0A</td>
<td>0x1</td>
<td>UInt8</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>0x0B</td>
<td>0x1</td>
<td>UInt8</td>
<td>Padding</td>
</tr>
<tr class="odd">
<td>0x0C</td>
<td>0x10</td>
<td>String</td>
<td>Pane name</td>
</tr>
<tr class="even">
<td>0x1C</td>
<td>0x8</td>
<td>String</td>
<td>Data</td>
</tr>
<tr class="odd">
<td>0x24</td>
<td>0xC</td>
<td>Vector3</td>
<td>Translation</td>
</tr>
<tr class="even">
<td>0x30</td>
<td>0xC</td>
<td>Vector3</td>
<td>Rotation</td>
</tr>
<tr class="odd">
<td>0x3C</td>
<td>0x8</td>
<td>Vector2</td>
<td>Scale</td>
</tr>
<tr class="even">
<td>0x44</td>
<td>0x8</td>
<td>Vector2</td>
<td>Size</td>
</tr>
</tbody>
</table>

## pic1(Picture 1)

**pic1** represents a picture that can be displayed in a layout. The
first 0x4C bytes are defined the same as
[pan1](CLYT_format#pan1_(pane_1) "wikilink") with minor differences.

| Offset                        | Size | Type    | Description                                      |
|-------------------------------|------|---------|--------------------------------------------------|
| 0x00                          | 0x4  | String  | Signature (pic1)                                 |
| 0x04                          | 0x4  | UInt32  | Section size (including the texture coordinates) |
| Same as pan1 from 0x8 to 0x4c |      |         |                                                  |
| 0x4C                          | 0x4  | RGBA8   | Top left vertex color                            |
| 0x50                          | 0x4  | RGBA8   | Top right vertex color                           |
| 0x54                          | 0x4  | RGBA8   | Bottom left vertex color                         |
| 0x58                          | 0x4  | RGBA8   | Bottom right vertex color                        |
| 0x5C                          | 0x2  | UInt16  | Material ID                                      |
| 0x5E                          | 0x2  | UInt16  | Nr texture coordinates = N                       |
| Texture coordinates entry     |      |         |                                                  |
| 0x60 + (N-1) \* 0x20          | 0x8  | Vector2 | Top left vertex texture coordinate               |
| 0x64 + (N-1) \* 0x20          | 0x8  | Vector2 | Top right vertex texture coordinate              |
| 0x68 + (N-1) \* 0x20          | 0x8  | Vector2 | Bottom left vertex texture coordinate            |
| 0x6C + (N-1) \* 0x20          | 0x8  | Vector2 | Bottom right vertex texture coordinate           |

## txt1 (Text 1)

A textbox used in layouts. The first 0x4C bytes are defined the same as
[pan1](CLYT_format#pan1_(pane_1) "wikilink") with minor differences.

| Offset                        | Size         | Type    | Description                                       |
|-------------------------------|--------------|---------|---------------------------------------------------|
| 0x00                          | 0x4          | String  | Signature (txt1)                                  |
| 0x04                          | 0x4          | UInt32  | Section size (including the textbox string)       |
| Same as pan1 from 0x8 to 0x4c |              |         |                                                   |
| 0x4C                          | 0x2          | Unknown | Flags (H Direction?)                              |
| 0x4E                          | 0x2          | Unknown | Flags (V Direction?)                              |
| 0x50                          | 0x4          | UInt32  | Material ID                                       |
| 0x54                          | 0x2          | Unknown | Flags (Line alignment?)                           |
| 0x56                          | 0x2          | Unknown | Padding                                           |
| 0x58                          | 0x4          | UInt32  | Offset from signature to beginning of the string  |
| 0x5C                          | 0x4          | RGBA8   | Font top color                                    |
| 0x60                          | 0x4          | RGBA8   | Font bottom color                                 |
| 0x64                          | 0x8          | Vector2 | Font scale                                        |
| 0x6C                          | 0x4          | Float   | Horizontal font spacing                           |
| 0x70                          | 0x4          | Float   | Vertical font spacing                             |
| 0x74                          | User defined | String  | Textbox text (must be multiple of 4), can be usd1 |

## wnd1 (Window 1)

A more complex type of [image pane](#pic1 "wikilink"), where the user
can define the content, the corners and the sides of it, depending on
what mode it's set to.

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
<td>Signature (wnd1)</td>
</tr>
<tr class="even">
<td>0x04</td>
<td>0x4</td>
<td>UInt32</td>
<td>Section size (including the texture coordinates)</td>
</tr>
<tr class="odd">
<td colspan="4"><p>Same as pan1 from 0x8 to 0x4c</td>
</tr>
<tr class="even">
<td>0x4C</td>
<td>0x4</td>
<td>float</td>
<td>Coordinate 1</td>
</tr>
<tr class="odd">
<td>0x50</td>
<td>0x4</td>
<td>float</td>
<td>Coordinate 2</td>
</tr>
<tr class="even">
<td>0x54</td>
<td>0x4</td>
<td>float</td>
<td>Coordinate 3</td>
</tr>
<tr class="odd">
<td>0x58</td>
<td>0x4</td>
<td>float</td>
<td>Coordinate 4</td>
</tr>
<tr class="even">
<td>0x5C</td>
<td>0x1</td>
<td>Byte</td>
<td>Number of frames (n)</td>
</tr>
<tr class="odd">
<td>0x5D</td>
<td>0x1</td>
<td>Byte</td>
<td>Flag</td>
</tr>
<tr class="even">
<td>0x5E</td>
<td>0x2</td>
<td>UInt16</td>
<td>Padding</td>
</tr>
<tr class="odd">
<td>0x60</td>
<td>0x4</td>
<td>UInt32</td>
<td>Window content offset (Points to 0x68)</td>
</tr>
<tr class="even">
<td>0x64</td>
<td>0x4</td>
<td>UInt32</td>
<td>Window frame offsets, offset to offsets of the materials for the
frames. (W)</td>
</tr>
<tr class="odd">
<td>0x68</td>
<td>0x4</td>
<td>RGBA8</td>
<td>Content box top left vertex color</td>
</tr>
<tr class="even">
<td>0x6C</td>
<td>0x4</td>
<td>RGBA8</td>
<td>Content box top right vertex color</td>
</tr>
<tr class="odd">
<td>0x70</td>
<td>0x4</td>
<td>RGBA8</td>
<td>Content box bottom left vertex color</td>
</tr>
<tr class="even">
<td>0x74</td>
<td>0x4</td>
<td>RGBA8</td>
<td>Content box bottom right vertex color</td>
</tr>
<tr class="odd">
<td>0x78</td>
<td>0x2</td>
<td>UInt16</td>
<td>Content box Material ID</td>
</tr>
<tr class="even">
<td>0x7A</td>
<td>0x2</td>
<td>UInt16</td>
<td>Number of Texture coordinates (N)</td>
</tr>
<tr class="odd">
<td colspan="4"><p>Texture coordinates entry</td>
</tr>
<tr class="even">
<td>0x7C + (N-1) * 0x20</td>
<td>0x8</td>
<td>Vector2</td>
<td>Top left vertex texture coordinate</td>
</tr>
<tr class="odd">
<td>0x84 + (N-1) * 0x20</td>
<td>0x8</td>
<td>Vector2</td>
<td>Top right vertex texture coordinate</td>
</tr>
<tr class="even">
<td>0x8C + (N-1) * 0x20</td>
<td>0x8</td>
<td>Vector2</td>
<td>Bottom left vertex texture coordinate</td>
</tr>
<tr class="odd">
<td>0x94 + (N-1) * 0x20</td>
<td>0x8</td>
<td>Vector2</td>
<td>Bottom right vertex texture coordinate</td>
</tr>
<tr class="even">
<td colspan="4"><p>Window frames</td>
</tr>
<tr class="odd">
<td>0x(W)</td>
<td>0x4 * n</td>
<td>UInt32</td>
<td>Offsets to frame materials</td>
</tr>
<tr class="even">
<td>0x(W)</td>
<td>0x4 * n</td>
<td>Window frame</td>
<td><table>
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
<td>0x0</td>
<td>UInt16</td>
<td>0x2</td>
<td>Frame Material ID</td>
</tr>
<tr class="even">
<td>0x2</td>
<td>Byte</td>
<td>0x1</td>
<td>Flip Type</td>
</tr>
<tr class="odd">
<td>0x3</td>
<td>Byte</td>
<td>0x1</td>
<td>Padding</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

Below is a table of possible material flip types. <sup><small>(From
Mario Kart Wii Wiki)</small></sup>

| Type | Description        |
|------|--------------------|
| 0    | None               |
| 1    | Flip (Horizontal)  |
| 2    | Flip (Vertical)    |
| 3    | Rotate 90 Degrees  |
| 4    | Rotate 180 Degrees |
| 5    | Rotate 270 Degrees |

## bnd1 (Bounding 1)

Same data structure as [Panes](#pan1_(pane_1) "wikilink"), but used to
limit interaction with buttons.

| Offset                        | Size | Type   | Description                                      |
|-------------------------------|------|--------|--------------------------------------------------|
| 0x00                          | 0x4  | String | Signature (bnd1)                                 |
| 0x04                          | 0x4  | UInt32 | Section size (including the texture coordinates) |
| Same as pan1 from 0x8 to 0x4c |      |        |                                                  |

## pas1 (Pane Start 1)

Marks the start of a pane hierarchy, with the parent being the previous
pane.

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (pas1) |
| 0x04   | 0x4  | UInt32 | Section Size     |

## pae1 (Pane End 1)

Marks the end of a pane hierarchy.

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (pae1) |
| 0x04   | 0x4  | UInt32 | Section Size     |

## grp1 (Group 1)

Starts a pane group, which can be inside other pane groups.

| Offset | Size      | Type        | Description             |
|--------|-----------|-------------|-------------------------|
| 0x00   | 0x4       | String      | Signature (grp1)        |
| 0x04   | 0x4       | UInt32      | Section Size            |
| 0x08   | 0x10      | String      | Group Name              |
| 0x18   | 0x4       | UInt32      | Nr Pane References (=N) |
| 0x1C   | 0x10 \* N | String\[N\] | Pane References         |

## grs1 (Group Start 1)

Starts a group hierarchy.

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (grs1) |
| 0x04   | 0x4  | UInt32 | Section Size     |

## gre1 (Group End 1)

Ends a group hierarchy.

| Offset | Size | Type   | Description      |
|--------|------|--------|------------------|
| 0x00   | 0x4  | String | Signature (gre1) |
| 0x04   | 0x4  | UInt32 | Section Size     |

## usd1 (User Data 1)

Contains a dictionary with strings as keys and variable values

| Offset | Size                 | Type        | Description             |
|--------|----------------------|-------------|-------------------------|
| 0x00   | 0x4                  | String      | Signature (usd1)        |
| 0x04   | 0x4                  | UInt32      | Section Size            |
| 0x08   | 0x4                  | UInt32      | Number of entries (= N) |
| 0xC    | 0xC \* N // Variable | Entries\[\] | Entries                 |

### User Entries

Where an entry is as follows:

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
<td>0x0</td>
<td>0x4</td>
<td>UInt32</td>
<td>Key offset (from start of this entry) to null-terminated ascii
string that serves as key.</td>
</tr>
<tr class="even">
<td>0x4</td>
<td>0x4</td>
<td>UInt32</td>
<td>Value offset (from start of this entry).</td>
</tr>
<tr class="odd">
<td>0x8</td>
<td>0x2</td>
<td>UInt16</td>
<td>Number of entries or string length.</td>
</tr>
<tr class="even">
<td>0xA</td>
<td>0x2</td>
<td>UInt16</td>
<td>Value type</p>
<table>
<thead>
<tr class="header">
<th>Value</th>
<th>Type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x0</td>
<td>String</td>
</tr>
<tr class="even">
<td>0x1</td>
<td>Int</td>
</tr>
<tr class="odd">
<td>0x2</td>
<td>Float</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

## Tools

- [Every File
  Explorer](https://github.com/PabloMK7/EveryFileExplorer/releases/latest)
  and [Switch Toolbox](https://github.com/KillzXGaming/Switch-Toolbox)
  both have limited support for viewing these.
- [Clypo](https://github.com/pleonex/Clypo/releases) allows exporting
  these files to yml and importing back to bclyt but it only supports
  scale, size, translation and rotation of panes.

# See also

<https://wiki.tockdom.com/wiki/BRLYT_(File_Format)>
<http://florian.nouwt.com/wiki/index.php/CLYT_%28File_Format%29>
([Archived](https://web.archive.org/web/20150511192058/http://florian.nouwt.com/wiki/index.php/CLYT_(File_Format)))
<https://github.com/Gericom/EveryFileExplorer/tree/master/3DS/NintendoWare/LYT1>
<https://github.com/KillzXGaming/Switch-Toolbox/tree/master/File_Format_Library/FileFormats/Layout/CTR/Panes>

[Category:File formats](Category:File_formats "wikilink")

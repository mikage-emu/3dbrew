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
<td><p>Signature (lyt1)</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Section Size</p></td>
</tr>
<tr class="odd">
<td><p>0x08</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Origin type</p>
<table>
<thead>
<tr class="header">
<th><p>Value</p></th>
<th><p>Meaning</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Classic</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Normal</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><p>0x0C</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Canvas Size</p></td>
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
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Type</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>0x14</p></td>
<td><p>String</p></td>
<td><p>Material Name</p></td>
</tr>
<tr class="even">
<td><p>0x14</p></td>
<td><p>0x4</p></td>
<td><p>RGBA8</p></td>
<td><p>Tev Color (Buffer Color?)</p></td>
</tr>
<tr class="odd">
<td><p>0x18</p></td>
<td><p>0x18</p></td>
<td><p>RGBA8[6]</p></td>
<td><p>Tev Constant Colors</p></td>
</tr>
<tr class="even">
<td><p>0x30</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Flags / bitfield</p>
<table>
<thead>
<tr class="header">
<th><p>Bit</p></th>
<th><p>Flag / data</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0-1</p></td>
<td><p>Nr texMap</p></td>
</tr>
<tr class="even">
<td><p>2-3</p></td>
<td><p>Nr texMatrix</p></td>
</tr>
<tr class="odd">
<td><p>4-5</p></td>
<td><p>Nr texCoordGen</p></td>
</tr>
<tr class="even">
<td><p>6-8</p></td>
<td><p>Nr tevStage</p></td>
</tr>
<tr class="odd">
<td><p>9</p></td>
<td><p>Has alphaCompare</p></td>
</tr>
<tr class="even">
<td><p>10</p></td>
<td><p>Has blendMode</p></td>
</tr>
<tr class="odd">
<td><p>11</p></td>
<td><p>Use Texture Only</p></td>
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
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Type</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>0x2</p></td>
<td><p>UInt16</p></td>
<td><p>Texture Index</p></td>
</tr>
<tr class="even">
<td><p>0x02</p></td>
<td><p>0x1</p></td>
<td><p>Byte</p></td>
<td><p>Bitfield</p>
<table>
<thead>
<tr class="header">
<th><p>Bit</p></th>
<th><p>Data</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0-1</p></td>
<td><p>Wrap S (Clamp = 0, Repeat = 1, Mirror = 2)</p></td>
</tr>
<tr class="even">
<td><p>2-3</p></td>
<td><p>Min Filter (0 = Near, 1 = Linear)</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="odd">
<td><p>0x03</p></td>
<td><p>0x1</p></td>
<td><p>Byte</p></td>
<td><p>Bitfield</p>
<table>
<thead>
<tr class="header">
<th><p>Bit</p></th>
<th><p>Data</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0-1</p></td>
<td><p>Wrap T (Clamp = 0, Repeat = 1, Mirror = 2)</p></td>
</tr>
<tr class="even">
<td><p>2-3</p></td>
<td><p>Mag Filter (0 = Near, 1 = Linear)</p></td>
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
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Type</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Type</p>
<table>
<thead>
<tr class="header">
<th><p>Value</p></th>
<th><p>Meaning</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>2x4 matrix</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><p>0x01</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Source (N = Tex N, max 2)</p></td>
</tr>
<tr class="odd">
<td><p>0x02</p></td>
<td><p>0x2</p></td>
<td><p>UInt8[]</p></td>
<td><p>Padding</p></td>
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
<td><p>Signature (pan1)</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Section Size</p></td>
</tr>
<tr class="odd">
<td><p>0x08</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Flags</p>
<table>
<thead>
<tr class="header">
<th><p>Bit</p></th>
<th><p>Flag</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Visible</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>InfluencedAlpha</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>LocationAdjust</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><p>0x09</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Origin (1 = centered, 2 = right, 3 = left, )</p></td>
</tr>
<tr class="odd">
<td><p>0x0A</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Alpha</p></td>
</tr>
<tr class="even">
<td><p>0x0B</p></td>
<td><p>0x1</p></td>
<td><p>UInt8</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="odd">
<td><p>0x0C</p></td>
<td><p>0x10</p></td>
<td><p>String</p></td>
<td><p>Pane name</p></td>
</tr>
<tr class="even">
<td><p>0x1C</p></td>
<td><p>0x8</p></td>
<td><p>String</p></td>
<td><p>Data</p></td>
</tr>
<tr class="odd">
<td><p>0x24</p></td>
<td><p>0xC</p></td>
<td><p>Vector3</p></td>
<td><p>Translation</p></td>
</tr>
<tr class="even">
<td><p>0x30</p></td>
<td><p>0xC</p></td>
<td><p>Vector3</p></td>
<td><p>Rotation</p></td>
</tr>
<tr class="odd">
<td><p>0x3C</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Scale</p></td>
</tr>
<tr class="even">
<td><p>0x44</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Size</p></td>
</tr>
</tbody>
</table>

## pic1(Picture 1)

**pic1** represents a picture that can be displayed in a layout. The
first 0x4C bytes are defined the same as
[pan1](CLYT_format#pan1_(Pane_1) "wikilink") with minor differences.

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
[pan1](CLYT_format#pan1_(Pane_1) "wikilink") with minor differences.

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
<td><p>Signature (wnd1)</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Section size (including the texture coordinates)</p></td>
</tr>
<tr class="odd">
<td colspan="4"><p>Same as pan1 from 0x8 to 0x4c</p></td>
</tr>
<tr class="even">
<td><p>0x4C</p></td>
<td><p>0x4</p></td>
<td><p>float</p></td>
<td><p>Coordinate 1</p></td>
</tr>
<tr class="odd">
<td><p>0x50</p></td>
<td><p>0x4</p></td>
<td><p>float</p></td>
<td><p>Coordinate 2</p></td>
</tr>
<tr class="even">
<td><p>0x54</p></td>
<td><p>0x4</p></td>
<td><p>float</p></td>
<td><p>Coordinate 3</p></td>
</tr>
<tr class="odd">
<td><p>0x58</p></td>
<td><p>0x4</p></td>
<td><p>float</p></td>
<td><p>Coordinate 4</p></td>
</tr>
<tr class="even">
<td><p>0x5C</p></td>
<td><p>0x1</p></td>
<td><p>Byte</p></td>
<td><p>Number of frames (n)</p></td>
</tr>
<tr class="odd">
<td><p>0x5D</p></td>
<td><p>0x1</p></td>
<td><p>Byte</p></td>
<td><p>Flag</p></td>
</tr>
<tr class="even">
<td><p>0x5E</p></td>
<td><p>0x2</p></td>
<td><p>UInt16</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="odd">
<td><p>0x60</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Window content offset (Points to 0x68)</p></td>
</tr>
<tr class="even">
<td><p>0x64</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Window frame offsets, offset to offsets of the materials for the
frames. (W)</p></td>
</tr>
<tr class="odd">
<td><p>0x68</p></td>
<td><p>0x4</p></td>
<td><p>RGBA8</p></td>
<td><p>Content box top left vertex color</p></td>
</tr>
<tr class="even">
<td><p>0x6C</p></td>
<td><p>0x4</p></td>
<td><p>RGBA8</p></td>
<td><p>Content box top right vertex color</p></td>
</tr>
<tr class="odd">
<td><p>0x70</p></td>
<td><p>0x4</p></td>
<td><p>RGBA8</p></td>
<td><p>Content box bottom left vertex color</p></td>
</tr>
<tr class="even">
<td><p>0x74</p></td>
<td><p>0x4</p></td>
<td><p>RGBA8</p></td>
<td><p>Content box bottom right vertex color</p></td>
</tr>
<tr class="odd">
<td><p>0x78</p></td>
<td><p>0x2</p></td>
<td><p>UInt16</p></td>
<td><p>Content box Material ID</p></td>
</tr>
<tr class="even">
<td><p>0x7A</p></td>
<td><p>0x2</p></td>
<td><p>UInt16</p></td>
<td><p>Number of Texture coordinates (N)</p></td>
</tr>
<tr class="odd">
<td colspan="4"><p>Texture coordinates entry</p></td>
</tr>
<tr class="even">
<td><p>0x7C + (N-1) * 0x20</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Top left vertex texture coordinate</p></td>
</tr>
<tr class="odd">
<td><p>0x84 + (N-1) * 0x20</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Top right vertex texture coordinate</p></td>
</tr>
<tr class="even">
<td><p>0x8C + (N-1) * 0x20</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Bottom left vertex texture coordinate</p></td>
</tr>
<tr class="odd">
<td><p>0x94 + (N-1) * 0x20</p></td>
<td><p>0x8</p></td>
<td><p>Vector2</p></td>
<td><p>Bottom right vertex texture coordinate</p></td>
</tr>
<tr class="even">
<td colspan="4"><p>Window frames</p></td>
</tr>
<tr class="odd">
<td><p>0x(W)</p></td>
<td><p>0x4 * n</p></td>
<td><p>UInt32</p></td>
<td><p>Offsets to frame materials</p></td>
</tr>
<tr class="even">
<td><p>0x(W)</p></td>
<td><p>0x4 * n</p></td>
<td><p>Window frame</p></td>
<td><table>
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
<td><p>0x0</p></td>
<td><p>UInt16</p></td>
<td><p>0x2</p></td>
<td><p>Frame Material ID</p></td>
</tr>
<tr class="even">
<td><p>0x2</p></td>
<td><p>Byte</p></td>
<td><p>0x1</p></td>
<td><p>Flip Type</p></td>
</tr>
<tr class="odd">
<td><p>0x3</p></td>
<td><p>Byte</p></td>
<td><p>0x1</p></td>
<td><p>Padding</p></td>
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

Same data structure as [Panes](#pan1_(Pane_1) "wikilink"), but used to
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
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Type</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Key offset (from start of this entry) to null-terminated ascii
string that serves as key.</p></td>
</tr>
<tr class="even">
<td><p>0x4</p></td>
<td><p>0x4</p></td>
<td><p>UInt32</p></td>
<td><p>Value offset (from start of this entry).</p></td>
</tr>
<tr class="odd">
<td><p>0x8</p></td>
<td><p>0x2</p></td>
<td><p>UInt16</p></td>
<td><p>Number of entries or string length.</p></td>
</tr>
<tr class="even">
<td><p>0xA</p></td>
<td><p>0x2</p></td>
<td><p>UInt16</p></td>
<td><p>Value type</p>
<table>
<thead>
<tr class="header">
<th><p>Value</p></th>
<th><p>Type</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>String</p></td>
</tr>
<tr class="even">
<td><p>0x1</p></td>
<td><p>Int</p></td>
</tr>
<tr class="odd">
<td><p>0x2</p></td>
<td><p>Float</p></td>
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
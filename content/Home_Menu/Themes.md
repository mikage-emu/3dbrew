+++
title = 'Themes'
+++

This page describes the formats/structure of the data stored in RomFS
for [Home Menu](Home_Menu "wikilink") DLC, for themes.

# Control Content

The control content has content-index 0. It's unknown what if any of
this is Home Menu specific.

RomFS structure:

- "MetaDataContentHeader.bin": Describes the number of themes and
  languages in the control content.
- "ContentInfoArchive_<region>_<lang>.bin" Contains the list of *all*
  DLC content available under this DLC title(which can include DLC
  that's not yet accessible via the shop). <region> can be "USA", etc.
  <lang>, for the US title: "en", "es", "fr", and "pt".
- "icons/<decimal_id>.icn" Contains the raw DLC icon image data, without
  any header. 48x48 tiled RGB565.

The below structures are little-endian.

MetaDataContentHeader.bin format:

| Relative offset | Size | Description                                                                               |
|-----------------|------|-------------------------------------------------------------------------------------------|
| 0x0             | 0x4  | Version - always 0x1                                                                      |
| 0x4             | 0x4  | Number of enabled themes                                                                  |
| 0x8             | 0x4  | Total number of themes                                                                    |
| 0xC             | 0x4  | Observed 0x300030                                                                         |
| 0x10            | 0x4  | Magic, 0xDEADBEEF                                                                         |
| 0x14..0x2C      | 0x2  | This data is sorted by region (JPN at 0x14, US at 0x18, etc.). This is the target region. |
| 0x16..0x2E      | 0x2  | Primary language for region? (0x0 for JPN, 0x1 for US and EU)                             |
| 0x30            | 0x4  | Number of ContentInfoArchive languages                                                    |
| 0x34+i          | 0x2  | ContentInfoArchive [region](Nandrw/sys/SecureInfo_A "wikilink")                           |
| 0x36+i          | 0x2  | ContentInfoArchive [language](Config_Savegame#Languages "wikilink")                       |

ContentInfoArchive header format, size 0x08:

| Relative offset | Size | Description                          |
|-----------------|------|--------------------------------------|
| 0x0             | 0x4  | Version? - always 0x1                |
| 0x4             | 0x4  | Number of theme entries that follow. |

ContentInfoArchive theme entry format, size 0xC8 (the file contains the
following entry for each of the DLC themes):

| Relative offset | Size | Description                           |
|-----------------|------|---------------------------------------|
| 0x0             | 0x40 | char string for the title text.       |
| 0x40            | 0x80 | char string for the description text. |
| 0xC0            | 0x4  | Content index                         |
| 0xC4            | 0x4  | 0x0 = disabled, 0x1 = enabled.        |

The first entry is set to dummy text, "content index" of 0 (invalid),
and disabled.

# Theme Content

RomFS structure:

- "bgm.bcstm": Background music, see [here](BCSTM "wikilink").
- "body_LZ.bin": LZ11 compressed blob containing the rest of the theme
  data(graphics + optional [CWAVs](BCWAV "wikilink")).

# Decompressed body_LZ.bin structure

| Offset | Size | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|--------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Version (Must be 1)                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x4    | 0x1  | Unknown                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x5    | 0x1  | 0 = disable usage of bgm.bcstm, non-zero = enable usage of bgm.bcstm.                                                                                                                                                                                                                                                                                                                                                                                                             |
| 0x8    | 0x4  | Normally zero(not used?).                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 0xC    | 0x4  | Must be \<4. Top screen draw type: 0 = none, 1 = solid color, 2 = solid color with textured squares, 3 = texture.                                                                                                                                                                                                                                                                                                                                                                 |
| 0x10   | 0x4  | Top screen frame type, when draw-type is 3: 0 = texture1 (regular scrolling speed), 1 = texture0 (no scroll), 3 = texture1 (slow scrolling speed).                                                                                                                                                                                                                                                                                                                                |
| 0x14   | 0x4  | Offset for the top screen solid color data. Length of data is either 5 or 7, depending on whether the top screen's draw type is 1 or 2. If draw-type = 1, the first three bytes are the background colour, the next adjusts the background gradient (0=none, 255=fade all the way to white at the top), and the last controls the opacity of the squares that float in front of the background.                                                                                   |
| 0x18   | 0x4  | Top screen texture offset, if draw-type has value 2 this offset points to texture5                                                                                                                                                                                                                                                                                                                                                                                                |
| 0x1C   | 0x4  | Additional top-screen texture offset, used with draw-type has value 2, this offset points to texture6. This is optional when using draw-type val2.                                                                                                                                                                                                                                                                                                                                |
| 0x20   | 0x4  | Must be \<4. Bottom screen draw type: 0 = none, 1 = solid color(see below), 2 = invalid, 3 = texture.                                                                                                                                                                                                                                                                                                                                                                             |
| 0x24   | 0x4  | Bottom screen frame type, when draw-type is 3: 0 = texture4 (regular scroll), 1 = texture2 (no scroll), 2 = texture3 (flipbook scroll, 0 \> 1 \> 2 \> 0), 3 = texture4 (slow scroll), 4 = texture3 (flipbook scroll, 0 \> 1 \> 2 \> 1 \> 0).                                                                                                                                                                                                                                      |
| 0x28   | 0x4  | Bottom Screen texture offset.                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0x2C   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x30   | 0x4  | Offset to a 0xC-byte block. The block contains four RGB888 colours that affect the cursor, as it expands and contracts. These are the border colour, main colour, unknown, and expanded glow colour.                                                                                                                                                                                                                                                                              |
| 0x34   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x38   | 0x4  | Offset to a 0xC-byte block. The first six bytes of the block contain RGB888 colours for the 3d folder model. Specifically, its shadowed and main colours, in that order. The other six bytes are unknown.                                                                                                                                                                                                                                                                         |
| 0x3C   | 0x4  | Must be \<2. 1 = enables usage of the following two fields.                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0x40   | 0x4  | Offset to the data for texture7.                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 0x44   | 0x4  | Offset to the data for texture8.                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 0x48   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x4C   | 0x4  | Offset to a 0xD-byte block. Block contains three RGB888 colours that affect both the cart icon that appears for DSiWare, and the file graphic that appears in folders. In order: bottom shadow, main colour, highlight at the top (folder icon only). The remaining four bytes are of unknown purpose. This block may or may not also be responsible for coloring regular icons when a texture is not used.                                                                       |
| 0x50   | 0x4  | Must be \<2. 1 = enables usage of the following two fields.                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0x54   | 0x4  | Offset to the data for texture9.                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 0x58   | 0x4  | Offset to the data for texture10.                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 0x5C   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x60   | 0x4  | Offset to a 0xD-byte block. Block contains three RGB888 colours controlling the buttons on the bottom screen with arrows on them - downwards sheen, main colour, leftwards sheen. The last four bytes are of unknown use. Note that the arrows themselves are coloured by the next field.                                                                                                                                                                                         |
| 0x64   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x68   | 0x4  | Offset to a 0x9-byte block. Block contains three RGB888 colors for the bottom screen arrows: edge colour, unpressed colour, and pressed colour. Note that this only controls the arrows themselves, not the rest of the button.                                                                                                                                                                                                                                                   |
| 0x6C   | 0x4  | Must be \<2. 1 = enables usage of the following two fields.                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0x70   | 0x4  | Offset to a 0x20-byte block. Block contains rgb data for the open button that appears when an app is under the cursoron the bottom screen. The 1st 4 bytes are unknown, the next 9 bytes contain colour data for(in order 3 bytes each) button background when pressed, unpressed and border. the next 7 bytes are unknown. The next 9 bytes contain the data for the text in thes order button text shadow, button text unpressed and then pressed. the last 3 bytes are unknown |
| 0x74   | 0x4  | Offset to a 0x20-byte block. Block contains rgb data for the close button that appears when home button pressed from within a app. The 1st 4 bytes are unknown, the next 9 bytes contain colour data for(in order 3 bytes each) button background when pressed, unpressed and border. the next 7 bytes are unknown. The next 9 bytes contain the data for the text in thes order button text shadow, button text unpressed and then pressed. the last 3 bytes are unknown         |
| 0x78   | 0x4  | Must be \<3. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x7C   | 0x4  | Offset to a 0xD-byte block that controls the text that appears above game icons when zoomed to the maximum level. First three bytes control background colour, next seven bytes are unknown, and the last three bytes control text colour.                                                                                                                                                                                                                                        |
| 0x80   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x84   | 0x4  | Offset to a 0xD-byte block, related to the bottom screen icon area. Used when the draw-type is set to solid colour. Block contains three RGB888 colours (shadow colour at the top of empty slot, background colour, border colour/shadow colour for the rest of empty slot) and one RGBA8888 (shadow/glow around folder area).                                                                                                                                                    |
| 0x88   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x8C   | 0x4  | Offset to a 0x9-byte block, related to the bottom screen outer area. Used when the draw-type is set to solid colour. Block contains three RGB888 colours (bottom stripes, main background colour, subtle edge glow).                                                                                                                                                                                                                                                              |
| 0x90   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x94   | 0x4  | Offset to a 0xD-byte block related to the background of folders. Block contains three RGB888 colours (shadow colour at the top of empty slot, background colour, border colour/shadow colour for the rest of empty slot) and one RGBA8888 (shadow/glow around folder area).                                                                                                                                                                                                       |
| 0x98   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x9C   | 0x4  | Offset to a 0x20-byte block. Related to the colour of the back arrow in folders.                                                                                                                                                                                                                                                                                                                                                                                                  |
| 0xA0   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0xA4   | 0x4  | Offset to a 0x15-byte block. The block contains seven RGB888 colours that affect the bottom bottom screen icon-resize and settings buttons. In order: left box shadow (subtle), background colour, border colour, icon gradient colour 1, icon gradient colour 2, pressed colour, right box shadow (subtle).                                                                                                                                                                      |
| 0xA8   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0xAC   | 0x4  | Offset to a 0xC-byte block. The block contains four RGB888 values, of which the first is the background colour for the "press to activate camera" overlay, and the fourth is the text colour of the same overlay. The middle two are unknown.                                                                                                                                                                                                                                     |
| 0xB0   | 0x4  | Must be \<2. 1 = enables usage of the following field.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0xB4   | 0x4  | Offset to a 0x6-byte block. The block contains two RGB888 values: the background colour and text colour for the message that tells you how many demo uses you have remaining.                                                                                                                                                                                                                                                                                                     |
| 0xB8   | 0x4  | Must be \<2. 1 = below audio data section is used, otherwise it's not used.                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0xBC   | 0x4  | Audio data section size, this must be \<=0x2DC00.                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 0xC0   | 0x4  | Offset for the audio data section.                                                                                                                                                                                                                                                                                                                                                                                                                                                |

The filesize is aligned to 0x10-bytes. The filesize must be at least
0xC4-bytes, due to padding/alignment the first block of data after the
header is normally located at 0xD0.

With the solid-color data, there's 5-bytes located at the solid-color
data offset. With draw-type has value 2, there's 7-bytes located here.
The first 4-bytes located here is RGBA8888 pixel data, the rest is
unknown.

With draw-type val2, texture5 is also used(this likely isn't used for
the entire top-screen). With draw-type val2, an extra texture with the
same format/dimensions as texture5 can be used, when the additional
texture offset field is set.

## Frame Types

| FrameType | Description                                                                                                |
|-----------|------------------------------------------------------------------------------------------------------------|
| 2         | Animated when pointer moved, split into 3 sections of 320\*240 and displayed in the order 0 \> 1 \> 2      |
| 4         | Animated when pointer moved, split into 3 sections of 320\*240 and displayed in the order 0 \> 1 \> 2 \> 1 |

## Textures

| ID  | Color format | Texture display dimensions | Texture data dimensions | Description                                                                                                                                                                                                                                       |
|-----|--------------|----------------------------|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0   | Tiled RGB565 | 412x240                    | 512x256                 | This is the texture used for the top-screen background, when the frame-type is set for this one. Used for backgrounds that don't scroll.                                                                                                          |
| 1   | Tiled RGB565 | 1008x240                   | 1024x256                | This is the texture used for the top-screen background, when the frame-type is set for this one. Used for backgrounds that scroll.                                                                                                                |
| 2   | Tiled RGB565 | 320x240                    | 512x256                 | This is the texture used for the bottom-screen background, when the frame-type is set for this one. Used for backgrounds that don't scroll.                                                                                                       |
| 3   | Tiled RGB565 | 960x240                    | 1024x256                | This is the texture used for the bottom-screen background, when the frame-type is set for this one. Split into three separate 320x240 textures that it jumps through like a flipbook.                                                             |
| 4   | Tiled RGB565 | 1008x240                   | 1024x256                | This is the texture used for the bottom-screen background, when the frame-type is set for this one. Used for backgrounds that scroll.                                                                                                             |
| 5   | Tiled A8     | 64x64                      | 64x64                   | This is used with the top-screen when top-screen draw-type is val2, see above. Used to tile the top screen in much the same way as the white squares that appear when no theme is selected, this is the moving pattern, it is rotated 90 degrees. |
| 6   | Tiled A8     | 64x64                      | 64x64                   | This is used with the top-screen when top-screen draw-type is val2, see above. Used to tile the top screen in much the same way as the white squares that appear when no theme is selected, this is the still pattern, it is rotated 90 degrees.  |
| 7   | Tiled BGR888 | 74x64                      | 128x64                  | This is used for folder's on the main menu.                                                                                                                                                                                                       |
| 8   | Tiled BGR888 | 82x64                      | 128x64                  | This is used for open folder's on the main menu.                                                                                                                                                                                                  |
| 9   | Tiled BGR888 | 36x72                      | 64x128                  | This is used for 48x48 icon borders on the main menu.                                                                                                                                                                                             |
| 10  | Tiled BGR888 | 25x50                      | 32x64                   | This is used for 24x24 icon borders on the main menu.                                                                                                                                                                                             |

## Audio data section

| Offset | Size | Description                                                                                                                                                                                                                                                                                                                  |
|--------|------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Unknown                                                                                                                                                                                                                                                                                                                      |
| 0x4    | 0x4  | Unknown                                                                                                                                                                                                                                                                                                                      |
| 0x8    |      | Beginning of the audio data entries.Each .cwav has an 8 byte "header" before the "Magic" (cwav) the first two bytes tell the 3ds where the next audio entry isand is the same as its cwav's filesize (See below). Bytes 3 + 4 are zeroes and byte 5 controls the cwav's volume (0-100) the last three bytes are zeroes again |

The audio data section contains the sound effects for this theme.

Audio data entry structure:

| Offset      | Size          | Description                            |
|-------------|---------------|----------------------------------------|
| 0x0         | Y (see below) | Additional data for CWAV 6, see below. |
| Y + 0x0     | 0x4           | CWAV size.                             |
| Y + 0x4     | 0x4           | Unknown                                |
| Y + 0x8     | X (see below) | Additional data for CWAV 4, see below. |
| Y + 0x8 + X |               | [CWAV](BCWAV "wikilink")               |

Structure of the data starting at offset 0x0, from the above entry, for
the additional data with CWAV 7:

| Relative offset | Size | Description |
|-----------------|------|-------------|
| 0x0             | 0x10 | ?           |

Y / the size of this block, is 0x10-bytes.

Structure of the data starting at offset 0x8, from the above entry, for
the additional data with CWAV 4:

| Relative offset | Size | Description |
|-----------------|------|-------------|
| 0x0             | 0x2C | ?           |

X / the size of this block, is 0x2C-bytes.

It's unknown how exactly the number of CWAVs is controlled. The CWAVs
are used for the following:

- 0: Cursor movement
- 1: Application launch
- 2: Certain buttons
- 3: Cancel buttons
- 4: When cursor would be moved off the screen, left/right
- 5: When cursor is moved a screen-worth of icons across
- 6: Folder buttons

# Built-in themes

The built-in themes are stored at Home Menu
RomFS:/theme/<Color>_LZ.bin, the format appears to be the same as
body_LZ.bin in the theme DLC content.
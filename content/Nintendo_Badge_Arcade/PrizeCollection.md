+++
title = 'PrizeCollection'
+++

## Overview

A **PrizeCollection** SARC file has the following folder structure:

`root`
`└── pc`
`    ├── PrizeCollection.xml`
`    ├── ci`
`    └── rt`
`        ├── At`
`        ├── CI`
`        ├── Ca`
`        ├── Cr`
`        ├── FO`
`        └── Pr`

Each of the subfolders contains a custom file format storing different
properties between those. Each of those files are compressed using Yaz0
compression.

| Subfolder | File type            |
|-----------|----------------------|
| ci        | Crane Instance (cib) |
| At        | Attachment (atb)     |
| CI        | Crane Icon (icb)     |
| Ca        | Category (cab)       |
| Cr        | Crane (crb)          |
| FO        | Fixed Object (fob)   |
| Pr        | Prize (prb)          |

## PrizeCollection.xml

This file has an index of all of the game data stored here. It has the
following data:

<?xml version="1.0" encoding="UTF-8"?>

<CenterPrizeCollectionFile>
`  `<Categories count="x">
`    `<Category name="CategoryName" />
`  `</Categories>
`  `<Cranes count="x">
`    `<Crane name="CraneName" />
`  `</Cranes>
`  `<CraneIcons count="x">
`    `<CraneIcon name="CraneIconName" />
`  `</CraneIcons>
`  `<Prizes count="x">
`    `<Prize name="PrizeName" />
`  `<Attachments count="x">
`    `<Attachment name="AttachmentName" />
`  `</Attachments>
`  `<FixedObjects count="x">
`    `<FixedObject name="FixedObjectName" />
`  `</FixedObjects>
`  `<CraneInstances>
`    `<CraneInstance name="CraneInstanceName" />
`  `</CraneInstances>
</CenterPrizeCollectionFile>

## Crane Instance (cib)

A crane instance file stores the data of a set and the components of the
machine.

| Offset | Size   | Description                                                        |
|--------|--------|--------------------------------------------------------------------|
| 0x0    | 0x4    | Header magic (CIBS)                                                |
| 0x4    | 0x4    | File version (0x3)                                                 |
| 0x8    | 0x4    | File length                                                        |
| 0xC    | 0x4    | Start address of header data (starting at ID)                      |
| 0x10   | 0x4    | End address of header data                                         |
| 0x14   | 0x4    | Start address of display names                                     |
| 0x18   | 0x4    | End address of display names                                       |
| 0x1C   | 0x4    | Start address of component names                                   |
| 0x20   | 0x4    | End address of component names                                     |
| 0x24   | 0x4    | Start address of crane instance properties                         |
| 0x28   | 0x4    | End address of crane instance properties                           |
| 0x2C   | 0x4    | Crane instance ID                                                  |
| 0x30   | 0x30   | Crane Instance name                                                |
| 0x60   | 0x30   | Crane name                                                         |
| 0x90   | 0x30   | Crane Icon name                                                    |
| 0xC0   | 0x4    | [Crane availability](#crane_availability "wikilink")               |
| 0xC4   | 0x4    | Unknown (usually 0x3?)                                             |
| 0xC8   | 0xC    | [Crane color](#crane_color "wikilink")                             |
| 0xD4   | 0x4    | [Crane type](#crane_type "wikilink")                               |
| 0xD8   | 0x8    | Unknown (usually zero?)                                            |
| 0xE0   | 0x4    | Number of prizes                                                   |
| 0xE4   | 0x4    | Number of attachments                                              |
| 0xE8   | 0x4    | Number of fixed objects                                            |
| 0xEC   | 0x4    | Number of on-machine prizes                                        |
| 0xF0   | 0x4    | Number of on-collection prizes                                     |
| 0xF4   | 0x4    | Number of on-machine attachments                                   |
| 0xF8   | 0x4    | Number of on-machine fixed objects                                 |
| 0xFC   | 0x4    | Number of attachment badges                                        |
| 0x100  | 0x1000 | [Display names](#language_names "wikilink")                        |
| 0x1100 | 0xB40  | [Component names](#component_names "wikilink")                     |
| 0x1C40 | 0x2440 | [Crane instance properties](#crane_instance_properties "wikilink") |

### Crane availability

This section defines where a machine is available to be used.

| Value | Crane availability          |
|-------|-----------------------------|
| 0x0   | Available on crane game     |
| 0x1   | Unknown                     |
| 0x2   | Available on tutorial crane |

### Crane color

This section defines the color of a crane. The color is set with three
float32 values with a range from 0 to 1 corresponding to RGB values.

| Offset | Size | Description       |
|--------|------|-------------------|
| 0xC8   | 0x4  | Crane red color   |
| 0xCC   | 0x4  | Crane green color |
| 0xD0   | 0x4  | Crane blue color  |

### Crane type

This section selects the crane used on the machine.

| Value | Crane type     |
|-------|----------------|
| 0x0   | Standard crane |
| 0x1   | Hammer crane   |
| 0x2   | Unused crane   |
| 0x3   | Stick crane    |
| 0x4   | Bomb crane     |

### Component Names

This section has the names of all the components (prizes, attachments
and fixed objects) used within a crane instance. Attachments are
optional, others are unknown.

Each list of components is then zero-indexed for later use on setting
its properties.

| Offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x1100 | 0x30 | Prize name                    |
|        | 0x30 | Optional prize name(s)        |
| 0x14C0 | 0x30 | Attachment name               |
|        | 0x30 | Optional attachment name(s)   |
| 0x1880 | 0x30 | Fixed object name             |
|        | 0x30 | Optional fixed object name(s) |

### Crane Instance Properties

This section has the properties of all the components (prizes,
attachments and fixed objects) and defines how many of them are used
within a set.

| Offset | Size | Description                                 |
|--------|------|---------------------------------------------|
| 0x1C40 | 0x60 | On-machine prize property                   |
|        | 0x60 | Optional on-machine prize properties        |
| 0x23C0 | 0x60 | On-collection prize property                |
|        | 0x60 | Optional on-collection prize properties     |
| 0x2F00 | 0x60 | On-machine attachment property              |
|        | 0x60 | Optional on-machine attachment properties   |
| 0x3680 | 0x60 | On-machine fixed object property            |
|        | 0x60 | Optional on-machine fixed object properties |
| 0x3E00 | 0x20 | Attachment badge property                   |
|        | 0x20 | Optional attachment badge properties        |

#### Component properties

All component-related properties set the visible components on the crane
instance or the collection. Each component can be set more than once
with different properties.

In case of prizes, this allows the player to get a prize more than once
or repeat it inside the collection.

Unless stated otherwise, all of the properties are saved as float32
values.

| Offset | Size | Description                                                  |
|--------|------|--------------------------------------------------------------|
| 0x0    | 0x4  | Component index (u32)                                        |
| 0x4    | 0x4  | Width scale                                                  |
| 0x8    | 0x4  | Height scale                                                 |
| 0xC    | 0x4  | Component rotation (clockwise)                               |
| 0x10   | 0x4  | Width position (zero means left)                             |
| 0x14   | 0x4  | Height position (zero means top)                             |
| 0x18   | 0x4  | Unknown property (usually around 0.2?)                       |
| 0x1C   | 0x4  | Unknown property                                             |
| 0x20   | 0x4  | Unknown property (usually 0.5?)                              |
| 0x24   | 0x4  | Unknown property (linked with 0x28?)                         |
| 0x28   | 0x4  | Unknown property (linked with 0x24?)                         |
| 0x2C   | 0x4  | Component gravity at start (0x0 = gravity, 0x1 = no gravity) |
| 0x30   | 0x30 | Unknown properties                                           |

The position is calculated using the 3DS screen as a reference
(400x240).

#### Attachment badge properties

This property sets the union of a badge with an attachment.

| Offset | Size | Description                             |
|--------|------|-----------------------------------------|
| 0x0    | 0x4  | Unknown (usually zero?)                 |
| 0x4    | 0x4  | Unknown (usually 1?)                    |
| 0x8    | 0x4  | Unknown                                 |
| 0xC    | 0x4  | Index of attachment selected            |
| 0x10   | 0x4  | Index of badge selected                 |
| 0x14   | 0x4  | Width position of attachment (float32)  |
| 0x18   | 0x4  | Height position of attachment (float32) |
| 0x1C   | 0x4  | Unknown (usually zero?)                 |

## Attachment (atb)

An attachment file stores the data of an object with badges attached and
its image.

| Offset               | Size   | Description                                   |
|----------------------|--------|-----------------------------------------------|
| 0x0                  | 0x4    | Header magic (ATBS)                           |
| 0x4                  | 0x4    | File version (0x3)                            |
| 0x8                  | 0x4    | File length                                   |
| 0xC                  | 0x4    | Start address of header data (starts at name) |
| 0x10                 | 0x4    | End address of header data                    |
| 0x14                 | 0x4    | Start address of image                        |
| 0x18                 | 0x4    | End address of image                          |
| 0x1C                 | 0x4    | Start address of A8 data                      |
| 0x20                 | 0x4    | End address of A8 data                        |
| 0x24                 | 0x4    | Start address of collision data               |
| 0x28                 | 0x4    | End address of collision data                 |
| 0x2C                 | 0x30   | Attachment name                               |
| 0x5C                 | 0x4    | Image width                                   |
| 0x60                 | 0x4    | Image height                                  |
| 0x64                 | 0x1C   | Padding                                       |
| 0x80                 | w \* h | ETC1A4 image of attachment                    |
| 0x80 + (w \* h)      | w \* h | A8 data of previous image                     |
| 0x80 + 2 \* (w \* h) |        | [Collision data](#collision_data "wikilink")  |

## Crane Icon (icb)

A crane icon file stores the icon of a set (crane instance).

| Offset | Size   | Description                                   |
|--------|--------|-----------------------------------------------|
| 0x0    | 0x4    | Header magic (ICBS)                           |
| 0x4    | 0x4    | File version (0x3)                            |
| 0x8    | 0x4    | File length                                   |
| 0xC    | 0x4    | Start address of header data (starts at name) |
| 0x10   | 0x4    | End address of header data (ORed with 0x80?)  |
| 0x14   | 0x4    | Start address of image                        |
| 0x18   | 0x4    | End address of image                          |
| 0x1C   | 0x30   | Crane icon name                               |
| 0x4C   | 0xB4   | Padding                                       |
| 0x100  | 0x2000 | 64x64 RGB565 image                            |

## Category (cab)

A category file stores the data of a group of sets and its category
image.

| Offset | Size   | Description                                          |
|--------|--------|------------------------------------------------------|
| 0x0    | 0x4    | Header magic (CABS)                                  |
| 0x4    | 0x4    | File version (0x3)                                   |
| 0x8    | 0x4    | File length                                          |
| 0xC    | 0x4    | Start address of header data (starts at ID)          |
| 0x10   | 0x4    | End address of header data                           |
| 0x14   | 0x4    | Start address of display names                       |
| 0x18   | 0x4    | End address of display names                         |
| 0x1C   | 0x4    | Start address of image                               |
| 0x20   | 0x4    | End address of image                                 |
| 0x24   | 0x4    | Category ID                                          |
| 0x28   | 0x4    | Unknown                                              |
| 0x2C   | 0x30   | Category name                                        |
| 0x5C   | 0x4    | Number of badges                                     |
| 0x60   | 0x4    | Number of sets (crane instances)                     |
| 0x64   | 0x4    | Unknown (related to category ID?)                    |
| 0x68   | 0x1000 | [Category display names](#language_names "wikilink") |
| 0x1068 | 0x1018 | Padding                                              |
| 0x2080 | 0x2000 | 64x64 RGB565 image of category                       |

## Crane (crb)

A crane file stores the background image used on a set (crane instance).

| Offset | Size    | Description                                   |
|--------|---------|-----------------------------------------------|
| 0x0    | 0x4     | Header magic (CRBS)                           |
| 0x4    | 0x4     | File version (0x3)                            |
| 0x8    | 0x4     | File length                                   |
| 0xC    | 0x4     | Start address of header data (starts at name) |
| 0x10   | 0x4     | End address of header data                    |
| 0x14   | 0x4     | Start address of image                        |
| 0x18   | 0x4     | End address of image                          |
| 0x1C   | 0x30    | Crane name                                    |
| 0x4C   | 0x34    | Padding                                       |
| 0x80   | 0x10000 | 512x256 ETC1 image                            |

The ETC1 image has a custom layout for distributing the contents of the
background:

- Pink (400x240): background image

<!-- -->

- Purple: unused

<!-- -->

- Red (14x256): crane overlay

<!-- -->

- Dark red: unused

<figure>
<img src="../../Crane_image_layout.png" title="File:Crane_image_layout.png" />
<figcaption><a
href="../../File:Crane_image_layout.png">File:Crane_image_layout.png</a></figcaption>
</figure>

## Fixed Object (fob)

A fixed object file stores the data of an immovable object and its
image.

| Offset          | Size   | Description                                   |
|-----------------|--------|-----------------------------------------------|
| 0x0             | 0x4    | Header magic (FOBS)                           |
| 0x4             | 0x4    | File version (0x3)                            |
| 0x8             | 0x4    | File length                                   |
| 0xC             | 0x4    | Start address of header data (starts at name) |
| 0x10            | 0x4    | End address of header data                    |
| 0x14            | 0x4    | Start address of image                        |
| 0x18            | 0x4    | End address of image                          |
| 0x1C            | 0x4    | Start address of collision data               |
| 0x20            | 0x4    | End address of collision data                 |
| 0x24            | 0x30   | Fixed object name                             |
| 0x54            | 0x4    | Image width                                   |
| 0x58            | 0x4    | Image height                                  |
| 0x5C            | 0x24   | Padding                                       |
| 0x80            | w \* h | ETC1A4 image of fixed object                  |
| 0x80 + (w \* h) |        | [Collision data](#collision_data "wikilink")  |

## Prize (prb)

A prize file stores the badge data and its image.

| Offset | Size   | Description                                                                                     |
|--------|--------|-------------------------------------------------------------------------------------------------|
| 0x0    | 0x4    | Header magic (PRBS)                                                                             |
| 0x4    | 0x4    | File version (0x3)                                                                              |
| 0x8    | 0x4    | File length (stuck at 0x45XX, but correct value works)                                          |
| 0xC    | 0x4    | Start address of header data (starts at ID)                                                     |
| 0x10   | 0x4    | End address of header data                                                                      |
| 0x14   | 0x4    | Start address of display names                                                                  |
| 0x18   | 0x4    | End address of display names                                                                    |
| 0x1C   | 0x4    | Start address of full RGB565+A4 images (64x64 and 32x32)                                        |
| 0x20   | 0x4    | End address of full RGB565+A4 images                                                            |
| 0x24   | 0x4    | Start address of optional images (same as 0x20 if none)                                         |
| 0x28   | 0x4    | End address of optional images (same as 0x20 if none)                                           |
| 0x2C   | 0x4    | Start address of ETC1A4+A8 image                                                                |
| 0x30   | 0x4    | End address of ETC1A4+A8 image                                                                  |
| 0x34   | 0x4    | Start address of collision data                                                                 |
| 0x38   | 0x4    | End address of collision data (stuck at 0x45XX, but correct value works)                        |
| 0x3C   | 0x4    | Badge ID                                                                                        |
| 0x40   | 0x4    | Unknown. Same as value in offset 0x0 in [BadgeIdentifier](Home_Menu#BadgeIdentifier "wikilink") |
| 0x44   | 0x30   | Badge file name                                                                                 |
| 0x74   | 0x30   | Badge category                                                                                  |
| 0xA4   | 0x8    | Title ID it opens (0xFFFFFFFF if none)                                                          |
| 0xAC   | 0x4    | Same as 0x40?                                                                                   |
| 0xB0   | 0x4    | Unknown (signed int)                                                                            |
| 0xB4   | 0x4    | Unknown (signed int)                                                                            |
| 0xB8   | 0x4    | Number of horizontal tiles                                                                      |
| 0xBC   | 0x4    | Number of vertical tiles                                                                        |
| 0xC0   | 0x10   | Unknown (always zero when 1x1 tile?)                                                            |
| 0xD0   | 0x4    | Full image width scale (float32)                                                                |
| 0xD4   | 0x4    | Full image height scale (float32)                                                               |
| 0xD8   | 0x8    | Unknown (always zero when 1x1 tile?)                                                            |
| 0xE0   | 0x1000 | [Badge display names](#language_names "wikilink")                                               |
| 0x10E0 | 0x20   | Padding                                                                                         |
| 0x1100 |        | [Image data](#badge_image_data "wikilink")                                                      |
|        |        | [Collision data](#collision_data "wikilink")                                                    |

### Badge image data

Following the badges metadata is it's image data. Each badge contains
multiple images used in different places during gameplay

An image can be either RGB565 or ETC1A4. RGB565 images are immediately
followed with A4 data for itself, whereas ETC1A4 images are immediately
followed with A8 data for itself

A badge may take up multiple spaces on the Home Menu, and as such
contains images for each space called "tiles". The number of image tiles
a badge uses is found in the badge metadata at offsets 0xB8 and 0xBC

All badge image data begins with a 64x64 RGB565 image of the full badge.
Following the 64x64 image is a 32x32 RGB565 image of the full badge,
which is used in the badge selector in Home Menu

If the badge is 1x1 tiles, then the first 64x64 RGB565 image is used in
Home Menu to display the badge. If the badge is *not* 1x1, then the
badge contains x\*y number of additional 64x64 and 32x32 RGB565 images,
where x is the number of horizontal tiles and y is the number of
vertical tiles. These tiles are then used in Home Menu to display the
badge. These additional images are stored immediately after the 32x32
image

Finally, the last image in the badge image data is a single 128x128
ETC1A4 image of the full badge which is used in game

| Offset | Size   | Description                                                                                                                               |
|--------|--------|-------------------------------------------------------------------------------------------------------------------------------------------|
| 0x1100 | 0x2000 | 64x64 RGB565 image of full badge (used in Home Menu if badge is 1x1)                                                                      |
| 0x3100 | 0x800  | A4 data                                                                                                                                   |
| 0x3900 | 0x800  | 32x32 RGB565 image of full badge (used in badge selector in Home Menu if badge is 1x1)                                                    |
| 0x4100 | 0x200  | A4 data                                                                                                                                   |
|        | 0x2000 | 64x64 Optional additional RGB565 image tile(s). Only exists if badge is not 1x1 (used in Home Menu if badge is not 1x1)                   |
|        | 0x800  | A4 data                                                                                                                                   |
|        | 0x800  | 32x32 Optional additional RGB565 image tile(s). Only exists if badge is not 1x1 (used in badge selector in Home Menu if badge is not 1x1) |
|        | 0x200  | A4 data                                                                                                                                   |
|        | 0x4000 | 128x128 ETC1A4 image (used in game)                                                                                                       |
|        | 0x4000 | A8 data                                                                                                                                   |

## Language Names

Some files, like the badge and the category file, store its display name
in a set of 16 different languages.

Each language is stored as a little-endian utf16 string, in an allocated
0x100 byte section stacked on top of each other.

A string does not need to fill the entire 0x100 byte section, the
remaining data is set to null bytes

The languages are ordered as follows:

1.  Japanese
2.  English
3.  French
4.  German
5.  Italian
6.  Spanish
7.  Chinese (simple)
8.  Korean
9.  Dutch
10. Portuguese
11. Russian
12. Chinese (traditional)
13. Unknown
14. Unknown
15. Unknown
16. Unknown

## Collision data

The collision of an object is defined by a set of polygons combined
together.

The polygons are represented using the vertices of each polygon, and
those vertices are represented using their coordinates according to the
in game image resolution.

| Offset | Size | Description              |
|--------|------|--------------------------|
| 0x0    | 0x4  | Number of polygons       |
| 0x4    | 0x44 | Polygon data             |
|        | 0x44 | Additional polygons data |

### Polygon data

The data of a polygon starts with the number of vertices. The
coordinates of each vertice are then stored as float32 values on an
allocated 0x40 byte section.

The vertices can't be next to each other, there is a 2 pixel circular
restricted area around each vertice. If the coordinates don't fill the
0x40 byte section, the remaining data is set to null bytes.

| Offset | Size | Description                         |
|--------|------|-------------------------------------|
| 0x0    | 0x4  | Number of vertices                  |
| 0x4    | 0x4  | X coordinate of vertice             |
| 0x8    | 0x4  | Y coordinate of vertice             |
|        | 0x4  | X coordinate of additional vertices |
|        | 0x4  | Y coordinate of additional vertices |
+++
title = 'CGFX'
categories = ["File formats"]
+++

CGFX is a container format used to store graphics resources. It can
contain 3D models, textures and animation data.

## CGFX

CGFX header :

| Offset | Length | Description                                                |
|--------|--------|------------------------------------------------------------|
| 0x0    | 0x4    | Magic "CGFX"                                               |
| 0x4    | 0x2    | Byte order mark: FFFE (little endian) or FEFF (big endian) |
| 0x6    | 0x2    | CGFX header size                                           |
| 0x8    | 0x4    | Revision                                                   |
| 0xC    | 0x4    | File size (bytes)                                          |
| 0x10   | 0x4    | Number of entries                                          |

A typical CGFX file contains two main entries, beginning directly after
the CGFX header: DATA and IMAG.

## DATA

DATA contains a list of DICT references.

DATA header (for N = 0..15) :

| Offset      | Length | Description                      |
|-------------|--------|----------------------------------|
| 0x0         | 0x4    | Magic "DATA"                     |
| 0x4         | 0x4    | DATA Size (in bytes)             |
| 0x8 +(N\*8) | 0x4    | Number of entries in DICT N      |
| 0xC +(N\*8) | 0x4    | Offset (self-relative) to DICT N |

The DATA header contains the entry counts and offsets for each DICT
entry. The number of entries can vary (probably based on the version?),
but are always in the following order. Any unused entries are zeroed.

Typical entries:

| N   | Type                                         |
|-----|----------------------------------------------|
| 0   | Models                                       |
| 1   | Textures                                     |
| 2   | LUTS (Material/Color/Shader look-up tables?) |
| 3   | Materials                                    |
| 4   | Shaders                                      |
| 5   | Cameras                                      |
| 6   | Lights                                       |
| 7   | Fog                                          |
| 8   | Environments                                 |
| 9   | Skeleton animations                          |
| 10  | Texture animations                           |
| 11  | Visibility animations                        |
| 12  | Camera animations                            |
| 13  | Light animations                             |
| 14  | Emitters                                     |
| 15  | Unknown                                      |

## DICT

DICTs are generic structures used to store values (and associate them to
a key ?). A DICT header is 0x1C bytes long.

DICT header :

| Offset | Length | Description                                                |
|--------|--------|------------------------------------------------------------|
| 0x0    | 0x4    | Magic "DICT"                                               |
| 0x4    | 0x4    | DICT size (in bytes)                                       |
| 0x8    | 0x4    | Number of entries                                          |
| 0xC    | 0x4    | ?                                                          |
| 0x10   | 0x2    | Unknown. Seems to be shifted left by 4 bits in the source. |
| 0x12   | 0xA    | ?                                                          |

DICT entry:

| Offset | Length | Description                      |
|--------|--------|----------------------------------|
| 0x0    | 0x4    | ?                                |
| 0x4    | 0x2    | ?                                |
| 0x6    | 0x2    | ?                                |
| 0x8    | 0x4    | Offset (self-relative) to symbol |
| 0xC    | 0x4    | Offset (self-relative) to object |

## CMDL

CMDL is used to describe a 3D model.

CMDL Header :

| Offset        | Length | Description                                                                     |
|---------------|--------|---------------------------------------------------------------------------------|
| 0x0           | 0x4    | Flags (bit 7: hasSkeletonSobj)                                                  |
| 0x4           | 0x4    | Magic "CMDL"                                                                    |
| 0x8           | 0x4    | ?                                                                               |
| 0xC           | 0x4    | Offset (self-relative) to model name                                            |
| 0x10          | 0x18   | ?                                                                               |
| 0x28          | 0x4    | Number of entries in Animation Types DICT                                       |
| 0x2C          | 0x4    | Offset (self-relative) to Animation Types DICT                                  |
| 0x30          | 0xC    | Global scale vector (3 floats : x, y, z)                                        |
| 0x3C          | 0x18   | ?                                                                               |
| 0x54          | 0x30   | Matrix 1                                                                        |
| 0x84          | 0x30   | Matrix 2                                                                        |
| 0xB4          | 0x4    | Number of Vertex Info SOBJ entries                                              |
| 0xB8          | 0x4    | Offset (self-relative) to Vertex Info SOBJ list                                 |
| 0xBC          | 0x4    | Number of MTOB DICT entries                                                     |
| 0xC0          | 0x4    | Offset (self-relative) to MTOB DICT                                             |
| 0xC4          | 0x4    | Number of Vertex Info SOBJ entries                                              |
| 0xC8          | 0x4    | Offset (self-relative) to Vertex Info SOBJ list                                 |
| 0xCC          | 0x4    | Number of Unknown DICT entries                                                  |
| 0xD0          | 0x4    | Offset (self-relative) to Unknown DICT                                          |
| 0xD4          | 0xC    | ?                                                                               |
| 0xE0          | 0x4    | Skeleton Info SOBJ offset (self-relative) \[only present if flag bit 7 is set\] |
| 0xB8+\[0xB8\] | 0x4\*N | Vertex Info SOBJ self-relative offset list                                      |

A CMDL section refers to outside data; it can not be considered
separately from the rest of the CGFX file. The second DICT in the CMDL
section contains offsets to MTOB objects.

## SOBJ

SOBJ structures can be used to describe 3D objects that are part of the
model. If such is the case then they will follow this structure :

| Offset | Length | Description                                                            |
|--------|--------|------------------------------------------------------------------------|
| 0x0    | 0x4    | Flags (bit 4: model; bit 1: skeleton)                                  |
| 0x4    | 0x4    | Magic "SOBJ"                                                           |
| 0x8    | 0x4    | ?                                                                      |
| 0xC    | 0x4    | Unknown symbol offset (self-relative)                                  |
| 0x10   | 0xC    | ?                                                                      |
| 0x1C   | 0x4    | Offset (self-relative) to Unknown1 (appears to hold array of floats) ? |
| 0x20   | 0xC    | Mesh position offset (X/Y/Z floats)                                    |
| 0x2C   | 0x4    | Face groups count                                                      |
| 0x30   | 0x4    | Offset (self-relative) to face groups offset array                     |
| 0x34   | 0x4    | ?                                                                      |
| 0x38   | 0x4    | Vertex groups count                                                    |
| 0x3C   | 0x4    | Offset (self-relative) to vertex groups offset array                   |
| 0x40   | 0x4    | Unknown offset (self-relative) ?                                       |

Face groups:

| Offset | Length | Description                                           |
|--------|--------|-------------------------------------------------------|
| 0x0    | 0x4    | Bone groups count                                     |
| 0x4    | 0x4    | Offset (self-relative) to UInt32 bone group IDs array |
| 0x8    | 0x4    | ?                                                     |
| 0xC    | 0x4    | Unknown2 count                                        |
| 0x10   | 0x4    | Offset (self-relative) to Unknown2 offset array       |

Unknown2:

| Offset | Length | Description                                                   |
|--------|--------|---------------------------------------------------------------|
| 0x0    | 0x4    | Face group descriptor count                                   |
| 0x4    | 0x4    | Offset (self-relative) to face array descriptors offset array |
| 0x8    | 0x4    | Unknown3 count                                                |
| 0xC    | 0x4    | Offset (self-relative) to UInt32 Unknown3 array               |
| 0x10   | 0x8    | ?                                                             |

Face array descriptor:

| Offset | Length | Description                                         |
|--------|--------|-----------------------------------------------------|
| 0x0    | 0x4    | Flags (bit 1: vertex index format: 0=byte, 1=short) |
| 0x4    | 0x4    | ?                                                   |
| 0x8    | 0x4    | Vertex index array size (in bytes)                  |
| 0xC    | 0x4    | Offset (self-relative) to vertex index array        |

Vertex groups come in a number of different formats. Typically the first
vertex group entry is of format 0x40000002 and contains the actual
vertex array.

Vertex group format 0x40000002:

| Offset | Length | Description                                                  |
|--------|--------|--------------------------------------------------------------|
| 0x0    | 0x4    | Flags (0x40000002)                                           |
| 0x4    | 0x4    | ?                                                            |
| 0x8    | 0x4    | ?                                                            |
| 0xC    | 0x4    | ?                                                            |
| 0x10   | 0x4    | ?                                                            |
| 0x14   | 0x4    | Vertex array size (in bytes)                                 |
| 0x18   | 0x4    | Offset (self-relative) to vertex array                       |
| 0x1C   | 0x4    | ?                                                            |
| 0x20   | 0x4    | ?                                                            |
| 0x24   | 0x4    | Vertex stride/size in bytes (see below)                      |
| 0x28   | 0x4    | Unknown3 count                                               |
| 0x2C   | 0x4    | Offset (self-relative) to component declaration offset array |

Each mesh's primary vertex group contains an array of vertex component
declaration objects, defining the order and parameters for each of a
vertex's components.

Vertex component declaration:

| Offset | Length | Description                                               |
|--------|--------|-----------------------------------------------------------|
| 0x0    | 0x4    | Flags (0x40000001)                                        |
| 0x4    | 0x4    | Vertex component type (see below)                         |
| 0x8    | 0x4    | ?                                                         |
| 0xC    | 0x4    | ?                                                         |
| 0x10   | 0x4    | ?                                                         |
| 0x14   | 0x4    | ?                                                         |
| 0x18   | 0x4    | ?                                                         |
| 0x1C   | 0x4    | ?                                                         |
| 0x20   | 0x4    | ?                                                         |
| 0x24   | 0x1    | Component data type (see below)                           |
| 0x25   | 0x1    | ?                                                         |
| 0x26   | 0x1    | ?                                                         |
| 0x27   | 0x1    | ?                                                         |
| 0x28   | 0x4    | Number of values in this component (e.g. XYZ-\>3, UV-\>2) |
| 0x2C   | 0x4    | Multiplier for this component's values (float)            |
| 0x30   | 0x4    | Position of this component within vertex stride           |

Vertex formats with bone data support multiple bone assignment. In this
case, the sum of all bone weights is 0x64.

Vertex component types:

| Value | Type                         |
|-------|------------------------------|
| 0x00  | Position                     |
| 0x01  | Normal                       |
| 0x02  | ? (unobserved)               |
| 0x03  | Color                        |
| 0x04  | UV0                          |
| 0x05  | UV1                          |
| 0x06  | ? (unobserved, possibly UV2) |
| 0x07  | Weight                       |
| 0x08  | Index                        |

Vertex component data types:

| Value | Type                            |
|-------|---------------------------------|
| 0x00  | sbyte                           |
| 0x01  | byte                            |
| 0x02  | short                           |
| 0x03  | ? (unobserved, possibly ushort) |
| 0x04  | ? (unobserved, possibly int)    |
| 0x05  | ? (unobserved, possibly uint)   |
| 0x06  | float                           |

Vertex components are stored as one of the above data types, and the
vertex component declaration contains a multiplier that adapts the
values to the float version which the game will use. For example, color
RGBA values are stored as bytes, and the multiplier converts them from
0-255 to 0-1.0, and position components using short values are
normalized via the multiplier to take advantage of the entire short
value range.

## TXOB

TXOBs are contained within MTOBs. They can describe textures; if such is
the case, then their structure is as follows :

| Offset | Length | Description                         |
|--------|--------|-------------------------------------|
| 0x0    | 0x4    | Flags                               |
| 0x4    | 0x4    | Magic "TXOB"                        |
| 0x8    | 0x8    | ?                                   |
| 0xC    | 0x4    | Offset (self-relative) to symbol    |
| 0x18   | 0x4    | Texture height                      |
| 0x1C   | 0x4    | Texture width                       |
| 0x28   | 0x4    | Mipmap levels                       |
| 0x34   | 0x4    | Texture format ID (see table below) |
| 0x3C   | 0x4    | Texture height (?)                  |
| 0x40   | 0x4    | Texture width (?)                   |
| 0x44   | 0x4    | Texture data size                   |
| 0x48   | 0x4    | Texture data offset (self-relative) |

| Texture format ID | Description            |
|-------------------|------------------------|
| 0x0               | RGBA8                  |
| 0x1               | RGB8                   |
| 0x2               | RGBA5551               |
| 0x3               | RGB565                 |
| 0x4               | RGBA4                  |
| 0x5               | LA8                    |
| 0x6               | HILO8                  |
| 0x7               | L8                     |
| 0x8               | A8                     |
| 0x9               | LA4                    |
| 0xA               | L4                     |
| 0xB               | A4 ?                   |
| 0xC               | ETC1 (see notes below) |
| 0xD               | ETC1A4 ?               |

Every texture format has its texture data divided into 8x8 tiles. See
[SMDH](SMDH#Icon_graphics "wikilink") for more information. ETC1 is a
compressed texture format which compresses blocks of 4x4 pixels into
u64s. These u64 are traditionally stored in big endian; however,
nintendo's implementation stores them in little endian. ETC1 textures
are stored in 8x8 tiles; decompressed 4x4 therefore have to be organized
accordingly. See [1](https://gist.github.com/smealum/8897237) for
implementation example.

## LUTS

Appears to contain color lookup tables possibly for use with shaders.

LUTS Header:

| Offset | Length | Description                                          |
|--------|--------|------------------------------------------------------|
| 0x0    | 0x4    | Magic "LUTS"                                         |
| 0x4    | 0x2    | Seems to adhere to powers of 2 (width/height/flags?) |
| 0x6    | 0x2    | Seems to adhere to powers of 2 (width/height/flags?) |
| 0x8    | 0x4    | ?                                                    |
| 0xC    | 0x8    | all zeroes ?                                         |
| 0x14   | 0x4    | ?                                                    |
| 0x18   | 0x4    | Offset to DICT (self-relative) ?                     |

All observed instances have an otherwise unreferenced DICT section
immediately afterward (the last LUTS value being a 0x4, which may
describe the relative position of that DICT), which appears to describe
material specularity.

## Skeleton data

Skeleton data is stored in an array. Each entry is 0xE0 bytes in length
and organized this way :

| Offset | Length | Description                                   |
|--------|--------|-----------------------------------------------|
| 0x0    | 0x4    | Offset (self relative) to name symbol         |
| 0x4    | 0x4    | ?                                             |
| 0x8    | 0x4    | Joint ID                                      |
| 0xC    | 0x4    | Parent joint ID                               |
| 0x10   | 0x4    | Signed offset (self-relative) to parent joint |
| 0x2C   | 0xC    | Angle vector (floats, x, y, z)                |
| 0x38   | 0xC    | Position vector (floats, x, y, z)             |
| 0x44   | 0x30   | Transformation matrix (4x3)                   |
| 0x74   | 0x30   | Identity matrix ? (4x3)                       |

Each entry stores the joint transformation data twice; once as
angle/position vectors and once as a transformation matrix. Each entry
also stores a second matrix which appears to always be identity. (?)

## CANM

CANMs are used to store skeletal animation data.

## Tools

- Every File Explorer
- Ohana3DS and its forks
- SPICA

## Links

- Another CGFX Format Description (Archived Page):
  [http://florian.nouwt.com/wiki/index.php/CGFX_(File_Format)](https://web.archive.org/web/20150511211029/http://florian.nouwt.com/wiki/index.php/CGFX_(File_Format))

[Category:File formats](Category:File_formats "wikilink")

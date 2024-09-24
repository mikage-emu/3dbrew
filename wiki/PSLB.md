This page documents the format of PSLB.

## Overview

PSLB are data-interchange files like JSON or XML.

## Header

| Offset | Size | Type      | Description         |
|--------|------|-----------|---------------------|
| 0x000  | 4    | char\[4\] | Magic Number 'PSLB' |
| 0x004  | 4    | uint32    | Unkown              |
| 0x008  | 4    | uint32    | Unkown              |
| 0x00C  | 4    | uint32    | Unkown              |

## Data

The data is constructed of 1 byte that represents what type of data
follows

| Value | Type           |
|-------|----------------|
| 1     | String         |
| 2     | int32          |
| 3     | float (4 byte) |
| 4     | Byte           |
| 5     | Map            |
| 6     | List           |

The string type is a combination of an uint32 for the length of the
string followed by the characters of the string.

For the Map and List after the type a uint32 follows that represents the
number of entries in the Map/List.

The keys of the Map are always strings but the values can have any type
of the table

[Category:File formats](Category:File_formats "wikilink")
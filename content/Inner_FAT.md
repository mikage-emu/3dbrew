+++
title = 'Inner FAT'
+++

This page describes a common FAT-like file system used in
[Savegames](Savegames "wikilink"), [Extdata](Extdata "wikilink") and
[Title Database](Title_Database "wikilink"). This file system format has
several variants depending on which kind of data it stores. All the
three kinds of data that use this file system structure also happen to
use the [DISA and DIFF](DISA_and_DIFF "wikilink") container as well, but
there is no direct relationship between the file system and the
DISA/DIFF container. All data formats described here is in the inner
data of the DISA/DIFF container (i.e. IVFC level 4). Please refer to the
DISA/DIFF page for how to unwrap it first before trying to extract the
file system.

## Overview

The file system consists of the following components:

- header
- directory hash table
- file hash table
- file allocation table
- directory entry table
- file entry table
- data region

The file allocation table (FAT) forms several linked lists inside, each
of which represents a "file" allocated in the data region. Please refer
to the File Allocation Table section below for more detail. In some
variants, the directory entry table and the file entry table are also
allocated as two special "files" in the data region, managed by the FAT,
while in others they are stand-alone tables located outside the data
region.

## Layout Variants

Four variants of the file system layout has been identified. A summary
diagram:

<figure>
<img src="../Inner-fat.png" title="File:Inner-fat.png" />
<figcaption><a
{{% href "../File:Inner-fat.png" %}}>File:Inner-fat.png</a></figcaption>
</figure>

### Savegame, `duplicate data = true`

Such savegame is a single DISA container that only has one partition
which is always configured as external IVFC level 4 disabled (see
[DISA](DISA_and_DIFF "wikilink") format for details). All components are
stored in this partition as

- filesystem header at the beginning
- directory hash table
- file hash table
- file allocation table
- data region
  - directory entry table is allocated inside data region
  - file entry table as well
  - all file data is also allocated here

In this layout, all data is duplicated by DISA's DPFS tree, which is
what the parameter `duplicate data` implies.

### Savegame, `duplicate data = false`

Such savegame is a single DISA container that has two partitions.
Partition A is always configured as external IVFC level 4 disabled, and
partition B is configured as it enabled. Components are stored among the
two partitions as

- Partition A
  - filesystem header at the beginning.
  - directory hash table
  - file hash table
  - (stand-alone) file allocation table
  - (stand-alone) directory entry table
  - file entry table
- Partition B
  - used as data region entirely, and only has file data allocated.

In this layout, all file system metadata is duplicated by partition A
DPFS tree, but file data is not as partition B has external IVFC level
4.

### Extdata

An extdata consists of several DIFF containers (device files), among
which the special device file `00000000/00000001` contains the inner FAT
system, while other devices contains normal subfiles of the extdata.
Please refer to [Extdata](Extdata "wikilink") for detail. The special
file `00000000/00000001` contists of the following components

- filesystem header at the beginning
- directory hash table
- file hash table
- file allocation table (degenerate, because the data region only has
  two "files": the directory entry table and the file entry table)
- data region
  - directory entry table allocated inside data region
  - file entry table as well
  - normal subfiles are NOT in the data region. They are in their DIFF
    containers instead.

The special file `00000000/00000001` is configured as external IVFC
level 4 disabled, and all other device files are configured as it
enabled.

### Title database

All [Title Database](Title_Database "wikilink") files are DIFF
containers. Except for `certs.db`, all of them uses this filesystem in
the DIFF inner data, which consists of

- database-specific pre-header at the beginning (See [Title
  Database](Title_Database "wikilink"))
- filesystem header
- directory Hash Table (degenerate and always has only one bucket, as
  there is only one directory for "root")
- file Hash Table
- file allocation table
- data region
  - directory entry table allocated inside data region (degenerate, as
    there is only one directory for "root")
  - file entry table as well
  - title entries (title info or ticket) are allocated as normal files
    in the data region as well.

## Filesystem Header

Offsets listed in the table below are all relative to the beginning of
the header, while all "starting block index" are relative to the
beginning of data region. This is especially important for title
database, as the offsets doesn't count the pre header.

| Offset   | Length         | Description                                                                                                                                                                   |
|----------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00     | 4              | Magic ("SAVE" for savegame; "BDRI" for title database; "VSXE" for extdata)                                                                                                    |
| 0x04     | 4              | Version (0x40000 for savegame; 0x30000 for title database and extdata)                                                                                                        |
| 0x08     | 8              | Filesystem Information offset (Y, =0x20 for savegame and title database, =0x138 for extdata)                                                                                  |
| 0x10     | 8              | Filesystem image size in blocks (including pre header for title database)                                                                                                     |
| 0x18     | 4              | Filesystem Image block size                                                                                                                                                   |
| 0x1C     | 4              | Padding                                                                                                                                                                       |
| 0x20     | 0x118 in total | Below is additional data for extdata. Not present in savegame or title database                                                                                               |
| 0x20     | 8              | Unknown                                                                                                                                                                       |
| 0x28     | 4              | 'Action' made on most recently mounted Extdata image                                                                                                                          |
| 0x2C     | 4              | Unknown                                                                                                                                                                       |
| 0x30     | 4              | ID of most recently mounted Extdata image                                                                                                                                     |
| 0x34     | 4              | Unknown                                                                                                                                                                       |
| 0x38     | 0x100          | Mount path, from most recently mounted Extdata image                                                                                                                          |
| Y        | 0x68 in total  | Below is Filesystem Information                                                                                                                                               |
| Y + 0x00 | 4              | Unknown                                                                                                                                                                       |
| Y + 0x04 | 4              | Data region block size                                                                                                                                                        |
| Y + 0x08 | 8              | Directory hash table offset                                                                                                                                                   |
| Y + 0x10 | 4              | Directory hash table bucket count (=1 for title database)                                                                                                                     |
| Y + 0x14 | 4              | Padding                                                                                                                                                                       |
| Y + 0x18 | 8              | File hash table offset                                                                                                                                                        |
| Y + 0x20 | 4              | File hash table bucket count                                                                                                                                                  |
| Y + 0x24 | 4              | Padding                                                                                                                                                                       |
| Y + 0x28 | 8              | File allocation table offset                                                                                                                                                  |
| Y + 0x30 | 4              | File allocation table entry count (excluding the leading 0th entry. See below)                                                                                                |
| Y + 0x34 | 4              | Padding                                                                                                                                                                       |
| Y + 0x38 | 8              | Data region offset (0 for savegame `duplicate data = false` layout, as the data region is in partition B for that layout)                                                     |
| Y + 0x40 | 4              | Data region block count (= File allocation table entry count)                                                                                                                 |
| Y + 0x44 | 4              | Padding                                                                                                                                                                       |
| Y + 0x48 | 8              | for savegame `duplicate data = false` layout: directory entry table offset; otherwise: u32 directory entry table starting block index + u32 directory entry table block count |
| Y + 0x50 | 4              | Maximum directory count, excluding the mandatory "root" directory (=1 for title database, but that 1 free directory slot is never used)                                       |
| Y + 0x54 | 4              | Padding                                                                                                                                                                       |
| Y + 0x58 | 8              | for savegame `duplicate data = false` layout: file entry table offset; otherwise: u32 file entry table starting block index + u32 file entry table block count                |
| Y + 0x60 | 4              | Maximum file count                                                                                                                                                            |
| Y + 0x64 | 4              | Padding                                                                                                                                                                       |

- For savegames, the file/directory bucket count & maximum count are
  specified by the parameters of
  [FS:FormatSaveData](FS:FormatSaveData "wikilink") or
  [FS:CreateSystemSaveData](FS:CreateSystemSaveData "wikilink").
- For extdata, the maximum file/directory count are specified by the
  parameters of [FS:CreateExtSaveData](FS:CreateExtSaveData "wikilink").
  The bucket count is likely calculated by the system.
- Directory & file entry tables are allocated in the data region as if
  they are two normal files (except for savegame
  `duplicate data = false` layout). However, only continuous allocation
  has been observed, so directly reading block_count \* block_size bytes
  from data_region + starting_block_index \* block_size should be safe.
- For title database (except for ticket), the range specified for data
  region seems overflow the file end by 0x80 bytes, which is exactly the
  size of the pre header. This makes it as if the data region offset
  should be relative to the pre header instead of the BDRI header.
  However, further investigation on the directory/file table allocated
  inside the data region shows that the data region offset is indeed
  relative to the BDRI header. It might be a bug in 3DS that the title
  database files miss 0x80-byte space at the end.

## Directory Entry Table

The directory entry table is an array of the entry type shown below. It
describes the directory hierarchy of the file system. There are two
variants of the directory entry type, and a dummy entry type.

### Savegame/Extdata Variant

| Offset | Length | Description                                                                          |
|--------|--------|--------------------------------------------------------------------------------------|
| 0x00   | 4      | Parent directory index. 0 for root                                                   |
| 0x04   | 16     | ASCII directory name in. All zero for root                                           |
| 0x14   | 4      | Next sibling directory index. 0 if this is the last one                              |
| 0x18   | 4      | First subdirectory index. 0 if not exists                                            |
| 0x1C   | 4      | First file index in file entry table. 0 for empty directory                          |
| 0x20   | 4      | Padding / zero?                                                                      |
| 0x24   | 4      | Index of the next directory in the same hash table bucket. 0 if this is the last one |

### Title Database Variant

Because title database only has one directory for "root", its directory
entry table degenerates into many zeros whose structure is not
recognizable. The size of one entry here is guessed.

| Offset | Length | Description                                                                                       |
|--------|--------|---------------------------------------------------------------------------------------------------|
| 0x00   | 4      | Parent directory index = 0 for root                                                               |
| 0x04   | 4      | Next sibling directory index = 0 because this is the last one                                     |
| 0x08   | 4      | First subdirectory index = 0 because there is no subdirectory                                     |
| 0x0C   | 4      | First file index in file entry table. 0 for empty directory                                       |
| 0x10   | 12     | Padding / zero?                                                                                   |
| 0x1C   | 4      | Index of the next directory in the same hash table bucket = 0 because there is no other directory |

### Dummy Entry

There are also some dummy entries in the array

| Offset    | Length | Description                                              |
|-----------|--------|----------------------------------------------------------|
| 0x00      | 4      | Current Total entry count                                |
| 0x04      | 4      | Maximum entry count = maximum directory count + 2        |
| 0x08      | 28/20  | Padding / All zero                                       |
| 0x24/0x1C | 4      | Index of the next dummy entry. 0 if this is the last one |

The 0-th entry of the array is always a dummy entry, which functions as
the head of the dummy entry linked list. The 1-st entry of the array is
always the root. Therefore maximum entry count is two more than maximum
directory count. Dummy entries are left there when deleting directories,
and reserved for future use.

## File Entry Table

The file entry table is an array of the entry type shown below. It
contains information for each file. There are three variants of the file
entry type, and a dummy entry type.

### Savegame Variant

| Offset | Length | Description                                                                               |
|--------|--------|-------------------------------------------------------------------------------------------|
| 0x00   | 4      | Parent directory index in directory entry table                                           |
| 0x04   | 16     | ASCII file name                                                                           |
| 0x14   | 4      | Next sibling file index. 0 if this is the last one                                        |
| 0x18   | 4      | Padding                                                                                   |
| 0x1C   | 4      | First block index in data region. 0x80000000 if the file is just created and has no data. |
| 0x20   | 8      | File Size                                                                                 |
| 0x28   | 4      | Padding?                                                                                  |
| 0x2C   | 4      | Index of the next file in the same hash table bucket. 0 if this is the last one           |

### Extdata Variant

| Offset | Length | Description                                                                     |
|--------|--------|---------------------------------------------------------------------------------|
| 0x00   | 4      | Parent directory index in directory entry table                                 |
| 0x04   | 16     | ASCII file name                                                                 |
| 0x14   | 4      | Next sibling file index. 0 if this is the last one                              |
| 0x18   | 4      | Padding                                                                         |
| 0x1C   | 4      | Always 0x80000000                                                               |
| 0x20   | 8      | Unique identifier. See [Extdata](Extdata "wikilink")                            |
| 0x28   | 4      | Padding?                                                                        |
| 0x2C   | 4      | Index of the next file in the same hash table bucket. 0 if this is the last one |

### Title database Variant

| Offset | Length | Description                                                                     |
|--------|--------|---------------------------------------------------------------------------------|
| 0x00   | 4      | Parent directory index in directory entry table                                 |
| 0x04   | 8      | Title ID                                                                        |
| 0x0C   | 4      | Next sibling file index. 0 if this is the last one                              |
| 0x10   | 4      | Padding                                                                         |
| 0x14   | 4      | First block index in data region.                                               |
| 0x18   | 8      | File size                                                                       |
| 0x20   | 8      | Padding?                                                                        |
| 0x28   | 4      | Index of the next file in the same hash table bucket. 0 if this is the last one |

### Dummy Entry

Like directory entry table, file entry table also has some dummy
entries:

| Offset    | Length | Description                                              |
|-----------|--------|----------------------------------------------------------|
| 0x00      | 4      | Current total entry count                                |
| 0x04      | 4      | Maximum entry count = maximum file count + 1             |
| 0x08      | 36/32  | Padding / All zero                                       |
| 0x2C/0x28 | 4      | Index of the next dummy entry. 0 if this is the last one |

The 0-th entry of the array is always a dummy entry, which functions as
the head of the dummy entry linked list. Therefore maximum entry count
is one more than maximum file count. Dummy entries are left there when
deleting files, and reserved for future use.

## Directory Hash Table & File Hash Table

This is a u32 array of size = bucket count, each of which is an index to
the directory / file entry table. The directory / file name is hashed
and its entry index is put to the corresponding bucket. If there is
already a directory/file entry in the bucket, then it appends to the
linked list formed by
`Index of the next directory/file in the same hash table bucket` field
in the directory/file entry table. i.e. this is a hash table using
separate chaining with linked lists

The hash function takes the parent index and the ASCII name (or title ID
for title database) as key. The function is equivalent to

    uint32_t GetBucket(
        uint8_t name[16 or 8], // For savegame/extdata, this takes all 16 bytes including trailing zeros; For title database, this is the 8-byte title ID
        uint32_t parent_dir_index,
        uint32_t bucket_count
    ) {
        uint32_t hash = parent_dir_index ^ 0x091A2B3C;
        for (int i = 0; i < 4 or 2; ++i) {
            hash = (hash >> 1) | (hash << 31);
            hash ^= (uint32_t)name[i * 4]
            hash ^= (uint32_t)name[i * 4 + 1] << 8
            hash ^= (uint32_t)name[i * 4 + 2] << 16
            hash ^= (uint32_t)name[i * 4 + 3] << 24
        }
        return hash % bucket_count;
    }

## File Allocation Table

The file allocation table is an array of a 8-byte entry shown below. The
array size is actually *one larger than* the size recorded in the
filesystem header. Each entry corresponds to a block in the data region
(the block size is defined in filesystem header). However, the 0th entry
corresponds to nothing, so the corresponding block index is off by one.
e.g. entry 31 in this table corresponds to block 30 in the data region.

| Offset | Length | Description                             |
|--------|--------|-----------------------------------------|
| 0x00   | 4      | bit\[0:30\]: Index U; bit\[31\]: Flag U |
| 0x04   | 4      | bit\[0:30\]: Index V; bit\[31\]: Flag V |

Entries in this table forms several chains, representing how blocks in
the data region should be linked together. However, unlike normal FAT
systems, which uses chains of entries, 3DS savegames use chain of
*nodes*. Each node spans one or multiple entries.

One node spanning `n` entries starting from `FAT[k]` is in the following
format:

    FAT[k + 0]:
        Index_U = index of the first entry of the previous node. 0 if this is the first node.
        Index_V = index of the first entry of the next node. 0 if this is the last node.
        Flag_U set if this is the first node.
        Flag_V set if this node has multiple entries.

    FAT[k + 1]:
        Index_U = k (the first entry index of this node)
        Index_V = k + n - 1 (the last entry index of this node)
        Flag_U always set
        Flag_V always clear

    FAT[k + 2] ~ FAT[k + n - 2]:
        All these entries are uninitialized

    FAT[k + n - 1]:
        Index_U = k
        Index_V = k + n - 1
        Flag_U always set
        Flag_V always clear
        (Same values as FAT[k + 1])

- Note: all indices above are entry indices (block index + 1)

All free blocks that are not allocated to any files also form a node
chain in the allocation table. The head index of this "free chain" is
recorded in `FAT[0].Index_V`. Other fields of `FAT[0]` are all zero

Here is an example:

<figure>
<img src="../Disa-fat.png" title="File:Disa-fat.png" />
<figcaption><a
{{% href "../File:Disa-fat.png" %}}>File:Disa-fat.png</a></figcaption>
</figure>

For extdata, because only two "files" (directory and file entry tables)
are allocated in the data region, and their size never changes once the
extdata is created, they are guaranteed continuous in the data region,
and the FAT degenerates to two big nodes. Therefore, instead of going
through FAT, the offset and size of directory / file entry table can be
found directly by offset = entry_table_starting block \*
data_region_block_size + data_region_offset and size =
entry_table_block_count \* data_region_block_size.

## Tools

<https://github.com/wwylele/3ds-save-tool>

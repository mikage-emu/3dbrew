+++
title = 'RomFS'
+++

### Overview

RomFS (or Read-Only Filesystem) is part of the [NCCH](NCCH "wikilink")
format, and is used as external file storage.

RomFS can be used:

- in conjunction with the [ExeFS](ExeFS "wikilink") of a NCCH

<!-- -->

- to contain the game manual accessible from the [Home
  Menu](Home_Menu "wikilink")

<!-- -->

- to contain the [DLP Child
  CIA](Download_Play#Broadcasted_application_data "wikilink"))

<!-- -->

- or to contain game cartridge update data

(There may be more implementations in the future)

### Format

The RomFS is wrapped inside a IVFC hash-tree container, and the actual
data is structured like a node-based tree, starting at the root level
directory node, moving down to other directory and file nodes. Each
directory node has pointers to child directory nodes and siblings,
together with a pointer to the first file node for that directory. Each
file node has pointers to their next file node, together with
information about the actual file data.

The RomFS IVFC hash-tree header is 0x5C bytes long and is structured as
follows:

| START | SIZE | DESCRIPTION                  |
|-------|------|------------------------------|
| 0x00  | 0x4  | Magic "IVFC"                 |
| 0x04  | 0x4  | Magic number 0x10000         |
| 0x08  | 0x4  | Master hash size             |
| 0x0C  | 0x8  | Level 1 logical offset       |
| 0x14  | 0x8  | Level 1 hashdata size        |
| 0x1C  | 0x4  | Level 1 block size, in log2  |
| 0x20  | 0x4  | Reserved                     |
| 0x24  | 0x8  | Level 2 logical offset       |
| 0x2C  | 0x8  | Level 2 hashdata size        |
| 0x34  | 0x4  | Level 2 block size, in log2. |
| 0x38  | 0x4  | Reserved                     |
| 0x3C  | 0x8  | Level 3 logical offset       |
| 0x44  | 0x8  | Level 3 hashdata size        |
| 0x4C  | 0x4  | Level 3 block size, in log2. |
| 0x50  | 0x4  | Reserved                     |
| 0x54  | 0x4  | Reserved                     |
| 0x58  | 0x4  | Optional info size.          |

### Level 3 Format

The Level 3 partition of a RomFS consists of a header specifying offsets
to four tables, followed by filedata (aligned to 16-bytes). Though their
size varies by RomFS contents, the tables are always sequential and in
the same order, as follows:

| START  | SIZE   | DESCRIPTION              |
|--------|--------|--------------------------|
| 0x0    | 0x28   | Header                   |
| 0x28   | Varies | Directory HashKey Table  |
| Varies | Varies | Directory Metadata Table |
| Varies | Varies | File HashKey Table       |
| Varies | Varies | File Metadata Table      |
| Varies | Varies | File Data                |

### Level 3 Header Format

RomFS Header data is always 0x28 bytes long, and follows this layout
(offsets are from the start of the header):

| START | SIZE | DESCRIPTION                     |
|-------|------|---------------------------------|
| 0x0   | 0x4  | Header Length                   |
| 0x4   | 0x4  | Directory Hash Table Offset     |
| 0x8   | 0x4  | Directory Hash Table Length     |
| 0xC   | 0x4  | Directory Metadata Table Offset |
| 0x10  | 0x4  | Directory Metadata Table Length |
| 0x14  | 0x4  | File Hash Table Offset          |
| 0x18  | 0x4  | File Hash Table Length          |
| 0x1C  | 0x4  | File Metadata Table Offset      |
| 0x20  | 0x4  | File Metadata Table Length      |
| 0x24  | 0x4  | File Data Offset                |

### Directory Metadata Structure

When a RomFS is built, directories are added recursively starting with
the root. When a directory is added, all of its files are added to the
File Metadata Table, then all of its subdirectories (if any), are added
to the table. If any of the directory's subdirectories have their own
subdirectories, the current directory's subdirectories are all added
before the subdirectories' subdirectories are added.

A Metadata entry for a directory has the following structure (all values
are initialized to 0xFFFFFFFF, and remain that way when unused):

| START | SIZE                                      | DESCRIPTION                                            |
|-------|-------------------------------------------|--------------------------------------------------------|
| 0x0   | 0x4                                       | Offset of Parent Directory (self if Root)              |
| 0x4   | 0x4                                       | Offset of next Sibling Directory                       |
| 0x8   | 0x4                                       | Offset of first Child Directory (Subdirectory)         |
| 0xC   | 0x4                                       | Offset of first File (in File Metadata Table)          |
| 0x10  | 0x4                                       | Offset of next Directory in the same Hash Table bucket |
| 0x14  | 0x4                                       | Name Length                                            |
| 0x18  | Name Length (rounded up to multiple of 4) | Directory Name (Unicode)                               |

### File Metadata Structure

A Metadata entry for a file has the following structure (all values are
initialized to 0xFFFFFFFF, and remain that way when unused):

| START | SIZE                                      | DESCRIPTION                                                      |
|-------|-------------------------------------------|------------------------------------------------------------------|
| 0x0   | 0x4                                       | Offset of Containing Directory (within Directory Metadata Table) |
| 0x4   | 0x4                                       | Offset of next Sibling File                                      |
| 0x8   | 0x8                                       | Offset of File's Data                                            |
| 0x10  | 0x8                                       | Length of File's Data                                            |
| 0x18  | 0x4                                       | Offset of next File in the same Hash Table bucket                |
| 0x1C  | 0x4                                       | Name Length                                                      |
| 0x20  | Name Length (rounded up to multiple of 4) | File Name (Unicode)                                              |

### Hash Table Structure

For both files and directories, a [separate chaining hash
table](https://en.wikipedia.org/wiki/Hash_table#Collision_resolution) is
created for quick lookup.

A hash table consists of a number of buckets, all initialized to
0xFFFFFFFF. The size of the table is dependent on the number of entries
in the relevant MetaData table (it's probably intended to always be the
smallest prime number greater than or equal to the number of entries,
but the implementation was lazy), illustrated by the following code
(C#):

            public static byte[] GetHashTableLength(uint numEntries)
            {
                uint count = numEntries;
                if (numEntries < 3)
                    count = 3;
                else if (numEntries < 19)
                    count |= 1;
                else
                {
                    while (count % 2 == 0
                        || count % 3 == 0
                        || count % 5 == 0
                        || count % 7 == 0
                        || count % 11 == 0
                        || count % 13 == 0
                        || count % 17 == 0)
                    {
                        count++;
                    }
                }
                return count;
            }

The hash function is based off directory/file name (byte array taken
from Metadata entry) and Parent Directory's offset (C#):

            public static uint CalcPathHash(byte[] Name, uint ParentOffset)
            {
                uint hash = ParentOffset ^ 123456789;
                for (int i = 0; i < Name.Length; i += 2)
                {
                    hash = (hash >> 5) | (hash << 27);
                    hash ^= (ushort)((Name[i]) | (Name[i + 1] << 8));
                }
                return hash;
            }

Each directory/file is put into the *i*th bucket, where *i* is the hash
taken modulus of bucket count. The directories/files in the same bucket
form a linked list, with the value in hash table as the offset to the
head element. When creating the hash table, a latter added
directory/file is always added as the head element of the linked list.

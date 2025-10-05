+++
title = 'CECD Savegame'
+++

<span id="cec-system-save-00010026-format"></span>

## CEC System Save (00010026) Format

    Folder and files                         `CecDataPathType`
    [Root]
    ├── eventlog.dat
    └── CEC                                  10
        ├── MacFilter___
        ├── MBoxList____                     1
        ├── &lt;8-digit ID&gt;                     11
        │   ├── MBoxInfo____                 2
        │   ├── MBoxData.001                 101
        │   ├── MBoxData.010                 110
        │   ├── MBoxData.050                 150
        │   ├── MBoxData.&lt;3-digit number&gt;    100 + &lt;number&gt;
        │   ├── ...
        │   ├── InBox___                     12
        │   │   ├── BoxInfo_____             3
        │   │   ├── _&lt;12-char ID&gt;            6
        │   │   └── ...
        │   └── OutBox__                     13
        │       ├── BoxInfo_____             4
        │       ├── OBIndex_____             5
        │       ├── _&lt;12-char ID&gt;            7
        │       └── ...
        ├── &lt;8-digit ID&gt;
        ...

<span id="file-mboxlist____"></span>

### File `MBoxList____`

| Offset | Length   | Description       |
|--------|----------|-------------------|
| 0x00   | 2        | Magic 0x6868      |
| 0x02   | 2        | Padding           |
| 0x04   | 4        | Version? always 1 |
| 0x08   | 4        | Number of boxes   |
| 0x0C   | 16 \* 24 | List of box name  |

Each box name is 16-char long. However, due to the fact that box name is usually a 8-digit ID, the rest of 8 chars are always null characters. Unused box names are filled with null characters.

<span id="file-mboxinfo____"></span>

### File `MBoxInfo____`

| Offset | Length | Description                               |
|--------|--------|-------------------------------------------|
| 0x00   | 2      | Magic 0x6363                              |
| 0x02   | 2      | Padding                                   |
| 0x04   | 4      | Title ID (matches the box directory name) |
| 0x08   | 4      | Private ID?                               |
| 0x0C   | 1      | Flags?                                    |
| 0x0D   | 1      | Flags?                                    |
| 0x0E   | 2      | Padding                                   |
| 0x10   | 32     | HMAC Key                                  |
| 0x30   | 4      | Zero?                                     |
| 0x34   | 12     | Timestamp when last accessed              |
| 0x40   | 1      | Display New Notification Dot              |
| 0x41   | 1      | Flag?                                     |
| 0x42   | 1      | Flag?                                     |
| 0x43   | 1      | Flag?                                     |
| 0x44   | 12     | Timestamp when last received              |
| 0x50   | 16     | Zero?                                     |

Note: - `Private ID` seems to be a number chosen by application arbitrarily, possibly for verification. Magic numbers such as 0x00000000, 0x00000001, 0xFFFFFFFF, 0xAABBCCDD and other random numbers have been observed here.

<span id="file-mboxdata.3-digit-number"></span>

### File `MBoxData.<3-digit number>`

<span id="file-mboxdata.001"></span>

#### File `MBoxData.001`

Icon

<span id="file-mboxdata.010"></span>

#### File `MBoxData.010`

This is the game title in null-terminated UTF-16 string.

<span id="file-mboxdata.050"></span>

#### File `MBoxData.050`

This is 8-byte file containing the title ID.

<span id="file-boxinfo_____"></span>

### File `BoxInfo_____`

This file consists of a 0x20-byte header, and an array of 0x70-byte entry. Each entry is a copy of the message header. See the next section for the message header format. The box info header format is

| Offset | Length | Description                                             |
|--------|--------|---------------------------------------------------------|
| 0x00   | 2      | Magic 0x6262                                            |
| 0x02   | 2      | Padding                                                 |
| 0x04   | 4      | Size of this file                                       |
| 0x08   | 4      | Maximum box size                                        |
| 0x0C   | 4      | Current box size                                        |
| 0x10   | 4      | Maximum message count                                   |
| 0x14   | 4      | Current message count / the size of the following array |
| 0x18   | 4      | Maximum batch size                                      |
| 0x1C   | 4      | Maximum message size                                    |

<span id="file-_12-char-id"></span>

### File `_<12-char ID>`

Each such file is a message. The ID in the file name is the message ID encoded in base-64. A message file consists of a 0x70-byte header, several extra header, a message body, and a 0x20-byte HMAC(?).

The header format is

| Offset | Length | Description                                       |
|--------|--------|---------------------------------------------------|
| 0x00   | 2      | Magic 0x6060                                      |
| 0x02   | 2      | Padding                                           |
| 0x04   | 4      | Message size                                      |
| 0x08   | 4      | Header + extra headers size                       |
| 0x0C   | 4      | Body size                                         |
| 0x10   | 4      | Title ID                                          |
| 0x14   | 4      | Title ID 2?                                       |
| 0x18   | 4      | Batch ID                                          |
| 0x1C   | 4      | ? ID                                              |
| 0x20   | 8      | Message ID                                        |
| 0x28   | 4      | Message version?                                  |
| 0x2C   | 8      | Message ID 2 (reply-to message id in an exchange) |
| 0x34   | 1      | Flags                                             |
| 0x35   | 1      | Send method                                       |
| 0x36   | 1      | Is unopen                                         |
| 0x37   | 1      | Is new                                            |
| 0x38   | 8      | Sender ID                                         |
| 0x40   | 8      | Sender ID 2?                                      |
| 0x48   | 12     | Timestamp when sent                               |
| 0x54   | 12     | Timestamp when received                           |
| 0x60   | 12     | Timestamp when created                            |
| 0x6C   | 1      | Send count                                        |
| 0x6D   | 1      | Forward count                                     |
| 0x6E   | 2      | User data                                         |

Each extra header has a format of

| Offset | Length    | Description |
|--------|-----------|-------------|
| 0x00   | 4         | Header type |
| 0x04   | 4         | Data size   |
| 0x08   | Data size | Header data |

The header type can be one of the follows:

| Value | Description |
|-------|-------------|
| 1     | ?           |
| 2     | Icon        |
| 3     | Game name   |
| 4     | Info text   |
| 5     | Region?     |

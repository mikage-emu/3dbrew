ExeFS or Executable Filesystem contains information related to the
executable program, and is the part of the [CXI](NCCH#CXI "wikilink")
format.

The ExeFS usually contains one or more of the following files:

- .code Contains the code binary, which can be optionally reverse-LZSS
  compressed via an exheader flag.
- [logo](logo "wikilink") Contains distribution licensing Binary data.
- [banner](File_Formats "wikilink") Contains the banner which homemenu
  uses for this CXI.
- [icon](SMDH "wikilink") Contains the icon which homemenu displays for
  this CXI.

### Format

The ExeFS header is 0x200 bytes long and follows this simple structure:

| Start | Size  | Description                                                         |
|-------|-------|---------------------------------------------------------------------|
| 0x00  | 0xa0  | File headers (10 headers maximum, 16 bytes each)                    |
| 0xa0  | 0x20  | Reserved                                                            |
| 0xc0  | 0x140 | File hashes (10 hashes maximum, 32 bytes each, one for each header) |

File hashes are stored in reverse order, i.e. the hash at offset 0x1E0
corresponds to the first ExeFS section.

#### File headers

There are a maximum of 10 file headers in the ExeFS format. (This
maximum number of file headers is disputable, with makerom indicating a
maximum of 8 sections and makecia indicating a maximum of 10. From a
non-SDK point of view, the ExeFS header format can hold no more than 10
file headers within the currently define size of 0x200 bytes.) The file
headers have the following structure:

| Start | Size | Description |
|-------|------|-------------|
| 0x0   | 0x8  | File name   |
| 0x8   | 0x4  | File offset |
| 0xC   | 0x4  | File size   |

File offsets are non-inclusive of the header's size (0x200 bytes). Also,
file headers which are not used are filled with all zeros.

#### File hashes

Each file header has a corresponding file hash, which is the SHA256 hash
calculated over the entire file contents.
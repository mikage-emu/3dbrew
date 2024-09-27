+++
title = 'NS CFA'
+++

This pages describes the content of the
[CFA](NCCH#cfa "wikilink")(titleID 0004001B00010702) RomFS used by NS.

## key.bin and value.bin

Originally the filesize for key.bin was 12-bytes, with the
[6.0.0-11](6.0.0-11 "wikilink") title-version this is now 48-bytes.

Originally the filesize for value.bin was 8-bytes, with the
[6.0.0-11](6.0.0-11 "wikilink") title-version this is now 32-bytes.

The two files form a KV-store of compatibility parameters, as follows:

| TitleId          | Name                                          | Flags                                             |
|------------------|-----------------------------------------------|---------------------------------------------------|
| 0004000000032800 | Ridge Racer 3D (JPN)                          | Card latency parameter 0x47E000, override level 0 |
| 0004000000033400 | Zelda no Densetsu: Toki no Ocarina 3D (JPN)   | Use only 4KB pages                                |
| 0004000000033500 | The Legend of Zelda: Ocarina of Time 3D (USA) | Use only 4KB pages                                |
| 0004000000033600 | The Legend of Zelda: Ocarina of Time 3D (EUR) | Use only 4KB pages                                |
| 0004000000033B00 | Ridge Racer 3D (EUR)                          | Card latency parameter 0x47E000, override level 0 |
| 0004000000035800 | Ridge Racer 3D (USA)                          | Card latency parameter 0x47E000, override level 0 |
| 000400000008F800 | The Legend of Zelda: Ocarina of Time 3D (KOR) | Use only 4KB pages                                |
| 000400000008F900 | The Legend of Zelda: Ocarina of Time 3D (CHN) | Use only 4KB pages                                |

Refer to
<https://gist.github.com/TuxSH/11da5baae53e80f466829bbab6be6373#file-parse_kv-py>
for more details.

## ctr_backup_black_list

This file added with [6.0.0-11](6.0.0-11 "wikilink") contains the
uniqueID blacklist for [SD Savedata
Backups](SD_Savedata_Backups "wikilink").

| Offset | Size            | Description                                                                                                |
|--------|-----------------|------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4             | Total entries, this is value 93 for the [6.0.0-11](6.0.0-11 "wikilink") title-version.                     |
| 0x4    | 0xC             | All-zero                                                                                                   |
| 0x10   | Totalentries\*4 | Entries, each entry is a word in the following format: 0x100000 \| [title_UniqueID](Title_list "wikilink") |

## qtm_black_list

This file was added with title version v4096, for
[9.0.0-20](9.0.0-20 "wikilink")/[8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink").
This is used when launching applications, on New3DS.

The applications in the "blacklist" seem to only be Nintendo-internal
(?) test applications, going from the unique IDs (unique ID is (tid \>\>
8) & 0xFFFFF). Camera mode (unsure) corresponds to stubbed cam command
id 0x00410040:

| UID     | Flags                                                                                          |
|---------|------------------------------------------------------------------------------------------------|
| 0xF8087 | QTM disabled, camera mode 0 \[stubbed\]                                                        |
| 0xF8088 | Camera mode 1 \[stubbed\]                                                                      |
| 0xF8089 | QTM disabled (2), camera mode 1 \[stubbed\]                                                    |
| 0xF8090 | Camera mode 0 \[stubbed\], [report app mode as O3DS](APT:GetApplicationRunningMode "wikilink") |

Refer to
<https://gist.github.com/TuxSH/11da5baae53e80f466829bbab6be6373#file-parse_qtm_blacklist-py>
for more details

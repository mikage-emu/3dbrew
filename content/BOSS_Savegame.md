+++
title = 'BOSS Savegame'
+++

This page describes the content of the [BOSS](SpotPass "wikilink") sysmodule savegame.

The savegame contains the following files with no directories:

## BOSS_A.db

This file is a database containing information about applications and their session on BOSS.

| Offset | Size | Description               |
|--------|------|---------------------------|
| 0x0    | 0x4  | Magic Number (0x12348000) |

After that, an array of data entries with a size of 0x800 follow.

| Offset | Size  | Description                                          |
|--------|-------|------------------------------------------------------|
| 0x0    | 0x10  | [BOSS_A_EntryHeader](#boss_a_entryheader "wikilink") |
| 0x10   | 0x120 | [BOSS_A_TitleInfo](#boss_a_titleinfo "wikilink")     |
| 0x130  | 0x304 | [BOSS_A_Certs](#boss_a_certs "wikilink")             |
| 0x434  | 0x4   | u32, Unknown. Unused?                                |
| 0x438  | 0x3C8 | Padding                                              |

### BOSS_A_EntryHeader

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 0x8  | u64, Program ID                  |
| 0x8    | 0x1  | bool, Valid                      |
| 0x9    | 0x1  | u8, Version. Latest version is 3 |
| 0xA    | 0x6  | Padding?                         |

### BOSS_A_TitleInfo

| Offset | Size | Description                                |
|--------|------|--------------------------------------------|
| 0x0    | 0x8  | u64, Program ID                            |
| 0x8    | 0x1  | u8, Session maker (1: User, 2: Privileged) |
| 0x9    | 0x1  | bool, Optout flag                          |
| 0xA    | 0x1  | bool, Arrival flag                         |
| 0xB    | 0x5  | Unknown                                    |
| 0x10   | 0x20 | [StorageEntry](#storageentry "wikilink")   |
| 0x30   | 0xF0 | Unknown                                    |

### StorageEntry

| Offset | Size | Description                    |
|--------|------|--------------------------------|
| 0x0    | 0x1  | bool, Registered               |
| 0x1    | 0x1  | u8, MediaType (0: NAND, 1: SD) |
| 0x2    | 0x2  | u16, Entry ID                  |
| 0x4    | 0x4  | u32, Storage size              |
| 0x8    | 0x8  | u64, Extdata ID                |
| 0x10   | 0x1  | u8, Unknown                    |
| 0x11   | 0x3  | Padding                        |
| 0x14   | 0x4  | u32, Unknown                   |
| 0x18   | 0x2  | u16, Unknown                   |
| 0x1A   | 0x2  | u16, Unknown                   |
| 0x1C   | 0x4  | Unknown                        |

### BOSS_A_Certs

| Offset | Size  | Description                              |
|--------|-------|------------------------------------------|
| 0x0    | 0x1   | u8, Root CA count (stubbed to 0)         |
| 0x1    | 0x3   | Padding                                  |
| 0x4    | 0x100 | char\[256\]\[1\], Root CA path           |
| 0x104  | 0x100 | char\[256\], Client certificate path     |
| 0x204  | 0x100 | char\[256\], Client certificate key path |

## BOSS_SS.db

This file is a database containing static information about tasks.

| Offset | Size | Description               |
|--------|------|---------------------------|
| 0x0    | 0x4  | Magic Number (0x12348000) |

After that, an array of data entries with a size of 0xC00 follow. An index of this array corresponds to the data with same index in BOSS_SV.db

| Offset | Size  | Description                                            |
|--------|-------|--------------------------------------------------------|
| 0x0    | 0x4   | [BOSS_SS_EntryHeader](#boss_ss_entryheader "wikilink") |
| 0x4    | 0x7D4 | [TaskActionConfig](#taskactionconfig "wikilink")       |
| 0x7D8  | 0xC   | [TaskOptionConfig](#taskoptionconfig "wikilink")       |
| 0x7E4  | 0x60  | [TaskQueryConfig](#taskqueryconfig "wikilink")         |
| 0x844  | 0x3BC | Padding                                                |

### BOSS_SS_EntryHeader

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 0x1  | u8, Version. Latest version is 3 |
| 0x1    | 0x3  | Padding                          |

### TaskActionConfig

Check the matching [properties](BOSS_Services#propertyids "wikilink") for more information about these fields.

| Offset | Size  | Description                                             |
|--------|-------|---------------------------------------------------------|
| 0x0    | 0x1   | u8, [ActionCode](BOSS_Services#actioncode "wikilink")   |
| 0x1    | 0x1   | u8, FS Root CA                                          |
| 0x2    | 0x1   | u8, FS Client Cert                                      |
| 0x3    | 0x1   | u8, [ApInfoType](BOSS_Services#apinfotype "wikilink")   |
| 0x4    | 0x1   | u8, Property 0x9                                        |
| 0x5    | 0x1   | u8, [CfgInfoType](BOSS_Services#cfginfotype "wikilink") |
| 0x6    | 0x2   | Padding                                                 |
| 0x8    | 0x4   | u32, Property 0x16                                      |
| 0xC    | 0x4   | u32, Property 0x8                                       |
| 0x10   | 0x4   | u32, Property 0x3B                                      |
| 0x14   | 0x4   | Handle, File handle                                     |
| 0x18   | 0x200 | Action data                                             |
| 0x218  | 0x200 | char\[512\], URL                                        |
| 0x418  | 0x360 | HeaderFields                                            |
| 0x790  | 0xC   | u32\[3\], Root CAs                                      |
| 0x79C  | 0x4   | u32\[1\], Client certificates                           |
| 0x7A0  | 0x4   | u32, Root CA Count                                      |
| 0x7A4  | 0x4   | u32, Client certificate count                           |
| 0x7A8  | 0x4   | Unknown                                                 |
| 0x7AC  | 0x40  | Property 0x15                                           |

### TaskOptionConfig

Check the matching [properties](BOSS_Services#propertyids "wikilink") for more information about these fields.

| Offset | Size | Description        |
|--------|------|--------------------|
| 0x0    | 0x1  | u8, Property 0x18  |
| 0x1    | 0x1  | u8, Property 0x19  |
| 0x2    | 0x1  | u8, Property 0x1A  |
| 0x3    | 0x1  | Padding            |
| 0x4    | 0x4  | u32, Property 0x1B |
| 0x8    | 0x4  | u32, Property 0x1C |

### TaskQueryConfig

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x60</td>
<td>QueryField[3]. Structure:</p>
<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>bool, Used</td>
</tr>
<tr>
<td>0x1</td>
<td>0xF</td>
<td>char[15], Query name</td>
</tr>
<tr>
<td>0x10</td>
<td>0x10</td>
<td>char[16], Query value</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

## BOSS_SV.db

This file is a database containing variable information about tasks.

| Offset | Size | Description               |
|--------|------|---------------------------|
| 0x0    | 0x4  | Magic Number (0x12348000) |

After that, an array of data entries with a size of 0xC00 follow. An index of this array corresponds to the data with same index in BOSS_SS.db

| Offset | Size  | Description                                            |
|--------|-------|--------------------------------------------------------|
| 0x0    | 0x20  | [BOSS_SV_EntryHeader](#boss_sv_entryheader "wikilink") |
| 0x20   | 0x10  | [TaskPolicyConfig](#taskpolicyconfig "wikilink")       |
| 0x30   | 0x78  | [TaskStatusInfo](#taskstatusinfo "wikilink")           |
| 0xA8   | 0x1E0 | [BOSS_SV_Unk1](#boss_sv_unk1 "wikilink")               |
| 0x288  | 0x5A8 | [BOSS_SV_Unk2](#boss_sv_unk2 "wikilink")               |
| 0x830  | 0x108 | [BOSS_SV_Unk3](#boss_sv_unk3 "wikilink")               |
| 0x938  | 0x2C8 | Padding                                                |

### BOSS_SV_EntryHeader

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 0x3  | Magic: \[0x41, 0x01, 0x01\]      |
| 0x3    | 0x1  | u8, Version. Latest version is 3 |
| 0x4    | 0xC  | Padding?                         |
| 0x10   | 0x8  | u64, Program ID                  |
| 0x18   | 0x8  | char\[8\], Task ID               |

### TaskPolicyConfig

Check the matching [properties](BOSS_Services#propertyids "wikilink") for more information about these fields.

| Offset | Size | Description                                                |
|--------|------|------------------------------------------------------------|
| 0x0    | 0x1  | u8 [PriorityLevel](BOSS_Services#prioritylevel "wikilink") |
| 0x1    | 0x1  | u8, SchedulingPolicy                                       |
| 0x2    | 0x1  | u8, TaskPermission                                         |
| 0x3    | 0x1  | Padding?                                                   |
| 0x4    | 0x4  | u32, TaskTargetDuration                                    |
| 0x8    | 0x4  | u32, Interval                                              |
| 0xC    | 0x4  | u32, Count                                                 |

### TaskStatusInfo

Check the matching [properties](BOSS_Services#propertyids "wikilink") for more information about these fields.

| Offset | Size | Description                                                 |
|--------|------|-------------------------------------------------------------|
| 0x0    | 0x8  | u64, LastSuccessfulTimestamp                                |
| 0x8    | 0x8  | u64, Property 0x29                                          |
| 0x10   | 0x1  | u8, [TaskStateCode](BOSS_Services#taskstatecode "wikilink") |
| 0x11   | 0x1  | u8, Property 0x1E                                           |
| 0x12   | 0x1  | u8, property 0x1F                                           |
| 0x13   | 0x1  | u8, TaskServiceStatus                                       |
| 0x14   | 0x1  | u8, Property 0x22                                           |
| 0x15   | 0x1  | u8, TaskResultCode                                          |
| 0x16   | 0x2  | Padding                                                     |
| 0x18   | 0x4  | u32, CommErrorCode                                          |
| 0x1C   | 0x4  | u32, Property 0x25                                          |
| 0x20   | 0x4  | u32, Property 0x26                                          |
| 0x24   | 0x4  | u32, Property 0x27                                          |
| 0x28   | 0x4  | u32, Property 0x2A                                          |
| 0x2C   | 0x4  | u32, Property 0x2B                                          |
| 0x30   | 0x2  | u16, Property 0x2D                                          |
| 0x32   | 0x2  | u16, Property 0x2E                                          |
| 0x34   | 0x1  | u8, Property 0x2C                                           |
| 0x35   | 0x1  | u8, Property 0x24                                           |
| 0x36   | 0x2  | Padding                                                     |
| 0x38   | 0x40 | char\[64\], LastModifiedHeader                              |

### BOSS_SV_Unk1

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x3 | Unknown |
| 0x3 | 0x1 | u8, Task type (0: Normal, 1: Immediate, 2: Background immediate) |
| 0x4 | 0x4 | u32, Unknown |
| 0x8 | 0x4 | u32, Unknown |
| 0xC | 0x4 | u32, Unknown |
| 0x10 | 0x10 | Unknown |
| 0x20 | 0x40 | char\[64\], Timestamp? |
| 0x60 | 0x180 | Unknown |

### BOSS_SV_Unk2

| Offset | Size  | Description                              |
|--------|-------|------------------------------------------|
| 0x0    | 0x4   | u32, Unknown                             |
| 0x4    | 0x4   | u32, Unknown                             |
| 0x8    | 0x220 | Unknown                                  |
| 0x228  | 0x20  | [StorageEntry](#storageentry "wikilink") |
| 0x248  | 0x360 | Unknown                                  |

### BOSS_SV_Unk3

| Offset | Size | Description         |
|--------|------|---------------------|
| 0x0    | 0x4  | u32, Unknown        |
| 0x4    | 0x4  | u32, Unknown result |
| 0x8    | 0x4  | u32, Unknown        |
| 0xC    | 0xFC | Unknown             |

## BOSS_PH_INFO.db

## BOSS_PM_INFO.db

## BOSS_SP_INFO.db

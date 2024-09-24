+++
title = 'AMPXI:GetPendingTitleInfo'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x001F0084\]                            |
| 1          | Title count                                           |
| 2          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 3          | (TitleCount \* 8) \<\< 8 \| 4                         |
| 4          | Title IDs input pointer                               |
| 5          | (TitleCount \* 24) \<\< 8 \| 0x14                     |
| 6          | Title Infos output pointer                            |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001F0040\] |
| 1          | Result code                |

# Description

Gets information on titles that are currently pending installation.

# Title info

Each entry in the buffer is 24 bytes, some contents are currently
unknown.

| Offset | Size | Description   |
|--------|------|---------------|
| 0      | 8    | Title id      |
| 8      | 2    | Title version |
| 10     | 2    | Status        |
| 12     | 4    | Title type    |
| 16     | 8    | Unknown       |

# Title status

| Status | Description                                          |
|--------|------------------------------------------------------|
| 0x0002 | Title was aborted.                                   |
| 0x0003 | Title was saved successfully, but not installed yet. |
| 0x0802 | Title install in progress.                           |
| 0x0803 | Title awaiting finalization.                         |
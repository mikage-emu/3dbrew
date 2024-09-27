+++
title = 'AMPXI:GetTitleInfo'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00030084\]                            |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 2          | Title count                                           |
| 3          | (TitleCount \* 8) \<\< 8 \| 6                         |
| 4          | Title IDs input pointer                               |
| 5          | (TitleCount \* 24) \<\< 8 \| 0x14                     |
| 6          | Title Infos output pointer                            |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030040\] |
| 1          | Result code                |

# Title info

Each entry in the buffer is 24 bytes, some contents are currently
unknown.

| Offset | Size | Description |
|--------|------|-------------|
| 0      | 8    | Title id    |
| 8      | 8    | Unknown     |
| 16     | 2    | Version     |
| 18     | 2    | Unknown     |
| 20     | 4    | Title type  |
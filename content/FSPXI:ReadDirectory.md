+++
title = 'FSPXI:ReadDirectory'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x001000C2\]                                            |
| 1          | Directory handle lower word                                           |
| 2          | Directory handle upper word                                           |
| 3          | [Entry](Filesystem_services#DirectoryEntry "wikilink") Count          |
| 4          | ((EntryCount \* 0x228) \<\< 8) \| 4                                   |
| 5          | [Entry](Filesystem_services#DirectoryEntry "wikilink") Output Pointer |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | Actual Entry Count |
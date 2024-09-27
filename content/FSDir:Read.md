+++
title = 'FSDir:Read'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x08010042\]                                            |
| 1          | [Entry](Filesystem_services#directoryentry "wikilink") Count          |
| 2          | ((EntryCount \* 0x228) \<\< 4) \| 0xC                                 |
| 3          | [Entry](Filesystem_services#directoryentry "wikilink") Output Pointer |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | Actual Entry Count |

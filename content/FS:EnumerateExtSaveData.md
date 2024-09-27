+++
title = 'FS:EnumerateExtSaveData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x8550102\]                              |
| 1          | Output ID Buffer Size                                  |
| 2          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 3          | ID Entry Size (usually 4 or 8)                         |
| 4          | u8, 0 = Non-Shared, 1 = Shared                         |
| 5          | (outputBufferSize \<\< 4) \| 0xC                       |
| 6          | Output Pointer                                         |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2          | Written ID Count |

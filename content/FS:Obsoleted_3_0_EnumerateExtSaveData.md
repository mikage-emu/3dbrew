+++
title = 'FS:Obsoleted 3 0 EnumerateExtSaveData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x08330082\]                             |
| 1          | Output ID Count (size / 8)                             |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 3          | (outputBytes \<\< 4) \| 0xC                            |
| 4          | Output Pointer                                         |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2          | Written ID Count |

# Description

This has been obsoleted. It now wraps around the new
[FS:EnumerateExtSaveData](FS:EnumerateExtSaveData "wikilink").
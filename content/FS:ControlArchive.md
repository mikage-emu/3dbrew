+++
title = 'FS:ControlArchive'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080D0144\] |
| 1-2        | u64, Archive Handle        |
| 3          | Action                     |
| 4          | Input Size                 |
| 5          | Output Size                |
| 6          | (inputSize \<\< 4) \| 0xA  |
| 7          | void\* Input               |
| 8          | (outputSize \<\< 4) \| 0xC |
| 9          | void\* Output              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This allows performing extra actions on archives.

# Action

| Value | Description                                                          | Input              | Output          |
|-------|----------------------------------------------------------------------|--------------------|-----------------|
| 0     | Commits save data changes.                                           | None               | None            |
| 1     | Retrieves a file's last-modified timestamp.                          | u16\*, UTF-16 Path | u64, Time Stamp |
| 30877 | Calls [FSPXI](Filesystem_services_PXI "wikilink") command 0x00560102 | 12 bytes           | 16 bytes        |
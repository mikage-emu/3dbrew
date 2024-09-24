+++
title = 'PMApp:LaunchTitleUpdate'
+++

# Request

| Index Word | Description                                                                                      |
|------------|--------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000D0240\]                                                                       |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink") for main title                        |
| 5-8        | [Program Info](Filesystem_services#ProgramInfo "wikilink") for update title                      |
| 9          | Process launch [flags](PMApp:LaunchTitle#Launch_Flags "wikilink") (ORed with 0x10000 internally) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This launches a title, also applying an update patch title.

This returns result code 0xC8A05801 if
[PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink") has been
called, 0xC8A05BF0 if an application is already running, and 0xD8E05802
if flag 0x1 is not set.
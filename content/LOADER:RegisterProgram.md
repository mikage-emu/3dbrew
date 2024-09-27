+++
title = 'LOADER:RegisterProgram'
+++

# Request

| Index Word | Description                                                                    |
|------------|--------------------------------------------------------------------------------|
| 0          | Header code \[0x00020200\]                                                     |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink") for the title       |
| 5-8        | [Program Info](Filesystem_services#ProgramInfo "wikilink") for an update title |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2-3        | u64, Program Handle |

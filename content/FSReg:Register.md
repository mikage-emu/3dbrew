+++
title = 'FSReg:Register'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x040103C0\]                                 |
| 1          | Process ID to register                                     |
| 2-3        | u64, Program Handle                                        |
| 4-7        | [Program Info](Filesystem_services#ProgramInfo "wikilink") |
| 8-15       | [Storage Information](Exheader#Storage_Info "wikilink")    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Register a process for filesystem use.
+++
title = 'PMDbg:LaunchAppDebug'
+++

# Request

| Index Word | Description                                                                                  |
|------------|----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00010140\]                                                                   |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink")                                   |
| 5          | Process launch [flags](PMApp:LaunchTitle#Launch_Flags "wikilink") (Internally ORed with 0x1) |

# Response

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code                                                      |
| 1          | Result code                                                      |
| 2          | N/A                                                              |
| 3          | Debug handle for the launched process from svcDebugActiveProcess |

# Description

This launches a title and opens a debug handle to its process. If a
process is currently queued from [launch flag
0x8](PMApp:LaunchTitle#Launch_Flags "wikilink"), this will instead call
and return the handle from
[RunQueuedProcess](PMDbg:RunQueuedProcess "wikilink").

This returns result code 0xC8A05BF0 if an application is already
running.
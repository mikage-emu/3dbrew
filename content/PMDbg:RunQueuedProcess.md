+++
title = 'PMDbg:RunQueuedProcess'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030000\] |

# Response

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code                                                      |
| 1          | Result code                                                      |
| 3          | Debug handle for the launched process from svcDebugActiveProcess |

# Description

This starts the process last queued using [launch flag
0x8](PMApp:LaunchTitle#Launch_Flags "wikilink").

This returns result code 0xD8A05804 if no process is queued or the
queued process was terminated before launch.

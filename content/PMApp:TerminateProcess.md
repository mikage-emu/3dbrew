+++
title = 'PMApp:TerminateProcess'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000500C0\] |
| 1          | Process ID                 |
| 2-3        | u64, Timeout               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This terminates the process with the specified process ID. If the
timeout value is not 0 and
[PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink") has been
called, the command returns error 0xC8A05801.
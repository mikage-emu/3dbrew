+++
title = 'PMApp:TerminateTitle'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040100\] |
| 1-2        | u64, Program ID            |
| 3-4        | u64, Timeout               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This terminates all processes which have the specified titleID. If the
timeout value is not 0 and
[PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink") has been
called, the command returns error 0xC8A05801.
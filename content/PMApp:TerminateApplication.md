+++
title = 'PMApp:TerminateApplication'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030080\] |
| 1-2        | u64, Timeout               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This terminates the currently running application, marked by [launch
flag 0x1](PMApp:LaunchTitle#launch_flags "wikilink").

This returns result code 0xC8A05801 if
[PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink") has been
called.

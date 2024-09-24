+++
title = 'NSS:TerminateProcess'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040040\] |
| 1          | Process ID                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Calls [PMApp:TerminateProcess](PMApp:TerminateProcess "wikilink") with
timeout value 0xB2D05E00.

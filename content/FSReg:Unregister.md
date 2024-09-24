+++
title = 'FSReg:Unregister'
+++

# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x04020040\]          |
| 1          | Process ID of program to unregister |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Unregister a process registered with
[FSReg:Register](FSReg:Register "wikilink")
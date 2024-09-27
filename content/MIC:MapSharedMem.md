+++
title = 'MIC:MapSharedMem'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010042\] |
| 1          | Shared-mem size            |
| 2          | Value 0x0                  |
| 3          | Shared-mem handle          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This maps the specified shared-memory under the MIC-module process, and
does state initialization for that.

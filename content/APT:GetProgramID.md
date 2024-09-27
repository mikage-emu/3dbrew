+++
title = 'APT:GetProgramID'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00580002\] |
| 1          | 0x20                       |
| 2          | Process ID                 |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2-3        | u64, Program ID |

# Description

This calls [FS:GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink")
and returns the Program ID if found. If not, this returns 0.
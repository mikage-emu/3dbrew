+++
title = 'DLPSRVR:IsChild'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0040\] |
| 1          | Process ID                 |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | bool, is a DLP child |

# Description

This uses command
[FS:GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink") to get the
title ID of the given process ID. Then it checks that (high_title_id &
0xFFFFC000 == 0x40000) && (high_title_id & 0xFFFF == 0x1) (in other
words, the high title ID must match 0x40001). If it matches, then it
returns true, otherwise it returns false.

+++
title = 'GSPGPU:AcquireRight'
+++

# Request

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x00160042\]                                             |
| 1          | Flag, normally zero.                                                   |
| 2          | Value 0x0 ([translation descriptor](IPC#Message_Structure "wikilink")) |
| 3          | Process handle                                                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When flag is non-zero additional hardware initialization is done, in
some cases this includes executing the hw-init function used for
[GSPGPU:ResetGpuCore](GSP_Services "wikilink"). That function is only
executed when a state field is value 0, after executing that function
this field is set to value 1.

Only one process can have rendering rights at a time. When another
process has those rights, this command blocks until the process with the
rights uses GSP:ReleaseRight.
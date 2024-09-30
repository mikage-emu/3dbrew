+++
title = 'ACU:IsConnected'
+++

# Request

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code \[0x003E0042\]                                       |
| 1          | Process ID of target process to check (or zero, see description) |
| 2          | Descriptor for process ID (0x20)                                 |
| 3          | ProcessID set by the ARM11 kernel.                               |


# Response

| Index Word | Description                       |
|------------|-------------                      |
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | bool, target process is connected |

# Description

Checks whether or not the target process has connected via [ACU:ConnectAsync](ACU:ConnectAsync "wikilink"). If a specific process ID is specified, this checks if the associated process has connected. When the input process ID is zero, this performs the same check for the current process. 

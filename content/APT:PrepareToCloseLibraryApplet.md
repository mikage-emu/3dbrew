+++
title = 'APT:PrepareToCloseLibraryApplet'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x002500C0\]                        |
| 1          | u8, ?                                             |
| 2          | u8, Caller Exiting (0 = not exiting, 1 = exiting) |
| 3          | u8, Jump to Home (0 = don't jump, 1 = jump)       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
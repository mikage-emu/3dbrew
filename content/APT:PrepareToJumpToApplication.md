+++
title = 'APT:PrepareToJumpToApplication'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x00230040\]                        |
| 1          | u8, Applet Exiting (0 = not exiting, 1 = exiting) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
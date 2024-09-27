+++
title = 'APT:CancelLibraryApplet'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x003B0040\]                             |
| 1          | u8, Application Exiting (0 = not exiting, 1 = exiting) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
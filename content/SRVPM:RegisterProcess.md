+++
title = 'SRVPM:RegisterProcess'
+++

# Request

| Index Word | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| 0          | Header code \[0x04030082 pre-[7.0.0-13](7.0.0-13 "wikilink"), 0x00030082 currently\] |
| 1          | Process ID                                                                           |
| 2          | Service count                                                                        |
| 3          | ((count \* 4) \<\< 14) \| 0x2                                                        |
| 4          | Pointer to service access control data                                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command registers a process with the service-manager, which
includes registering the serviceaccesscontrol for the process which
normally originates from the exheader.

+++
title = 'SRVPM:UnregisterProcess'
+++

# Request

| Index Word | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| 0          | Header code \[0x04040040 pre-[7.0.0-13](7.0.0-13 "wikilink"), 0x00040040 currently\] |
| 1          | Process ID                                                                           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command unregisters a process with the service-manager.
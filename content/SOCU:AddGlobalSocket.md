+++
title = 'SOCU:AddGlobalSocket'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00230040\] |
| 1          | int sockfd                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Normally each socket is only accessible to the user-process which
created it. Once this command finishes the specified socket will be
accessible to all processes(or at least more than just the process which
created it). This is required by
[SSL_Services](SSL_Services "wikilink"), for example.

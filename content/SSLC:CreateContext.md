+++
title = 'SSLC:CreateContext'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x000200C2\]                      |
| 1          | [Socket](Socket_Services "wikilink") descriptor |
| 2          | u32 input_opt                                   |
| 3          | Host-name size, including null-terminator.      |
| 4          | (Size\<\<4) \| 10                               |
| 5          | Pointer to input host-name buffer               |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2          | Output SSL context handle |

# Description

This creates a session context. The specified sockfd must be used with
[SOCU:AddGlobalSocket](SOCU:AddGlobalSocket "wikilink") before
SSLC:CreateContext.

The context opt field also used by
[SSLC:ContextClearOpt](SSLC:ContextClearOpt "wikilink") is set to:
input_opt \| 0x1b. For user-processes the default value for input_opt is
0x0.

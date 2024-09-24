+++
title = 'HTTPC:CreateRootCertChain'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002D0000\] |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | RootCertChain context handle |

# Description

This uses
[SSLC:CreateRootCertChain](SSLC:CreateRootCertChain "wikilink")
internally. The context handle returned by the SSLC command is separate
from the one returned by this HTTPC command.

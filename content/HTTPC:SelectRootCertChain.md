+++
title = 'HTTPC:SelectRootCertChain'
+++

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x00260080\]   |
| 1          | HTTP context handle          |
| 2          | RootCertChain context handle |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the RootCertChain to use with the specified HTTP context. This
can only be used if no RootCertChain was already set for this context,
including the one which automatically gets created when using the
context-specific RootCA commands such as
[HTTPC:AddTrustedRootCA](HTTPC:AddTrustedRootCA "wikilink").
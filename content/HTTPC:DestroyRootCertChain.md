+++
title = 'HTTPC:DestroyRootCertChain'
+++

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x002E0040\]   |
| 1          | RootCertChain context handle |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This uses command
[SSLC:DestroyRootCertChain](SSLC:DestroyRootCertChain "wikilink"), then
removes the context from the internal HTTP-module list.
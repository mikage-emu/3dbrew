+++
title = 'HTTPC:RootCertChainRemoveCert'
+++

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x00310080\]   |
| 1          | RootCertChain context handle |
| 2          | Cert context handle          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

HTTP module uses command
[SSLC:RootCertChainRemoveCert](SSLC:RootCertChainRemoveCert "wikilink"),
for handling this HTTPC command. There doesn't seem to be any
HTTP-context-specific version of this HTTPC command.
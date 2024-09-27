+++
title = 'HTTPC:AddDefaultCert'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00250080\] |
| 1          | HTTP context handle        |
| 2          | CertID                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

HTTP module uses command
[SSLC:RootCertChainAddDefaultCert](SSLC:RootCertChainAddDefaultCert "wikilink"),
for handling this HTTPC command.
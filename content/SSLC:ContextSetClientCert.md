+++
title = 'SSLC:ContextSetClientCert'
+++

# Request

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | Header code \[0x00190080\]                         |
| 1          | u32 [contexthandle](SSLC:CreateContext "wikilink") |
| 2          | ClientCert context handle                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the ClientCert context handle for the specified SSLC context.

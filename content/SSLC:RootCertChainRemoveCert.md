+++
title = 'SSLC:RootCertChainRemoveCert'
+++

# Request

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code \[0x00070080\]                                         |
| 1          | [RootCertChain](SSLC:CreateRootCertChain "wikilink") contexthandle |
| 2          | Cert context handle                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This removes the specified cert from the RootCertChain.
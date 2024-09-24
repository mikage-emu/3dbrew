+++
title = 'HTTPC:RootCertChainAddCert'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x002F0082\]         |
| 1          | RootCertChain context handle       |
| 2          | Root CA cert buffer size           |
| 4          | (Size\<\<4) \| 10                  |
| 5          | Pointer to input root CA cert data |

# Response

| Index Word | Description   |
|------------|---------------|
| 0          | Header code   |
| 1          | Result code   |
| 2          | u32, unknown. |

# Description

This is the RootCertChain version of
[HTTPC:AddTrustedRootCA](HTTPC:AddTrustedRootCA "wikilink"). This uses
[SSLC:AddTrustedRootCA](SSLC:AddTrustedRootCA "wikilink") internally.
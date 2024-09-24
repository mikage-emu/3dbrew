+++
title = 'HTTPC:OpenClientCertContext'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00320084\] |
| 1          | Cert size                  |
| 2          | Key size                   |
| 3          | (CertSize\<\<4) \| 10      |
| 4          | Pointer to input cert      |
| 5          | (KeySize\<\<4) \| 10       |
| 6          | Pointer to input key       |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | ClientCert context handle. |

# Description

This uses
[SSLC:OpenClientCertContext](SSLC:OpenClientCertContext "wikilink")
internally.
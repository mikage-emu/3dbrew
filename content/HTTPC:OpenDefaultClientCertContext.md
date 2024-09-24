+++
title = 'HTTPC:OpenDefaultClientCertContext'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00330040\] |
| 1          | u8 certID                  |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | ClientCert context handle. |

# Description

This uses
[SSLC:OpenDefaultClientCertContext](SSLC:OpenDefaultClientCertContext "wikilink")
internally.

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x00300080\]   |
| 1          | RootCertChain context handle |
| 2          | CertID                       |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | Cert context handle. |

# Description

HTTP module uses command
[SSLC:RootCertChainAddDefaultCert](SSLC:RootCertChainAddDefaultCert "wikilink"),
for handling this HTTPC command.
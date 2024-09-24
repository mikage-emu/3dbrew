# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00280080\] |
| 1          | HTTP context handle        |
| 2          | u8 certID                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Similar to [HTTPC:SetClientCert](HTTPC:SetClientCert "wikilink"), except
this uses
[SSLC:OpenDefaultClientCertContext](SSLC:OpenDefaultClientCertContext "wikilink")
instead of
[SSLC:OpenClientCertContext](SSLC:OpenClientCertContext "wikilink").
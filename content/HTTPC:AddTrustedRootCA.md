# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00240082\]         |
| 1          | HTTP context handle                |
| 2          | Root CA cert buffer size           |
| 3          | (Size\<\<4) \| 10                  |
| 4          | Pointer to input root CA cert data |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

HTTP module uses command
[SSLC:AddTrustedRootCA](SSLC:AddTrustedRootCA "wikilink"), for handling
this HTTPC command.
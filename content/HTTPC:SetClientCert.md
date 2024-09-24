+++
title = 'HTTPC:SetClientCert'
+++

# Request

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code \[0x002700C4\]                |
| 1          | HTTP context handle                       |
| 2          | Client cert buffer size                   |
| 3          | Cert private key buffer size              |
| 4          | (Client cert buffer size\<\<4) \| 10      |
| 5          | Client cert buffer                        |
| 6          | (Cert private key buffer size\<\<4) \| 10 |
| 7          | Cert private key buffer                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

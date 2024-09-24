# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0084\] |
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

This opens a ClientCert context using the input DER cert and DER private
key. This is for the TLS client cert+privk.
# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00050082\]         |
| 1          | SSL RootCertChain context handle   |
| 2          | Root CA cert buffer size           |
| 3          | (Size\<\<4) \| 10                  |
| 4          | Pointer to input root CA cert data |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | Cert context handle. |

# Description

This adds the specified root CA cert(DER format) to the specified
root-CA chain. This *only* adds it to the chain, the DER data is not
parsed at all.
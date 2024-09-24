# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0040\] |
| 1          | u8 certID                  |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | ClientCert context handle. |

# CertIDs

| ID       | Description                                                                                                                                                                        |
|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Non-0x40 | Invalid certID, error 0xd8e0b839 is returned for this.                                                                                                                             |
| 0x40     | This is the client cert+privk from [ClCertA](ClCertA "wikilink"). This data from ClCertA only gets loaded when there's no ClientCert context handles already open for this certID. |

# Description

This opens a ClientCert context for the specified default certID. This
is for the TLS client cert+privk. Once the user-process is done using
this context handle, that handle must be closed.
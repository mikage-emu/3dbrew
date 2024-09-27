+++
title = 'SSLC:CloseClientCertContext'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0040\] |
| 1          | ClientCert context handle. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This closes the specified ClientCert context handle.
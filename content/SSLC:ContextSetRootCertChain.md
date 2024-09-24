+++
title = 'SSLC:ContextSetRootCertChain'
+++

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00180080\]       |
| 1          | SSL context handle               |
| 2          | SSL RootCertChain context handle |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the RootCertChain for the specified SSL context.

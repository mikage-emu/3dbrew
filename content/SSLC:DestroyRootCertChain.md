+++
title = 'SSLC:DestroyRootCertChain'
+++

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00040040\]       |
| 1          | SSL RootCertChain context handle |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This destroys the specified RootCertChain context.
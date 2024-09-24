+++
title = 'ACI:GetNetworkProxyEnable'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x045F0000\] |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2          | 1 if the proxy is enabled |

# Description

Gets if the proxy is enabled for the loaded network
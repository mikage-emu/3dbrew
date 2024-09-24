+++
title = 'ACU:GetConnectingSsidLength'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00350000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Length      |

# Description

Gets the length of the SSID of the WiFi the 3DS is currently connected
to.
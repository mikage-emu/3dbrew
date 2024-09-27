+++
title = 'ACU:GetConnectingSecurityMode'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00330000\] |

# Response

| Index Word | Description                                                                                                                                     |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                                     |
| 1          | Result code                                                                                                                                     |
| 2          | SecurityMode: 0 = Open Authentication, 1 = WEP 40-bit, 2 = WEP 104-bit, 3 = WEP 128-bit, 4 = WPA TKIP, 5 = WPA2 TKIP, 6 = WPA AES, 7 = WPA2 AES |

# Description

Gets the security mode of the wifi the 3ds is currently connected to.

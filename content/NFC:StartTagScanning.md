+++
title = 'NFC:StartTagScanning'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00050040\] |
| 1          | u16, unknown. This is normally 0x0.               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts scanning for NFC tags.
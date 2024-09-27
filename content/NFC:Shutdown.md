+++
title = 'NFC:Shutdown'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00020040\] |
| 1          | u8, unknown.                                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
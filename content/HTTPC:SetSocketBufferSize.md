+++
title = 'HTTPC:SetSocketBufferSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100080\] |
| 1          | HTTP context handle        |
| 2          | u32 val                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This just returns 0 when the input context handle is valid for this
service-session.

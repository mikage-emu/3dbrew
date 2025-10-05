+++
title = 'HTTPC:GetRequestState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050040\] |
| 1          | HTTP context handle        |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | Output state |

# States

| Value | Description                                                      |
|-------|------------------------------------------------------------------|
| 0x0   | Request has not started yet, initializing context.               |
| 0x1   | Request has not started yet, context has been initialized.       |
| 0x2   | Request has not started yet, waiting to be scheduled.            |
| 0x3   | Request has not started yet, scheduling.                         |
| 0x4   | Request has not started yet, scheduled, waiting for http thread. |
| 0x5   | Request in progress, connecting to server.                       |
| 0x6   | Request in progress, sending HTTP request.                       |
| 0x7   | Request in progress, receiving HTTP response.                    |
| 0x8   | Ready to download the content.                                   |
| 0x9   | Request finished successfully, closing context.                  |
| 0xA   | Request finished, either due to an error or end of body.         |

# Description

This returns the request state, this is used to determine when to download the content.

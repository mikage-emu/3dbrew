+++
title = 'HTTPC:NotifyFinishSendPostData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001D0040\] |
| 1          | HTTP context handle        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This must be used after all data has been uploaded via the
SendPostData\* HTTPC command(s), if those commands were used at all.
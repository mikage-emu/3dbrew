+++
title = 'IRU:GetSendState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u8 output   |

# Description

When the state field is set the value which
[StartSendTransfer](IRU:StartSendTransfer "wikilink") initially sets it
to, this returns value 0(data-send in progress), otherwise this returns
value 1.

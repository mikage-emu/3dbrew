+++
title = 'IRU:GetTransferState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u8 output   |

# Output Values

| Value | Description              |
|-------|--------------------------|
| 1     | Ready                    |
| 2     | Data-send in progress    |
| 3     | Data-receive in progress |

# Description

This returns the raw u8 state field checked by
[GetSendState](IRU:GetSendState "wikilink").

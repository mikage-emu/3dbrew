+++
title = 'FSPXI:GetCardType'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00180000\] |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | u8 CTR card = 0, TWL card = 1 |

# Card Type

There is a third return path that returns 2. The meaning of this return
type is currently unknown

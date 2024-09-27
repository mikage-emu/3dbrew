+++
title = 'FS:GetCardType'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08130000\] |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | u8 CTR card = 0, TWL card = 1 |

# Description

This returns the type of the inserted cartridge. If no cartridge is
inserted it seems to return the type of the previously inserted
cartridge.
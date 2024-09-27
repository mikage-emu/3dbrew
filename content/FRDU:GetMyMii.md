+++
title = 'FRDU:GetMyMii'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

| Index Word | Description            |
|------------|------------------------|
| 0          | Header code            |
| 1          | Result code            |
| 2          | MiiStoreData structure |

MiiStoreData Structure:

|     |                             |
|-----|-----------------------------|
| u8  | data\[0x60\]                |
| u32 | value32\[0x60/sizeof(u32)\] |

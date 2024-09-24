+++
title = 'FRDU:GetMyProfile'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070000\] |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2-3        | Profile structure |

Profile Structure:

| Type    | Name                              |
|---------|-----------------------------------|
| u8      | region                            |
| u8      | country                           |
| u8      | area                              |
| u8      | language                          |
| u8      | platform, always 2 (PLATFORM_CTR) |
| u8\[3\] | padding                           |

+++
title = 'APT:IsStandardMemoryLayout'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x01040000\] |

# Response

| Index Word | Description                                                 |
|------------|-------------------------------------------------------------|
| 0          | Header code                                                 |
| 1          | Result code                                                 |
| 2          | u8, Standard Memory Layout (0 = non-standard, 1 = standard) |

# Description

On Old3DS, this returns 1 if the current
[APPMEMTYPE](Configuration_Memory#APPMEMTYPE "wikilink") is 0, for 64MB
mode. On New3DS, this returns 1 if the current
[APPMEMTYPE](Configuration_Memory#APPMEMTYPE "wikilink") isn't 7, for
178MB mode.
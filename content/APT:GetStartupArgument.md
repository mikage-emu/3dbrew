+++
title = 'APT:GetStartupArgument'
+++

# Request

| Index Word | Description                                                                      |
|------------|----------------------------------------------------------------------------------|
| 0          | Header code \[0x00510080\]                                                       |
| 1          | Parameter Size (capped to 0x300 or 0x1000 depending on different system version) |
| 2          | [StartupArgumentType](NS_and_APT_Services#startupargumenttype "wikilink")        |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | (Parameter Size \<\< 14) \| 2 |
| 1          | void\*, Parameter             |

# Response

| Index Word | Description                                 |
|------------|---------------------------------------------|
| 0          | Header code                                 |
| 1          | Result code                                 |
| 2          | u8, Exists (0 = does not exist, 1 = exists) |

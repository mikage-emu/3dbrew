# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | u8 output value |

# Description

This calls the code for
[Cfg:GetSystemModel](Cfg:GetSystemModel "wikilink"). When the output
value from that is 3 for Nintendo 2DS, the output value here is zero,
otherwise the output value here is 1.
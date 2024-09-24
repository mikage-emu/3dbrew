+++
title = 'CAMU:PlayShutterSoundWithWave'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00370202\] |
| 1          | Size                       |
| 2-5        | ChannelParam               |
| 6-8        | OptionInfo                 |
| 9          | (Size \<\< 4) \| 0xA       |
| 10         | Wave Data Pointer          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# ChannelParam

| Offset | Size | Description                                 |
|--------|------|---------------------------------------------|
| 0x0    | 0x4  | Pitch                                       |
| 0x4    | 0x4  | Left Volume                                 |
| 0x8    | 0x4  | Right Volume                                |
| 0xC    | 0x1  | u8, 0 = No Interpolation, 1 = Interpolation |

# OptionInfo

| Offset | Size | Description                                                    |
|--------|------|----------------------------------------------------------------|
| 0x0    | 0x4  | Fade Target Volume                                             |
| 0x4    | 0x4  | Fade Time (Milliseconds)                                       |
| 0x8    | 0x1  | u8, 0 = Use Hardware Volume, 1 = Ignore Hardware Volume        |
| 0x9    | 0x1  | u8, 0 = Don't Force Speaker Output, 1 = Force Speaker Output   |
| 0xA    | 0x1  | u8, 0 = Don't Complete Before Sleep, 1 = Complete Before Sleep |
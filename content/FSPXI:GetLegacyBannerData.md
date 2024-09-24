# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x003C0102\]           |
| 1          | u8 media type                        |
| 2-3        | u64 program ID                       |
| 4          | u8 unknown                           |
| 5          | 0x23C004 for (banner size\<\<8) \| 4 |
| 6          | Output buffer ptr                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Parameter 4

Effect is unknown. FS always calls this with either 0 or 1
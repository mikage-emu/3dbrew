# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00160000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2-6        | GyroscopeLowCalibrateParam |

# GyroscopeLowCalibrateParam

| Offset | Size | Description                |
|--------|------|----------------------------|
| 0x0    | 0x2  | s16 x zero point?          |
| 0x2    | 0x2  | s16 x positive unit point? |
| 0x4    | 0x2  | s16 x negative unit point? |
| 0x6    | 0x2  | s16 z zero point?          |
| 0x8    | 0x2  | s16 z positive unit point? |
| 0xA    | 0x2  | s16 z negative unit point? |
| 0xC    | 0x2  | s16 y zero point?          |
| 0xE    | 0x2  | s16 y positive unit point? |
| 0x10   | 0x2  | s16 y negative unit point? |
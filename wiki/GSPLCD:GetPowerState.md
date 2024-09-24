# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0040\] |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2          | Power state (u8) |

# Power state flags

| Bit | Description          |
|-----|----------------------|
| 0   | Top backlight on     |
| 1   | Bottom backlight on  |
| 2   | LC panel on          |
| 3   | Operation in process |
| 7   | Fatal error          |

# Description

Read LCD power state. If set, the fatal error bit halts any successive
power operation; the result code tells the cause of the error.
# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0000\] |

# Response

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code                 |
| 1          | Result code                 |
| 2          | u8, power (0 = off, 1 = on) |

# Description

This is a wrapper for CDCMIC command 0x00040000.
# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060000\] |

# Response

| Index Word | Description                                               |
|------------|-----------------------------------------------------------|
| 0          | Header code                                               |
| 1          | Result code                                               |
| 2          | Public mode (byte, 0 = private, non-zero = public)        |
| 3          | Show current game (byte, 0 = don't show, non-zero = show) |
| 4          | Show game history (byte, 0 = don't show, non-zero = show) |
# Request

| Index Word | Description                                                                                                            |
|------------|------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00050100\]                                                                                             |
| 1-2        | 8-byte UTF-8 service name                                                                                              |
| 3          | Name length                                                                                                            |
| 4          | Flags (bit0: if set, return an error immediately if the port is full, otherwise wait until it becomes available again) |

# Response

| Index Word | Description    |
|------------|----------------|
| 0          | Header code    |
| 1          | Result code    |
| 3          | Service handle |
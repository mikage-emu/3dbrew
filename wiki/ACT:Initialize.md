# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00010084\]                            |
| 1          | SDK Version                                           |
| 2          | Shared memory size                                    |
| 3          | Always 0x20(kernel PID header)                        |
| 4          | 0x20(The code to request the current process handle.) |
| 5          | 0x00 (handle-transfer header for kernel)              |
| 6          | Shared memory address value.                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This initializes the ACT service. Shared memory initialization is
optional, but some service calls require it. The SDK version seems to be
0xB0502C8.
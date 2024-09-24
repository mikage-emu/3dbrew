# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | Available channel bit mask |

# Description

This function tries to acquire sound channels. Response cmdbuf\[2\]
holds a bitmask to which channels were allocated to this process.
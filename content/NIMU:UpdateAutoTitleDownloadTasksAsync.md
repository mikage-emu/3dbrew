# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110000\] |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x00110042\]      |
| 1          | Result code                     |
| 2          | Copy Handle Header (0x04000000) |
| 3          | Completion Event Handle         |

# Description

Updates the stored list of auto title download tasks by contacting the
NPNS server, then signals the completion event.
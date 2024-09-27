# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070000\] |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 3          | Event handle |

# Description

This event is signaled by MIC-module when more audio-data is available
in shared-mem.
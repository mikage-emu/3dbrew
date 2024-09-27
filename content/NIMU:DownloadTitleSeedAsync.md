# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002D00C0\] |
| 1-2        | Title ID                   |
| 3          | u16 Country Code           |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x002D0042\]      |
| 1          | Result code                     |
| 2          | Copy Handle Header (0x04000000) |
| 3          | Completion Event Handle         |

# Description

Downloads and installs the seed key for the given title ID from the
Kagiya server, then signals the completion event.
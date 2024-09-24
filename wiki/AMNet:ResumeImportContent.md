# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08100040\] |
| 1          | u16, Content Index         |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2-3        | u64, Resume offset |
| 4          | 0x10               |
| 5          | Content Handle     |

# Description

This is used to open a content, with the TMD content type disc flag.
This is normally used for content installation.
# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00150040\] |
| 1          | Size                                              |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description           |
|------------|-----------------------|
| 0          | (Size\<\<14) \| 2     |
| 1          | Pointer to output buf |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This reads the app-data from the [Amiibo](Amiibo "wikilink") data
already stored in memory. The size must be \>=0xD8-bytes, but the actual
used size is hard-coded to 0xD8.

A certain NFC module state field must be non-zero in order to use this,
otherwise an error is returned(same field as
[NFC:WriteAppData](NFC:WriteAppData "wikilink")).
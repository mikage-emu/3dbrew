# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x0C010100\] |
| 1-2        | u64, File Offset           |
| 3-4        | u64, Size                  |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2-3        | u64, Number of available bytes |

# Description

Gets the number of available bytes to read from an offset, up to the
provided size value. Internally, this loops calling
[FSFile:Read](FSFile:Read "wikilink") until either the provided size
value or the end of the file is reached.
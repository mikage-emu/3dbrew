# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002C0080\] |
| 1          | HTTP context handle        |
| 2          | u32 bitmask                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the value which can be passed to
[SSLC:ContextClearOpt](SSLC:ContextClearOpt "wikilink") later. By
default this value is 0x0 in the context. The
[SSLC:ContextClearOpt](SSLC:ContextClearOpt "wikilink") command is only
used when this value is non-zero in the context.
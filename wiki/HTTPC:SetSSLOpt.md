# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002B0080\] |
| 1          | HTTP context handle        |
| 2          | u32 input_opt              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the input_opt value which is later passed to
[SSLC:CreateContext](SSLC:CreateContext "wikilink"). The default setting
is value 0x0 when this command is never used with the context.
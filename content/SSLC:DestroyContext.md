# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001E0040\] |
| 1          | SSL context handle         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This destroys the specified context which was created by
[SSLC:CreateContext](SSLC:CreateContext "wikilink").
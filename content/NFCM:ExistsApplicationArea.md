+++
title = 'NFCM:ExistsApplicationArea'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04070000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04070080\] |
| 1          | Result code                |
| 2          | bool Exists                |

# Description

This checks whether the amiibo application area exists.
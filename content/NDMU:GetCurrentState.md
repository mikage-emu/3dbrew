+++
title = 'NDMU:GetCurrentState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code                                                        |
| 1          | Result code                                                        |
| 2          | Current NDM State (see [here](NDM_Services "wikilink") for values) |

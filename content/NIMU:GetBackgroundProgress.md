+++
title = 'NIMU:GetBackgroundProgress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x000A0340\]                                             |
| 1          | Result code                                                            |
| 2-11       | [System Update Progress](NIM_Services#SystemUpdateProgress "wikilink") |
| 12         | Unused?                                                                |
| 13         | Unused?                                                                |

# Description

Gets the current state of the background system update.

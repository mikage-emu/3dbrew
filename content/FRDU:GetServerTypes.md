+++
title = 'FRDU:GetServerTypes'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00300000\] |

# Response

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code                                                         |
| 1          | Result code                                                         |
| 2          | NASC Environment (0: Prod, 1: Test, 2: Dev)                         |
| 3          | [Server type](Friend_Services#server_types "wikilink") letter value |
| 4          | [Server type](Friend_Services#server_types "wikilink") number value |

# Description

This returns the environment settings of the current account being used
by friends.

+++
title = 'FRDA:CreateLocalAccount'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x04010100\]                                          |
| 1          | Local account ID                                                    |
| 2          | NASC Environment (0: Prod, 1: Test, 2: Dev)                         |
| 3          | [Server type](Friend_Services#Server_Types "wikilink") letter value |
| 4          | [Server type](Friend_Services#Server_Types "wikilink") number value |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This creates a new local account with the given parameters.

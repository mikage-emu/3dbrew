+++
title = 'CfgI:DeleteConfigNANDSavefile'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08050000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This deletes the "config" file stored in the NAND
[Config_Savegame](Config_Savegame "wikilink").

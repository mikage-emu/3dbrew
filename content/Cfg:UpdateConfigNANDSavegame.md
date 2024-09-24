+++
title = 'Cfg:UpdateConfigNANDSavegame'
+++

# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x04030000\] ("cfg:i": 0x04030000 / 0x08030000) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes the Config buffer in memory to the Cfg NAND
[savegame](Config_Savegame "wikilink").

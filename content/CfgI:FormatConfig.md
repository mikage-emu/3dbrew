+++
title = 'CfgI:FormatConfig'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08060000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This first executes the code used by
[CfgI:DeleteConfigNANDSavefile](CfgI:DeleteConfigNANDSavefile "wikilink").
This then initializes the configuration by creating/writing the config
info-blocks. Then this executes the code used by
[Cfg:UpdateConfigNANDSavegame](Cfg:UpdateConfigNANDSavegame "wikilink").

After using this command, the system will start System Setup at next
system-boot.
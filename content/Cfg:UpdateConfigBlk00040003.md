+++
title = 'Cfg:UpdateConfigBlk00040003'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04090000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This updates the 12-byte [config](Config_Savegame "wikilink") block with
blkID 0x00040003, and writes the updated config to the NAND savegame.
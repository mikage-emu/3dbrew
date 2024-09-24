+++
title = 'HIDSPVR:CallibrateTouch'
+++

# Request

| Index Word | Description                              |
|------------|------------------------------------------|
| 0          | Header code \[0x00010200\]               |
| 1-2        | TopLeft test point X, Y                  |
| 3-4        | Raw touch point for the above test point |
| 5-6        | BottomRight test point X, Y              |
| 7-8        | Raw touch data for the above test point  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This just writes the values passed to [ConfigInfoBlk
0x40000](Config_Savegame#Configuration_blocks "wikilink")
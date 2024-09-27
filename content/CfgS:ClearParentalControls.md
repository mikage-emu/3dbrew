+++
title = 'CfgS:ClearParentalControls'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x040F0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This clears the parental controls option found in Settings. Although the
parental controls are cleared, the secret answer and pin code are not
cleared from config block 0x00100001. However the email stored in config
block 0x000C0002 is cleared.

+++
title = 'IRU:Initialize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This does IRU initialization. This also calls the function for
[IRU:SetBitRate](IRU:SetBitRate "wikilink") with input value 6.
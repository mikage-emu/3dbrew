+++
title = 'DSP:GetHeadphoneStatus'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001F0000\] |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code                               |
| 1          | Result code                               |
| 2          | u8, 0 = not inserted, non-zero = inserted |

# Description

Wrapper for cdc:DSP cmd 6.

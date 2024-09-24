+++
title = 'MICU:GetGain'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u8, gain    |

# Description

This is a wrapper for CDCMIC command 0x00020000.
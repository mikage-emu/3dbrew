+++
title = 'MICU:SetIirFilterMic'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0042\] |
| 1          | Size                       |
| 2          | (Size \<\< 4) \| 0xA       |
| 3          | Pointer to IIR Filter Data |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a wrapper for CDCMIC command 0x00050042.

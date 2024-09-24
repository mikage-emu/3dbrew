+++
title = 'MICU:SetGain'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080040\] |
| 1          | u8, gain                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a wrapper for CDCMIC command 0x00010040.
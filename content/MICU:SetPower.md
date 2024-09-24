+++
title = 'MICU:SetPower'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x000A0040\]  |
| 1          | u8, power (0 = off, 1 = on) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a wrapper for CDCMIC command 0x00030040. When recording is
disabled with this, MIC-module writes value 0xFFFF to the output audio
sample data in shared-mem, since that's what the MIC hardware returns
here.

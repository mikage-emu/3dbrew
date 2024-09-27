+++
title = 'GSPGPU:SetLedForceOff'
+++

# Request

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x001C0040\]                       |
| 1          | u8 state: 0 = 3D LED enable, 1 = 3D LED disable. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This service command allows processes to control the 3D LED. The input
u8 is written to GSP module state, the register for this is not updated
immediately. By default the 3D LED is enabled, when this GSP state field
is set or [3D_LEDSTATE](Configuration_Memory "wikilink") is set the 3D
LED is disabled.

+++
title = 'GSPGPU:SetPerfLogMode'
+++

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00110040\]       |
| 1          | Mode (0 = disabled, 1 = enabled) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the logging mode, then resets the previous state.

+++
title = 'GSPGPU:SaveVramSysArea'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00190000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This saves the contents of VRAM. This also DMAs the current
framebuffers' data into VRAM.
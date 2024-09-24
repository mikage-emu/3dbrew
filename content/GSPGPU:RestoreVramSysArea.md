+++
title = 'GSPGPU:RestoreVramSysArea'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001A0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This restores the contents of VRAM. This also restores the
[LCD](LCD "wikilink") hw registers values(primary framebuffer
addresses/settings), using the saved state from
[GSPGPU:SaveVramSysArea](GSPGPU:SaveVramSysArea "wikilink"). This
command can be used multiple times, without needing to use
[GSPGPU:SaveVramSysArea](GSPGPU:SaveVramSysArea "wikilink") again. This
command seems to do nothing when
[GSPGPU:SaveVramSysArea](GSPGPU:SaveVramSysArea "wikilink") wasn't used
at all.
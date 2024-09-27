+++
title = 'GSPGPU:ImportDisplayCaptureInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00180000\] |

# Response

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00180240\]         |
| 1          | Result code                        |
| 2-5        | Capture info for the top screen    |
| 6-9        | Capture info for the bottom screen |

# Capture info

| Index Word | Description                                                                            |
|------------|----------------------------------------------------------------------------------------|
| 0          | Left framebuffer VA                                                                    |
| 1          | Right framebuffer VA (top screen only)                                                 |
| 2          | [Format](GPU/External_Registers#framebuffer_format "wikilink")                         |
| 3          | [Stride](GPU/External_Registers#lcd_source_framebuffer_setup "wikilink") (offset 0x90) |

# Description

This returns the current framebuffer state. The returned framebuffer
addresses are for the currently active framebuffers.

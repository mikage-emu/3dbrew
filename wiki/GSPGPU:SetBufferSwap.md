# Request

| Index Word | Description                                                                           |
|------------|---------------------------------------------------------------------------------------|
| 0          | Header code \[0x00050200\]                                                            |
| 1          | Screen ID (0 = top, 1 = bottom)                                                       |
| 2-8        | [Framebuffer info structure](GSP_Shared_Memory#Framebuffer_info_structure "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets GSP state for the LCD framebuffers. When the value of
[VCount](GPU/External_Registers#LCD_Source_Framebuffer_Setup "wikilink")
(offset 0x54) is greater than a certain constant, the GSP state for the
specified screen is immediately written to the LCD registers. This
constant is 0x52 on GSP for [11.16.0-48](11.16.0-48 "wikilink"), though
it used to be 0x54.

This command should only be used when directly writing to the
framebuffers; when using the GPU the framebuffer info stored in [GSP
shared memory](GSP_Shared_Memory#Framebuffer_info "wikilink") should be
used instead.
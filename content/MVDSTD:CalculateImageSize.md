+++
title = 'MVDSTD:CalculateImageSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000400C0\] |
| 1          | u32 type                   |
| 2          | u32 width                  |
| 3          | u32 height                 |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Resultcode       |
| 2          | u32 output size. |

# Types

| Value  | Pixel_size |
|--------|------------|
| 2 or 6 | 2          |
| 0x1006 | 4          |

If any other input value is used that's not listed above, MVD-sysmodule
will run [svcBreak](SVC "wikilink").

# Description

This calculates the byte-size of an image buffer. Size =
width\*height\*pixel_size(due to this the input width and height are
interchangeable). See above for pixel_size. If the input width is higher
than 1920, 1920 is used internally instead(likewise for height).
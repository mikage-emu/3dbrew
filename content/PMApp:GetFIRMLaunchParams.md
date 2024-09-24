+++
title = 'PMApp:GetFIRMLaunchParams'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070042\] |
| 1          | Size                       |
| 2          | (Size \<\< 4) \| 0xC       |
| 3          | FIRM Parameters Pointer    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The size is clamped to 0x1000-bytes, then the
[mapped](SVC#KernelSetState "wikilink") buffer for
[FIRM](FIRM "wikilink") launch parameters is copied to the output
buffer.
+++
title = 'MVDSTD:CalculateWorkBufSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030300\] |
| 1..12      | ?                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This calculates the buffer size for
[MVDSTD:Initialize](MVDSTD:Initialize "wikilink") using the input
parameters. This doesn't write to MVD state / registers at all.

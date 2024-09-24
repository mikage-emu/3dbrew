+++
title = 'APT:SendDeliverArg'
+++

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00340084\]       |
| 1          | Parameter Size (capped to 0x300) |
| 2          | HMAC Size (capped to 0x20)       |
| 3          | (Parameter Size \<\< 14) \| 2    |
| 4          | void\*, Parameter                |
| 5          | (HMAC Size \<\< 14) \| 0x802     |
| 6          | void\*, HMAC                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This executes the same code which
[<APT:StartApplication>](APT:StartApplication "wikilink") also uses for
the input buffers.

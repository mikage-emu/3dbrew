+++
title = 'FSPXI:GenerateRandomBytes'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004800C2\] |
| 1          | Buffer size                |
| 2          | (Buffer size \<\< 8) \| 4  |
| 3          | Buffer pointer             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command generates random bytes and stores them in the specified
output pointer with the specified size.

Used in FS11 to generate the 8-byte unique identifier in
[DIFF](DISA_and_DIFF#DIFF_header "wikilink") headers.

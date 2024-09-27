+++
title = 'PSPXI:GenerateRandomBytes'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0042\] |
| 1          | Output buffer size         |
| 2          | (Size\<\<8) \| 0x4         |
| 3          | Output buffer pointer      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Generates random bytes using the FIPS 186-2 (change notice 1) appendix 3
generator using SHA-1.
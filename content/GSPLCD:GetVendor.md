+++
title = 'GSPLCD:GetVendor'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140000\] |

# Response

| Index Word | Description           |
|------------|-----------------------|
| 0          | Header code           |
| 1          | Result code           |
| 2          | u8, vendor identifier |

# Description

Gets the vendors of the screens, and returns it encoded in an u8. The
least significant half of the number contain the bottom screen vendor
identifier number, the most significant half of the number contains the
top screen vendor identifier number.
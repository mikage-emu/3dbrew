+++
title = 'NWMUDS:UpdateNetworkAttribute'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070080\] |
| 1          | u16 bitmask                |
| 2          | u8 flag                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When flag is zero, an u16 state field is cleared using the input
bitmask. When flag is non-zero, it's ORRed using the input bitmask
instead. If bitmask 0x4 is clear in the input bitmask, this clears that
bit in the value before actually writing the value into state.

This seems to be used by the host device for updating
[networkstruct](NWM_Services "wikilink")+0x16.
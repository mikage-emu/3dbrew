+++
title = 'NWMUDS:SetApplicationData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100042\] |
| 1          | Size                       |
| 2          | (Size\<\<14) \| 0x1002     |
| 3          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the appdata in the beacon, see
[here](NWM_Services "wikilink"). By default this is not set(size=0).
This command doesn't need to be used when the appdata is not used. This
is used on the host 3DS to update the beacon data used for broadcasting.
NWM module will automatically broadcast the updated beacon at the next
beacon broadcast interval.

This returns error 0xE10113E9 when the u32 input size is larger than
0xC8.
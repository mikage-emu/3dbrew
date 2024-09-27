+++
title = 'NFCM:GetEmptyRegisterInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04030000\] |

# Response

| Index Word | Description                                                                                  |
|------------|----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x04030A80\]                                                                   |
| 1          | Result code                                                                                  |
| 2-42       | [RegisterInfo](NFC_Services#registerinfo "wikilink") truncated to 0xA4 bytes, filled with 0s |

# Description

This returns a [RegisterInfo](NFC_Services#registerinfo "wikilink"),
minus the last 4 bytes, filled with 0s.

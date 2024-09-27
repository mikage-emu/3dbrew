+++
title = 'NFC:GetTagState'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x000D0000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | u8 output state |

# Tag state values

| Value | Description                                                                                                                                                                                                                                                                                                                                                                                                             |
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0     | [NFC:Initialize](NFC:Initialize "wikilink") was not used yet.                                                                                                                                                                                                                                                                                                                                                           |
| 1     | Not currently scanning for NFC tags. Set by [NFC:StopTagScanning](NFC:StopTagScanning "wikilink") and [NFC:Initialize](NFC:Initialize "wikilink"), when successful.                                                                                                                                                                                                                                                     |
| 2     | Currently scanning for NFC tags. Set by [NFC:StartTagScanning](NFC:StartTagScanning "wikilink") when successful.                                                                                                                                                                                                                                                                                                        |
| 3     | NFC tag is in range. The state automatically changes to this when the state was previous value 3, without using any NFC service commands.                                                                                                                                                                                                                                                                               |
| 4     | NFC tag is now out of range, where the NFC tag was previously in range. This occurs automatically without using any NFC service commands. Once this state is entered, it won't automatically change to anything else when the tag is moved in range again. Hence, if you want to keep doing tag scanning after this, you must [stop](NFC:StopTagScanning "wikilink")+[start](NFC:StartTagScanning "wikilink") scanning. |
| 5     | NFC tag data was successfully loaded. This is set by [NFC:LoadAmiiboData](NFC:LoadAmiiboData "wikilink") when successful.                                                                                                                                                                                                                                                                                               |

# Description

This returns the current NFC tag state.

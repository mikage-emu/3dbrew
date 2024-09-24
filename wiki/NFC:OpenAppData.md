# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00130040\]   |
| 1          | u32 little-endian [Amiibo](Amiibo "wikilink") AppID |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This opens the Amiibo appdata for
[reading](NFC:ReadAppData "wikilink")/[writing](NFC:WriteAppData "wikilink").
Amiibosettings_byte0 bit5 must be set, and the byteswapped amiibo_appID
in amiibosettings must match the input appID. Once all the checks pass,
the state field checked by the
[reading](NFC:ReadAppData "wikilink")/[writing](NFC:WriteAppData "wikilink")
commands is set to 1. This command does not check if the appdata is
already opened(state field set here being already set).

Error 0xC8A17638 is returned for amiibo_appID mismatch.
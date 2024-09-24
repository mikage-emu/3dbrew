# Request

| Index Word | Description                                                                  |
|------------|------------------------------------------------------------------------------|
| 0          | Header code \[0x04040A40\]                                                   |
| 1-41       | [RegisterInfo](NFC_Services#RegisterInfo "wikilink") truncated to 0xA4 bytes |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04040040\] |
| 1          | Result code                |

# Description

This writes the provided
[RegisterInfo](NFC_Services#RegisterInfo "wikilink") to the Amiibo data
stored in memory, this is the writing version of
[GetRegisterInfo](NFC:GetRegisterInfo "wikilink") except with a
truncated structure. Note that the font region and creation date seem to
be ignored.
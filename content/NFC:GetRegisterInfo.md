# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code \[Starting with [9.3.0-X](9.3.0-21 "wikilink"): 0x00170000\] |

# Response

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code                                          |
| 1          | Result code                                          |
| 2-43       | [RegisterInfo](NFC_Services#RegisterInfo "wikilink") |

# Description

This returns the NFC Amiibo registration info, from data already stored
in memory.

When [plaintext_amiibosettingsdata](Amiibo "wikilink")\[0\] bit4 is
clear, this will just return an all-zero output structure with
result-code=0xC8A17628.
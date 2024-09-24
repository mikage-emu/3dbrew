# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x001D0044\]                                 |
| 1          | [Passphrase](NWM_Services "wikilink") buffer size          |
| 2          | (NetworkStructSize\<\<12) \| 0x402                         |
| 3          | Input network [struct](NWM_Services "wikilink") buffer ptr |
| 4          | (PassphraseSize\<\<12) \| 2                                |
| 5          | Input passphrase buffer ptr                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This begins hosting an UDS local-WLAN AP. NWM-module itself throws a
fatal-error if the max_nodes field in the NetworkStruct is set to 0x1.
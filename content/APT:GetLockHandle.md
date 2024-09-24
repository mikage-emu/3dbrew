+++
title = 'APT:GetLockHandle'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010040\] |
| 1          | Flags                      |

# Response

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code                                                        |
| 1          | Result code                                                        |
| 2          | [AppletAttr](NS_and_APT_Services#AppletAttr "wikilink")            |
| 3          | APT State (bit0 = Power Button State, bit1 = Order To Close State) |
| 4          | 0x0 ([translation descriptor](IPC "wikilink"))                     |
| 5          | Lock Handle                                                        |

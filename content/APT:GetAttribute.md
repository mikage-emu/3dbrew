+++
title = 'APT:GetAttribute'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x000A0040\]                     |
| 1          | [AppID](NS_and_APT_Services#appids "wikilink") |

# Response

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code                                             |
| 1          | Result code                                             |
| 2          | [AppletAttr](NS_and_APT_Services#appletattr "wikilink") |

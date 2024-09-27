+++
title = 'APT:GetAppletManInfo'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00050040\]                            |
| 1          | [AppletPos](NS_and_APT_Services#appletpos "wikilink") |

# Response

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code                                              |
| 1          | Result code                                              |
| 2          | [AppletPos](NS_and_APT_Services#appletpos "wikilink")    |
| 3          | Requested [AppID](NS_and_APT_Services#appids "wikilink") |
| 4          | Home Menu [AppID](NS_and_APT_Services#appids "wikilink") |
| 5          | Current [AppID](NS_and_APT_Services#appids "wikilink")   |

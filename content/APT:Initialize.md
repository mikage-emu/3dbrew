+++
title = 'APT:Initialize'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00020080\]                              |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink")          |
| 2          | [AppletAttr](NS_and_APT_Services#AppletAttr "wikilink") |

# Response

| Index Word | Description                                                                                                     |
|------------|-----------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                     |
| 1          | Result code                                                                                                     |
| 2          | 0x04000000 ([translation descriptor](IPC "wikilink"))                                                           |
| 3          | Notification Event Handle (call [<APT:InquireNotification>](APT:InquireNotification "wikilink") when triggered) |
| 4          | Resume Event Handle (triggered at start of execution and when returning to app from home menu)                  |

# Description

The [AppletAttr](NS_and_APT_Services#AppletAttr "wikilink")
[AppletPos](NS_and_APT_Services#AppletPos "wikilink") must not be larger
than 6, otherwise NS calls [svcBreak](SVC "wikilink").
[AppletAttr](NS_and_APT_Services#AppletAttr "wikilink") bitmask
0x20000000 must not be set when the
[AppletAttr](NS_and_APT_Services#AppletAttr "wikilink")
[AppletPos](NS_and_APT_Services#AppletPos "wikilink") == POS_SYS and
using this command via <APT:U>, otherwise NS calls
[svcBreak](SVC "wikilink").
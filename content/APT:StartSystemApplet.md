+++
title = 'APT:StartSystemApplet'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x001F0084\]                     |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink") |
| 2          | Parameters Size                                |
| 3          | 0x0                                            |
| 4          | Handle Parameter                               |
| 5          | (Parameters Size \<\< 14) \| 2                 |
| 6          | void\*, Parameters                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts the applet with the specified
[AppID](NS_and_APT_Services#AppIDs "wikilink"), and
[sets](APT:SendParameter "wikilink") the parameter data for this applet
to the specified buffer data (the size for this can be zero). This also
terminates the currently running application/applet, in some cases.
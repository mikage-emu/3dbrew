+++
title = 'APT:StartLibraryApplet'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x001E0084\]                     |
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
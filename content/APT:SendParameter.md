+++
title = 'APT:SendParameter'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x000C0104\]                                 |
| 1          | Source [AppID](NS_and_APT_Services#AppIDs "wikilink")      |
| 2          | Destination [AppID](NS_and_APT_Services#AppIDs "wikilink") |
| 3          | [Command](NS_and_APT_Services#Command "wikilink")          |
| 4          | Parameter Size (max is 0x1000)                             |
| 5          | 0x0                                                        |
| 6          | Handle Parameter                                           |
| 7          | (Parameter Size \<\< 14) \| 2                              |
| 8          | void\*, Parameter                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the parameter data state.
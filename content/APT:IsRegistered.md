+++
title = 'APT:IsRegistered'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x00090040\]                     |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink") |

# Response

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code                                    |
| 1          | Result code                                    |
| 2          | u8 output: 0 = not registered, 1 = registered. |

# Description

This returns whether the specified AppID is registered with NS yet. An
AppID is "registered" once the process associated with the AppID uses
<APT:Enable>. Home-menu uses this command to determine when the launched
process is running and to determine when to stop using
[GSP](GSP_Services "wikilink") etc, while displaying the "Nintendo 3DS"
loading screen.

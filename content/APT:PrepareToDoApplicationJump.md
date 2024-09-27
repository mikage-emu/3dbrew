+++
title = 'APT:PrepareToDoApplicationJump'
+++

# Request

| Index Word | Description                                                  |
|------------|--------------------------------------------------------------|
| 0          | Header code \[0x00310100\]                                   |
| 1          | u8, [Flags](APT:PrepareToDoApplicationJump#Flags "wikilink") |
| 2-3        | u64, Program ID                                              |
| 4          | [MediaType](Filesystem_services#MediaType "wikilink")        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Flags

| Value | Description                                                                                                     |
|-------|-----------------------------------------------------------------------------------------------------------------|
| 0     | The input parameters are used.                                                                                  |
| 1     | The parameters from the NS state are used.                                                                      |
| 2     | The parameters already set for the application [AppID](NS_and_APT_Services#AppIDs "wikilink") (0x300) are used. |

# Description

After initializing Program
ID/[MediaType](Filesystem_services#MediaType "wikilink") fields/etc,
this then uses
[PTMSYSM:NotifyPlayEvent](PTMSYSM:NotifyPlayEvent "wikilink") and
[PMApp:LaunchTitle](PMApp:LaunchTitle "wikilink") (in some cases these
two commands aren't used however).

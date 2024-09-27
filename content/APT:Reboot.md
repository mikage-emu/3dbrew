+++
title = 'APT:Reboot'
+++

# Request

| Index Word | Description                                                                                                                            |
|------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00490180\]                                                                                                             |
| 1-4        | [Program Info](Filesystem_services#programinfo "wikilink") for the title which will be run under the launched [FIRM](FIRM "wikilink"). |
| 5          | u8, [FIRM Launch Memory Flags](FIRM#firm_launch_parameters "wikilink")                                                                 |
| 6          | [FIRM](FIRM "wikilink") Title ID Low                                                                                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This triggers a [FIRM](FIRM "wikilink")
[launch](PMApp:LaunchFIRMSetParams "wikilink"). Normally the input Title
ID from the 0x10-byte structure is written to the FIRM parameter buffer,
however this is skipped when this Title ID matches the TIDs for
[AppID](NS_and_APT_Services#appids "wikilink") 0x101, 0x103, or 0x104
([AppID](NS_and_APT_Services#appids "wikilink") 0x104 is only checked
here on older NS versions however).

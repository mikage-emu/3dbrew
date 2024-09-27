+++
title = 'PMDbg:LaunchApp'
+++

# Request

| Index Word | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00020140\]                                                                    |
| 1-4        | [Program Info](Filesystem_services#programinfo "wikilink")                                    |
| 5          | Process launch [flags](PMApp:LaunchTitle#launch_flags "wikilink") (Internally orred with 0x3) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wrapper for [PMApp:LaunchTitle](PMApp:LaunchTitle "wikilink").

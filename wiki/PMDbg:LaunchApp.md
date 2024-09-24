# Request

| Index Word | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00020140\]                                                                    |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink")                                    |
| 5          | Process launch [flags](PMApp:LaunchTitle#Launch_Flags "wikilink") (Internally orred with 0x3) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wrapper for [PMApp:LaunchTitle](PMApp:LaunchTitle "wikilink").
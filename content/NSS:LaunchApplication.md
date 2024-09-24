+++
title = 'NSS:LaunchApplication'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x00150140\]                                 |
| 1-4        | [Program Info](Filesystem_services#ProgramInfo "wikilink") |
| 5          | [Launch Flags](PMApp:LaunchTitle#Launch_Flags "wikilink")  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Unlike LaunchTitle, this will do a "proper" app launch, using the update
title if present. It seems to set proper internal states, like
[<APT:PrepareToStartApplication>](APT:PrepareToStartApplication "wikilink")
and [<APT:StartApplication>](APT:StartApplication "wikilink") would.
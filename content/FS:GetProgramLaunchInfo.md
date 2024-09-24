+++
title = 'FS:GetProgramLaunchInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x082F0040\] |
| 1          | Process ID                 |

# Response

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code                                                |
| 1          | Result code                                                |
| 2-5        | [Program Info](Filesystem_services#ProgramInfo "wikilink") |

# Description

This returns the [Program
Info](Filesystem_services#ProgramInfo "wikilink") for the specified
process, which was registered via
[fs:REG](Filesystem_services "wikilink").

+++
title = 'AMPXI:DeleteProgramsAtomically'
+++

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00670082\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2          | Title Count                                            |
| 3          | ((Title Count \* 8) \<\< 8) \| 0x6                     |
| 4          | Title IDs Input Pointer                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Deletes the input title IDs in batch, using the same deletion code as in [AMPXI:DeleteTitle](AMPXI:DeleteTitle "wikilink"). All title IDs given must correspond to title entries within the same title database. For example, one title given that exists in import.db and another in title.db is not allowed.

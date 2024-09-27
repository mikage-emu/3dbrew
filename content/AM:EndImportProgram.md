+++
title = 'AM:EndImportProgram'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04050002\] |
| 1          | 0x10                       |
| 2          | CIA Handle                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Executes the function for
[AM:EndImportProgramWithoutCommit](AM:EndImportProgramWithoutCommit "wikilink"),
then uses [AM:CommitImportPrograms](AM:CommitImportPrograms "wikilink")
for this title. For
[AM:CommitImportPrograms](AM:CommitImportPrograms "wikilink"), this
loads the media type from the AM module CIA object-state, the second u8
for that command is set to value 1.

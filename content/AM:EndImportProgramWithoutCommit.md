+++
title = 'AM:EndImportProgramWithoutCommit'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04060002\] |
| 1          | 0x10                       |
| 2          | CIA Handle                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Closes the CIA file handle in preparation for install finalization.

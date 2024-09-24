+++
title = 'NIMU:DownloadMissingTitleSeedsAsync'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002E0000\] |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x002E0042\]      |
| 1          | Result code                     |
| 2          | Copy Handle Header (0x04000000) |
| 3          | Completion Event Handle         |

# Description

Downloads and installs seed keys from the Kagiya server for any
installed titles that are currently missing one, then signals the
completion event.

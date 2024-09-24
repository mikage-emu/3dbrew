+++
title = 'NIMU:CancelAutoTitleDownloadTask'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x00180080\]  |
| 1-2        | Auto Title Download Task ID |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00180040\] |
| 1          | Result code                |

# Description

Cancels an auto title download task. Used by the HOME menu when download
now is pressed, as part of changing an auto title download into a
regular background download.
+++
title = 'NIMU:StopTitleDownload'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00270000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00270040\] |
| 1          | Result code                |

# Description

Stops a download. The download can be resumed later by starting it
again. Used by the home menu when pressing download later on an active
download.
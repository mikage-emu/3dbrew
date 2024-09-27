+++
title = 'NIMU:IsPendingAutoTitleDownloadTasks'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00150000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00150080\] |
| 1          | Result code                |
| 2          | bool Has Pending Tasks     |

# Description

Returns whether there are pending auto title download tasks that are
ready to be started.
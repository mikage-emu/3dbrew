+++
title = 'NIMU:UnregisterTask'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000C0082\]         |
| 1-2        | Title ID                           |
| 3          | Process ID Header (0x20)           |
| 4          | Process ID (Auto-Filled by Kernel) |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0040\] |
| 1          | Result code                |

# Description

Unregisters a background title download task.

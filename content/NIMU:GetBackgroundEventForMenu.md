+++
title = 'NIMU:GetBackgroundEventForMenu'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050000\] |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x00050042\]      |
| 1          | Result code                     |
| 2          | Copy Handle Header (0x04000000) |
| 3          | Event Handle                    |

# Description

Gets the event handle used to signal the home menu that a background
system update is ready to commit.
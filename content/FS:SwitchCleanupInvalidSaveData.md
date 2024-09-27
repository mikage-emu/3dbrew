+++
title = 'FS:SwitchCleanupInvalidSaveData'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x085F0040\]  |
| 1          | u8, 0 = disable, 1 = enable |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
+++
title = 'NIMU:IsRegistered'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0080\] |
| 1-2        | Title ID                   |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0080\] |
| 1          | Result code                |
| 2          | bool Registered            |

# Description

Checks whether a title has a registered background download task.

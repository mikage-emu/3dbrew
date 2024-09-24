+++
title = 'FRDU:GetMyFavoriteGame'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0000\] |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2-3        | u64, Application Title ID |

# Description

Obtains the favorite game set by the console.

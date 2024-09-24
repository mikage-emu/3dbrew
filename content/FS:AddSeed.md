+++
title = 'FS:AddSeed'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x087A0180\] |
| 1-2        | u64, Title ID              |
| 3-6        | Seed                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Adds an entry to the seed DB for the specified title.
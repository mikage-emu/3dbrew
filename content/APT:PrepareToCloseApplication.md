+++
title = 'APT:PrepareToCloseApplication'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x00220040\]                        |
| 1          | u8, Cancel Preload (0 = don't cancel, 1 = cancel) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

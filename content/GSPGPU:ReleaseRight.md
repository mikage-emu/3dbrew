+++
title = 'GSPGPU:ReleaseRight'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00170000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Releases rights to the GPU. Only one process can have rendering rights
at a time.
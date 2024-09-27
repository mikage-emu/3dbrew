+++
title = 'MIC:UnmapSharedMem'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This unmaps the shared-memory under the MIC-module process, and updates
MIC-module state.

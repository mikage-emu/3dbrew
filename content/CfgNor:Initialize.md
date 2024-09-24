+++
title = 'CfgNor:Initialize'
+++

# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x00010040\]           |
| 1          | Unknown u8, this is usually value 1. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command must be used after obtaining the service handle, before
using other CfgNor service commands.

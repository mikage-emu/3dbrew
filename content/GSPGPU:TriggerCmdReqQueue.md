+++
title = 'GSPGPU:TriggerCmdReqQueue'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This triggers handling of the GX command written to the command buffer
in [shared](GSP_Shared_Memory "wikilink") memory.

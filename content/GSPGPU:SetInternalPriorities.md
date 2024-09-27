+++
title = 'GSPGPU:SetInternalPriorities'
+++

# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x001E0080\]          |
| 1          | Session thread priority             |
| 2          | Session thread priority with rights |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets the priority for the thread handling incoming GSPGPU commands, and
the priority when said thread has acquired GPU rights. Both values must
be \< 0x40.
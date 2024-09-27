+++
title = 'ACU:SetClientVersion'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00400042\]                             |
| 1          | The client version                                     |
| 2          | Must be translate-header value 0x20.                   |
| 3          | The kernel writes the PID of the current process here. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets the ACU Client Version.
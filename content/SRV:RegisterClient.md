# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00010002\]                             |
| 1          | Must be translate-header value 0x20.                   |
| 2          | The kernel writes the PID of the current process here. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Registers the given process ID for use of other *srv:* commands. Based
on the process ID, *srv:* performs some rudimentary access control.

Internally sm-module just writes the input PID into the object
associated with the user-process session-handle.
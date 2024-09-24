+++
title = 'NFC:StartCommunication'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00030000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

With the Old3DS sysmodule this starts communication with Old3DS NFC
hardware. The New3DS sysmodule just checks state for this
command(somestate_val0 = {some_retval}, ...).
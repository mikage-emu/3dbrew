+++
title = 'APT:SendCaptureBufferInfo'
+++

# Request

| Index Word | Description                                                                   |
|------------|-------------------------------------------------------------------------------|
| 0          | Header code \[0x00400042\]                                                    |
| 1          | Size                                                                          |
| 2          | (Size \<\< 14) \| 2                                                           |
| 3          | void\*, [CaptureBufferInfo](NS_and_APT_Services#CaptureBufferInfo "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The input size is clamped to 0x20-bytes by NS. The input buffer with the
clamped size is then copied to a NS state buffer. The size field for
this state buffer is also set to this clamped size.

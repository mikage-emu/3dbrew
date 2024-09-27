+++
title = 'APT:ReceiveCaptureBufferInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00410040\] |
| 1          | Size                       |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                                   |
|------------|-------------------------------------------------------------------------------|
| 0          | (Size \<\< 14) \| 2                                                           |
| 1          | void\*, [CaptureBufferInfo](NS_and_APT_Services#CaptureBufferInfo "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Actual Size |

# Description

This command loads the data set by
[<APT:SendCaptureBufferInfo>](APT:SendCaptureBufferInfo "wikilink"). The
input size is clamped to 0x20-bytes by NS, then this size is clamped to
the size for the NS state buffer. The NS state buffer data is copied to
the output buffer, (when the clamped size is not zero) then the size
field for the state buffer is set 0.

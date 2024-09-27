+++
title = 'APT:GetCaptureInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004A0040\] |
| 1          | Size                       |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                                   |
|------------|-------------------------------------------------------------------------------|
| 0          | (Size \<\< 14) \| 2                                                           |
| 1          | void\*, [CaptureBufferInfo](NS_and_APT_Services#capturebufferinfo "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command loads the data set by
[<APT:SendCaptureBufferInfo>](APT:SendCaptureBufferInfo "wikilink"),
this command is similar to
[<APT:ReceiveCaptureBufferInfo>](APT:ReceiveCaptureBufferInfo "wikilink").
The input size is clamped to 0x20-bytes by NS. The NS state
[buffer](APT:SendCaptureBufferInfo "wikilink") data is then copied to
the output buffer.

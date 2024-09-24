+++
title = 'HTTPC:AddPostDataBinary'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x001300C4\]                        |
| 1          | HTTP context handle                               |
| 2          | Form name buffer size, including null-terminator. |
| 3          | Binary data size.                                 |
| 4          | (FormNameSize\<\<14) \| 0xC02                     |
| 5          | Form name data pointer                            |
| 6          | (BinaryDataSize\<\<4) \| 10                       |
| 7          | Binary data pointer                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This URL-encodes the specified "name=value" with binary data, then adds
it to the POST data which will be uploaded once the request is sent.

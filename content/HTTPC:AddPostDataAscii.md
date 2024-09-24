# Request

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | Header code \[0x001200C4\]                         |
| 1          | HTTP context handle                                |
| 2          | Form name buffer size, including null-terminator.  |
| 3          | Form value buffer size, including null-terminator. |
| 4          | (FormNameSize\<\<14) \| 0xC02                      |
| 5          | Form name data pointer                             |
| 6          | (FormValueSize\<\<4) \| 10                         |
| 7          | Form value data pointer                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This URL-encodes the specified "name=value" data, then adds it to the
POST data which will be uploaded once the request is
[sent](HTTPC:BeginRequest "wikilink"). When using this command,
[HTTPC:AddRequestHeader](HTTPC:AddRequestHeader "wikilink") must be used
to add a "Content-Type: application/x-www-form-urlencoded" header.
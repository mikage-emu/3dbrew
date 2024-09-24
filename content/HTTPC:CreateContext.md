+++
title = 'HTTPC:CreateContext'
+++

# Request

| Index Word | Description                                 |
|------------|---------------------------------------------|
| 0          | Header code \[0x00020082\]                  |
| 1          | URL buffer size, including null-terminator. |
| 2          | u8 RequestMethod                            |
| 3          | (URLSize\<\<4) \| 10                        |
| 4          | URL data pointer                            |

## enum RequestMethod

| Memory state flags          | Value |
|-----------------------------|-------|
| NONE (this causes an error) | 0     |
| GET                         | 1     |
| POST                        | 2     |
| HEAD                        | 3     |
| PUT                         | 4     |
| DELETE                      | 5     |
| POST                        | 6     |
| PUT                         | 7     |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | HTTP context handle |

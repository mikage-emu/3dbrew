+++
title = 'SOCU:getnameinfo'
+++

```
int getnameinfo(const struct sockaddr *sa, socklen_t salen, char *host, socklen_t hostlen, char *serv, socklen_t servlen, int flags)
```

# Request

| Index Word | Description                                                     |
|------------|-----------------------------------------------------------------|
| 0          | Header code \[0x00100102\]                                      |
| 1          | value 0x1C // size of sockaddr_in6                              |
| 2          | socklen_t hostlen                                               |
| 3          | socklen_t servlen                                               |
| 4          | int flags                                                       |
| 5          | 0x1C \<\<14 \| 8 \<\< 10 \| 2 // IPC_Desc_StaticBuffer(0x1C,8); |
| 6          | const struct sockaddr \*sa                                      |

## Thread Static Buffers

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | hostlen\<\<14 // IPC_Desc_StaticBuffer(hostlen,0); |
| 1          | host                                               |
| 2          | servlen\<\<14 // IPC_Desc_StaticBuffer(servlen,0); |
| 3          | serv                                               |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

Notes : some of the 0x1C values could possibly be replaced by salen, but
the module seems to accept only 0x1C.
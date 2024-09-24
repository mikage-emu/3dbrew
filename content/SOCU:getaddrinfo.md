` int socu_getaddrinfo(const char *node, const char *service, const struct addrinfo *hints, struct addrinfo **res, addrinfo_3ds_t *info, s32 info_count, s32 * count)`

This function will store each result entry in the form of the following
structure :

`struct addrinfo_3ds_t`
`{`
`   s32                     ai_flags;`
`   s32                     ai_family;`
`   s32                     ai_socktype;`
`   s32                     ai_protocol;`
`   u32                     ai_addrlen;`
`   char                    ai_canonname[256];`
`   struct sockaddr_storage ai_addr;`
`};`

Its size is 0x130.

Note that the command will simply fill whatever it can, but never issue
any error if there isn't enough memory provided to store those entries.
However, the count of entries will always hold the correct value, that
way you can reallocate memory and call the function again.

# Request

| Index Word | Description                                                                               |
|------------|-------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00F0106\]                                                                 |
| 1          | 0 if node is NULL, strlen(node)+1 otherwise                                               |
| 2          | 0 if service is NULL, strlen(service)+1 otherwise                                         |
| 3          | 0 if hints is NULL, sizeof(struct addrinfo) otherwise                                     |
| 4          | sizeof(addrinfo_3ds_t) \* info_count                                                      |
| 5          | (value used for word 1) \<\<14 \| 5 \<\< 10 \| 2 // IPC_Desc_StaticBuffer(cmdbuf\[1\], 5) |
| 6          | node                                                                                      |
| 7          | (value used for word 2) \<\<14 \| 6 \<\< 10 \| 2 // IPC_Desc_StaticBuffer(cmdbuf\[2\], 6) |
| 8          | service                                                                                   |
| 9          | (value used for word 3) \<\<14 \| 7 \<\< 10 \| 2 // IPC_Desc_StaticBuffer(cmdbuf\[3\], 7) |
| 10         | hints                                                                                     |

## Thread Static Buffers

| Index Word | Description                                                                                                     |
|------------|-----------------------------------------------------------------------------------------------------------------|
| 0          | (sizeof(addrinfo_3ds_t) \* info_count) \<\<14 // IPC_Desc_StaticBuffer(sizeof(addrinfo_3ds_t) \* info_count, 0) |
| 1          | info                                                                                                            |

# Response

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code                         |
| 1          | Result code                         |
| 2          | POSIX return value                  |
| 3          | count (number of entries available) |

# Known error codes

| Error name   | Value |
|--------------|-------|
| EAI_FAMILY   | -303  |
| EAI_MEMORY   | -304  |
| EAI_NONAME   | -305  |
| EAI_SOCKTYPE | -307  |
The socket sysmodule has a maximum limit of 64 sockets in total.

# Socket user service "soc:U"

There can be up to 18 sessions of this service.

| Command Header | Available since system-version | Description                                              |
|----------------|--------------------------------|----------------------------------------------------------|
| 0x00010044     |                                | [InitializeSockets](SOCU:InitializeSockets "wikilink")   |
| 0x000200C2     |                                | [socket](SOCU:socket "wikilink")                         |
| 0x00030082     |                                | [listen](SOCU:listen "wikilink")                         |
| 0x00040082     |                                | [accept](SOCU:accept "wikilink")                         |
| 0x00050084     |                                | [bind](SOCU:bind "wikilink")                             |
| 0x00060084     |                                | [connect](SOCU:connect "wikilink")                       |
| 0x00070104     |                                | [recvfrom_other](SOCU:recvfrom_other "wikilink")         |
| 0x00080102     |                                | [recvfrom](SOCU:recvfrom "wikilink")                     |
| 0x00090106     |                                | [sendto_other](SOCU:sendto_other "wikilink")             |
| 0x000A0106     |                                | [sendto](SOCU:sendto "wikilink")                         |
| 0x000B0042     |                                | [close](SOCU:close "wikilink")                           |
| 0x000C0082     |                                | [shutdown](SOCU:shutdown "wikilink")                     |
| 0x000D0082     |                                | [gethostbyname](SOCU:gethostbyname "wikilink")           |
| 0x000E00C2     |                                | [gethostbyaddr](SOCU:gethostbyaddr "wikilink")           |
| 0x000F0106     |                                | [getaddrinfo](SOCU:getaddrinfo "wikilink")               |
| 0x00100102     |                                | [getnameinfo](SOCU:getnameinfo "wikilink")               |
| 0x00110102     |                                | [getsockopt](SOCU:getsockopt "wikilink")                 |
| 0x00120104     |                                | [setsockopt](SOCU:setsockopt "wikilink")                 |
| 0x001300C2     |                                | [fcntl](SOCU:fcntl "wikilink")                           |
| 0x00140084     |                                | [poll](SOCU:poll "wikilink")                             |
| 0x00150042     |                                | [sockatmark](SOCU:sockatmark "wikilink")                 |
| 0x00160000     |                                | [gethostid](SOCU:gethostid "wikilink")                   |
| 0x00170082     |                                | [getsockname](SOCU:getsockname "wikilink")               |
| 0x00180082     |                                | [getpeername](SOCU:getpeername "wikilink")               |
| 0x00190000     |                                | [ShutdownSockets](SOCU:ShutdownSockets "wikilink")       |
| 0x001A00C0     |                                | [GetNetworkOpt](SOCU:GetNetworkOpt "wikilink")           |
| 0x001B0040     |                                | [ICMPSocket](SOCU:ICMPSocket "wikilink")                 |
| 0x001C0104     |                                | [ICMPPing](SOCU:ICMPPing "wikilink")                     |
| 0x001D0040     |                                | [ICMPCancel](SOCU:ICMPCancel "wikilink")                 |
| 0x001E0040     |                                | [ICMPClose](SOCU:ICMPClose "wikilink")                   |
| 0x001F0040     |                                | [GetResolverInfo](SOCU:GetResolverInfo "wikilink")       |
| 0x00200146     |                                | [SendToMultiple](SOCU:SendToMultiple "wikilink")         |
| 0x00210002     |                                | [CloseSockets](SOCU:CloseSockets "wikilink")             |
| 0x00220040     |                                | (int sockfd) Might be the inverse of command 0x00230040? |
| 0x00230040     |                                | [AddGlobalSocket](SOCU:AddGlobalSocket "wikilink")       |
| 0x100100C0     | ?                              | ?                                                        |
| 0x10030142     | ?                              | ?                                                        |
| 0x10050084     | ?                              | ?                                                        |
| 0x10070102     | ?                              | ?                                                        |

# Socket privileged service "soc:P"

There can be up to 3 sessions of this service.

| Command Header | Description                                                      |
|----------------|------------------------------------------------------------------|
| 0x00010084     | [InitializeSockets](SOCP:InitializeSockets "wikilink")           |
| 0x00020000     | [FinalizeSockets](SOCP:FinalizeSockets "wikilink")               |
| 0x000300C2     | [SetNetworkOpt](SOCP:SetNetworkOpt "wikilink")                   |
| 0x00040040     | [CloseSocketsForProcess](SOCP:CloseSocketsForProcess "wikilink") |
| 0x000500C0     |                                                                  |
| 0x00060000     | [gethostid](SOCP:gethostid "wikilink")                           |
| 0x00070000     |                                                                  |
| 0x00080000     |                                                                  |
| 0x00090000     | [StopInitializeSockets](SOCP:StopInitializeSockets "wikilink")   |

# struct sockaddr

| Offset | Size                   | Description                               |
|--------|------------------------|-------------------------------------------|
| 0x0    | 0x1                    | Total size of the entire sockaddr buffer. |
| 0x1    | 0x1                    | u8 sa_family                              |
| 0x2    | sockaddr_totalsize-0x2 | sa_data\[\]                               |

The total buffer size is 0x8, for family AF_INET value 2. AF_INET6 seems
to be value 23, the total sockaddr size for this is 0x1C. The max
sockaddr buffer size which the socket module can handle is size 0x1C.

These socket services(and defines/structures) seem to be based on the
Wii sockets?

# Socket module errors

| Error      | Description                                                                                                                                                                                                                           |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0xC8A07004 | This is returned when trying to use a socket descriptor from a different process.                                                                                                                                                     |
| 0xC8A07009 | Network dropped connection on reset? (Translated from ENETRESET error)                                                                                                                                                                |
| 0xC8A0700B | [SOCU:InitializeSockets](SOCU:InitializeSockets "wikilink") returns this when the specified PID was already used with [SOCU:InitializeSockets](SOCU:InitializeSockets "wikilink")(since the PID was found in SOC module state table). |
| 0xD860700A | [SOCU:InitializeSockets](SOCU:InitializeSockets "wikilink") returns this when the PID table is already full(32 processes max).                                                                                                        |
| 0xD8E07006 | Not initialized. This is returned when [SOCU:InitializeSockets](SOCU:InitializeSockets "wikilink") has not been run.                                                                                                                  |
| 0xD8E07007 | The given socket descriptor does not exist.                                                                                                                                                                                           |

# Socket module static buffers

This is the list of the known thread static buffers in use for SOC:u and
the commands using those.

| buffer ID | commands            |
|-----------|---------------------|
| 0         | bind,connect        |
| 1         | sendto_other,sendto |
| 2         | sendto              |
| 5-7       | getaddrinfo         |
| 8         | getnameinfo         |
| 9         | setsockopt          |
| 10        | poll                |

# IPV6

It seems that Nintendo planned ahead and included IPv6 support to some
extent in their code. Name resolution functions support IPv6 (such as
[getnameinfo](SOCU:getnameinfo "wikilink")), but
[socket](SOCU:socket "wikilink") doesn't.

The ipv6 sockaddr size is 0x1C and is required for some IPC commands,
even when using sockaddr_in which in reality is of size 8. The
sockaddr_in6 struct is the following:

`struct in6_addr`
`{`
`   uint8_t s6_addr[16];`
`};`

`struct sockaddr_in6`
`{`
`    sa_family_t     sin6_family;`
`    in_port_t       sin6_port;`
`    struct in6_addr sin6_addr;`
`    u32             sin6_flowinfo; // Not confirmed`
`    u32             sin6_scope_id; // Not confirmed`
`};`

[Category:Services](Category:Services "wikilink")
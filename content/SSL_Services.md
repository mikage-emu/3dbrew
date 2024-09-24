# SSL service "ssl:C"

| Command Header | Available since system-version | Available from service-sessions | Description                                                                                                                                                      |
|----------------|--------------------------------|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010002     | [1.0.0-0](1.0.0-0 "wikilink")  | Basically main-only             | [Initialize](SSLC:Initialize "wikilink")                                                                                                                         |
| 0x000200C2     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [CreateContext](SSLC:CreateContext "wikilink")                                                                                                                   |
| 0x00030000     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [CreateRootCertChain](SSLC:CreateRootCertChain "wikilink")                                                                                                       |
| 0x00040040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [DestroyRootCertChain](SSLC:DestroyRootCertChain "wikilink")                                                                                                     |
| 0x00050082     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [AddTrustedRootCA](SSLC:AddTrustedRootCA "wikilink")                                                                                                             |
| 0x00060080     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [RootCertChainAddDefaultCert](SSLC:RootCertChainAddDefaultCert "wikilink")                                                                                       |
| 0x00070080     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [RootCertChainRemoveCert](SSLC:RootCertChainRemoveCert "wikilink")                                                                                               |
| 0x00080000     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | CreateCrlStore. This writes an output u32 to cmdreply\[2\](created context handle).                                                                              |
| 0x00090040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | DestroyCrlStore(u32 contexthandle)                                                                                                                               |
| 0x000A0082     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | AddCrlToCrlStore(u32 contexthandle, u32 size, ((Size\<\<4) \| 10), inbufptr)                                                                                     |
| 0x000B0080     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | AddInternalCrlToCrlStore(u32 contexthandle, u8 inval2)                                                                                                           |
| 0x000C0080     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | RemoveCrlFromCrlStore(u32 contexthandle, u32 certcontexthandle) This removes the specified cert from the context.                                                |
| 0x000D0084     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [OpenClientCertContext](SSLC:OpenClientCertContext "wikilink")                                                                                                   |
| 0x000E0040     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [OpenDefaultClientCertContext](SSLC:OpenDefaultClientCertContext "wikilink")                                                                                     |
| 0x000F0040     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [CloseClientCertContext](SSLC:CloseClientCertContext "wikilink")                                                                                                 |
| 0x00100000     | [1.0.0-0](1.0.0-0 "wikilink")  | All                             | [SeedRNG](SSLC:SeedRNG "wikilink")                                                                                                                               |
| 0x00110042     | [1.0.0-0](1.0.0-0 "wikilink")  | All                             | [GenerateRandomData](SSLC:GenerateRandomData "wikilink")                                                                                                         |
| 0x00120042     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink")                                                                                       |
| 0x00130040     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [StartConnection](SSLC:StartConnection "wikilink")                                                                                                               |
| 0x00140040     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [StartConnectionGetOut](SSLC:StartConnectionGetOut "wikilink")                                                                                                   |
| 0x00150082     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [Read](SSLC:Read "wikilink")                                                                                                                                     |
| 0x00160082     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [ReadPeek](SSLC:ReadPeek "wikilink")                                                                                                                             |
| 0x00170082     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [Write](SSLC:Write "wikilink")                                                                                                                                   |
| 0x00180080     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [ContextSetRootCertChain](SSLC:ContextSetRootCertChain "wikilink")                                                                                               |
| 0x00190080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [ContextSetClientCert](SSLC:ContextSetClientCert "wikilink")                                                                                                     |
| 0x001A0080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | SetCrlStore(u32 [contexthandle](SSLC:CreateContext "wikilink"), u32 handle) This writes a context handle created by command 0x00080000 into the session context. |
| 0x001B0080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [ContextClearOpt](SSLC:ContextClearOpt "wikilink")                                                                                                               |
| 0x001C00C4     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [ContextGetProtocolCipher](SSLC:ContextGetProtocolCipher "wikilink")                                                                                             |
| 0x001D0040     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | GetCertVerificationErrors(u32 [contexthandle](SSLC:CreateContext "wikilink")) Writes an output u32 from the context state to cmdreply\[2\].                      |
| 0x001E0040     | [1.0.0-0](1.0.0-0 "wikilink")  | All                             | [DestroyContext](SSLC:DestroyContext "wikilink")                                                                                                                 |
| 0x001F0082     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [ContextInitSharedmem](SSLC:ContextInitSharedmem "wikilink")                                                                                                     |
| 0x00200082     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | AddEVPolicyID([contexthandle](SSLC:CreateContext "wikilink"), u32 size, ((Size\<\<4) \| 10), inbufptr) The input buffer is handled as a string.                  |

Going by strings in the SSL sysmodule it appears the sysmodule uses RSA
BSAFE(like certain other 3DS software), this is also likely where the
"ssl:C" name comes from(RSA BSAFE "SSL-C").

Similar to HTTPC, each SSL [context](SSLC:CreateContext "wikilink") is
used with a dedicated service session which gets opened after creating
that context. Following creating the context + opening the service
session,
[SSLC:InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink")
is used from that service session for that context. Afterwards, all
commands which require a handle for this context are done with this
dedicated service session.

Internally there's a separate object vtable used with the above SSLC
commands, for the main session(where
[SSLC:InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink")
wasn't used), and context sessions where
[SSLC:InitializeConnectionSession](SSLC:InitializeConnectionSession "wikilink")
was used. Error 0xD960BBF4 will be returned if a command was used with
the wrong session type.

Like some other commands, 0x001F0082 and 0x00200082 are not used by
HTTP-sysmodule.

Among commands 0x00180080..0x001B0080 none of them are completely
mandatory. However, with the default settings at bare minimum a
RootCertChain needs selected otherwise an untrusted-RootCA error will
trigger eventually.

It's unknown whether TLS server-\>client connections are supported.

The highest supported TLS protocol version is v1.1(this is the version
used by default).

# Commands 0x00080000..0x000C0080

These appear to be basically the same as the RootCertChain
0x00030000..0x00070080 commands, except with a different context. The
equivalent of RootCertChainAddDefaultCert in this set(0x000B0080) is not
usable however.

It's unknown what this context is actually used for. Trying to use this
seems to have no affect on the TLS connection at all, it seems like the
cert isn't even parsed.

# Cert verification

The server TLS cert not-before/not-after timestamps are not validated
using the system-date which can be set via [System
Settings](System_Settings "wikilink")(it's possible these timestamps are
not validated at all).

# SSLOpt

| Flag (BIT) | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0x000 (??) | Don't verify certificate at all                                     |
| 0x001 (00) | Verify Common Name (CN)                                             |
| 0x002 (01) | Verify RootCA                                                       |
| 0x004 (02) | Verify date                                                         |
| 0x008 (03) | Verify cert chain                                                   |
| 0x010 (04) | Verify "subject alt name" (required for multi-address certificates) |
| 0x020 (05) | Verify cert EV                                                      |
| 0x200 (09) | Makes certification validation always succeed                       |
| 0x800 (11) | Disable use of TLSv1.1 (hence fallback to TLSv1.0)                  |

This is the options field initialized during
[SSLC:CreateContext](SSLC:CreateContext "wikilink"), and cleared via
[SSLC:ContextClearOpt](SSLC:ContextClearOpt "wikilink"). When the
context is initially created, the options field initially has bitmask
0x1B set(besides the additional bits specified via
[SSLC:CreateContext](SSLC:CreateContext "wikilink")).

# Error codes

| Error code | Description                                                                               |
|------------|-------------------------------------------------------------------------------------------|
| 0xD8A0B801 | Generic error, it means "this is not an SSL connection"                                   |
| 0xD840B802 | EWOULDBLOCK while trying to read                                                          |
| 0xD840B803 | EWOULDBLOCK while trying to write                                                         |
| 0xD840B807 | EWOULDBLOCK while calling sslcStartConnection()                                           |
| 0xD8A0B805 | Syscall error, usually means there's no more data to be read because connection is closed |
| 0xD8A0B806 | End-of-stream reached, there is no more data to be read                                   |
| 0xD8A0B814 | Server cert verification failed since the RootCA isn't trusted.                           |
| 0xD8A0B836 | The specified RootCertChain handle was not found in the linked-list.                      |

[Category:Services](Category:Services "wikilink")
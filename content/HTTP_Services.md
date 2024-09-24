+++
title = 'HTTP Services'
categories = ["Services"]
+++

# HTTP service "<http:C>"

| Command Header | Available since system-version | Available from service-sessions | Description                                                                                                |
|----------------|--------------------------------|---------------------------------|------------------------------------------------------------------------------------------------------------|
| 0x00010044     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [Initialize](HTTPC:Initialize "wikilink")                                                                  |
| 0x00020082     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [CreateContext](HTTPC:CreateContext "wikilink")                                                            |
| 0x00030040     | [1.0.0-0](1.0.0-0 "wikilink")  | All                             | [CloseContext](HTTPC:CloseContext "wikilink")                                                              |
| 0x00040040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [CancelConnection](HTTPC:CancelConnection "wikilink")                                                      |
| 0x00050040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetRequestState](HTTPC:GetRequestState "wikilink")                                                        |
| 0x00060040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetDownloadSizeState](HTTPC:GetDownloadSizeState "wikilink")                                              |
| 0x00070040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetRequestError](HTTPC:GetRequestError "wikilink")                                                        |
| 0x00080042     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [InitializeConnectionSession](HTTPC:InitializeConnectionSession "wikilink")                                |
| 0x00090040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [BeginRequest](HTTPC:BeginRequest "wikilink")                                                              |
| 0x000A0040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [BeginRequestAsync](HTTPC:BeginRequestAsync "wikilink")                                                    |
| 0x000B0082     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [ReceiveData](HTTPC:ReceiveData "wikilink")                                                                |
| 0x000C0102     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [ReceiveDataTimeout](HTTPC:ReceiveDataTimeout "wikilink")                                                  |
| 0x000D0146     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [SetProxy](HTTPC:SetProxy "wikilink")                                                                      |
| 0x000E0040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [SetProxyDefault](HTTPC:SetProxyDefault "wikilink")                                                        |
| 0x000F00C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [SetBasicAuthorization](HTTPC:SetBasicAuthorization "wikilink")                                            |
| 0x00100080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [SetSocketBufferSize](HTTPC:SetSocketBufferSize "wikilink")                                                |
| 0x001100C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [AddRequestHeader](HTTPC:AddRequestHeader "wikilink")                                                      |
| 0x001200C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [AddPostDataAscii](HTTPC:AddPostDataAscii "wikilink")                                                      |
| 0x001300C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [AddPostDataBinary](HTTPC:AddPostDataBinary "wikilink")                                                    |
| 0x00140082     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [AddPostDataRaw](HTTPC:AddPostDataRaw "wikilink")                                                          |
| 0x00150080     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SetPostDataType(u8 enum)                                                                                   |
| 0x001600C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SendPostDataAscii                                                                                          |
| 0x00170144     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SendPostDataAsciiTimeout                                                                                   |
| 0x001800C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SendPostDataBinary                                                                                         |
| 0x00190144     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SendPostDataBinaryTimeout                                                                                  |
| 0x001A0082     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SendPostDataRaw                                                                                            |
| 0x001B0102     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [SendPOSTDataRawTimeout](HTTPC:SendPOSTDataTimeout "wikilink")                                             |
| 0x001C0080     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | SetPostDataEncoding                                                                                        |
| 0x001D0040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [NotifyFinishSendPostData](HTTPC:NotifyFinishSendPostData "wikilink")                                      |
| 0x001E00C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetResponseHeader](HTTPC:GetResponseHeader "wikilink")                                                    |
| 0x001F0144     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetResponseHeaderTimeout](HTTPC:GetResponseHeaderTimeout "wikilink")                                      |
| 0x00200082     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetResponseData](HTTPC:GetResponseData "wikilink")                                                        |
| 0x00210102     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | GetResponseDataTimeout                                                                                     |
| 0x00220040     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetResponseStatusCode](HTTPC:GetResponseStatusCode "wikilink")                                            |
| 0x002300C0     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [GetResponseStatusCodeTimeout](HTTPC:GetResponseStatusCodeTimeout "wikilink")                              |
| 0x00240082     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [AddTrustedRootCA](HTTPC:AddTrustedRootCA "wikilink")                                                      |
| 0x00250080     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [AddDefaultCert](HTTPC:AddDefaultCert "wikilink")                                                          |
| 0x00260080     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [SelectRootCertChain](HTTPC:SelectRootCertChain "wikilink")                                                |
| 0x002700C4     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | [SetClientCert](HTTPC:SetClientCert "wikilink")                                                            |
| 0x00280080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [SetClientCertDefault](HTTPC:SetClientCertDefault "wikilink")                                              |
| 0x00290080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [SetClientCertContext](HTTPC:SetClientCertContext "wikilink")                                              |
| 0x002A0040     | [1.0.0-0](1.0.0-0 "wikilink")  | All                             | (u32 contexthandle) GetSSLError? This loads a value from state, this doesn't seem to use any sslc command. |
| 0x002B0080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [SetSSLOpt](HTTPC:SetSSLOpt "wikilink")                                                                    |
| 0x002C0080     | [1.0.0-0](1.0.0-0 "wikilink")  | Context-only                    | [SetSSLClearOpt](HTTPC:SetSSLClearOpt "wikilink")                                                          |
| 0x002D0000     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [CreateRootCertChain](HTTPC:CreateRootCertChain "wikilink")                                                |
| 0x002E0040     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [DestroyRootCertChain](HTTPC:DestroyRootCertChain "wikilink")                                              |
| 0x002F0082     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [RootCertChainAddCert](HTTPC:RootCertChainAddCert "wikilink")                                              |
| 0x00300080     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [RootCertChainAddDefaultCert](HTTPC:RootCertChainAddDefaultCert "wikilink")                                |
| 0x00310080     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [RootCertChainRemoveCert](HTTPC:RootCertChainRemoveCert "wikilink")                                        |
| 0x00320084     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [OpenClientCertContext](HTTPC:OpenClientCertContext "wikilink")                                            |
| 0x00330040     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [OpenDefaultClientCertContext](HTTPC:OpenDefaultClientCertContext "wikilink")                              |
| 0x00340040     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | [CloseClientCertContext](HTTPC:CloseClientCertContext "wikilink")                                          |
| 0x00350186     | [1.0.0-0](1.0.0-0 "wikilink")  | Main-only                       | SetDefaultProxy                                                                                            |
| 0x00360000     | [1.0.0-0](1.0.0-0 "wikilink")  |                                 | ClearDNSCache                                                                                              |
| 0x00370080     | [2.0.0-X](2.0.0-2 "wikilink")  |                                 | SetKeepAlive (bool)                                                                                        |
| 0x003800C0     | [3.0.0-X](3.0.0-5 "wikilink"). |                                 | SetPostDataTypeSize (u8 enum, u32 size) (similar to SetPostDataType)                                       |
| 0x00390000     | [3.0.0-X](3.0.0-5 "wikilink"). |                                 | Finalize                                                                                                   |
| 0x003A0080     | [8.0.0-X](8.0.0-18 "wikilink") |                                 | SetKeepAlive?                                                                                              |
| 0x003B0082     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | SetCrl                                                                                                     |
| 0x003C0080     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | SetInternalCrl                                                                                             |
| 0x003D0080     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | SetCrlStore                                                                                                |
| 0x003E0000     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | CreateCrlStore                                                                                             |
| 0x003F0040     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | DestroyCrlStore                                                                                            |
| 0x00400082     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | AddCrlToCrlStore                                                                                           |
| 0x00410080     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | AddInternalCrl                                                                                             |
| 0x00420040     | [9.0.0-X](9.0.0-20 "wikilink") |                                 | RemoveCrlFromCrlStore                                                                                      |

# TLS Root CAs

Initially a HTTP context will not trust *any* root-CAs at all. Which
root-CAs to trust must be *explicitly* specified via the add-root-CA
service command(s).

RootCertChains can be used to easily select a particular chain of
trusted root-CAs with multiple HTTP contexts, without having to re-send
each of the root-CA commands for each HTTP context. The maximum number
of RootCertChains that can exist for an user-process, is only 2.

When using the context-specific RootCA commands such as
[HTTPC:AddTrustedRootCA](HTTPC:AddTrustedRootCA "wikilink") where
[HTTPC:SelectRootCertChain](HTTPC:SelectRootCertChain "wikilink") was
already used, the cert will just be added to the selected RootCertChain.

# ClientCert Contexts

These are basically the same as RootCertChains except for TLS client
cert+privk. The maximum number of ClientCert-contexts that can exist for
an user-process, is only 2.

# Error codes

| Error code | Description                                                                                                                                                                                                                                                                           |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0xd8a0a03c | Failed to verify the HTTPS server's TLS certificate.                                                                                                                                                                                                                                  |
| 0xd8a0a046 | This is returned by [HTTPC:Initialize](HTTPC:Initialize "wikilink") when no network connection is available(or at least when wifi is disabled via Home Menu on New3DS). Seems to be caused by DNS lookup failure([SOCU:getaddrinfo](SOCU:getaddrinfo "wikilink") returning an error). |
| 0xd8a0a049 | Seems to be caused by a socket connect() timeout error?                                                                                                                                                                                                                               |
| 0xd8a0a066 | This indicates that the context handle is wrong.                                                                                                                                                                                                                                      |
| 0xd820a069 | This is returned when the call times out (with any call with a timeout arg)                                                                                                                                                                                                           |

[Category:Services](Category:Services "wikilink")

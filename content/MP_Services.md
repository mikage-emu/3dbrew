+++
title = 'MP Services'
categories = ["Services"]
+++

This is used for 3DS\<\>DS(i) local-WLAN communications, via the
DS\<\>DS wifi protocol.

See also [here](MP_Registers "wikilink").

# MP service "mp:u"

| Command Header | Available since system-version | Description                                                |
|----------------|--------------------------------|------------------------------------------------------------|
| 0x00010040     |                                | [GetHandle](MP:GetHandle "wikilink")                       |
| 0x00020000     |                                | [Initialize](MP:Initialize "wikilink")                     |
| 0x00030000     |                                | [Shutdown](MP:Shutdown "wikilink")                         |
| 0x000400C0     |                                | [Bind](MP:Bind "wikilink")                                 |
| 0x00050042     |                                | [SetBeaconData](MP:SetBeaconData "wikilink")               |
| 0x00060000     |                                | Used prior to [MP:Shutdown](MP:Shutdown "wikilink").       |
| 0x00070042     |                                | [SetAppData](MP:SetAppData "wikilink")                     |
| 0x00080040     |                                | (s8 unk) Writes the input value into state as an u16, etc. |
| 0x00090040     |                                | (u16 unk) ?                                                |
| 0x000A0000     |                                | Unknown. Writes the output u16 to cmdreply\[2\].           |
| 0x000B0000     |                                | Unknown. Writes the output u32 to cmdreply\[2\].           |
| 0x000C0000     |                                | Unknown. Writes the output u32 to cmdreply\[2\].           |
| 0x000D00C2     |                                | ?                                                          |
| 0x000E0084     |                                | ?                                                          |
| 0x000F00C2     |                                | ?                                                          |
| 0x00100000     |                                | ?                                                          |
| 0x00110080     |                                | [RecvDataFrame](MP:RecvDataFrame "wikilink")               |
| 0x00120082     |                                | ?                                                          |
| 0x00130040     |                                | (u32 unk) ?                                                |
| 0x001400C2     |                                | [SendDataFrame](MP:SendDataFrame "wikilink")               |

# nodeID

This is an u32 value where the intended range is \<16. It's unknown
whether this is for nodes or some sessionID.

[Category:Services](Category:Services "wikilink")

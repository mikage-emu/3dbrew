+++
title = 'IR Services'
categories = ["Services"]
+++

\_\_TOC\_\_

# IR Service "ir:u"

| Command Header | Available since system version | Description |
|----|----|----|
| 0x00010000 | [1.0.0-0](1.0.0-0 "wikilink") | [Initialize](IRU:Initialize "wikilink") |
| 0x00020000 | [1.0.0-0](1.0.0-0 "wikilink") | [Shutdown](IRU:Shutdown "wikilink") |
| 0x00030042 | [1.0.0-0](1.0.0-0 "wikilink") | [StartSendTransfer](IRU:StartSendTransfer "wikilink") |
| 0x00040000 | [1.0.0-0](1.0.0-0 "wikilink") | [WaitSendTransfer](IRU:WaitSendTransfer "wikilink") |
| 0x000500C2 | [1.0.0-0](1.0.0-0 "wikilink") | [StartRecvTransfer](IRU:StartRecvTransfer "wikilink") |
| 0x00060000 | [1.0.0-0](1.0.0-0 "wikilink") | [WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink") |
| 0x00070000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetRecvTransferCount](IRU:GetRecvTransferCount "wikilink") |
| 0x00080000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetSendState](IRU:GetSendState "wikilink") |
| 0x00090040 | [1.0.0-0](1.0.0-0 "wikilink") | [SetBitRate](IRU:SetBitRate "wikilink") |
| 0x000A0000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetBitRate](IRU:GetBitRate "wikilink") |
| 0x000B0040 | [1.0.0-0](1.0.0-0 "wikilink") | [SetIRLEDState](IRU:SetIRLEDState "wikilink") |
| 0x000C0000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetIRLEDRecvState](IRU:GetIRLEDRecvState "wikilink") |
| 0x000D0000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetSendFinishedEvent](IRU:GetSendFinishedEvent "wikilink") |
| 0x000E0000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetRecvFinishedEvent](IRU:GetRecvFinishedEvent "wikilink") |
| 0x000F0000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetTransferState](IRU:GetTransferState "wikilink") |
| 0x00100000 | [1.0.0-0](1.0.0-0 "wikilink") | [GetErrorStatus](IRU::GetErrorStatus "wikilink") |
| 0x00110040 | [1.0.0-0](1.0.0-0 "wikilink") | [SetSleepModeActive](IRU:SetSleepModeActive "wikilink") |
| 0x00120040 | [1.0.0-0](1.0.0-0 "wikilink") | [SetSleepModeState](IRU:SetSleepModeState "wikilink") |

# IR Service "ir:USER"

| Command Header | Available since system version | Description |
|----|----|----|
| 0x00010182 | [2.0.0-2](2.0.0-2 "wikilink") | [InitializeIrnop](IRUSER:InitializeIrnop "wikilink") |
| 0x00020000 | [2.0.0-2](2.0.0-2 "wikilink") | FinalizeIrnop |
| 0x00030000 | [2.0.0-2](2.0.0-2 "wikilink") | ClearReceiveBuffer |
| 0x00040000 | [2.0.0-2](2.0.0-2 "wikilink") | ClearSendBuffer |
| 0x000500C0 | [2.0.0-2](2.0.0-2 "wikilink") | WaitConnection |
| 0x00060040 | [2.0.0-2](2.0.0-2 "wikilink") | RequireConnection (u8 input) |
| 0x000702C0 | [2.0.0-2](2.0.0-2 "wikilink") | AutoConnection |
| 0x00080000 | [2.0.0-2](2.0.0-2 "wikilink") | AnyConnection |
| 0x00090000 | [2.0.0-2](2.0.0-2 "wikilink") | Disconnect |
| 0x000A0000 | [2.0.0-2](2.0.0-2 "wikilink") | GetReceiveEvent (writes event handle to cmdreply\[3\]) |
| 0x000B0000 | [2.0.0-2](2.0.0-2 "wikilink") | GetSendEvent (writes event handle to cmdreply\[3\]) |
| 0x000C0000 | [2.0.0-2](2.0.0-2 "wikilink") | GetConnectionStatusEvent (writes event handle to cmdreply\[3\]) |
| 0x000D0042 | [2.0.0-2](2.0.0-2 "wikilink") | SendIrnop (u32 size, ((Size\<\<14) \| 2), inbufptr) |
| 0x000E0042 | [2.0.0-2](2.0.0-2 "wikilink") | SendIrnopLarge (u32 size, ((Size\<\<8) \| 10), inbufptr) |
| 0x000F0040 | [2.0.0-2](2.0.0-2 "wikilink") | ReceiveIrnop |
| 0x00100042 | [2.0.0-2](2.0.0-2 "wikilink") | ReceiveIrnopLarge |
| 0x0011.... | [2.0.0-2](2.0.0-2 "wikilink") | GetLatestReceiveErrorResult |
| 0x0012.... | [2.0.0-2](2.0.0-2 "wikilink") | GetLatestSendErrorResult |
| 0x0013.... | [2.0.0-2](2.0.0-2 "wikilink") | GetConnectionStatus |
| 0x0014.... | [2.0.0-2](2.0.0-2 "wikilink") | GetTryingToConnectStatus |
| 0x0015.... | [2.0.0-2](2.0.0-2 "wikilink") | GetReceiveSizeFreeAndUsed |
| 0x0016.... | [2.0.0-2](2.0.0-2 "wikilink") | GetSendSizeFreeAndUsed |
| 0x0017.... | [2.2.0-X](2.2.0-X "wikilink") | GetConnectionRole |
| 0x00180182 | [2.2.0-X](2.2.0-X "wikilink") | [InitializeIrnopShared](IRUSER:InitializeIrnopShared "wikilink") |
| 0x00190040 | [2.2.0-X](2.2.0-X "wikilink") | ReleaseReceivedData (32bit_value input) |
| 0x001A0040 | [2.2.0-X](2.2.0-X "wikilink") | SetOwnMachineId (u8 input) |

This service was added with [2.0.0-2](2.0.0-2 "wikilink").

When sending data, SendIrnop is used when the size is \<=0xFC, otherwise SendIrnopLarge is used.

# IR Service "ir:rst"

| Command Header | Available since system-version | Description |
|----|----|----|
| 0x00010000 | [8.0.0-18](8.0.0-18 "wikilink") | [GetHandles](IRRST:GetHandles "wikilink") |
| 0x00020080 | [8.0.0-18](8.0.0-18 "wikilink") | [Initialize](IRRST:Initialize "wikilink") |
| 0x00030000 | [8.0.0-18](8.0.0-18 "wikilink") | [Shutdown](IRRST:Shutdown "wikilink") |
| 0x00040000 | [8.0.0-18](8.0.0-18 "wikilink") | This writes an unknown u8 to index-word cmdreply\[2\], from data loaded from an I2C device register. |
| 0x00050000 | [8.0.0-18](8.0.0-18 "wikilink") | This writes an unknown u8 from IR-module state to index-word cmdreply\[2\]. |
| 0x00060000 | [8.0.0-18](8.0.0-18 "wikilink") | This writes two unknown u8 fields from IR-module state to index-word cmdreply\[2\] and cmdreply\[3\]. |
| 0x00070080 | [9.0.0-20](9.0.0-20 "wikilink") | (u8 unk0, u8 unk1) This is used for calibrating the C-stick on the N3DS EXTHID. |
| 0x00080000 | [9.0.0-20](9.0.0-20 "wikilink") | (u8 unk0, u8 unk1) ? |
| 0x00090000 | [9.0.0-20](9.0.0-20 "wikilink") | This writes two unknown u8 fields to index-word cmdreply\[2\] and cmdreply\[3\]. |

This service was added with [8.0.0-18](8.0.0-18 "wikilink"). Unlike the other IR services, this uses [I2C](I2C "wikilink") deviceid 17(this deviceid isn't actually handled by the [8.0.0-18](8.0.0-18 "wikilink") I2C module). This is for the additional [New 3DS](New_3DS "wikilink") HID hardware, this HID data is stored in [shared-memory](IRRST_Shared_Memory "wikilink"). Even with [9.0.0-20](9.0.0-20 "wikilink") IR module still registers+handles this service on both Old3DS+New3DS.

# IR Services

Only one session(two sessions starting with [8.0.0-18](8.0.0-18 "wikilink")) to any of these services can be open at a time, thus only one/two process(es) can use any of these services at once. These services interface with hardware services gpio::IR and i2c::IR. The i2c::IR service is used for sending/receiving data.

IRU is for regular IR comms. IRUSER uses a custom IR protocol(above the physical layer). Both of these services use IrDA-SIR. The IR hardware seems to only support IrDA-SIR, other physical protocols such as the one for TV-remotes are not supported(going by the datasheet linked [here](Hardware "wikilink") for a different IC at least).

The protocol used with IRUSER involves encryption(?) implemented in software. IRUSER is used for the [Circle Pad Pro](Circle_Pad_Pro "wikilink"). This same IRUSER service uses the New3DS HID hardware when running on New3DS. Note that the main service for New3DS HID is ir:rst, and these two service are mutually exclusive: when one is initialized and reading data from New3DS HID, the other cannot access it.

[Category:Services](Category:Services "wikilink")

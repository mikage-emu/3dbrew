# GSP service "gsp::Gpu"

| Command Header | Available since system version  | GSP rights required | Description                                                                      |
|----------------|---------------------------------|---------------------|----------------------------------------------------------------------------------|
| 0x00010082     |                                 | Yes                 | [WriteHWRegs](GSPGPU:WriteHWRegs "wikilink")                                     |
| 0x00020084     |                                 | Yes                 | [WriteHWRegsWithMask](GSPGPU:WriteHWRegsWithMask "wikilink")                     |
| 0x00030082     |                                 | Yes                 | [WriteHWRegRepeat](GSPGPU:WriteHWRegRepeat "wikilink")                           |
| 0x00040080     |                                 | Yes                 | [ReadHWRegs](GSPGPU:ReadHWRegs "wikilink")                                       |
| 0x00050200     |                                 | Yes                 | [SetBufferSwap](GSPGPU:SetBufferSwap "wikilink")                                 |
| 0x00060082     |                                 | No                  | SetCommandList (Stubbed)                                                         |
| 0x000700C2     |                                 | No                  | RequestDma (Stubbed)                                                             |
| 0x00080082     |                                 | No                  | [FlushDataCache](GSPGPU:FlushDataCache "wikilink")                               |
| 0x00090082     |                                 | No                  | [InvalidateDataCache](GSPGPU:InvalidateDataCache "wikilink")                     |
| 0x000A0044     |                                 | No                  | RegisterInterruptEvents (Stubbed)                                                |
| 0x000B0040     |                                 | See below           | [SetLcdForceBlack](GSPGPU:SetLcdForceBlack "wikilink")                           |
| 0x000C0000     |                                 | No                  | [TriggerCmdReqQueue](GSPGPU:TriggerCmdReqQueue "wikilink")                       |
| 0x000D0140     |                                 | No                  | SetDisplayTransfer (Stubbed)                                                     |
| 0x000E0180     |                                 | No                  | SetTextureCopy (Stubbed)                                                         |
| 0x000F0200     |                                 | No                  | SetMemoryFill (Stubbed)                                                          |
| 0x00100040     |                                 | No                  | [SetAxiConfigQoSMode](GSPGPU:SetAxiConfigQoSMode "wikilink")                     |
| 0x00110040     |                                 | No                  | [SetPerfLogMode](GSPGPU:SetPerfLogMode "wikilink")                               |
| 0x00120000     |                                 | No                  | [GetPerfLog](GSPGPU:GetPerfLog "wikilink")                                       |
| 0x00130042     |                                 | No                  | [RegisterInterruptRelayQueue](GSPGPU:RegisterInterruptRelayQueue "wikilink")     |
| 0x00140000     |                                 | No                  | [UnregisterInterruptRelayQueue](GSPGPU:UnregisterInterruptRelayQueue "wikilink") |
| 0x00150002     |                                 | No                  | [TryAcquireRight](GSPGPU:TryAcquireRight "wikilink")                             |
| 0x00160042     |                                 | No                  | [AcquireRight](GSPGPU:AcquireRight "wikilink")                                   |
| 0x00170000     |                                 | No                  | [ReleaseRight](GSPGPU:ReleaseRight "wikilink")                                   |
| 0x00180000     |                                 | No                  | [ImportDisplayCaptureInfo](GSPGPU:ImportDisplayCaptureInfo "wikilink")           |
| 0x00190000     |                                 | See below           | [SaveVramSysArea](GSPGPU:SaveVramSysArea "wikilink")                             |
| 0x001A0000     |                                 | See below           | [RestoreVramSysArea](GSPGPU:RestoreVramSysArea "wikilink")                       |
| 0x001B0000     |                                 | Yes                 | [ResetGpuCore](GSPGPU:ResetGpuCore "wikilink")                                   |
| 0x001C0040     |                                 | No                  | [SetLedForceOff](GSPGPU:SetLedForceOff "wikilink")                               |
| 0x001D0040     |                                 | No                  | SetTestCommand (Stubbed)                                                         |
| 0x001E0080     |                                 | No                  | [SetInternalPriorities](GSPGPU:SetInternalPriorities "wikilink")                 |
| 0x001F0082     | [8.0.0-18](8.0.0-18 "wikilink") | No                  | [StoreDataCache](GSPGPU:StoreDataCache "wikilink")                               |

The GSP module starts a thread for handling commands for each service
session, a maximum of 4 processes can use this service at once. Official
applications have an optional code-path which
[writes](GSPGPU:WriteHWRegs "wikilink") to registers during
initialization, this is normally not used however.

If a process has acquired rights, attempting to [set LCDs to
black](GSPGPU:SetLcdForceBlack "wikilink") from another process will
fail. Saving/restoring VRAM requires bit0 of process
[flags](GSPGPU:RegisterInterruptRelayQueue "wikilink") to be set.

# GSP service "gsp::Lcd"

| Command Header | Available since system version  | Description                                                                                                                                                                                                |
|----------------|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010040     |                                 | [EnableABL](GSPLCD:EnableABL "wikilink")                                                                                                                                                                   |
| 0x00020040     |                                 | [DisableABL](GSPLCD:DisableABL "wikilink")                                                                                                                                                                 |
| 0x00030080     |                                 | [SetRSLut](GSPLCD:SetRSLut "wikilink")                                                                                                                                                                     |
| 0x000400C0     |                                 | [SetRSParams](GSPLCD:SetRSParams "wikilink")                                                                                                                                                               |
| 0x00050140     |                                 | [SetABLArea](GSPLCD:SetABLArea "wikilink")                                                                                                                                                                 |
| 0x00060140     |                                 | ?                                                                                                                                                                                                          |
| 0x00070080     |                                 | [SetInertia](GSPLCD:SetInertia "wikilink")                                                                                                                                                                 |
| 0x000800C0     |                                 | [SetDitherMode](GSPLCD:SetDitherMode "wikilink")                                                                                                                                                           |
| 0x00090140     |                                 | [SetDitherParams](GSPLCD:SetDitherParams "wikilink")                                                                                                                                                       |
| 0x000A0080     |                                 | [SetBrightnessRaw](GSPLCD:SetBrightnessRaw "wikilink")                                                                                                                                                     |
| 0x000B0080     |                                 | [SetBrightness](GSPLCD:SetBrightness "wikilink")                                                                                                                                                           |
| 0x000C0040     |                                 | [ReloadConfig](GSPLCD:ReloadConfig "wikilink")                                                                                                                                                             |
| 0x000D0040     |                                 | [RestoreConfig](GSPLCD:RestoreConfig "wikilink")                                                                                                                                                           |
| 0x000E0000     |                                 | [GetPowerState](GSPLCD:GetPowerState "wikilink")                                                                                                                                                           |
| 0x000F0000     |                                 | [PowerOnAllBacklights](GSPLCD:PowerOnAllBacklights "wikilink")                                                                                                                                             |
| 0x00100000     |                                 | [PowerOffAllBacklights](GSPLCD:PowerOffAllBacklights "wikilink")                                                                                                                                           |
| 0x00110040     |                                 | [PowerOnBacklight](GSPLCD:PowerOnBacklight "wikilink")                                                                                                                                                     |
| 0x00120040     |                                 | [PowerOffBacklight](GSPLCD:PowerOffBacklight "wikilink")                                                                                                                                                   |
| 0x00130040     |                                 | [SetLedForceOff](GSPLCD:SetLedForceOff "wikilink")                                                                                                                                                         |
| 0x00140000     | [8.0.0-18](8.0.0-18 "wikilink") | [GetVendor](GSPLCD:GetVendor "wikilink") New3DS-only, stubbed on Old3DS: This only returns an error. Uninitialized data(not set by this command itself) is also written to u8 cmdreply_word\[2\].          |
| 0x00150040     | [8.0.0-18](8.0.0-18 "wikilink") | [GetBrightness](GSPLCD:GetBrightness "wikilink") New3DS-only, stubbed on Old3DS: This only returns an error. Uninitialized data(not set by this command itself) is also written to u32 cmdreply_word\[2\]. |

Unlike gsp::Gpu, GSP module does not start a separate thread for
handling these service commands.

# Version history

| Version                      | Changes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [v8196](8.0.0-18 "wikilink") | Support for the new LINEAR memory region was implemented(for cache commands and vaddr-\>physaddr conversion). Support for the new process-mem 0x1E800000 region(however the GPU can't actually access this memory) was added for vaddr-\>physaddr conversion. Originally GSP module ignored vaddr-\>physaddr conversion errors(like with vaddrs outside of the handled ranges) and just wrote physaddr value0 to the GPU registers, however now GSP module returns an error for that instead(see [here](GSP_Shared_Memory#Command_Buffer_Header "wikilink") regarding errors being written to GSP shared-mem). New services commands were added too, see above. |

# New3DS

There's separate GSP-module titles for Old3DS and New3DS. PTM
CheckNew3DS is only used by the New3DS title, for copying that flag into
a state field. Elsewhere that field is checked for running additional
code only on New3DS, for processing various state / using
[QTM](QTM_Services "wikilink") commands.

[Category:Services](Category:Services "wikilink")
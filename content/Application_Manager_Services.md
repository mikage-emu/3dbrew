+++
title = 'Application Manager Services'
categories = ["Services"]
+++

# Application Manager services "am:sys", "am:u", "am:net"

| Command Header | Description                                                                          |
|----------------|--------------------------------------------------------------------------------------|
| 0x00010040     | [GetNumPrograms](AM:GetNumPrograms "wikilink")                                       |
| 0x00020082     | [GetProgramList](AM:GetProgramList "wikilink")                                       |
| 0x00030084     | [GetProgramInfos](AM:GetProgramInfos "wikilink")                                     |
| 0x000400C0     | [DeleteUserProgram](AM:DeleteUserProgram "wikilink")                                 |
| 0x000500C0     | [GetProductCode](AM:GetProductCode "wikilink")                                       |
| 0x000600C0     | [GetStorageId](AM:GetStorageId "wikilink")                                           |
| 0x00070080     | [DeleteTicket](AM:DeleteTicket "wikilink")                                           |
| 0x00080000     | [GetNumTickets](AM:GetNumTickets "wikilink")                                         |
| 0x00090082     | [GetTicketList](AM:GetTicketList "wikilink")                                         |
| 0x000A0000     | [GetDeviceId](AM:GetDeviceId "wikilink")                                             |
| 0x000B0040     | [GetNumImportTitleContexts](AM:GetNumImportTitleContexts "wikilink")                 |
| 0x000C0082     | [GetImportTitleContextList](AM:GetImportTitleContextList "wikilink")                 |
| 0x000D0084     | [GetImportTitleContexts](AM:GetImportTitleContexts "wikilink")                       |
| 0x000E00C0     | [DeleteImportTitleContext](AM:DeleteImportTitleContext "wikilink")                   |
| 0x000F00C0     | [GetNumImportContentContexts](AM:GetNumImportContentContexts "wikilink")             |
| 0x00100102     | [GetImportContentContextList](AM:GetImportContentContextList "wikilink")             |
| 0x00110104     | [GetImportContentContexts](AM:GetImportContentContexts "wikilink")                   |
| 0x00120102     | [DeleteImportContentContexts](AM:DeleteImportContentContexts "wikilink")             |
| 0x00130040     | [NeedsCleanup](AM:NeedsCleanup "wikilink")                                           |
| 0x00140040     | [DoCleanup](AM:DoCleanup "wikilink")                                                 |
| 0x00150040     | [DeleteAllImportContexts](AM:DeleteAllImportContexts "wikilink")                     |
| 0x00160000     | [DeleteAllTemporaryPrograms](AM:DeleteAllTemporaryPrograms "wikilink")               |
| 0x00170044     | [ImportTwlBackupLegacy](AM:ImportTwlBackupLegacy "wikilink")                         |
| 0x00180080     | [InitializeTitleDatabase](AM:InitializeTitleDatabase "wikilink")                     |
| 0x00190040     | [QueryAvailableTitleDatabase](AM:QueryAvailableTitleDatabase "wikilink")             |
| 0x001A00C0     | [CalcTwlBackupSize](AM:CalcTwlBackupSize "wikilink")                                 |
| 0x001B0144     | [ExportTwlBackup](AM:ExportTwlBackup "wikilink")                                     |
| 0x001C0084     | [ImportTwlBackup](AM:ImportTwlBackup "wikilink")                                     |
| 0x001D0000     | [DeleteAllTwlUserPrograms](AM:DeleteAllTwlUserPrograms "wikilink")                   |
| 0x001E00C8     | [ReadTwlBackupInfo](AM:ReadTwlBackupInfo "wikilink")                                 |
| 0x001F0040     | [DeleteAllExpiredUserPrograms](AM:DeleteAllExpiredUserPrograms "wikilink")           |
| 0x00200000     | [GetTwlArchiveResourceInfo](AM:GetTwlArchiveResourceInfo "wikilink")                 |
| 0x00210042     | [GetPersonalizedTicketInfoList](AM:GetPersonalizedTicketInfoList "wikilink")         |
| 0x00220080     | [DeleteAllImportContextsFiltered](AM:DeleteAllImportContextsFiltered "wikilink")     |
| 0x00230080     | [GetNumImportTitleContextsFiltered](AM:GetNumImportTitleContextsFiltered "wikilink") |
| 0x002400C2     | [GetImportTitleContextListFiltered](AM:GetImportTitleContextListFiltered "wikilink") |
| 0x002500C0     | [CheckContentRights](AM:CheckContentRights "wikilink")                               |
| 0x00260044     | [GetTicketLimitInfos](AM:GetTicketLimitInfos "wikilink")                             |
| 0x00270044     | [GetDemoLaunchInfos](AM:GetDemoLaunchInfos "wikilink")                               |
| 0x00280108     | [ReadTwlBackupInfoEx](AM:ReadTwlBackupInfoEx "wikilink")                             |
| 0x00290082     | [DeleteUserProgramsAtomically](AM:DeleteUserProgramsAtomically "wikilink")           |
| 0x002A00C0     | [GetNumExistingContentInfos](AM:GetNumExistingContentInfos "wikilink")               |
| 0x002B0142     | [ListExistingContentInfos](AM:ListExistingContentInfos "wikilink")                   |
| 0x002C0084     | [GetProgramInfosIgnorePlatform](AM:GetProgramInfosIgnorePlatform "wikilink")         |
| 0x002D00C0     | [CheckContentRightsIgnorePlatform](AM:CheckContentRightsIgnorePlatform "wikilink")   |

# Application Manager services "am:u" and "am:net"

| Command Header | Description                                                                                          |
|----------------|------------------------------------------------------------------------------------------------------|
| 0x04010080     | [UpdateFirmwareTo](AM:UpdateFirmwareTo "wikilink")                                                   |
| 0x04020040     | [BeginImportProgram](AM:BeginImportProgram "wikilink")                                               |
| 0x04030000     | [BeginImportProgramTemporarily](AM:BeginImportProgramTemporarily "wikilink")                         |
| 0x04040002     | [CancelImportProgram](AM:CancelImportProgram "wikilink")                                             |
| 0x04050002     | [EndImportProgram](AM:EndImportProgram "wikilink")                                                   |
| 0x04060002     | [EndImportProgramWithoutCommit](AM:EndImportProgramWithoutCommit "wikilink")                         |
| 0x040700C2     | [CommitImportPrograms](AM:CommitImportPrograms "wikilink")                                           |
| 0x04080042     | [GetProgramInfoFromCia](AM:GetProgramInfoFromCia "wikilink")                                         |
| 0x04090004     | [GetSystemMenuDataFromCia](AM:GetSystemMenuDataFromCia "wikilink")                                   |
| 0x040A0002     | [GetDependencyListFromCia](AM:GetDependencyListFromCia "wikilink")                                   |
| 0x040B0002     | [GetTransferSizeFromCia](AM:GetTransferSizeFromCia "wikilink")                                       |
| 0x040C0002     | [GetCoreVersionFromCia](AM:GetCoreVersionFromCia "wikilink")                                         |
| 0x040D0042     | [GetRequiredSizeFromCia](AM:GetRequiredSizeFromCia "wikilink")                                       |
| 0x040E00C2     | [CommitImportProgramsAndUpdateFirmwareAuto](AM:CommitImportProgramsAndUpdateFirmwareAuto "wikilink") |
| 0x040F0000     | [UpdateFirmwareAuto](AM:UpdateFirmwareAuto "wikilink")                                               |
| 0x041000C0     | [DeleteProgram](AM:DeleteProgram "wikilink")                                                         |
| 0x04110044     | [GetTwlProgramListForReboot](AM:GetTwlProgramListForReboot "wikilink")                               |
| 0x04120000     | [GetSystemUpdaterMutex](AM:GetSystemUpdaterMutex "wikilink")                                         |
| 0x04130002     | [GetMetaSizeFromCia](AM:GetMetaSizeFromCia "wikilink")                                               |
| 0x04140044     | [GetMetaDataFromCia](AM:GetMetaDataFromCia "wikilink")                                               |
| 0x04150080     | [CheckDemoLaunchRights](AM:CheckDemoLaunchRights "wikilink")                                         |
| 0x041600C0     | [GetInternalTitleLocationInfo](AM:GetInternalTitleLocationInfo "wikilink")                           |
| 0x041700C0     | [PerpetuateAgbSaveData](AM:PerpetuateAgbSaveData "wikilink")                                         |
| 0x04180040     | [BeginImportProgramForOverWrite](AM:BeginImportProgramForOverWrite "wikilink")                       |
| 0x04190000     | [BeginImportSystemProgram](AM:BeginImportSystemProgram "wikilink")                                   |

# Application Manager service "am:app"

| Command Header | Description                                                                  |
|----------------|------------------------------------------------------------------------------|
| 0x100100C0     | [GetDLCContentInfoCount](AM:GetDLCContentInfoCount "wikilink")               |
| 0x10020104     | [FindDLCContentInfos](AM:FindDLCContentInfos "wikilink")                     |
| 0x10030142     | [ListDLCContentInfos](AM:ListDLCContentInfos "wikilink")                     |
| 0x10040102     | [DeleteDLCContents](AM:DeleteDLCContents "wikilink")                         |
| 0x10050084     | [GetDLCTitleInfos](AM:GetDLCTitleInfos "wikilink")                           |
| 0x10060080     | [GetDLCOrLicenseNumTickets](AM:GetDLCOrLicenseNumTickets "wikilink")         |
| 0x10070102     | [ListDLCOrLicenseTicketInfos](AM:ListDLCOrLicenseTicketInfos "wikilink")     |
| 0x100801C2     | [GetDLCOrLicenseItemRights](AM:GetDLCOrLicenseItemRights "wikilink")         |
| 0x100900C0     | [IsDLCTitleInUse](AM:IsDLCTitleInUse "wikilink")                             |
| 0x100A0000     | [ReloadSDTitleDatabase](AM:ReloadSDTitleDatabase "wikilink")                 |
| 0x100B00C0     | [GetNumDLCExistingContentInfos](AM:GetNumDLCExistingContentInfos "wikilink") |
| 0x100C0142     | [ListDLCExistingContentInfos](AM:ListDLCExistingContentInfos "wikilink")     |
| 0x100D0084     | [GetPatchTitleInfos](AM:GetPatchTitleInfos "wikilink")                       |

The only commands accessible with this service are listed under this
section.

# Application Manager service "am:sys"

This service only has access to the 0x00XX\* commands listed above, and
the "am:app" commands.

# Application Manager service "am:u"

# Application Manager network service "am:net"

| Command Header | Description                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------|
| 0x08010000     | [BeginImportTicket](AMNet:BeginImportTicket "wikilink")                                             |
| 0x08020002     | [CancelImportTicket](AMNet:CancelImportTicket "wikilink")                                           |
| 0x08030002     | [EndImportTicket](AMNet:EndImportTicket "wikilink")                                                 |
| 0x08040100     | [BeginImportTitle](AMNet:BeginImportTitle "wikilink")                                               |
| 0x08050000     | [StopImportTitle](AMNet:StopImportTitle "wikilink")                                                 |
| 0x080600C0     | [ResumeImportTitle](AMNet:ResumeImportTitle "wikilink")                                             |
| 0x08070000     | [CancelImportTitle](AMNet:CancelImportTitle "wikilink")                                             |
| 0x08080000     | [EndImportTitle](AMNet:EndImportTitle "wikilink")                                                   |
| 0x080900C2     | [CommitImportTitles](AMNet:CommitImportTitles "wikilink")                                           |
| 0x080A0000     | [BeginImportTmd](AMNet:BeginImportTmd "wikilink")                                                   |
| 0x080B0002     | [CancelImportTmd](AMNet:CancelImportTmd "wikilink")                                                 |
| 0x080C0042     | [EndImportTmd](AMNet:EndImportTmd "wikilink")                                                       |
| 0x080D0042     | [CreateImportContentContexts](AMNet:CreateImportContentContexts "wikilink")                         |
| 0x080E0040     | [BeginImportContent](AMNet:BeginImportContent "wikilink")                                           |
| 0x080F0002     | [StopImportContent](AMNet:StopImportContent "wikilink")                                             |
| 0x08100040     | [ResumeImportContent](AMNet:ResumeImportContent "wikilink")                                         |
| 0x08110002     | [CancelImportContent](AMNet:CancelImportContent "wikilink")                                         |
| 0x08120002     | [EndImportContent](AMNet:EndImportContent "wikilink")                                               |
| 0x08130000     | [GetNumCurrentImportContentContexts](AMNet:GetNumCurrentImportContentContexts "wikilink")           |
| 0x08140042     | [GetCurrentImportContentContextList](AMNet:GetCurrentImportContentContextList "wikilink")           |
| 0x08150044     | [GetCurrentImportContentContexts](AMNet:GetCurrentImportContentContexts "wikilink")                 |
| 0x08160146     | [Sign](AMNet:Sign "wikilink")                                                                       |
| 0x08170146     | [Verify](AMNet:Verify "wikilink")                                                                   |
| 0x08180042     | [GetDeviceCert](AMNet:GetDeviceCert "wikilink")                                                     |
| 0x08190108     | [ImportCertificates](AMNet:ImportCertificates "wikilink")                                           |
| 0x081A0042     | [ImportCertificate](AMNet:ImportCertificate "wikilink")                                             |
| 0x081B00C2     | [CommitImportTitlesAndUpdateFirmwareAuto](AMNet:CommitImportTitlesAndUpdateFirmwareAuto "wikilink") |
| 0x081C0100     | [DeleteTicketId](AMNet:DeleteTicketId "wikilink")                                                   |
| 0x081D0080     | [GetNumTicketIds](AMNet:GetNumTicketIds "wikilink")                                                 |
| 0x081E0102     | [GetTicketIdList](AMNet:GetTicketIdList "wikilink")                                                 |
| 0x081F0080     | [GetNumTicketsOfProgram](AMNet:GetNumTicketsOfProgram "wikilink")                                   |
| 0x08200102     | [ListTicketInfos](AMNet:ListTicketInfos "wikilink")                                                 |
| 0x08210142     | [ExportLicenseTicket](AMNet:ExportLicenseTicket "wikilink")                                         |
| 0x08220000     | [GetNumCurrentContentInfos](AMNet:GetNumCurrentContentInfos "wikilink")                             |
| 0x08230044     | [FindCurrentContentInfos](AMNet:FindCurrentContentInfos "wikilink")                                 |
| 0x08240082     | [ListCurrentContentInfos](AMNet:ListCurrentContentInfos "wikilink")                                 |
| 0x08250102     | [CalculateContextRequiredSize](AMNet:CalculateContextRequiredSize "wikilink")                       |
| 0x08260042     | [UpdateImportContentContexts](AMNet:UpdateImportContentContexts "wikilink")                         |
| 0x08270000     | [DeleteAllDemoLaunchInfos](AMNet:DeleteAllDemoLaunchInfos "wikilink")                               |
| 0x082800C0     | [BeginImportTitleForOverWrite](AMNet:BeginImportTitleForOverWrite "wikilink")                       |
| 0x08290184     | [ExportTicketWrapped](AMNet:ExportTicketWrapped "wikilink")                                         |

# File service

| Command Header | Available since system-version | Description                                                                                    |
|----------------|--------------------------------|------------------------------------------------------------------------------------------------|
| 0x0001....     |                                | Stubbed. After validating the translate-paramater headers, this just returns error 0xE0C046F8. |
| 0x040100C4     |                                | [Control](AMFile:Control "wikilink")                                                           |
| 0x08010100     |                                | [OpenSubFile](AMFile:OpenSubFile "wikilink")                                                   |
| 0x080200C2     |                                | [Read](AMFile:Read "wikilink")                                                                 |
| 0x08030102     |                                | [Write](AMFile:Write "wikilink")                                                               |
| 0x08040000     |                                | [GetSize](AMFile:GetSize "wikilink")                                                           |
| 0x08050080     |                                | [SetSize](AMFile:SetSize "wikilink")                                                           |
| 0x08060000     |                                | [GetAttributes](AMFile:GetAttributes "wikilink")                                               |
| 0x08070000     |                                | [SetAttributes](AMFile:SetAttributes "wikilink")                                               |
| 0x08080000     |                                | [Close](AMFile:Close "wikilink")                                                               |
| 0x08090000     |                                | [Flush](AMFile:Flush "wikilink")                                                               |
| 0x080A0000     |                                | This just returns 0.                                                                           |
| 0x080B0000     |                                | This just returns 0.                                                                           |
| 0x080C0000     |                                | This just returns 0.                                                                           |

This is similar to
[FSFile](Filesystem_services#File_service "wikilink").

For handling each command that's actually implemented, the AM cmdhandler
function calls a vtable funcptr.

The private port for this seems to be referred to as "am:pipe", even
though the "am:pipe" string isn't actually used.

# Types

## TicketInfo

| Offset | Length | Description |
|--------|--------|-------------|
| 0x0    | 0x8    | Title ID    |
| 0x8    | 0x8    | Ticket ID   |
| 0x10   | 0x2    | Version     |
| 0x12   | 0x2    | Padding     |
| 0x14   | 0x4    | Size        |

## TitleInfo

| Offset | Length | Description |
|--------|--------|-------------|
| 0x0    | 0x8    | Title ID    |
| 0x8    | 0x8    | Size        |
| 0x10   | 0x2    | Version     |
| 0x12   | 0x2    | Padding     |
| 0x14   | 0x4    | Type        |

## ContentInfo

| Offset | Length | Description                                                                                              |
|--------|--------|----------------------------------------------------------------------------------------------------------|
| 0x0    | 0x2    | Index                                                                                                    |
| 0x2    | 0x2    | [Content Type Flags](Title_metadata#Content_Type_flags "wikilink") from [TMD](Title_metadata "wikilink") |
| 0x4    | 0x4    | Content ID                                                                                               |
| 0x8    | 0x8    | Size                                                                                                     |
| 0x10   | 0x1    | Bit 0: Downloaded, Bit 1: Owned                                                                          |
| 0x11   | 0x7    | Padding                                                                                                  |

## ImportTitleContext

| Offset | Length | Description |
|--------|--------|-------------|
| 0x0    | 0x8    | Title ID    |
| 0x8    | 0x2    | Version     |
| 0xA    | 0x2    | State       |
| 0xC    | 0x4    | Type        |
| 0x10   | 0x8    | Size        |

### ImportTitleContextState

| Value | Description        |
|-------|--------------------|
| 0     | None               |
| 1     | Waiting for import |
| 2     | Resumable          |
| 3     | Waiting for commit |
| 4     | Already exists     |
| 5     | Deleting           |
| 6     | Needs cleanup      |

## ImportContentContext

| Offset | Length | Description            |
|--------|--------|------------------------|
| 0x0    | 0x4    | Content ID             |
| 0x4    | 0x2    | Index                  |
| 0x6    | 0x2    | Type                   |
| 0x8    | 0x8    | Size                   |
| 0x10   | 0x8    | Current Install Offset |

## TwlBackupInfo

| Offset | Length | Description                                                                                                         |
|--------|--------|---------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x8    | Title ID                                                                                                            |
| 0x8    | 0x2    | Group ID                                                                                                            |
| 0xA    | 0x2    | Title Version                                                                                                       |
| 0xC    | 0x4    | public.sav size                                                                                                     |
| 0x10   | 0x4    | private.sav size                                                                                                    |
| 0x14   | 0x4    | Unused, padding.                                                                                                    |
| 0x18   | 0x8    | u64, required space in bytes for installation (aligned to 0x4000, used to show amount of blocks in system settings) |
|        |        |                                                                                                                     |

# Errors

See [this](Application_Manager_Services_PXI "wikilink").

[Category:Services](Category:Services "wikilink")

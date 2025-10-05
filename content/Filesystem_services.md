+++
title = 'Filesystem Services'
categories = ["Services"]
+++

# Services

## Filesystem service "fs:USER"

You can at most have 32 FS archive handles.

| Command Header | Available since system version | Description | Required [exheader](NCCH/Extended_Header "wikilink") access info bitmask |
|----|----|----|----|
| 0x000100C6 | ? | [Dummy1](FS:Dummy1 "wikilink") | None |
| 0x040100C4 | ? | [Control](FS:Control "wikilink") | None |
| 0x08010002 | ? | [Initialize](FS:Initialize "wikilink") | None |
| 0x080201C2 | ? | [OpenFile](FS:OpenFile "wikilink") | None |
| 0x08030204 | ? | [OpenFileDirectly](FS:OpenFileDirectly "wikilink") | None |
| 0x08040142 | ? | [DeleteFile](FS:DeleteFile "wikilink") | None |
| 0x08050244 | ? | [RenameFile](FS:RenameFile "wikilink") | None |
| 0x08060142 | ? | [DeleteDirectory](FS:DeleteDirectory "wikilink") | None |
| 0x08070142 | ? | [DeleteDirectoryRecursively](FS:DeleteDirectoryRecursively "wikilink") | None |
| 0x08080202 | ? | [CreateFile](FS:CreateFile "wikilink") | None |
| 0x08090182 | ? | [CreateDirectory](FS:CreateDirectory "wikilink") | None |
| 0x080A0244 | ? | [RenameDirectory](FS:RenameDirectory "wikilink") | None |
| 0x080B0102 | ? | [OpenDirectory](FS:OpenDirectory "wikilink") | None |
| 0x080C00C2 | ? | [OpenArchive](FS:OpenArchive "wikilink") | Each archive ID code has separate access info bitmasks, if it has any |
| 0x080D0144 | ? | [ControlArchive](FS:ControlArchive "wikilink") | None |
| 0x080E0080 | ? | [CloseArchive](FS:CloseArchive "wikilink") | None |
| 0x080F0180 | ? | [Obsoleted_2_0_FormatThisUserSaveData](FS:Obsoleted_2_0_FormatThisUserSaveData "wikilink") | None |
| 0x08100200 | ? | [Obsoleted_3_0_CreateSystemSaveData](FS:Obsoleted_3_0_CreateSystemSaveData "wikilink") | 0x4, for when the input saveID doesn't match the exheader saveID |
| 0x08110040 | ? | [Obsoleted_3_0_DeleteSystemSaveData](FS:Obsoleted_3_0_DeleteSystemSaveData "wikilink") | 0x1004, for when the input saveID doesn't match the exheader saveID |
| 0x08120080 | ? | [GetFreeBytes](FS:GetFreeBytes "wikilink") | None |
| 0x08130000 | ? | [GetCardType](FS:GetCardType "wikilink") | 0x1017 |
| 0x08140000 | ? | [GetSdmcArchiveResource](FS:GetSdmcArchiveResource "wikilink") | None |
| 0x08150000 | ? | [GetNandArchiveResource](FS:GetNandArchiveResource "wikilink") | 0x1007 |
| 0x08160000 | ? | [GetSdmcFatfsError](FS:GetSdmcFatfsError "wikilink") | 0x2 |
| 0x08170000 | ? | [IsSdmcDetected](FS:IsSdmcDetected "wikilink") | None |
| 0x08180000 | ? | [IsSdmcWritable](FS:IsSdmcWritable "wikilink") | None |
| 0x08190042 | ? | [GetSdmcCid](FS:GetSdmcCid "wikilink") | 0x2 |
| 0x081A0042 | ? | [GetNandCid](FS:GetNandCid "wikilink") | 0x2 |
| 0x081B0000 | ? | [GetSdmcSpeedInfo](FS:GetSdmcSpeedInfo "wikilink") | 0x2 |
| 0x081C0000 | ? | [GetNandSpeedInfo](FS:GetNandSpeedInfo "wikilink") | 0x2 |
| 0x081D0042 | ? | [GetSdmcLog](FS:GetSdmcLog "wikilink") | 0x2 |
| 0x081E0042 | ? | [GetNandLog](FS:GetNandLog "wikilink") | 0x2 |
| 0x081F0000 | ? | [ClearSdmcLog](FS:ClearSdmcLog "wikilink") | 0x2 |
| 0x08200000 | ? | [ClearNandLog](FS:ClearNandLog "wikilink") | 0x2 |
| 0x08210000 | ? | [CardSlotIsInserted](FS:CardSlotIsInserted "wikilink") | 0x1017 |
| 0x08220000 | ? | [CardSlotPowerOn](FS:CardSlotPowerOn "wikilink") | 0x2 |
| 0x08230000 | ? | [CardSlotPowerOff](FS:CardSlotPowerOff "wikilink") | 0x2 |
| 0x08240000 | ? | [CardSlotGetCardIFPowerStatus](FS:CardSlotGetCardIFPowerStatus "wikilink") | 0x2 |
| 0x08250040 | ? | [CardNorDirectCommand](FS:CardNorDirectCommand "wikilink") | 0x2 |
| 0x08260080 | ? | [CardNorDirectCommandWithAddress](FS:CardNorDirectCommandWithAddress "wikilink") | 0x2 |
| 0x08270082 | ? | [CardNorDirectRead](FS:CardNorDirectRead "wikilink") | 0x2 |
| 0x082800C2 | ? | [CardNorDirectReadWithAddress](FS:CardNorDirectReadWithAddress "wikilink") | 0x2 |
| 0x08290082 | ? | [CardNorDirectWrite](FS:CardNorDirectWrite "wikilink") | 0x2 |
| 0x082A00C2 | ? | [CardNorDirectWriteWithAddress](FS:CardNorDirectWriteWithAddress "wikilink") | 0x2 |
| 0x082B00C2 | ? | [CardNorDirectRead_4xIO](FS:CardNorDirectRead_4xIO "wikilink") | 0x2 |
| 0x082C0082 | ? | [CardNorDirectCpuWriteWithoutVerify](FS:CardNorDirectCpuWriteWithoutVerify "wikilink") | 0x2 |
| 0x082D0040 | ? | [CardNorDirectSectorEraseWithoutVerify](FS:CardNorDirectSectorEraseWithoutVerify "wikilink") | 0x2 |
| 0x082E0040 | ? | [GetProductInfo](FS:GetProductInfo "wikilink") | 0x1005 |
| 0x082F0040 | ? | [GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink") | 0x1005 |
| 0x08300182 | ? | [Obsoleted_3_0_CreateExtSaveData](FS:Obsoleted_3_0_CreateExtSaveData "wikilink") | 0xC, for when the input extdataID doesn't match the exheader extdataID |
| 0x08310180 | ? | [Obsoleted_3_0_CreateSharedExtSaveData](FS:Obsoleted_3_0_CreateSharedExtSaveData "wikilink") | 0x1005 |
| 0x08320102 | ? | [Obsoleted_3_0_ReadExtSaveDataIcon](FS:Obsoleted_3_0_ReadExtSaveDataIcon "wikilink") | 0x100D, for when the input extdataID doesn't match the exheader extdataID |
| 0x08330082 | ? | [Obsoleted_3_0_EnumerateExtSaveData](FS:Obsoleted_3_0_EnumerateExtSaveData "wikilink") | 0x1005 |
| 0x08340082 | ? | [Obsoleted_3_0_EnumerateSharedExtSaveData](FS:Obsoleted_3_0_EnumerateSharedExtSaveData "wikilink") | 0x1005 |
| 0x08350080 | ? | [Obsoleted_3_0_DeleteExtSaveData](FS:Obsoleted_3_0_DeleteExtSaveData "wikilink") | 0x100D, for when the input extdataID doesn't match the exheader extdataID |
| 0x08360080 | ? | [Obsoleted_3_0_DeleteSharedExtSaveData](FS:Obsoleted_3_0_DeleteSharedExtSaveData "wikilink") | 0x1005 |
| 0x08370040 | ? | [SetCardSpiBaudRate](FS:SetCardSpiBaudRate "wikilink") | 0x2 |
| 0x08380040 | ? | [SetCardSpiBusMode](FS:SetCardSpiBusMode "wikilink") | 0x2 |
| 0x08390000 | ? | [SendInitializeInfoTo9](FS:SendInitializeInfoTo9 "wikilink") | None |
| 0x083A0100 | ? | [GetSpecialContentIndex](FS:GetSpecialContentIndex "wikilink") | 0x1005 |
| 0x083B00C2 | ? | [GetLegacyRomHeader](FS:GetLegacyRomHeader "wikilink") | 0x1015 |
| 0x083C00C2 | ? | [GetLegacyBannerData](FS:GetLegacyBannerData "wikilink") | 0x1015 |
| 0x083D0100 | ? | [CheckAuthorityToAccessExtSaveData](FS:CheckAuthorityToAccessExtSaveData "wikilink") | 0x44 |
| 0x083E00C2 | ? | [QueryTotalQuotaSize](FS:QueryTotalQuotaSize "wikilink") | None |
| 0x083F00C0 | ? | [Obsoleted_3_0_GetExtDataBlockSize](FS:Obsoleted_3_0_GetExtDataBlockSize "wikilink") | None |
| 0x08400040 | ? | [AbnegateAccessRight](FS:AbnegateAccessRight "wikilink") | ? |
| 0x08410000 | ? | [DeleteSdmcRoot](FS:DeleteSdmcRoot "wikilink") | 0x1005 |
| 0x08420040 | ? | [DeleteAllExtSaveDataOnNand](FS:DeleteAllExtSaveDataOnNand "wikilink") | 0x1005 |
| 0x08430000 | ? | [InitializeCtrFileSystem](FS:InitializeCtrFileSystem "wikilink") | None |
| 0x08440000 | ? | [CreateSeed](FS:CreateSeed "wikilink") | 0x2 |
| 0x084500C2 | ? | [GetFormatInfo](FS:GetFormatInfo "wikilink") | ? |
| 0x08460102 | ? | [GetLegacyRomHeader2](FS:GetLegacyRomHeader2 "wikilink") | 0x1015 |
| 0x08470180 | ? | [Obsoleted_2_0_FormatCtrCardUserSaveData](FS:Obsoleted_2_0_FormatCtrCardUserSaveData "wikilink") | 0x6 |
| 0x08480042 | ? | [GetSdmcCtrRootPath](FS:GetSdmcCtrRootPath "wikilink") | 0x100D |
| 0x08490040 | ? | [GetArchiveResource](FS:GetArchiveResource "wikilink") | ? |
| 0x084A0002 | ? | [ExportIntegrityVerificationSeed](FS:ExportIntegrityVerificationSeed "wikilink") | 0x4000 |
| 0x084B0002 | ? | [ImportIntegrityVerificationSeed](FS:ImportIntegrityVerificationSeed "wikilink") | 0x4000 |
| 0x084C0242 | ? | [FormatSaveData](FS:FormatSaveData "wikilink") | 0x6, in some cases this write isn't needed however |
| 0x084D0102 | ? | [GetLegacySubBannerData](FS:GetLegacySubBannerData "wikilink") | 0x1015 |
| 0x084E0342 | ? | [UpdateSha256Context](FS:UpdateSha256Context "wikilink") | 0x5 |
| 0x084F0102 | ? | [ReadSpecialFile](FS:ReadSpecialFile "wikilink") | None |
| 0x08500040 | ? | [GetSpecialFileSize](FS:GetSpecialFileSize "wikilink") | None |
| 0x08510242 | [3.0.0-5](3.0.0-5 "wikilink") | [CreateExtSaveData](FS:CreateExtSaveData "wikilink") | Shared extdata: 0x101005. Regular extdata in certain cases: 0xC |
| 0x08520100 | [3.0.0-5](3.0.0-5 "wikilink") | [DeleteExtSaveData](FS:DeleteExtSaveData "wikilink") | Shared extdata: 0x101005. Regular extdata in certain cases: 0x10100D |
| 0x08530142 | [3.0.0-5](3.0.0-5 "wikilink") | [ReadExtSaveDataIcon](FS:ReadExtSaveDataIcon "wikilink") | 0x10100D (this doesn't apply in certain cases, however) |
| 0x08540010 | [3.0.0-5](3.0.0-5 "wikilink") | [GetExtDataBlockSize](FS:GetExtDataBlockSize "wikilink") | 0x10100D (this doesn't apply in certain cases, however) |
| 0x08550102 | [3.0.0-5](3.0.0-5 "wikilink") | [EnumerateExtSaveData](FS:EnumerateExtSaveData "wikilink") | 0x101005 |
| 0x08560240 | [3.0.0-5](3.0.0-5 "wikilink") | [CreateSystemSaveData](FS:CreateSystemSaveData "wikilink") | 0x4 (this doesn't apply in certain cases, however) |
| 0x08570080 | [3.0.0-5](3.0.0-5 "wikilink") | [DeleteSystemSaveData](FS:DeleteSystemSaveData "wikilink") | 0x1004 (this doesn't apply in certain cases, however) |
| 0x08580000 | [3.0.0-5](3.0.0-5 "wikilink") | [StartDeviceMoveAsSource](FS:StartDeviceMoveAsSource "wikilink") | 0x2004 |
| 0x08590200 | [3.0.0-5](3.0.0-5 "wikilink") | [StartDeviceMoveAsDestination](FS:StartDeviceMoveAsDestination "wikilink") | 0x2004 |
| 0x085A00C0 | [3.0.0-5](3.0.0-5 "wikilink") | [SetArchivePriority](FS:SetArchivePriority "wikilink") | None |
| 0x085B0080 | [3.0.0-5](3.0.0-5 "wikilink") | [GetArchivePriority](FS:GetArchivePriority "wikilink") | None |
| 0x085C00C0 | [3.0.0-5](3.0.0-5 "wikilink") | [SetCtrCardLatencyParameter](FS:SetCtrCardLatencyParameter "wikilink") | 0xE |
| 0x085D01C0 | [3.0.0-5](3.0.0-5 "wikilink") | [SetFsCompatibilityInfo](FS:SetFsCompatibilityInfo "wikilink") | 0x100001 |
| 0x085E0040 | [3.0.0-5](3.0.0-5 "wikilink") | [ResetCardCompatibilityParameter](FS:ResetCardCompatibilityParameter "wikilink") | 0xE |
| 0x085F0040 | [3.0.0-5](3.0.0-5 "wikilink") | [SwitchCleanupInvalidSaveData](FS:SwitchCleanupInvalidSaveData "wikilink") | 0x12004 |
| 0x08600042 | [3.0.0-5](3.0.0-5 "wikilink") | [EnumerateSystemSaveData](FS:EnumerateSystemSaveData "wikilink") | 0x2004 |
| 0x08610042 | [3.0.0-5](3.0.0-5 "wikilink") | [InitializeWithSdkVersion](FS:InitializeWithSdkVersion "wikilink") | None |
| 0x08620040 | [3.0.0-5](3.0.0-5 "wikilink") | [SetPriority](FS:SetPriority "wikilink") | None |
| 0x08630000 | [3.0.0-5](3.0.0-5 "wikilink") | [GetPriority](FS:GetPriority "wikilink") | None |
| 0x08640000 | [3.0.0-5](3.0.0-5 "wikilink") | [Obsoleted_4_0_GetNandInfo](FS:Obsoleted_4_0_GetNandInfo "wikilink") | Stubbed, this returns an error |
| 0x08650140 | [4.0.0-7](4.0.0-7 "wikilink") | [SetSaveDataSecureValue](FS:SetSaveDataSecureValue "wikilink") | 0x121004 (in certain cases this doesn't apply, however) |
| 0x086600C0 | [4.0.0-7](4.0.0-7 "wikilink") | [GetSaveDataSecureValue](FS:GetSaveDataSecureValue "wikilink") | 0x121004 (in certain cases this doesn't apply, however) |
| 0x086700C4 | [4.0.0-7](4.0.0-7 "wikilink") | [ControlSecureSave](FS:ControlSecureSave "wikilink") | 0x121004 |
| 0x08680000 | [4.0.0-7](4.0.0-7 "wikilink") | [GetMediaType](FS:GetMediaType "wikilink") | None |
| 0x08690000 | [4.0.0-7](4.0.0-7 "wikilink") | [Obsoleted_4_0_GetNandEraseCount](FS:Obsoleted_4_0_GetNandEraseCount "wikilink") | Stubbed, this returns an error. |
| 0x086A0082 | [4.0.0-7](4.0.0-7 "wikilink") | [ReadNandReport](FS:ReadNandReport "wikilink") | None |
| 0x086B00C2 | ? | [SetOtherSaveDataSecureValue](FS:SetOtherSaveDataSecureValue "wikilink") | 0x121004 |
| 0x086C00C2 | ? | [GetOtherSaveDataSecureValue](FS:GetOtherSaveDataSecureValue "wikilink") | 0x121004 |
| 0x086D0080 | ? | [BeginSaveDataMove](FS:BeginSaveDataMove "wikilink") | 0x20004 |
| 0x086E00C0 | ? | [SetThisSaveDataSecureValue](FS:SetThisSaveDataSecureValue "wikilink") | None |
| 0x086F0040 | ? | [GetThisSaveDataSecureValue](FS:GetThisSaveDataSecureValue "wikilink") | None |
| 0x087000C2 | ? | [CheckArchive](FS:CheckArchive "wikilink") | None |
| 0x08710140 | ? | [TransferSaveDataCMAC](FS:TransferSaveDataCMAC "wikilink") | 0x20004 |
| 0x08720200 | ? | [RegisterTitleContentOverlay](FS:RegisterTitleContentOverlay "wikilink") | 0x80004 |
| 0x08730100 | ? | [UnregisterTitleContentOverlay](FS:UnregisterTitleContentOverlay "wikilink") | 0x80004 |
| 0x08740000 | ? | [UnregisterAllTitleContentOverlays](FS:UnregisterAllTitleContentOverlays "wikilink") | 0x80004 |
| 0x08750140 | ? | [SetSaveArchiveSecureValue](FS:SetSaveArchiveSecureValue "wikilink") | None |
| 0x087600C0 | ? | [GetSaveArchiveSecureValue](FS:GetSaveArchiveSecureValue "wikilink") | None |
| 0x08770140 | ? | [RegisterSpecialTitleContent](FS:RegisterSpecialTitleContent "wikilink") | 0x80004 |
| 0x08780100 | ? | [UnregisterSpecialTitleContent](FS:UnregisterSpecialTitleContent "wikilink") | 0x80004 |
| 0x087900C2 | ? | Same as [GetLegacyBannerData](FS:GetLegacyBannerData "wikilink"), except for the last parameter this internally passes u8 value 0x1 instead of 0x0, for the FSPXI command. | 0x101015 |
| 0x087A0180 | [9.6.0-X](9.6.0-24 "wikilink") | [AddSeed](FS:AddSeed "wikilink") | 0x200000 |
| 0x087B0080 | [9.6.0-X](9.6.0-24 "wikilink") | [GetSeed](FS:GetSeed "wikilink") | 0x200000 |
| 0x087C0080 | [9.6.0-X](9.6.0-24 "wikilink") | [DeleteSeed](FS:DeleteSeed "wikilink") | 0x200000 |
| 0x087D0000 | [9.6.0-X](9.6.0-24 "wikilink") | [GetNumSeeds](FS:GetNumSeeds "wikilink") | 0x200000 |
| 0x087E0042 | [9.6.0-X](9.6.0-24 "wikilink") | [ListSeeds](FS:ListSeeds "wikilink") | 0x200000 |
| 0x087F0100 | [9.6.0-X](9.6.0-24 "wikilink") | [TitleContentHasSeed](FS:TitleContentHasSeed "wikilink") | 0x200000 |
| 0x08800880 | [9.6.0-X](9.6.0-24 "wikilink") | [AddTitleTag](FS:AddTitleTag "wikilink") | 0x200000 |
| 0x08810080 | [9.6.0-X](9.6.0-24 "wikilink") | [GetTitleTag](FS:GetTitleTag "wikilink") | 0x200000 |
| 0x08820080 | [9.6.0-X](9.6.0-24 "wikilink") | [DeleteTitleTag](FS:DeleteTitleTag "wikilink") | 0x200000 |
| 0x08830000 | [9.6.0-X](9.6.0-24 "wikilink") | [GetNumTitleTags](FS:GetNumTitleTags "wikilink") | 0x200000 |
| 0x08840042 | [9.6.0-X](9.6.0-24 "wikilink") | [ListTitleTags](FS:ListTitleTags "wikilink") | 0x200000 |
| 0x088500C0 | [9.6.0-X](9.6.0-24 "wikilink") | [CheckTitleSeed](FS:CheckTitleSeed "wikilink") | 0x200000 |
| 0x088600C0 | [11.1.0-X](11.1.0-34 "wikilink") | [CheckUpdatedDat](FS:CheckUpdatedDat "wikilink") | 0x80000 |

Note: The question marks from Dummy1 to GetSpecialFileSize on the "available since system version" field are mainly there because I think that most of these are necessary for the main system to function, so theoretically that would mean that since the creation of the 3DS these were available, or since launch if that makes more sense. But because of the peculiar nature of some of the functions, they will remain question marks until they can be confirmed 100%.

When access rights are required for a command, at least one of the bits in the process access info specified in the above table for the command must be set. Error 0xD9004676 is returned when a process attempts to use a command which it doesn't have access rights for the command. The exheader access info field is all zero's for most applications. Note that the permissions listed in the above table is for system-version v2.x, therefore permission bit(s) added with newer FIRM may be missing from this.

Each session for fs:USER has separate permissions, initially these are set to all zero's for new fs:USER sessions. The permissions/etc for fs:USER sessions are initialized via [FS:Initialize](FS:Initialize "wikilink")(loaded from the user process exheader).

## Filesystem service "fs:LDR"

This service is identical to fs:USER, except [FS:OpenArchive](FS:OpenArchive "wikilink") archive 0x2345678E can only be accessed with fs:LDR.

## ProgramRegistry service "fs:REG"

| Command Header | Description                                         |
|----------------|-----------------------------------------------------|
| 0x000100C6     | [Dummy1](FSReg:Dummy1 "wikilink")                   |
| 0x040103C0     | [Register](FSReg:Register "wikilink")               |
| 0x04020040     | [Unregister](FSReg:Unregister "wikilink")           |
| 0x040300C0     | [GetProgramInfo](FSReg:GetProgramInfo "wikilink")   |
| 0x04040100     | [LoadProgram](FSReg:LoadProgram "wikilink")         |
| 0x04050080     | [UnloadProgram](FSReg:UnloadProgram "wikilink")     |
| 0x04060080     | [CheckHostLoadId](FSReg:CheckHostLoadId "wikilink") |

Only two sessions can be opened for this service at a time, hence no other processes can use this due to [pm-module](Process_Manager_Services "wikilink") and [loader](Loader_Services "wikilink") using this.

# File and directory access

## Files

File session handles obtained via [FS:OpenFile](FS:OpenFile "wikilink") and [FS:OpenFileDirectly](FS:OpenFileDirectly "wikilink") can be used to access files through a service-like interface, despite not being an actual service registered using [SRV:RegisterService](SRV:RegisterService "wikilink"). To use this service-like interface, simply call the SendSyncRequest SVC with a file session handle, using the IPC buffer in thread-local storage for parameters and responses, just like you would with a proper service.

| Command Header | Description                                      |
|----------------|--------------------------------------------------|
| 0x000100C6     | [Dummy1](FSFile:Dummy1 "wikilink")               |
| 0x040100C4     | [Control](FSFile:Control "wikilink")             |
| 0x08010100     | [OpenSubFile](FSFile:OpenSubFile "wikilink")     |
| 0x080200C2     | [Read](FSFile:Read "wikilink")                   |
| 0x08030102     | [Write](FSFile:Write "wikilink")                 |
| 0x08040000     | [GetSize](FSFile:GetSize "wikilink")             |
| 0x08050080     | [SetSize](FSFile:SetSize "wikilink")             |
| 0x08060000     | [GetAttributes](FSFile:GetAttributes "wikilink") |
| 0x08070040     | [SetAttributes](FSFile:SetAttributes "wikilink") |
| 0x08080000     | [Close](FSFile:Close "wikilink")                 |
| 0x08090000     | [Flush](FSFile:Flush "wikilink")                 |
| 0x080A0040     | [SetPriority](FSFile:SetPriority "wikilink")     |
| 0x080B0000     | [GetPriority](FSFile:GetPriority "wikilink")     |
| 0x080C0000     | [OpenLinkFile](FSFile:OpenLinkFile "wikilink")   |
| 0x0C010100     | [GetAvailable](FSFile:GetAvailable "wikilink")   |

## Directories

Directory session handles obtained via [FS:OpenDirectory](FS:OpenDirectory "wikilink") are usable via a service-like interface, following the exact same procedure described above for file sessions.

| Command Header | Available since system version | Description |
|----|----|----|
| 0x000100C6 | [1.0.0-0](1.0.0-0 "wikilink") | [Dummy1](FSDir:Dummy1 "wikilink") |
| 0x040100C4 | [1.0.0-0](1.0.0-0 "wikilink") | [Control](FSDir:Control "wikilink") |
| 0x08010042 | [1.0.0-0](1.0.0-0 "wikilink") | [Read](FSDir:Read "wikilink") |
| 0x08020000 | [1.0.0-0](1.0.0-0 "wikilink") | [Close](FSDir:Close "wikilink") |
| 0x08030040 | ? | [SetPriority](FSDir:SetPriority "wikilink") |
| 0x08040000 | ? | [GetPriority](FSDir:GetPriority "wikilink") |

# Archives

| ArchiveId | Description | Accessible via [FS](Filesystem_services "wikilink") | Accessible via [FSPXI](Filesystem_services_PXI "wikilink") | Only accessible by Process9 internally | Requires binary [Lowpath](FS:OpenFile "wikilink") | Required exheader FS access info bitmask |
|----|----|----|----|----|----|----|
| 0x00000003 | SelfNCCH (including [RomFS](#romfs "wikilink")) | Yes | No | No | No | None |
| 0x00000004 | SaveData (the saveID/mediatype for this is loaded from data originally from the user process' exheader) | Yes | No | No | No | None |
| 0x00000006 | ExtSaveData | Yes | No | No | Yes | 0x100D, when the input extdataID isn't listed in the exheader. |
| 0x00000007 | Shared ExtSaveData | Yes | No | No | Yes | None |
| 0x00000008 | SystemSaveData | Yes | No | No | Yes | 0x4, when the input saveID doesn't match the exheader system-saveID. |
| 0x00000009 | SDMC | Yes | Yes | No | No | 0x8E |
| 0x0000000A | SDMC Write-Only | Yes | No | No | No | 0x808E |
| 0x12345678 | ExtSaveData for BOSS | Yes | No | No | Yes | 0x44 |
| 0x12345679 | CARD SPI FS | Yes | Yes | No | No | 0x16 |
| 0x1234567B | ExtSaveData, and ExtSaveData for BOSS | No | Yes | No | Yes |  |
| 0x1234567C | SystemSaveData | No | Yes | No | Yes |  |
| 0x1234567D | NAND RW | Yes | Yes | No | No | 0x800 |
| 0x1234567E | NAND RO | Yes | Yes | No | No | 0x200 |
| 0x1234567F | NAND RO Write FS | No | Yes | No | No | ? |
| 0x12345680 | Extdata transfer. Used for transferring [NAND Shared Extdata](Extdata#nand_shared_extdata "wikilink") during [system tranfers](System_Transfer_Shared_Extdata_Transfer /_Shared_Extdata_Transfer "wikilink"). | Yes | Yes | No | Yes | ? |
| 0x12345681 | System Savedata transfer. Used for transferring [System Save Data](System_SaveData "wikilink") during [system tranfers](System_Transfer_Shared_Extdata_Transfer /_Shared_Extdata_Transfer "wikilink"). | Yes | Yes | No | Yes | ? |
| 0x12345682 | Unknown. There's code for this in spider v9.9, but that code isn't actually used. | Yes | No | No | Yes | ? |
| 0x2345678A | Title access. With FS, this allows accessing NCCH/NCSD contents (ExeFS, RomFS, checking if a content uses a seed, checking the validity of the installed seed). FSPXI, additionally, allows opening raw NCCH/NCSD NCCH contents and DSiWare contents for reading, along with encrypted save data. | Yes | Yes | No | Yes | 0x1005 |
| 0x2345678B | Used internally by Process9 as the lowest level title access archive. Allows for opening various sections of a title (TMD, CMD, raw contents, DLC contents, raw save data (including public/private/banner saves for DSiWare), title and/or content import context files and /data directories for save data. | No | No | Yes | Yes |  |
| 0x2345678C | Used internally to access [Title Database (/dbs)](Title_Database "wikilink") files. For SD, `title.db` and `import.db`. For NAND, `title.db`, `import.db`, `tmp_t.db`, `tmp_i.db`, and `jumpid.db`. | No | No | Yes | Yes |  |
| 0x2345678D | Used internally to access non-title /dbs files on the NAND: `certs.db` and `ticket.db`. | No | No | Yes | No |  |
| 0x2345678E | FSPXI: Program Access (limited subset of merged main title + update/patch title access). For fs:LDR(used by the "loader" FIRM ARM11-process), only `exefs:/.code`. Not accessible with fs:USER. | Yes | Yes | No | Yes | None, see description. |
| 0x567890AB | NAND CTR FS | No | Yes | No | No | ? |
| 0x567890AC | TWL PHOTO | Yes | Yes | No | No | ? |
| 0x567890AD | TWLS (DSi Sound stores recordings here). This is mapped to the FAT12 image stored in the file at [Twln/shared2/0000](Twln/shared2/0000 "wikilink"). | No | Yes | No | No | ? |
| 0x567890AE | NAND TWL FS | Yes | Yes | No | No | 0x100 |
| 0x567890AF | NAND W FS | Yes | Yes | No | No | 0x100 |
| 0x567890B0 | Internally creates the same "ID Storage" wrapper over the NAND that is used for SystemSaveData and Shared ExtData, but all operations are stubbed and return 0xE0C046F8. | No | Yes | No | No |  |
| 0x567890B1 | Gamecard SaveData (for check). This is a wrapper for UserSaveDataForCheck: the OpenArchive code for that is called with archive-lowpath TID=0/mediatype=2(gamecard). | Yes | No | No | No | 0x6 |
| 0x567890B2 | UserSaveData (for check). This is the same as the regular SaveData archive, except with this the savedata ID and mediatype is loaded from the input archive lowpath. | Yes | No | No | Yes | 0x6 |
| 0x567890B3 | [AGB Save Data](3DS_Virtual_Console#nand_savegame "wikilink") | No | No | Yes | No | \- |
| 0x567890B4 | Similar to 0x567890B2 but can only access Accessible Save specified in [exheader](NCCH/Extended_Header#storage_info "wikilink")? | Yes | No | No | Yes | ? |

Archives listed as not requiring a binary lowpath, use lowpath type [empty](FS:OpenFile "wikilink").

The above permission bitmasks are from v2.x, see the above Services section for how these are handled.

Archives CTR NAND, NAND RO Write FS, TWL NAND, NAND W FS, and CARD SPI FS require the corresponding process exheader access control mount flag to be set, in the exheader for any of the currently running ARM11 processes, for [FSPXI](Filesystem_services_PXI "wikilink"). The access rights checked by [FS](Filesystem_services "wikilink") module for archive mounting with fs:USER, are stored in the process' exheader accessinfo.

The CARDSPI archive allows access to the gamecard CARD1 raw savedata flash(aka "cardspi:/" in [Process9](FIRM "wikilink")), the file lowpath must be WCHAR "/". The "NAND W FS" archive allows access to the raw NAND image(aka "wnand:/" in Process9), the file lowpath must be WCHAR "/".

# Filenames and Paths

## PathType

| Value | Description |
|----|----|
| -1 | Returned internally by Process9, when errors occur it seems(in particular when no nul-terminator was found in the input path). The data ptr is set to NULL. |
| 0x0 | INVALID - Specifies an invalid path |
| 0x1 | EMPTY - Specifies an empty path |
| 0x2 | BINARY - Non-text based path. Meaning is per-archive |
| 0x3 | ASCII - Text-based path with 7-bit ASCII characters padded to 8-bits each (signed char) |
| 0x4 | UTF16 - Text-based path with UTF-16 characters |

In IPC requests, sizes of ASCII and UTF16 paths must include space for the null-terminator.

## Binary LowPath

The format of the data that a binary LowPath points to is custom per archive.

### SystemSaveData / Extdata / Shared Extdata Archive Path Data Format

#### DataAccessPath

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>u8 <a {{% href "../Mediatypes" %}} title="wikilink">Mediatype</a></td>
</tr>
<tr>
<td>0x1</td>
<td>0x1</td>
<td>only for NAND data (System Savedata / Shared Extdata), otherwise left 0:</p>
<table>
<thead>
<tr>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>Accesses from/to <code>nand:/data/</code><ID0 of current system></td>
</tr>
<tr>
<td>1</td>
<td>Accesses from/to <code>nand:/fixdata</code></td>
</tr>
<tr>
<td>2</td>
<td>Accesses from/to <code>nand:/data/&lt;ID0 from </code><a {{% href "../Filesystem_services" %}} title="wikilink"><code>Device Move Context</code></a><code>&gt;</code></td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x2</td>
<td>0x2</td>
<td>padding</td>
</tr>
</tbody>
</table>

#### SystemSaveData

##### FS

###### Archive Path

| Index word | Description |
|----|----|
| 0 | [DataAccessPath](Filesystem_services#dataaccesspath "wikilink") |
| 1 | save ID low (save ID high is 0) |

###### File Path

The file path is a cleartext ASCII or UTF16 file path (<file path>).

The file path would access the file at <base path>`/sysdata/`<save ID low>`/`<save ID high>`/`<file path>.
Note that `/`<file path> refers to the virtual file system inside the </code><save ID high></code> file.

##### FSPXI / FS System Savedata Transfer / FSPXI System Savedata Transfer

###### Archive Path

| Index word | Description |
|----|----|
| 0 | [DataAccessPath](Filesystem_services#dataaccesspath "wikilink") |

###### File Path

| Index word | Description  |
|------------|--------------|
| 0          | save ID low  |
| 1          | save ID high |

The file path would access the file at <base path>`/sysdata/`<save ID low>`/`<save ID high>.

#### Extdata / Shared Extdata

##### FS / FS Extdata Transfer / FSPXI Extdata Transfer

###### Archive Path

| Index word | Description |
|----|----|
| 0 | [DataAccessPath](Filesystem_services#dataaccesspath "wikilink") |
| 1 | ext save ID low |
| 2 | ext save ID high |

This refers to the extdata filesystem structure's base directory at <base path>`/extdata/`<ext save ID low>`/`<ext save ID high>.

###### File Path

The file path is a cleartext ASCII or UTF16 file path (<file path>).

For FS Extdata, this would acccess <base path>`/extdata/`<save ID low>`/`<save ID high>`/`<directory ID>`/`<file ID>`/`<file path>, and `/`<file path> refers to the virtual file system inside the </code><file ID></code> file.

For FS / FSPXI Extdata Transfer, this accesses <base path>`/extdata/`<save ID low>`/`<save ID high>`/`<file path>.

### UserSaveDataForCheck Archive Path Data Format

| Index word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | [Mediatype](Mediatypes "wikilink") (must be non-zero) |
| 1          | Lower word saveid                                     |
| 2          | Upper word saveid                                     |

The file/directory lowpath for this FS archive is a text path in the [savegame](Savegames "wikilink") filesystem.

### 0x567890B4 Archive Path Data Format

| Index word | Description |
|----|----|
| 0 | [Mediatype](Mediatypes "wikilink") |
| 1 | `Lower_word_saveid >> 8` ? |
| 2 | Unknown. Game calculate this using formula `0xFFFFFF00 | unknown_b` |

### Title Access Archive Path Data Format

#### Title Access Type

| Value | Description |
|----|----|
| 0 | High-level NCCH content access |
| 1 | Save data access (high-level, decrypted) |
| 2 | Raw content (low-level NCCH/SRL) access |
| 3 | Banner save data access (for DSiWare titles) |
| 4 | FS only: Save data transfer (internally uses generated data from [FS:BeginSaveDataMove](FS:BeginSaveDataMove "wikilink") as the IV for "Save data access (low-level, encrypted)") |
| 5 | Save data access (low-level, encrypted) |

#### NCCH Access Type

| Value | Description                                                      |
|-------|------------------------------------------------------------------|
| 0     | RomFS                                                            |
| 1     | `exefs:/.code`                                                   |
| 2     | System Menu Data (`exefs:/icon`, `exefs:/banner`, `exefs:/logo`) |
| 3     | NCCH Header(s)                                                   |
| 4     | "is seeded" check                                                |
| 5     | Seed verify/validate                                             |

#### NCCH Header Access Type

| Value | Description |
|----|----|
| 0 | [Extheader](NCCH/Extended_Header "wikilink") (0x0-0x400) |
| 1 | [Extheader](NCCH/Extended_Header "wikilink") AccessDesc (0x400-0x800) |
| 2 | Raw [NCCH Header](NCCH#ncch_header "wikilink") |

#### Archive Path

| Offset | Size | Description                         |
|--------|------|-------------------------------------|
| 0x0    | 0x8  | Program ID (Title ID)               |
| 0x9    | 0x1  | [Media Type](Mediatypes "wikilink") |
| 0xA    | 0x7  | padding                             |

#### File Path

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">Title Access Type</a></td>
</tr>
<tr>
<td>0x4</td>
<td>0x10</td>
<td>Dynamic data depending on <a {{% href "../Filesystem_services" %}} title="wikilink">Title Access Type</a>:</p>
<table>
<thead>
<tr>
<th>High Level NCCH Access</th>
<th>Save Data Access (high level)</th>
<th>Raw Content</th>
<th>FS only: Save Data Transfer</th>
</tr>
</thead>
<tbody>
<tr>
<td><table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td>Content index from TMD for NAND/SD titles
NCSD partition index for gamecards</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">NCCH Access Type</a></td>
</tr>
<tr>
<td>0x8</td>
<td>0x8</td>
<td>Dynamic data depending on <a {{% href "../Filesystem_services" %}} title="wikilink">NCCH Access Type</a>:
For ExeFS, (System Menu Data / <code>exefs:/.code</code>),</p>
<table>
<tbody>
<tr>
<td>8-byte ExeFS file name</td>
</tr>
</tbody>
</table>
<p>For Header Access,</p>
<table>
<tbody>
<tr>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">u64, NCCH Header Access Type</a></td>
</tr>
</tbody>
</table>
<p>For RomFS,</p>
<table>
<tbody>
<tr>
<td><a {{% href "../NCCH" %}} title="wikilink">u64, Allowed content types flag</a>
(<code>(1 &lt;&lt; allowed_type_a) |</p>
<p>(1 &lt;&lt; allowed_type_b)...</code>)</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table></td>
<td><table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x10</td>
<td>16-byte IV for save data crypto</td>
</tr>
</tbody>
</table></td>
<td><table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td>Content index from TMD for NAND/SD titles
NCSD partition index for gamecards</td>
</tr>
<tr>
<td>0x4</td>
<td>0xC</td>
<td>padding</td>
</tr>
</tbody>
</table></td>
<td><table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td>Save data transfer key from <a {{% href "../FS:BeginSaveDataMove" %}} title="wikilink">FS:BeginSaveDataMove</a></td>
</tr>
<tr>
<td>0x4</td>
<td>0xC</td>
<td>padding</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x14</td>
<td>0x10</td>
<td>16-byte seed for titles that require one, or for validating a seed against the check value in the <a {{% href "../NCCH" %}} title="wikilink">NCCH Header</a>'s check value.
If the title does not use a seed, this should not be included and size 0x14 should be used instead of 0x24.</td>
</tr>
</tbody>
</table>

For encrypted save data access and banner save data access, the entire 0x10 portion of the dynamic data is left blank.

The "is seeded check" NCCH access type opens a virtual 1-byte file that reads either 0 or 1; this value is generated on-the-fly and will be 1 if ncchflags\[7\] has bit5 set (content uses seed), and 0 otherwise.

For NCCH sections that require a seed (e.g. `.code`, RomFS, etc.), the additional seed portion of the low path must be populated with the correct seed.

The "Seed Verify/Validate" NCCH access type also requires the seed portion of the lowpath. The target NCCH content is opened (with the opened file interface being stubbed, meaning no real reads/writes can be performed on it), and the given seed is used to calculate the seed check hash, and part of it is compared to the check value in the NCCH header. If it matches, opening the "file" succeeds, otherwise 0xD900458C is returned. If attempt is made to use the seed validation type on a content that does not use a seed, error 0xC92044E6 is returned.

#### FS Limitations

For FS, this archive functions the same, except for the following limitations:

\- Only the title access types "High Level NCCH Access" and "High Level Save Data Access", and "Save Data Transfer" are allowed.

\- For high level NCCH access, the types "RomFS", "System Menu Data", "Seeded check", and "Seed Check/Verify" are allowed.

\- For "Seed Check/Verify", rather than providing the title seed in the file path (as is the case for FSPXI), the seed is retrieved from the seed database (meaning the file lowpath size is always 0x14 for FS).

### Program Access / SelfNCCH access

Provides access to a "merged" archive of a base title and, optionally, a separate update (patch) title.

If no patch title exists, the base title is considered to be the patch title, i.e. turning all "patch" accesses into accesses to the base title.

#### Program Access Type

| Value | Description | Accesses |
|----|----|----|
| 0 | RomFS ("unspecified" [content type](NCCH#content_type "wikilink"), the default) | Base title |
| 1 | `exefs:/.code` | Patch title |
| 2 | System Menu Data (`exefs:/icon`, `exefs:/banner`, `exefs:/logo`) | Base title |
| 3 | Save Data (high level, decrypted) | \- |
| 4 | RomFS (all [content types](NCCH#content_type "wikilink")) | Base title |
| 5 | RomFS ("unspecified" [content type](NCCH#content_type "wikilink"), the default) | Patch title |

#### Archive Path

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x8 | u64, Program Handle from [PXIPM:RegisterProgram](PXIPM:RegisterProgram "wikilink") |

#### File Path

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">Program Access Type</a></td>
</tr>
<tr>
<td>0x4</td>
<td>0x8</td>
<td>Dynamic data depending on <a {{% href "../Filesystem_services" %}} title="wikilink">Program Access Type</a>:</p>
<table>
<thead>
<tr>
<th>ExeFS files (System Menu Data, etc.)</th>
<th>RomFS of base title (all <a {{% href "../NCCH" %}} title="wikilink">content types</a>)</th>
</tr>
</thead>
<tbody>
<tr>
<td><table>
<tbody>
<tr>
<td>8-character ExeFS filename</td>
</tr>
</tbody>
</table></td>
<td><table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td>u32, content index of target content</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td>padding</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

#### FS Limitations

\- FSPXI allows all access types.

\- When used through fs:LDR by loader, FS only provides access to `exefs:/.code`.

\- For SelfNCCH access, the only allowed access types are "RomFS ("unspecified" [content type](NCCH#content_type "wikilink"), the default)" of the Base or Patch title, and "System Menu Data". Attempting to access "Save Data" results in error 0xE0E046BE, "RomFS (all [content types](NCCH#content_type "wikilink"))" in 0xF9604784, and "`exefs:/.code`" in 0xD9004676.

### [RomFS](RomFS "wikilink")

Archives 0x3 and 0x2345678E both allow for accessing the [level-3 IVFC images](RomFS#level_3_format "wikilink") for RomFS access. The main CXI RomFS is accessible via an all-zero 0xc-byte binary file-lowpath. The update RomFS can be accessed with the first u32 in the binary file-lowpath being set to 0x5. The user must handle parsing the filesystem used in the exposed image itself.

With FSPXI the returned data for RomFS is the entire RomFS section from the NCCH, starting at the IVFC header.

The 0x3 archive is an interface for the 0x2345678E archive with the current process programID+mediatype. The file lowpath is 3-words. These words are written to 0x2345678E-archive file_lowpath+0, with the rest of that lowpath set to all-zero(lowpath is different from archive 0x2345678A). File lowpath:

<table>
<thead>
<tr>
<th>Index word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>See above. The only values which FS-module doesn't allow to be used here are:</p>
<ul>
<li>0x1: Error 0xE0E046BE.</li>
<li>0x3: Error 0xE0E046BE.</li>
<li>0x4: FS-module executes svcBreak when using this.</li>
</ul></td>
</tr>
<tr>
<td>1-2</td>
<td>See above. Not validated by FS-module.</td>
</tr>
</tbody>
</table>

# Anti Savegame Restore

Anti Savegame Restore, internally referred to as *Save Data Rollback Prevention*, is a feature originally implemented in the FS module with [4.0.0-7](4.0.0-7 "wikilink"), which prevents the user from restoring previous versions of a savegame image. This feature is not used (in practice) for gamecard games. When an old version of the save is detected, the application will display an error regarding old savegame version, then delete and recreate the save data (similar to when it is corrupted).

## Implementation

When creating the savedata, the application generates a secure value (a 64 bit unsigned integer), then stores it in either the [DISA save image header](DISA_and_DIFF#disa_header "wikilink") or the [Anti Savegame Restore Save Data](Filesystem_services#anti_savegame_restore_save_data "wikilink"). The application then uses the anti-savegame-restore commands ([FS:SetSaveDataSecureValue](FS:SetSaveDataSecureValue "wikilink"), [FS:GetSaveDataSecureValue](FS:GetSaveDataSecureValue "wikilink"), [FS:SetOtherSaveDataSecureValue](FS:SetOtherSaveDataSecureValue "wikilink"), [FS:GetOtherSaveDataSecureValue](FS:GetOtherSaveDataSecureValue "wikilink"), [FS:SetThisSaveDataSecureValue](FS:SetThisSaveDataSecureValue "wikilink"), [FS:GetThisSaveDataSecureValue](FS:GetThisSaveDataSecureValue "wikilink"), [FS:SetSaveArchiveSecureValue](FS:SetSaveArchiveSecureValue "wikilink") and [FS:GetSaveArchiveSecureValue](FS:GetSaveArchiveSecureValue "wikilink")) to verify the value known to the game for comparison with the value returned by FS, and to update the value in the corresponding storage location.

Each time the application writes to the savegame, the value should be updated by both the application and through FS. Usually, applications update this value by incrementing it. However, generating a new random-number or other methods of updating it can be used as well.

## Anti Savegame Restore Save Data

The save data used for this feature is stored in [System Save Data](System_SaveData "wikilink") ID 0x00010011 and contains only one file, named `DB`:

### Main Structure

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1000</td>
<td>Header</p>
<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>u8, version (usually 0)</td>
</tr>
<tr>
<td>0x1</td>
<td>0x3</td>
<td>padding</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td>u32, number of secure value entries</td>
</tr>
<tr>
<td>0x8</td>
<td>0xFF8</td>
<td>completely unused, padding</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x1000</td>
<td>0x1C000 (8 * 14336)</td>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">Secure value keys</a></td>
</tr>
<tr>
<td>0x1D000</td>
<td>0x1C000 (8 * 14336)</td>
<td>u64s, Secure values</td>
</tr>
</tbody>
</table>

### SecureValueKey

Depending on which command is used, secure value keys can be interpreted as:

| Offset | Size | Description   |
|--------|------|---------------|
| 0x0    | 0x8  | u64, Title ID |

or:

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | u32, [Secure Value Slot](Filesystem_services#securevalueslot "wikilink") |
| 0x4 | 0x4 | u32, Unique ID |

## Applications using this feature

- Animal Crossing: New Leaf
- Pokemon X & Y
- Pokemon Omega Ruby & Alpha Sapphire
- Pokemon Omega Ruby & Alpha Sapphire Demo
- Pokemon Shuffle
- Super Smash Bros
- Pokemon Red,Blue and Yellow (GB(C) VC)
- Rusty's Real Deal Baseball
- Megami Meguri

# SEEDDB and TITLETAG

With [9.6.0-X](9.6.0-24 "wikilink") new [System_SaveData](System_SaveData "wikilink") with save ID 0x0001000F was added. This save data contains both the NCCH seed database (SEEDDB) and the title tag database (TITLETAG).

These databases are managed by the commands [FS:AddSeed](FS:AddSeed "wikilink"), [FS:GetSeed](FS:GetSeed "wikilink"), [FS:DeleteSeed](FS:DeleteSeed "wikilink"), [FS:GetNumSeeds](FS:GetNumSeeds "wikilink") and [FS:ListSeeds](FS:ListSeeds "wikilink") for SEEDDB, and [FS:AddTitleTag](FS:AddTitleTag "wikilink"), [FS:GetTitleTag](FS:GetTitleTag "wikilink"), [FS:DeleteTitleTag](FS:DeleteTitleTag "wikilink"), [FS:GetNumTitleTags](FS:GetNumTitleTags "wikilink"), and [FS:ListTitleTags](FS:ListTitleTags "wikilink") for TITLETAG respectively.

Both the [HOME Menu](Home_Menu "wikilink") and the [NIM](NIM_Services "wikilink") module have access to these commands.

## SEEDDB

Stored in the system savedata archive 0x0001000F as a file named `SEEDDB`, it contains the title-unique seed-data used for the new [NCCH](NCCH "wikilink") keyY generation added with FIRM [9.6.0-X](9.6.0-24 "wikilink").

The file follows a simple key-value format allowing the storage of seed data for up to 2000 unique title IDs.

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1000</td>
<td>Header</p>
<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>u8, version (usually 0)</td>
</tr>
<tr>
<td>0x1</td>
<td>0x3</td>
<td>padding</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td>u32, number of seed entries</td>
</tr>
<tr>
<td>0x8</td>
<td>0xFF8</td>
<td>completely unused, padding</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x1000</td>
<td>0x3E80 (8 * 2000)</td>
<td>u64s, Title IDs</td>
</tr>
<tr>
<td>0x4E80</td>
<td>0x7D00 (16 * 2000)</td>
<td>Seed data, 16 bytes per seed</td>
</tr>
</tbody>
</table>

## TITLETAG Database

Stored in the system savedata archive 0x0001000F as a file named `TITLETAG`, it contains information used by the [HOME Menu](Home_Menu "wikilink") to handle cases when a to-be-released title has been purchased already, that is, to properly install the seed required for [NCCH](NCCH "wikilink") keyY generation added with FIRM [9.6.0-X](9.6.0-24 "wikilink").

When a to-be-released title is purchased, the [NIM](NIM_Services "wikilink") module installs a [title tag](Filesystem_services#titletag "wikilink") with enough information about the title for the [HOME Menu](Home_Menu "wikilink") to be able to initiate a seed import once the title has been released (and thus, the title's NCCH content lock seed). Until the title's seed is released, and while the title tag remains in the database, the HOME Menu will prevent the user from launching the software as it would not run without the seed. Once released, information from the title tag is used to download the seed, and, if successful, the title tag is removed from the database, making the software playable.

The file follows a simple key-value format allowing the storage of title tag data for up to 2000 unique title IDs.

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1000</td>
<td>Header</p>
<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>u8, version (usually 0)</td>
</tr>
<tr>
<td>0x1</td>
<td>0x3</td>
<td>padding</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td>u32, number of entries</td>
</tr>
<tr>
<td>0x8</td>
<td>0xFF8</td>
<td>completely unused, padding</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x1000</td>
<td>0x3E80 (8 * 2000)</td>
<td>u64s, Title IDs</td>
</tr>
<tr>
<td>0x4E80</td>
<td>0x3E800 (0x80 * 2000)</td>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">Title Tag</a> data, 0x80 bytes per entry</td>
</tr>
</tbody>
</table>

# Common Types

## MediaType

| Value | Description |
|-------|-------------|
| 0     | NAND        |
| 1     | SD          |
| 2     | Game Card   |

## SystemMediaType

| Value | Description |
|-------|-------------|
| 0     | CTR NAND    |
| 1     | TWL NAND    |
| 2     | SD          |
| 3     | TWL Photo   |

## OpenFlags

| Bit | Description |
|-----|-------------|
| 0   | Read        |
| 1   | Write       |
| 2   | Create      |

## Attributes

| Offset | Size | Description  |
|--------|------|--------------|
| 0x0    | 0x1  | Is Directory |
| 0x1    | 0x1  | Is Hidden    |
| 0x2    | 0x1  | Is Archive   |
| 0x3    | 0x1  | Is Read-Only |

## WriteOption

| Offset | Size | Description       |
|--------|------|-------------------|
| 0x0    | 0x1  | Flush             |
| 0x1    | 0x1  | Update Time Stamp |
| 0x2    | 0x1  | Reserved          |
| 0x3    | 0x1  | Reserved          |

## DirectoryEntry

| Offset | Size  | Description                                             |
|--------|-------|---------------------------------------------------------|
| 0x0    | 0x20C | UTF-16 Entry Name                                       |
| 0x20C  | 0xA   | 8.3 short filename name                                 |
| 0x216  | 0x4   | 8.3 short filename extension                            |
| 0x21A  | 0x1   | Always 1                                                |
| 0x21B  | 0x1   | Reserved                                                |
| 0x21C  | 0x4   | [Attributes](Filesystem_services#attributes "wikilink") |
| 0x220  | 0x8   | Entry Size                                              |

## ArchiveResource

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 0x4  | Sector byte-size                 |
| 0x4    | 0x4  | Cluster byte-size                |
| 0x8    | 0x4  | Partition capacity in clusters   |
| 0xC    | 0x4  | Available free space in clusters |

## ProgramInfo

| Offset | Size | Description                                            |
|--------|------|--------------------------------------------------------|
| 0x0    | 0x8  | Program ID                                             |
| 0x8    | 0x1  | [Media Type](Filesystem_services#mediatype "wikilink") |
| 0x9    | 0x7  | Padding                                                |

## ProductInfo

| Offset | Size | Description      |
|--------|------|------------------|
| 0x0    | 0x10 | Product Code     |
| 0x10   | 0x2  | Company Code     |
| 0x12   | 0x2  | Remaster Version |

## IntegrityVerificationSeed

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x10 | AES-CBC MAC over a SHA256 hash, which hashes the first 0x110-bytes of the cleartext SEED. |
| 0x10 | 0x120 | The [nand/private/movable.sed](nand/private/movable.sed "wikilink"), encrypted with AES-CBC using the above MAC for the counter. |

## ExtSaveDataInfo

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | [DataAccessPath](Filesystem_services#dataaccesspath "wikilink") |
| 0x4 | 0x8 | Save ID |
| 0xC | 0x4 | Reserved |

## SystemSaveDataInfo

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | [DataAccessPath](Filesystem_services#dataaccesspath "wikilink") |
| 0x4 | 0x4 | Save ID |

## SecureValueSlot

| Value  | Description    |
|--------|----------------|
| 0x1000 | SD Application |

## SecureValueEntry

<table>
<thead>
<tr>
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x4</td>
<td>u32, <a {{% href "../Filesystem_services" %}} title="wikilink">Secure Value Slot</a></td>
</tr>
<tr>
<td>0x4</td>
<td>0x1</td>
<td>When used as an input entry:</p>
<table>
<thead>
<tr>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>This entry should be removed.</td>
</tr>
<tr>
<td>1</td>
<td>This entry should be updated with the given value.</td>
</tr>
</tbody>
</table>
<p>When returned from a command:</p>
<table>
<thead>
<tr>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0</td>
<td>No entry with the given slot and title ID was found, or: this entry is unused.</td>
</tr>
<tr>
<td>1</td>
<td>The entry with the given slot and title ID was found, or: this entry is used.</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x5</td>
<td>0x3</td>
<td>padding</td>
</tr>
<tr>
<td>0x8</td>
<td>0x8</td>
<td>u64, Secure Value</td>
</tr>
</tbody>
</table>

## TitleTag

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | Magic, `PREP` (PREPurchase install) |
| 0x4 | 0x4 | s32, Release date year |
| 0x8 | 0x1 | u8, Release date month |
| 0x9 | 0x1 | u8, Release date day |
| 0xA | 0x2 | u16, Country code |
| 0xC | 0x4 | u32, Seed status (0: not downloaded yet, 1: last download attempt failed, 2: seed installed successfully) |
| 0x10 | 0x4 | Result code from last seed installation attempt |
| 0x14 | 0x4 | Support error code from last seed installation attempt |
| 0x18 | 0x68 | reserved padding (unused) |

## CardSpiBaudRate

| Value | Description |
|-------|-------------|
| 0x0   | 512KHz      |
| 0x1   | 1MHz        |
| 0x2   | 2MHz        |
| 0x3   | 4MHz        |
| 0x4   | 8MHz        |
| 0x5   | 16MHz       |

## CardSpiBusMode

| Value | Description |
|-------|-------------|
| 0x0   | 1-bit       |
| 0x1   | 4-bit       |

## SpecialContentType

| Value | Description                   | Found in                  |
|-------|-------------------------------|---------------------------|
| 0x1   | CTR (Old3DS) Update Partition | Gamecards                 |
| 0x2   | Manual                        | Gamecards, Digital titles |
| 0x3   | DLP Child                     | Gamecards, Digital titles |
| 0x4   | KTR (New3DS) Update Partition | Gamecards                 |

## DeviceMoveContext

| Offset | Size | Description                                                 |
|--------|------|-------------------------------------------------------------|
| 0x0    | 0x10 | IVs (ID0 of source console)                                 |
| 0x10   | 0x10 | Encrypt Parameter (used to calculate the IV for encryption) |

# Errors

See [Filesystem_services_PXI](Filesystem_services_PXI "wikilink").

[Category:Services](Category:Services "wikilink")

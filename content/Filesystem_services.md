+++
title = 'Filesystem Services'
categories = ["Services"]
+++

# Services

## Filesystem service "fs:USER"

You can at most have 32 FS archive handles.

| Command Header | Available since system version                     | Description                                                                                                                                                                                                                 | Required [exheader](NCCH/Extended_Header "wikilink") access info bitmask  |
|----------------|----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| 0x000100C6     | ?                                                  | [Dummy1](FS:Dummy1 "wikilink")                                                                                                                                                                                              | None                                                                      |
| 0x040100C4     | ?                                                  | [Control](FS:Control "wikilink")                                                                                                                                                                                            | None                                                                      |
| 0x08010002     | ?                                                  | [Initialize](FS:Initialize "wikilink")                                                                                                                                                                                      | None                                                                      |
| 0x080201C2     | ?                                                  | [OpenFile](FS:OpenFile "wikilink")                                                                                                                                                                                          | None                                                                      |
| 0x08030204     | ?                                                  | [OpenFileDirectly](FS:OpenFileDirectly "wikilink")                                                                                                                                                                          | None                                                                      |
| 0x08040142     | ?                                                  | [DeleteFile](FS:DeleteFile "wikilink")                                                                                                                                                                                      | None                                                                      |
| 0x08050244     | ?                                                  | [RenameFile](FS:RenameFile "wikilink")                                                                                                                                                                                      | None                                                                      |
| 0x08060142     | ?                                                  | [DeleteDirectory](FS:DeleteDirectory "wikilink")                                                                                                                                                                            | None                                                                      |
| 0x08070142     | ?                                                  | [DeleteDirectoryRecursively](FS:DeleteDirectoryRecursively "wikilink")                                                                                                                                                      | None                                                                      |
| 0x08080202     | ?                                                  | [CreateFile](FS:CreateFile "wikilink")                                                                                                                                                                                      | None                                                                      |
| 0x08090182     | ?                                                  | [CreateDirectory](FS:CreateDirectory "wikilink")                                                                                                                                                                            | None                                                                      |
| 0x080A0244     | ?                                                  | [RenameDirectory](FS:RenameDirectory "wikilink")                                                                                                                                                                            | None                                                                      |
| 0x080B0102     | ?                                                  | [OpenDirectory](FS:OpenDirectory "wikilink")                                                                                                                                                                                | None                                                                      |
| 0x080C00C2     | ?                                                  | [OpenArchive](FS:OpenArchive "wikilink")                                                                                                                                                                                    | Each archive ID code has separate access info bitmasks, if it has any     |
| 0x080D0144     | ?                                                  | [ControlArchive](FS:ControlArchive "wikilink")                                                                                                                                                                              | None                                                                      |
| 0x080E0080     | ?                                                  | [CloseArchive](FS:CloseArchive "wikilink")                                                                                                                                                                                  | None                                                                      |
| 0x080F0180     | ?                                                  | [Obsoleted_2_0_FormatThisUserSaveData](FS:Obsoleted_2_0_FormatThisUserSaveData "wikilink")                                                                                                                                  | None                                                                      |
| 0x08100200     | ?                                                  | [Obsoleted_3_0_CreateSystemSaveData](FS:Obsoleted_3_0_CreateSystemSaveData "wikilink")                                                                                                                                      | 0x4, for when the input saveID doesn't match the exheader saveID          |
| 0x08110040     | ?                                                  | [Obsoleted_3_0_DeleteSystemSaveData](FS:Obsoleted_3_0_DeleteSystemSaveData "wikilink")                                                                                                                                      | 0x1004, for when the input saveID doesn't match the exheader saveID       |
| 0x08120080     | ?                                                  | [GetFreeBytes](FS:GetFreeBytes "wikilink")                                                                                                                                                                                  | None                                                                      |
| 0x08130000     | ?                                                  | [GetCardType](FS:GetCardType "wikilink")                                                                                                                                                                                    | 0x1017                                                                    |
| 0x08140000     | ?                                                  | [GetSdmcArchiveResource](FS:GetSdmcArchiveResource "wikilink")                                                                                                                                                              | None                                                                      |
| 0x08150000     | ?                                                  | [GetNandArchiveResource](FS:GetNandArchiveResource "wikilink")                                                                                                                                                              | 0x1007                                                                    |
| 0x08160000     | ?                                                  | [GetSdmcFatfsError](FS:GetSdmcFatfsError "wikilink")                                                                                                                                                                        | 0x2                                                                       |
| 0x08170000     | ?                                                  | [IsSdmcDetected](FS:IsSdmcDetected "wikilink")                                                                                                                                                                              | None                                                                      |
| 0x08180000     | ?                                                  | [IsSdmcWritable](FS:IsSdmcWritable "wikilink")                                                                                                                                                                              | None                                                                      |
| 0x08190042     | ?                                                  | [GetSdmcCid](FS:GetSdmcCid "wikilink")                                                                                                                                                                                      | 0x2                                                                       |
| 0x081A0042     | ?                                                  | [GetNandCid](FS:GetNandCid "wikilink")                                                                                                                                                                                      | 0x2                                                                       |
| 0x081B0000     | ?                                                  | [GetSdmcSpeedInfo](FS:GetSdmcSpeedInfo "wikilink")                                                                                                                                                                          | 0x2                                                                       |
| 0x081C0000     | ?                                                  | [GetNandSpeedInfo](FS:GetNandSpeedInfo "wikilink")                                                                                                                                                                          | 0x2                                                                       |
| 0x081D0042     | ?                                                  | [GetSdmcLog](FS:GetSdmcLog "wikilink")                                                                                                                                                                                      | 0x2                                                                       |
| 0x081E0042     | ?                                                  | [GetNandLog](FS:GetNandLog "wikilink")                                                                                                                                                                                      | 0x2                                                                       |
| 0x081F0000     | ?                                                  | [ClearSdmcLog](FS:ClearSdmcLog "wikilink")                                                                                                                                                                                  | 0x2                                                                       |
| 0x08200000     | ?                                                  | [ClearNandLog](FS:ClearNandLog "wikilink")                                                                                                                                                                                  | 0x2                                                                       |
| 0x08210000     | ?                                                  | [CardSlotIsInserted](FS:CardSlotIsInserted "wikilink")                                                                                                                                                                      | 0x1017                                                                    |
| 0x08220000     | ?                                                  | [CardSlotPowerOn](FS:CardSlotPowerOn "wikilink")                                                                                                                                                                            | 0x2                                                                       |
| 0x08230000     | ?                                                  | [CardSlotPowerOff](FS:CardSlotPowerOff "wikilink")                                                                                                                                                                          | 0x2                                                                       |
| 0x08240000     | ?                                                  | [CardSlotGetCardIFPowerStatus](FS:CardSlotGetCardIFPowerStatus "wikilink")                                                                                                                                                  | 0x2                                                                       |
| 0x08250040     | ?                                                  | [CardNorDirectCommand](FS:CardNorDirectCommand "wikilink")                                                                                                                                                                  | 0x2                                                                       |
| 0x08260080     | ?                                                  | [CardNorDirectCommandWithAddress](FS:CardNorDirectCommandWithAddress "wikilink")                                                                                                                                            | 0x2                                                                       |
| 0x08270082     | ?                                                  | [CardNorDirectRead](FS:CardNorDirectRead "wikilink")                                                                                                                                                                        | 0x2                                                                       |
| 0x082800C2     | ?                                                  | [CardNorDirectReadWithAddress](FS:CardNorDirectReadWithAddress "wikilink")                                                                                                                                                  | 0x2                                                                       |
| 0x08290082     | ?                                                  | [CardNorDirectWrite](FS:CardNorDirectWrite "wikilink")                                                                                                                                                                      | 0x2                                                                       |
| 0x082A00C2     | ?                                                  | [CardNorDirectWriteWithAddress](FS:CardNorDirectWriteWithAddress "wikilink")                                                                                                                                                | 0x2                                                                       |
| 0x082B00C2     | ?                                                  | [CardNorDirectRead_4xIO](FS:CardNorDirectRead_4xIO "wikilink")                                                                                                                                                              | 0x2                                                                       |
| 0x082C0082     | ?                                                  | [CardNorDirectCpuWriteWithoutVerify](FS:CardNorDirectCpuWriteWithoutVerify "wikilink")                                                                                                                                      | 0x2                                                                       |
| 0x082D0040     | ?                                                  | [CardNorDirectSectorEraseWithoutVerify](FS:CardNorDirectSectorEraseWithoutVerify "wikilink")                                                                                                                                | 0x2                                                                       |
| 0x082E0040     | ?                                                  | [GetProductInfo](FS:GetProductInfo "wikilink")                                                                                                                                                                              | 0x1005                                                                    |
| 0x082F0040     | ?                                                  | [GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink")                                                                                                                                                                  | 0x1005                                                                    |
| 0x08300182     | ?                                                  | [Obsoleted_3_0_CreateExtSaveData](FS:Obsoleted_3_0_CreateExtSaveData "wikilink")                                                                                                                                            | 0xC, for when the input extdataID doesn't match the exheader extdataID    |
| 0x08310180     | ?                                                  | [Obsoleted_3_0_CreateSharedExtSaveData](FS:Obsoleted_3_0_CreateSharedExtSaveData "wikilink")                                                                                                                                | 0x1005                                                                    |
| 0x08320102     | ?                                                  | [Obsoleted_3_0_ReadExtSaveDataIcon](FS:Obsoleted_3_0_ReadExtSaveDataIcon "wikilink")                                                                                                                                        | 0x100D, for when the input extdataID doesn't match the exheader extdataID |
| 0x08330082     | ?                                                  | [Obsoleted_3_0_EnumerateExtSaveData](FS:Obsoleted_3_0_EnumerateExtSaveData "wikilink")                                                                                                                                      | 0x1005                                                                    |
| 0x08340082     | ?                                                  | [Obsoleted_3_0_EnumerateSharedExtSaveData](FS:Obsoleted_3_0_EnumerateSharedExtSaveData "wikilink")                                                                                                                          | 0x1005                                                                    |
| 0x08350080     | ?                                                  | [Obsoleted_3_0_DeleteExtSaveData](FS:Obsoleted_3_0_DeleteExtSaveData "wikilink")                                                                                                                                            | 0x100D, for when the input extdataID doesn't match the exheader extdataID |
| 0x08360080     | ?                                                  | [Obsoleted_3_0_DeleteSharedExtSaveData](FS:Obsoleted_3_0_DeleteSharedExtSaveData "wikilink")                                                                                                                                | 0x1005                                                                    |
| 0x08370040     | ?                                                  | [SetCardSpiBaudRate](FS:SetCardSpiBaudRate "wikilink")                                                                                                                                                                      | 0x2                                                                       |
| 0x08380040     | ?                                                  | [SetCardSpiBusMode](FS:SetCardSpiBusMode "wikilink")                                                                                                                                                                        | 0x2                                                                       |
| 0x08390000     | ?                                                  | [SendInitializeInfoTo9](FS:SendInitializeInfoTo9 "wikilink")                                                                                                                                                                | None                                                                      |
| 0x083A0100     | ?                                                  | [GetSpecialContentIndex](FS:GetSpecialContentIndex "wikilink")                                                                                                                                                              | 0x1005                                                                    |
| 0x083B00C2     | ?                                                  | [GetLegacyRomHeader](FS:GetLegacyRomHeader "wikilink")                                                                                                                                                                      | 0x1015                                                                    |
| 0x083C00C2     | ?                                                  | [GetLegacyBannerData](FS:GetLegacyBannerData "wikilink")                                                                                                                                                                    | 0x1015                                                                    |
| 0x083D0100     | ?                                                  | [CheckAuthorityToAccessExtSaveData](FS:CheckAuthorityToAccessExtSaveData "wikilink")                                                                                                                                        | 0x44                                                                      |
| 0x083E00C2     | ?                                                  | [QueryTotalQuotaSize](FS:QueryTotalQuotaSize "wikilink")                                                                                                                                                                    | None                                                                      |
| 0x083F00C0     | ?                                                  | [Obsoleted_3_0_GetExtDataBlockSize](FS:Obsoleted_3_0_GetExtDataBlockSize "wikilink")                                                                                                                                        | None                                                                      |
| 0x08400040     | ?                                                  | [AbnegateAccessRight](FS:AbnegateAccessRight "wikilink")                                                                                                                                                                    | ?                                                                         |
| 0x08410000     | ?                                                  | [DeleteSdmcRoot](FS:DeleteSdmcRoot "wikilink")                                                                                                                                                                              | 0x1005                                                                    |
| 0x08420040     | ?                                                  | [DeleteAllExtSaveDataOnNand](FS:DeleteAllExtSaveDataOnNand "wikilink")                                                                                                                                                      | 0x1005                                                                    |
| 0x08430000     | ?                                                  | [InitializeCtrFileSystem](FS:InitializeCtrFileSystem "wikilink")                                                                                                                                                            | None                                                                      |
| 0x08440000     | ?                                                  | [CreateSeed](FS:CreateSeed "wikilink")                                                                                                                                                                                      | 0x2                                                                       |
| 0x084500C2     | ?                                                  | [GetFormatInfo](FS:GetFormatInfo "wikilink")                                                                                                                                                                                | ?                                                                         |
| 0x08460102     | ?                                                  | [GetLegacyRomHeader2](FS:GetLegacyRomHeader2 "wikilink")                                                                                                                                                                    | 0x1015                                                                    |
| 0x08470180     | ?                                                  | [Obsoleted_2_0_FormatCtrCardUserSaveData](FS:Obsoleted_2_0_FormatCtrCardUserSaveData "wikilink")                                                                                                                            | 0x6                                                                       |
| 0x08480042     | ?                                                  | [GetSdmcCtrRootPath](FS:GetSdmcCtrRootPath "wikilink")                                                                                                                                                                      | 0x100D                                                                    |
| 0x08490040     | ?                                                  | [GetArchiveResource](FS:GetArchiveResource "wikilink")                                                                                                                                                                      | ?                                                                         |
| 0x084A0002     | ?                                                  | [ExportIntegrityVerificationSeed](FS:ExportIntegrityVerificationSeed "wikilink")                                                                                                                                            | 0x4000                                                                    |
| 0x084B0002     | ?                                                  | [ImportIntegrityVerificationSeed](FS:ImportIntegrityVerificationSeed "wikilink")                                                                                                                                            | 0x4000                                                                    |
| 0x084C0242     | ?                                                  | [FormatSaveData](FS:FormatSaveData "wikilink")                                                                                                                                                                              | 0x6, in some cases this write isn't needed however                        |
| 0x084D0102     | ?                                                  | [GetLegacySubBannerData](FS:GetLegacySubBannerData "wikilink")                                                                                                                                                              | 0x1015                                                                    |
| 0x084E0342     | ?                                                  | [UpdateSha256Context](FS:UpdateSha256Context "wikilink")                                                                                                                                                                    | 0x5                                                                       |
| 0x084F0102     | ?                                                  | [ReadSpecialFile](FS:ReadSpecialFile "wikilink")                                                                                                                                                                            | None                                                                      |
| 0x08500040     | ?                                                  | [GetSpecialFileSize](FS:GetSpecialFileSize "wikilink")                                                                                                                                                                      | None                                                                      |
| 0x08510242     | [3.0.0-5](3.0.0-5 "wikilink")                      | [CreateExtSaveData](FS:CreateExtSaveData "wikilink")                                                                                                                                                                        | Shared extdata: 0x101005. Regular extdata in certain cases: 0xC           |
| 0x08520100     | [3.0.0-5](3.0.0-5 "wikilink")                      | [DeleteExtSaveData](FS:DeleteExtSaveData "wikilink")                                                                                                                                                                        | Shared extdata: 0x101005. Regular extdata in certain cases: 0x10100D      |
| 0x08530142     | [3.0.0-5](3.0.0-5 "wikilink")                      | [ReadExtSaveDataIcon](FS:ReadExtSaveDataIcon "wikilink")                                                                                                                                                                    | 0x10100D (this doesn't apply in certain cases, however)                   |
| 0x085400C0     | [3.0.0-5](3.0.0-5 "wikilink")                      | [GetExtDataBlockSize](FS:GetExtDataBlockSize "wikilink")                                                                                                                                                                    | 0x10100D (this doesn't apply in certain cases, however)                   |
| 0x08550102     | [3.0.0-5](3.0.0-5 "wikilink")                      | [EnumerateExtSaveData](FS:EnumerateExtSaveData "wikilink")                                                                                                                                                                  | 0x101005                                                                  |
| 0x08560240     | [3.0.0-5](3.0.0-5 "wikilink")                      | [CreateSystemSaveData](FS:CreateSystemSaveData "wikilink")                                                                                                                                                                  | 0x4 (this doesn't apply in certain cases, however)                        |
| 0x08570080     | [3.0.0-5](3.0.0-5 "wikilink")                      | [DeleteSystemSaveData](FS:DeleteSystemSaveData "wikilink")                                                                                                                                                                  | 0x1004 (this doesn't apply in certain cases, however)                     |
| 0x08580000     | [3.0.0-5](3.0.0-5 "wikilink")                      | [StartDeviceMoveAsSource](FS:StartDeviceMoveAsSource "wikilink")                                                                                                                                                            | 0x2004                                                                    |
| 0x08590200     | [3.0.0-5](3.0.0-5 "wikilink")                      | [StartDeviceMoveAsDestination](FS:StartDeviceMoveAsDestination "wikilink")                                                                                                                                                  | 0x2004                                                                    |
| 0x085A00C0     | [3.0.0-5](3.0.0-5 "wikilink")                      | [SetArchivePriority](FS:SetArchivePriority "wikilink")                                                                                                                                                                      | None                                                                      |
| 0x085B0080     | [3.0.0-5](3.0.0-5 "wikilink")                      | [GetArchivePriority](FS:GetArchivePriority "wikilink")                                                                                                                                                                      | None                                                                      |
| 0x085C00C0     | [3.0.0-5](3.0.0-5 "wikilink")                      | [SetCtrCardLatencyParameter](FS:SetCtrCardLatencyParameter "wikilink")                                                                                                                                                      | 0xE                                                                       |
| 0x085D01C0     | [3.0.0-5](3.0.0-5 "wikilink")                      | [SetFsCompatibilityInfo](FS:SetFsCompatibilityInfo "wikilink")                                                                                                                                                              | 0x100001                                                                  |
| 0x085E0040     | [3.0.0-5](3.0.0-5 "wikilink")                      | [ResetCardCompatibilityParameter](FS:ResetCardCompatibilityParameter "wikilink")                                                                                                                                            | 0xE                                                                       |
| 0x085F0040     | [3.0.0-5](3.0.0-5 "wikilink")                      | [SwitchCleanupInvalidSaveData](FS:SwitchCleanupInvalidSaveData "wikilink")                                                                                                                                                  | 0x12004                                                                   |
| 0x08600042     | [3.0.0-5](3.0.0-5 "wikilink")                      | [EnumerateSystemSaveData](FS:EnumerateSystemSaveData "wikilink")                                                                                                                                                            | 0x2004                                                                    |
| 0x08610042     | [3.0.0-5](3.0.0-5 "wikilink")                      | [InitializeWithSdkVersion](FS:InitializeWithSdkVersion "wikilink")                                                                                                                                                          | None                                                                      |
| 0x08620040     | [3.0.0-5](3.0.0-5 "wikilink")                      | [SetPriority](FS:SetPriority "wikilink")                                                                                                                                                                                    | None                                                                      |
| 0x08630000     | [3.0.0-5](3.0.0-5 "wikilink")                      | [GetPriority](FS:GetPriority "wikilink")                                                                                                                                                                                    | None                                                                      |
| 0x08640000     | [3.0.0-5](3.0.0-5 "wikilink")                      | [Obsoleted_4_0_GetNandInfo](FS:Obsoleted_4_0_GetNandInfo "wikilink")                                                                                                                                                        | Stubbed, this returns an error                                            |
| 0x08650140     | [4.0.0-7](4.0.0-7 "wikilink")                      | [SetSaveDataSecureValue](FS:SetSaveDataSecureValue "wikilink")                                                                                                                                                              | 0x121004 (in certain cases this doesn't apply, however)                   |
| 0x086600C0     | [4.0.0-7](4.0.0-7 "wikilink")                      | [GetSaveDataSecureValue](FS:GetSaveDataSecureValue "wikilink")                                                                                                                                                              | 0x121004 (in certain cases this doesn't apply, however)                   |
| 0x086700C4     | [4.0.0-7](4.0.0-7 "wikilink")                      | [ControlSecureSave](FS:ControlSecureSave "wikilink")                                                                                                                                                                        | 0x121004                                                                  |
| 0x08680000     | [4.0.0-7](4.0.0-7 "wikilink")                      | [GetMediaType](FS:GetMediaType "wikilink")                                                                                                                                                                                  | None                                                                      |
| 0x08690000     | [4.0.0-7](4.0.0-7 "wikilink")                      | [Obsoleted_4_0_GetNandEraseCount](FS:Obsoleted_4_0_GetNandEraseCount "wikilink")                                                                                                                                            | Stubbed, this returns an error.                                           |
| 0x086A0082     | [4.0.0-7](4.0.0-7 "wikilink")                      | [ReadNandReport](FS:ReadNandReport "wikilink")                                                                                                                                                                              | None                                                                      |
| 0x086B00C2     | ?                                                  | SetOtherSaveDataSecureValue                                                                                                                                                                                                 | 00121004                                                                  |
| 0x086C00C2     | ?                                                  | GetOtherSaveDataSecureValue                                                                                                                                                                                                 | 00121004                                                                  |
| 0x086D0040     | ?                                                  | ?                                                                                                                                                                                                                           | 00020004                                                                  |
| 0x086E00C0     | Related to Secure Value? Used in Pokemon Sun/Moon. | SetThisSaveDataSecureValue                                                                                                                                                                                                  | None?                                                                     |
| 0x086F0040     | Related to Secure Value? Used in Pokemon Sun/Moon. | GetThisSaveDataSecureValue                                                                                                                                                                                                  | 0xE                                                                       |
| 0x087000C2     | ?                                                  | ?                                                                                                                                                                                                                           | None?                                                                     |
| 0x08710100     | ?                                                  | ?                                                                                                                                                                                                                           | 0xC                                                                       |
| 0x087201C0     | ?                                                  | ?                                                                                                                                                                                                                           | 00080004                                                                  |
| 0x087300C0     | ?                                                  | ?                                                                                                                                                                                                                           | 00080004                                                                  |
| 0x08740000     | ?                                                  | ?                                                                                                                                                                                                                           | 00080004                                                                  |
| 0x08750140     | ?                                                  | ?                                                                                                                                                                                                                           | None?                                                                     |
| 0x087600C0     | ?                                                  | ?                                                                                                                                                                                                                           | None?                                                                     |
| 0x08770100     | ?                                                  | ?                                                                                                                                                                                                                           | ?                                                                         |
| 0x087800C0     | ?                                                  | ?                                                                                                                                                                                                                           | ?                                                                         |
| 0x087900C2     | ?                                                  | Same as GetLegacyBannerData, except for the last parameter this passes u8 value 0x1 instead of 0x0, for the FSPXI command.                                                                                                  | 0x00101015                                                                |
| 0x087A0180     | [9.6.0-X](9.6.0-24 "wikilink")                     | [AddSeed](FS:AddSeed "wikilink")                                                                                                                                                                                            | 0x00200000                                                                |
| 0x087B....     | [9.6.0-X](9.6.0-24 "wikilink")                     | Wrapper for the code internally used for command \<0x087A....\>.                                                                                                                                                            | 0x00200000                                                                |
| 0x087C....     | [9.6.0-X](9.6.0-24 "wikilink")                     | Eventually calls same code as command \<0x087A....\>.                                                                                                                                                                       | 0x00200000                                                                |
| 0x087D0000     | [9.6.0-X](9.6.0-24 "wikilink")                     | GetNumSeeds. Writes the number of seeds to cmdreply\[2\]                                                                                                                                                                    | 0x00200000                                                                |
| 0x087E0042     | [9.6.0-X](9.6.0-24 "wikilink")                     | Eventually calls same code as command \<0x087A....\>. Writes a list of titleIDs to the outbuf, this is for titles with content-lock-seed(s) stored in SEEDDB. (u32 total_titleids_probably, ((Size\<\<4) \| 12), outbufptr) | 0x00200000                                                                |
| 0x087F....     | [9.6.0-X](9.6.0-24 "wikilink")                     | ?                                                                                                                                                                                                                           | 0x00200000                                                                |
| 0x0880....     | [9.6.0-X](9.6.0-24 "wikilink")                     | Eventually calls same code as command \<0x087A....\>.                                                                                                                                                                       | 0x00200000                                                                |
| 0x0881....     | [9.6.0-X](9.6.0-24 "wikilink")                     | Eventually calls same code as command \<0x087A....\>.                                                                                                                                                                       | 0x00200000                                                                |
| 0x0882....     | [9.6.0-X](9.6.0-24 "wikilink")                     | Eventually calls same code as command \<0x087A....\>.                                                                                                                                                                       | 0x00200000                                                                |
| 0x08830000     | [9.6.0-X](9.6.0-24 "wikilink")                     | Writes an output value to cmdreply\[2\].                                                                                                                                                                                    | 0x00200000                                                                |
| 0x08840042     | [9.6.0-X](9.6.0-24 "wikilink")                     | Eventually calls same code as command \<0x087A....\>.                                                                                                                                                                       | 0x00200000                                                                |
| 0x0885....     | [9.6.0-X](9.6.0-24 "wikilink")                     | ?                                                                                                                                                                                                                           | 0x00200000                                                                |
| 0x088600C0     | [11.1.0-X](11.1.0-34 "wikilink")                   | [CheckUpdatedDat](FS:CheckUpdatedDat "wikilink")                                                                                                                                                                            | 0x00080000                                                                |

Note: The question marks from Dummy1 to GetSpecialFileSize on the
"available since system version" field are mainly there because I think
that most of these are necessary for the main system to function, so
theoretically that would mean that since the creation of the 3DS these
were available, or since launch if that makes more sense. But because of
the peculiar nature of some of the functions, they will remain question
marks until they can be confirmed 100%.

When access rights are required for a command, at least one of the bits
in the process access info specified in the above table for the command
must be set. Error 0xD9004676 is returned when a process attempts to use
a command which it doesn't have access rights for the command. The
exheader access info field is all zero's for most applications. Note
that the permissions listed in the above table is for system-version
v2.x, therefore permission bit(s) added with newer FIRM may be missing
from this.

Each session for fs:USER has separate permissions, initially these are
set to all zero's for new fs:USER sessions. The permissions/etc for
fs:USER sessions are initialized via
[FS:Initialize](FS:Initialize "wikilink")(loaded from the user process
exheader).

## Filesystem service "fs:LDR"

This service is identical to fs:USER, except
[FS:OpenArchive](FS:OpenArchive "wikilink") archive 0x2345678E can only
be accessed with fs:LDR.

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

Only two sessions can be opened for this service at a time, hence no
other processes can use this due to
[pm-module](Process_Manager_Services "wikilink") and
[loader](Loader_Services "wikilink") using this.

# File and directory access

## Files

File session handles obtained via [FS:OpenFile](FS:OpenFile "wikilink")
and [FS:OpenFileDirectly](FS:OpenFileDirectly "wikilink") can be used to
access files through a service-like interface, despite not being an
actual service registered using
[SRV:RegisterService](SRV:RegisterService "wikilink"). To use this
service-like interface, simply call the SendSyncRequest SVC with a file
session handle, using the IPC buffer in thread-local storage for
parameters and responses, just like you would with a proper service.

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

Directory session handles obtained via
[FS:OpenDirectory](FS:OpenDirectory "wikilink") are usable via a
service-like interface, following the exact same procedure described
above for file sessions.

| Command Header | Available since system version | Description                                 |
|----------------|--------------------------------|---------------------------------------------|
| 0x000100C6     | [1.0.0-0](1.0.0-0 "wikilink")  | [Dummy1](FSDir:Dummy1 "wikilink")           |
| 0x040100C4     | [1.0.0-0](1.0.0-0 "wikilink")  | [Control](FSDir:Control "wikilink")         |
| 0x08010042     | [1.0.0-0](1.0.0-0 "wikilink")  | [Read](FSDir:Read "wikilink")               |
| 0x08020000     | [1.0.0-0](1.0.0-0 "wikilink")  | [Close](FSDir:Close "wikilink")             |
| 0x08030040     | ?                              | [SetPriority](FSDir:SetPriority "wikilink") |
| 0x08040000     | ?                              | [GetPriority](FSDir:GetPriority "wikilink") |

# Archives

| ArchiveId  | Description                                                                                                                                                          | Accessible via [FS](Filesystem_services "wikilink") | Accessible via [FSPXI](Filesystem_services_PXI "wikilink") | Only accessible by Process9 internally | Requires binary [Lowpath](FS:OpenFile "wikilink") | Required exheader FS access info bitmask                             |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|------------------------------------------------------------|----------------------------------------|---------------------------------------------------|----------------------------------------------------------------------|
| 0x00000003 | SelfNCCH (including [RomFS](#romfs "wikilink"))                                                                                                                      | Yes                                                 | No                                                         | No                                     | No                                                | None                                                                 |
| 0x00000004 | SaveData (the saveID/mediatype for this is loaded from data originally from the user process' exheader)                                                              | Yes                                                 | No                                                         | No                                     | No                                                | None                                                                 |
| 0x00000006 | ExtSaveData                                                                                                                                                          | Yes                                                 | No                                                         | No                                     | Yes                                               | 0x100D, when the input extdataID isn't listed in the exheader.       |
| 0x00000007 | Shared ExtSaveData                                                                                                                                                   | Yes                                                 | No                                                         | No                                     | Yes                                               | None                                                                 |
| 0x00000008 | SystemSaveData                                                                                                                                                       | Yes                                                 | No                                                         | No                                     | Yes                                               | 0x4, when the input saveID doesn't match the exheader system-saveID. |
| 0x00000009 | SDMC                                                                                                                                                                 | Yes                                                 | Yes                                                        | No                                     | No                                                | 0x8E                                                                 |
| 0x0000000A | SDMC Write-Only                                                                                                                                                      | Yes                                                 | No                                                         | No                                     | No                                                | 0x808E                                                               |
| 0x12345678 | ExtSaveData for BOSS                                                                                                                                                 | Yes                                                 | No                                                         | No                                     | Yes                                               | 0x44                                                                 |
| 0x12345679 | CARD SPI FS                                                                                                                                                          | Yes                                                 | Yes                                                        | No                                     | No                                                | 0x16                                                                 |
| 0x1234567B | ExtSaveData, and ExtSaveData for BOSS                                                                                                                                | No                                                  | Yes                                                        | No                                     | Yes                                               |                                                                      |
| 0x1234567C | SystemSaveData                                                                                                                                                       | No                                                  | Yes                                                        | No                                     | Yes                                               |                                                                      |
| 0x1234567D | NAND RW                                                                                                                                                              | Yes                                                 | Yes                                                        | No                                     | No                                                | 0x800                                                                |
| 0x1234567E | NAND RO                                                                                                                                                              | Yes                                                 | Yes                                                        | No                                     | No                                                | 0x200                                                                |
| 0x1234567F | NAND RO Write FS                                                                                                                                                     | No                                                  | Yes                                                        | No                                     | No                                                | ?                                                                    |
| 0x12345680 | Unknown. There's code for this in spider v9.9, but that code isn't actually used.                                                                                    | Yes                                                 | ?                                                          | No                                     | Yes                                               | ?                                                                    |
| 0x12345681 | Unknown. Accessed by FS service.                                                                                                                                     | ?                                                   | ?                                                          | No                                     | ?                                                 | ?                                                                    |
| 0x12345682 | Unknown. There's code for this in spider v9.9, but that code isn't actually used.                                                                                    | Yes                                                 | ?                                                          | No                                     | Yes                                               | ?                                                                    |
| 0x2345678A | Used for accessing general NCCH data. With FSPXI this also allows savedata access.                                                                                   | Yes                                                 | Yes                                                        | No                                     | Yes                                               | 0x1005                                                               |
| 0x2345678B | ?                                                                                                                                                                    | No                                                  | No                                                         | Yes                                    | Yes                                               |                                                                      |
| 0x2345678C | Used internally to access [/dbs](Title_Database "wikilink") files?                                                                                                   | No                                                  | No                                                         | Yes                                    | Yes                                               |                                                                      |
| 0x2345678D | ?                                                                                                                                                                    | No                                                  | No                                                         | Yes                                    | No                                                |                                                                      |
| 0x2345678E | FSPXI: Similar to archive 0x2345678A. For fs:LDR(used by the "loader" FIRM ARM11-process), only ExeFS. Not accessible with fs:USER.                                  | Yes                                                 | Yes                                                        | No                                     | Yes                                               | None, see description.                                               |
| 0x567890AB | NAND CTR FS                                                                                                                                                          | No                                                  | Yes                                                        | No                                     | No                                                | ?                                                                    |
| 0x567890AC | TWL PHOTO                                                                                                                                                            | Yes                                                 | Yes                                                        | No                                     | No                                                | ?                                                                    |
| 0x567890AD | TWLS (DSi Sound stores recordings here). This is mapped to the FAT12 image stored in the file at [Twln/shared2/0000](Twln/shared2/0000 "wikilink").                  | No                                                  | Yes                                                        | No                                     | No                                                | ?                                                                    |
| 0x567890AE | NAND TWL FS                                                                                                                                                          | Yes                                                 | Yes                                                        | No                                     | No                                                | 0x100                                                                |
| 0x567890AF | NAND W FS                                                                                                                                                            | Yes                                                 | Yes                                                        | No                                     | No                                                | 0x100                                                                |
| 0x567890B0 | ?                                                                                                                                                                    | No                                                  | Yes                                                        | No                                     | No                                                |                                                                      |
| 0x567890B1 | Gamecard SaveData (for check). This is a wrapper for UserSaveDataForCheck: the OpenArchive code for that is called with archive-lowpath TID=0/mediatype=2(gamecard). | Yes                                                 | No                                                         | No                                     | No                                                | 0x6                                                                  |
| 0x567890B2 | UserSaveData (for check). This is the same as the regular SaveData archive, except with this the savedata ID and mediatype is loaded from the input archive lowpath. | Yes                                                 | No                                                         | No                                     | Yes                                               | 0x6                                                                  |
| 0x567890B4 | Similar to 0x567890B2 but can only access Accessible Save specified in [exheader](NCCH/Extended_Header#Storage_Info "wikilink")?                                     | Yes                                                 | No                                                         | No                                     | Yes                                               | ?                                                                    |

Archives listed as not requiring a binary lowpath, use lowpath type
[empty](FS:OpenFile "wikilink").

The above permission bitmasks are from v2.x, see the above Services
section for how these are handled.

Archives CTR NAND, NAND RO Write FS, TWL NAND, NAND W FS, and CARD SPI
FS require the corresponding process exheader access control mount flag
to be set, in the exheader for any of the currently running ARM11
processes, for [FSPXI](Filesystem_services_PXI "wikilink"). The access
rights checked by [FS](Filesystem_services "wikilink") module for
archive mounting with fs:USER, are stored in the process' exheader
accessinfo.

The CARDSPI archive allows access to the gamecard CARD1 raw savedata
flash(aka "cardspi:/" in [Process9](FIRM "wikilink")), the file lowpath
must be WCHAR "/". The "NAND W FS" archive allows access to the raw NAND
image(aka "wnand:/" in Process9), the file lowpath must be WCHAR "/".

# Filenames and Paths

PathType:

| Value | Description                                                                                                                                                 |
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| -1    | Returned internally by Process9, when errors occur it seems(in particular when no nul-terminator was found in the input path). The data ptr is set to NULL. |
| 0x0   | INVALID - Specifies an invalid path                                                                                                                         |
| 0x1   | EMPTY - Specifies an empty path                                                                                                                             |
| 0x2   | BINARY - Non-text based path. Meaning is per-archive                                                                                                        |
| 0x3   | ASCII - Text-based path with 7-bit ASCII characters padded to 8-bits each (signed char)                                                                     |
| 0x4   | UTF16 - Text-based path with UTF-16 characters                                                                                                              |

In IPC requests, sizes of ASCII and UTF16 paths must include space for
the null-terminator.

## Binary LowPath

The format of the data that a binary LowPath points to is custom per
archive.

### SelfNCCH File Path Data Format

<table>
<thead>
<tr class="header">
<th>Index word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Type:</p>
<ul>
<li>0x0: RomFS</li>
<li>0x1: error 0xD9004676</li>
<li>0x2: ExeFS</li>
<li>0x3: Error 0xE0E046BE.</li>
<li>0x4: FS-module crashes on this</li>
<li>0x5: Update RomFS?</li>
</ul></td>
</tr>
<tr class="even">
<td><p>1-2</p></td>
<td><p>File name for ExeFS ("icon"/"banner"/"logo"). ".code" is not
allowed</p></td>
</tr>
</tbody>
</table>

Note that ExeFS files only support reading from offset=0 and with
size=file_size.

### SystemSaveData Archive Path Data Format

#### FS

| Index word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | [Mediatype](Mediatypes "wikilink") (must be zero for NAND) |
| 1          | saveid                                                     |

The file/directory lowpath is a text lowpath in the
[savegame](Savegames "wikilink") filesystem.

#### FSPXI

| Index word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | u8 [Mediatype](Mediatypes "wikilink") (must be zero for NAND) |

The file lowpath is a binary lowpath containing the u64 saveid, however
the high word of the saveid is always zero. The mounted file is the
cleartext savegame image. Up to 32 SystemSaveData image files can be
opened under a single mounted FSPXI archive.

### UserSaveDataForCheck Archive Path Data Format

| Index word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | [Mediatype](Mediatypes "wikilink") (must be non-zero) |
| 1          | Lower word saveid                                     |
| 2          | Upper word saveid                                     |

The file/directory lowpath for this FS archive is a text path in the
[savegame](Savegames "wikilink") filesystem.

### 0x567890B4 Archive Path Data Format

| Index word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | [Mediatype](Mediatypes "wikilink")                                  |
| 1          | `Lower_word_saveid >> 8` ?                                          |
| 2          | Unknown. Game calculate this using formula `0xFFFFFF00 | unknown_b` |

### ExtSaveData Archive Path Data Format

| Index word | Description                        |
|------------|------------------------------------|
| 0          | [Mediatype](Mediatypes "wikilink") |
| 1          | Lower word saveid                  |
| 2          | Upper word saveid                  |

For FS, the file/directory lowpath is a text path in the
[extdata](extdata "wikilink") filesystem. For FSPXI, the file lowpath is
a text path relative to the "/extdata/<ExtdataIDHigh>/<ExtdataIDLow>"
directory on SD/NAND, for the cleartext extdata image to mount.

### 0x2345678A Archive Path Data Format

| Index word | Description                                                                                               |
|------------|-----------------------------------------------------------------------------------------------------------|
| 0          | Lower word programID                                                                                      |
| 1          | Upper word programID                                                                                      |
| 2          | ([Mediatype](Mediatypes "wikilink") & 0xFF) \| (uninitialized_data? & 0xFFFFFF00)                         |
| 3          | Number of something? Hardcoded per-archive, 0 for ExeFS, 200 for area:, 100 for rate:, 40 for eula:, etc. |

File lowpath:

| Index word | Description                                                                                                                         |
|------------|-------------------------------------------------------------------------------------------------------------------------------------|
| 0          | 0 for NCCH data, 1 for savedata. The latter is only valid for FSPXI. Value 2 is allowed via archive 0x3, it's unknown what this is. |
| 1          | TMD content index / NCSD partition index.                                                                                           |
| 2          | Type: 0=romfs(0 for non-NCCH as well), 1=exefs ".code"(?), 2=exefs "icon"/"banner"/"logo", 3=unknown, 4=unknown, 5=unknown.         |
| 3-4        | Filename for ExeFS.                                                                                                                 |

The 0x14-byte lowpath is all-zero for accessing the title's main RomFS.

### [RomFS](RomFS "wikilink")

Archives 0x3 and 0x2345678E both allow for accessing the [level-3 IVFC
images](RomFS#Level_3_Format "wikilink") for RomFS access. The main CXI
RomFS is accessible via an all-zero 0xc-byte binary file-lowpath. The
update RomFS can be accessed with the first u32 in the binary
file-lowpath being set to 0x5. The user must handle parsing the
filesystem used in the exposed image itself.

With FSPXI the returned data for RomFS is the entire RomFS section from
the NCCH, starting at the IVFC header.

The 0x3 archive is an interface for the 0x2345678E archive with the
current process programID+mediatype. The file lowpath is 3-words. These
words are written to 0x2345678E-archive file_lowpath+0, with the rest of
that lowpath set to all-zero(lowpath is different from archive
0x2345678A). File lowpath:

<table>
<thead>
<tr class="header">
<th>Index word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>See above. The only values which FS-module doesn't allow to be
used here are:</p>
<ul>
<li>0x1: Error 0xE0E046BE.</li>
<li>0x3: Error 0xE0E046BE.</li>
<li>0x4: FS-module executes svcBreak when using this.</li>
</ul></td>
</tr>
<tr class="even">
<td><p>1-2</p></td>
<td><p>See above. Not validated by FS-module.</p></td>
</tr>
</tbody>
</table>

# SEEDDB

With [9.6.0-X](9.6.0-24 "wikilink") new
[System_SaveData](System_SaveData "wikilink") with saveID 0001000F was
added, this seems to be handled by FS-module itself, probably via the
new service-cmds added to fsuser. [Home Menu](Home_Menu "wikilink") and
[NIM](NIM_Services "wikilink") module have access to those commands.

The SEEDDB savedata contains the title-unique seed-data used for the new
[NCCH](NCCH "wikilink") keyY generation added with FIRM
[9.6.0-X](9.6.0-24 "wikilink").

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
| 0x21C  | 0x4   | [Attributes](Filesystem_services#Attributes "wikilink") |
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
| 0x8    | 0x1  | [Media Type](Filesystem_services#MediaType "wikilink") |
| 0x9    | 0x7  | Padding                                                |

## ProductInfo

| Offset | Size | Description      |
|--------|------|------------------|
| 0x0    | 0x10 | Product Code     |
| 0x10   | 0x2  | Company Code     |
| 0x12   | 0x2  | Remaster Version |

## IntegrityVerificationSeed

| Offset | Size  | Description                                                                                                                      |
|--------|-------|----------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x10  | AES-CBC MAC over a SHA256 hash, which hashes the first 0x110-bytes of the cleartext SEED.                                        |
| 0x10   | 0x120 | The [nand/private/movable.sed](nand/private/movable.sed "wikilink"), encrypted with AES-CBC using the above MAC for the counter. |

## ExtSaveDataInfo

| Offset | Size | Description                                            |
|--------|------|--------------------------------------------------------|
| 0x0    | 0x1  | [Media Type](Filesystem_services#MediaType "wikilink") |
| 0x1    | 0x1  | Unknown                                                |
| 0x2    | 0x2  | Reserved                                               |
| 0x4    | 0x8  | Save ID                                                |
| 0xC    | 0x4  | Reserved                                               |

## SystemSaveDataInfo

| Offset | Size | Description                                            |
|--------|------|--------------------------------------------------------|
| 0x0    | 0x1  | [Media Type](Filesystem_services#MediaType "wikilink") |
| 0x1    | 0x1  | Unknown                                                |
| 0x2    | 0x2  | Reserved                                               |
| 0x4    | 0x4  | Save ID                                                |

## SecureValueSlot

| Value  | Description    |
|--------|----------------|
| 0x1000 | SD Application |

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

| Value | Description |
|-------|-------------|
| 0x1   | Update      |
| 0x2   | Manual      |
| 0x3   | DLP Child   |

## DeviceMoveContext

| Offset | Size | Description       |
|--------|------|-------------------|
| 0x0    | 0x10 | IVs               |
| 0x10   | 0x10 | Encrypt Parameter |

# Errors

See [Filesystem_services_PXI](Filesystem_services_PXI "wikilink").

[Category:Services](Category:Services "wikilink")

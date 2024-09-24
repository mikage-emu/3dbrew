# Config service "cfg:u"

| Command Header | Available since system version  | Description                                                                                                                 |
|----------------|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| 0x00010082     |                                 | [GetConfigInfoBlk2](CfgS:GetConfigInfoBlk2 "wikilink")/GetConfig                                                            |
| 0x00020000     |                                 | [SecureInfoGetRegion](Cfg:SecureInfoGetRegion "wikilink")/GetRegion                                                         |
| 0x00030040     |                                 | [GenHashConsoleUnique](Cfg:GenHashConsoleUnique "wikilink")/GetTransferableId                                               |
| 0x00040000     | [3.0.0-5](3.0.0-5 "wikilink")   | [GetRegionCanadaUSA](Cfg:GetRegionCanadaUSA "wikilink")/IsCoppacsSupported                                                  |
| 0x00050000     | [5.0.0-11](5.0.0-11 "wikilink") | [GetSystemModel](Cfg:GetSystemModel "wikilink")                                                                             |
| 0x00060000     | [6.0.0-11](6.0.0-11 "wikilink") | [GetModelNintendo2DS](Cfg:GetModelNintendo2DS "wikilink")                                                                   |
| 0x00070040     | [7.0.0-13](7.0.0-13 "wikilink") | (u8 val) This writes the input u8 to the first byte in the config-block for blkID [0x00160000](Config_Savegame "wikilink"). |
| 0x00080080     | [7.0.0-13](7.0.0-13 "wikilink") | [TranslateCountryInfo](Cfg:TranslateCountryInfo "wikilink")                                                                 |
| 0x00090040     | [7.0.0-13](7.0.0-13 "wikilink") | [GetCountryCodeString](Cfg:GetCountryCodeString "wikilink")                                                                 |
| 0x000A0040     | [7.0.0-13](7.0.0-13 "wikilink") | [GetCountryCodeID](Cfg:GetCountryCodeID "wikilink")                                                                         |
| 0x000B0000     | [9.3.0-X](9.3.0-21 "wikilink")  | IsFangateSupported                                                                                                          |

# Config service "cfg:s"

cfg:s contains all the commands in cfg:u, in addition to the following:

| Command Header | Available since system version | Description                                                             |
|----------------|--------------------------------|-------------------------------------------------------------------------|
| 0x04010082     |                                | [GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink")                  |
| 0x04020082     |                                | [SetConfigInfoBlk4](CfgS:SetConfigInfoBlk4 "wikilink")                  |
| 0x04030000     |                                | [UpdateConfigNANDSavegame](Cfg:UpdateConfigNANDSavegame "wikilink")     |
| 0x04040042     |                                | [GetLocalFriendCodeSeedData](Cfg:GetLocalFriendCodeSeedData "wikilink") |
| 0x04050000     |                                | [GetLocalFriendCodeSeed](CfgS:GetLocalFriendCodeSeed "wikilink")        |
| 0x04060000     |                                | [SecureInfoGetRegion](Cfg:SecureInfoGetRegion "wikilink")               |
| 0x04070000     |                                | [SecureInfoGetByte101](CfgS:SecureInfoGetByte101 "wikilink")            |
| 0x04080042     |                                | [SecureInfoGetSerialNo](CfgS:SecureInfoGetSerialNo "wikilink")          |
| 0x04090000     |                                | [UpdateConfigBlk00040003](Cfg:UpdateConfigBlk00040003 "wikilink")       |
| 0x040A0000     | ?                              | ?                                                                       |
| 0x040B0000     | ?                              | ?                                                                       |
| 0x040C0000     | ?                              | ?                                                                       |
| 0x040D0040     |                                | SetUUIDClockSequence                                                    |
| 0x040E0000     |                                | GetUUIDClockSequence                                                    |
| 0x040F0000     |                                | [ClearParentalControls](CfgS:ClearParentalControls "wikilink")          |

CfgS command 0x04060000(SecureInfoGetRegion) is used by NIM module to
determine the SOAP RegionId, when sending SOAP requests. See
[here](Nandrw/sys/SecureInfo_A "wikilink").

# Config service "cfg:i"

cfg:i contains all the commands in cfg:u and cfg:s, in addition to the
following:

| Command Header | Available since system version | Description                                                                                                                                          |
|----------------|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x08010082     |                                | [GetConfigInfoBlk8](CfgS:GetConfigInfoBlk8 "wikilink")                                                                                               |
| 0x08020082     |                                | [SetConfigInfoBlk4](CfgS:SetConfigInfoBlk4 "wikilink")                                                                                               |
| 0x08030000     |                                | [UpdateConfigNANDSavegame](Cfg:UpdateConfigNANDSavegame "wikilink")                                                                                  |
| 0x080400C2     |                                | [CreateConfigInfoBlk](CfgI:CreateConfigInfoBlk "wikilink")                                                                                           |
| 0x08050000     |                                | [DeleteConfigNANDSavefile](CfgI:DeleteConfigNANDSavefile "wikilink")                                                                                 |
| 0x08060000     |                                | [FormatConfig](CfgI:FormatConfig "wikilink")                                                                                                         |
| 0x08070000     |                                | This basically just returns result-code value 0x0, due to code this eventually executes being NOPed out.                                             |
| 0x08080000     |                                | This updates the config blocks for blkIDs 0x0 and 0x20000. In certain cases this may call the code for [FormatConfig](CfgI:FormatConfig "wikilink"). |
| 0x08090000     |                                | This updates the config block for blkID 0x60000.                                                                                                     |
| 0x080A0000     |                                | ResetAnalogStickCalibrationParam? This updates the config block for blkID 0x00040001.                                                                |
| 0x080B0082     |                                | [SetGetLocalFriendCodeSeedData](CfgI:SetGetLocalFriendCodeSeedData "wikilink")                                                                       |
| 0x080C0042     |                                | [SetLocalFriendCodeSeedSignature](CfgI:SetLocalFriendCodeSeedSignature "wikilink")                                                                   |
| 0x080D0000     |                                | [DeleteCreateNANDLocalFriendCodeSeed](CfgI:DeleteCreateNANDLocalFriendCodeSeed "wikilink")                                                           |
| 0x080E0000     |                                | [VerifySigLocalFriendCodeSeed](CfgI:VerifySigLocalFriendCodeSeed "wikilink")                                                                         |
| 0x080F0042     |                                | [GetLocalFriendCodeSeedData](Cfg:GetLocalFriendCodeSeedData "wikilink")                                                                              |
| 0x08100000     |                                | [GetLocalFriendCodeSeed](CfgS:GetLocalFriendCodeSeed "wikilink")                                                                                     |
| 0x08110084     |                                | [SetSecureInfo](CfgI:SetSecureInfo "wikilink")                                                                                                       |
| 0x08120000     |                                | [DeleteCreateNANDSecureInfo](CfgI:DeleteCreateNANDSecureInfo "wikilink")                                                                             |
| 0x08130000     |                                | [VerifySigSecureInfo](CfgI:VerifySigSecureInfo "wikilink")                                                                                           |
| 0x08140042     |                                | [SecureInfoGetData](CfgI:SecureInfoGetData "wikilink")                                                                                               |
| 0x08150042     |                                | [SecureInfoGetSignature](CfgI:SecureInfoGetSignature "wikilink")                                                                                     |
| 0x08160000     |                                | [SecureInfoGetRegion](Cfg:SecureInfoGetRegion "wikilink")                                                                                            |
| 0x08170000     |                                | [SecureInfoGetByte101](CfgS:SecureInfoGetByte101 "wikilink")                                                                                         |
| 0x08180042     |                                | [SecureInfoGetSerialNo](CfgS:SecureInfoGetSerialNo "wikilink")                                                                                       |
| 0x0819....     | ?                              | ?                                                                                                                                                    |
| 0x081A....     | ?                              | ?                                                                                                                                                    |
| 0x081B....     | ?                              | ?                                                                                                                                                    |
| 0x081C....     | ?                              | ?                                                                                                                                                    |
| 0x081D....     | ?                              | ?                                                                                                                                                    |
| 0x081E....     | ?                              | ?                                                                                                                                                    |
| 0x081F....     | ?                              | ?                                                                                                                                                    |
| 0x0820....     | ?                              | ?                                                                                                                                                    |

# Config NVRAM service "cfg:nor"

| Command Header | Description                                                                                                                            |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010040     | [Initialize](CfgNor:Initialize "wikilink")                                                                                             |
| 0x00020000     | [Shutdown](CfgNor:Shutdown "wikilink")                                                                                                 |
| 0x00030040     | (u8 flag) Writes the input flag to state. Uses SPI service command [EnableSpiBus](SPI_Services "wikilink").                            |
| 0x00040000     | Writes the u8 from the state written by 0x00030040 to cmdreply\[2\].                                                                   |
| 0x00050082     | [ReadData](CfgNor:ReadData "wikilink")                                                                                                 |
| 0x00060082     | [WriteData](CfgNor:WriteData "wikilink")                                                                                               |
| 0x00070000     | This just uses the WREN command.                                                                                                       |
| 0x00080000     | This just uses the WRDI command.                                                                                                       |
| 0x00090000     | [ReadIdentification](CfgNor:ReadIdentification "wikilink")                                                                             |
| 0x000A0000     | This waits for the WIP bit in the status register to clear(wait for writing to finish).                                                |
| 0x000B0000     | This waits for the WEL bit in the status register to become set(write enabled).                                                        |
| 0x000C0000     | This writes the value of the WIP bit in the status register to u8 cmdreply\[2\].                                                       |
| 0x000D0000     | This writes the value of the WIP bit in the status register to u8 cmdreply\[2\].                                                       |
| 0x000E0000     | [ReadStatusRegister](CfgNor:ReadStatusRegister "wikilink")                                                                             |
| 0x000F0082     | [ReadDataOther](CfgNor:ReadDataOther "wikilink")                                                                                       |
| 0x00100082     | [WriteDataOther](CfgNor:WriteDataOther "wikilink")                                                                                     |
| 0x00110040     | (u32 offset) Uses command WREN then waits for WEL to become enabled. Sends command 0xDB to SPI followed by the specified flash offset. |
| 0x00120040     | (u32 offset) Identical to 0x00110040 except this uses SPI-command 0xD8 instead("block erase").                                         |
| 0x00130000     | This uses SPI command 0xB9 for "Deep power down".                                                                                      |
| 0x00140000     | This uses SPI command 0xAB for "Release from deep power down".                                                                         |

This is an interface for the "SPI::NOR" service, for accessing the Wifi
NVRAM/SPI Flash.

[Category:Services](Category:Services "wikilink")
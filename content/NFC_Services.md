+++
title = 'NFC Services'
+++

The New3DS NFC module was added with
[8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink"). The Old3DS NFC module was
added with [9.3.0-X](9.3.0-21 "wikilink").

On New3DS NFC module uses the [NFC](I2C_Registers "wikilink") hardware
via the [i2c::NFC](I2C_Services "wikilink") and
[gpio:NFC](GPIO_Services "wikilink") services. On Old3DS NFC module
communicates with a NFC peripheral via IR with the IRUSER service.

Only 1 session can be open for all of these services combined. Commands
for each service are handled by the main-thread.

# NFC services

## NFC user service "nfc:u"

This is the NFC service used by regular applications, for the NFP API.

This was first seen in the Super Smash Bros eShop demo (only in the
exheader, the demo doesn't actually use it), but at that time no
system-module was available for NFC on CDN. The first regular
application to use this service was Super Smash Bros, with the v1.0.5
game-update, which used the new 9.3.0-X command set.

## NFC management service "nfc:m"

| Command Header | Available since system-version            | Name                                                           | Input                                                                                             | Output                                 | Notes                                                                                                             |
|----------------|-------------------------------------------|----------------------------------------------------------------|---------------------------------------------------------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| 0x040100C2     | Unknown, \<[9.3.0-X](9.3.0-21 "wikilink") | ???                                                            | u32 unknownA, u32 unknownB, u32 unknownC, u32 (sizeof(\*buffer) \<\< 14 \| 0x402), void \* buffer | s32 result                             | Used when resetting an amiibo from amiibo Settings.                                                               |
| 0x04020000     | [9.3.0-X](9.3.0-21 "wikilink")            | [GetAdminInfo](NFCM:GetAdminInfo "wikilink")                   |                                                                                                   |                                        |                                                                                                                   |
| 0x04030000     | [9.3.0-X](9.3.0-21 "wikilink")            | [GetEmptyRegisterInfo](NFCM:GetEmptyRegisterInfo "wikilink")   |                                                                                                   |                                        |                                                                                                                   |
| 0x04040A40     | [9.3.0-X](9.3.0-21 "wikilink")            | [SetRegisterInfo](NFCM:SetRegisterInfo "wikilink")             |                                                                                                   |                                        |                                                                                                                   |
| 0x04050000     | [9.3.0-X](9.3.0-21 "wikilink")            | [DeleteRegisterInfo](NFCM:DeleteRegisterInfo "wikilink")       |                                                                                                   |                                        |                                                                                                                   |
| 0x04060000     | [9.3.0-X](9.3.0-21 "wikilink")            | [DeleteApplicationArea](NFCM:DeleteApplicationArea "wikilink") |                                                                                                   |                                        |                                                                                                                   |
| 0x04070000     | [9.3.0-X](9.3.0-21 "wikilink")            | [ExistsApplicationArea](NFCM:ExistsApplicationArea "wikilink") |                                                                                                   |                                        |                                                                                                                   |
| 0x04080000     | [9.3.0-X](9.3.0-21 "wikilink")            | ???                                                            | void                                                                                              | s32 result, u32 unknownA               |                                                                                                                   |
| 0x040C0000     | [9.3.0-X](9.3.0-21 "wikilink")            | ?                                                              | None                                                                                              | s32 result                             | Among other things, this will eventually call the savedata writing code referenced in the below savedata section. |
| 0x040D0000     | [9.3.0-X](9.3.0-21 "wikilink")            | ???                                                            | void                                                                                              | s32 result                             |                                                                                                                   |
| 0x040E0000     | [9.3.0-X](9.3.0-21 "wikilink")            | ???                                                            | void                                                                                              | s32 result, u32 unknownA, u32 unknownB | Again, amiibo applet ignores value unknownA.                                                                      |
| 0x040F0000     | [9.3.0-X](9.3.0-21 "wikilink")            | ???                                                            | void                                                                                              | s32 result, u32 unknownA, u32 unknownB |                                                                                                                   |

This is used by the [amiibo Settings](amiibo_Settings "wikilink")
applet. This service has the above commands, in addition to the
command-set listed below.

## NFC development service "nfc:dev"

| Command header | Available since system-version | Description                                    |
|----------------|--------------------------------|------------------------------------------------|
| 0x00110100     |                                | [ReadRawPages](NFCDEV:ReadRawPages "wikilink") |
| 0x001200C0     |                                | [WriteRawPage](NFCDEV:WriteRawPage "wikilink") |

Some of these commands seems to be intended for use only on dev-units.

Unlike the New3DS NFC-module, at least some of these commands are
stubbed in the Old3DS NFC-module(only returns an error).

## NFC service "nfc:p"

| Command header | Available since system-version | Description                                                                                                                                                                                                                                                          |
|----------------|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010000     |                                | Initialize                                                                                                                                                                                                                                                           |
| 0x00020000     |                                | Shutdown                                                                                                                                                                                                                                                             |
| 0x00030080     |                                | (unk0, unk1) ?                                                                                                                                                                                                                                                       |
| 0x00040000     |                                | ?                                                                                                                                                                                                                                                                    |
| 0x000500C2     |                                | [SendTagCommand](NFCP:SendTagCommand "wikilink")                                                                                                                                                                                                                     |
| 0x00060000     |                                | GetTagInfo                                                                                                                                                                                                                                                           |
| 0x00070000     |                                | GetTagState maybe? Writes an output value to cmdreply\[2\].                                                                                                                                                                                                          |
| 0x00080000     |                                | Writes a handle to cmdreply\[3\].                                                                                                                                                                                                                                    |
| 0x00090000     |                                | Writes a handle to cmdreply\[3\].                                                                                                                                                                                                                                    |
| 0x000A0000     |                                | Unknown. Writes an output value to cmdreply\[2\].                                                                                                                                                                                                                    |
| 0x000B0000     |                                | Unknown. Writes 0x60-bytes of output starting at cmdreply\[2\]. u16 +0 is the size of the data at +4, +2 is not initialized, u8 +3 is loaded from state, u32 +0x2C is loaded from state, and the data at +4 with the previously mentioned size is copied from state. |
| 0x000C0040     |                                | (u32 outputsize) Writes output to static_buf_id=0, outputsize 1 is used when it's \>=1.                                                                                                                                                                              |
| 0x000D0040     |                                | (u32 outputsize) Writes output to static_buf_id=0, outputsize 1 is used when it's \>=1.                                                                                                                                                                              |
| 0x000E0080     |                                | (u8 unk, u32 outputsize) Writes output to static_buf_id=0, outputsize 2 is used when it's \>=2.                                                                                                                                                                      |
| 0x000F0040     |                                | (u32 outputsize) Writes output to static_buf_id=0, outputsize 2 is used when it's \>=2.                                                                                                                                                                              |
| 0x00100000     |                                | Unknown.                                                                                                                                                                                                                                                             |
| 0x00110000     |                                | Unknown.                                                                                                                                                                                                                                                             |
| 0x00120000     |                                | Unknown. Writes an output u32 to cmdreply\[2\].                                                                                                                                                                                                                      |
| 0x00130000     |                                | Unknown. Writes an output u32 to cmdreply\[2\].                                                                                                                                                                                                                      |

This service is used by the mint library-applet, starting with
[9.3.0-21](9.3.0-21 "wikilink"). This service was added to the mint
service-access-control list with [9.0.0-20](9.0.0-20 "wikilink"). The
mint process is the only known eShop-related process using this
service([eShop](eShop "wikilink")-application and NIM-module don't use
it). Used for NFC card payments in JPN [eShop](eShop "wikilink")(the
v16384 mint title is *identical* for USA/JPN besides programIDs in the
NCCH header/exheader).

JPN eShop game "Megami Meguri" uses these same JPN NFC cards. The only
accessible NFC service is nfcu.

## NFC service "nfc:r"

This service has no known use.

## NFC service "nfc:s"

| Command header | Available since system-version | Description                                                                                                                            |
|----------------|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0x00130102     |                                | [SendTagCommand](NFCS:SendTagCommand "wikilink")                                                                                       |
| 0x00230000     |                                | This writes the following command request data to [I2C](I2C_Registers "wikilink"), without reading any response: 10 20 00 01 01.       |
| 0x00240000     |                                | This writes the following command request data to [I2C](I2C_Registers "wikilink"), without reading any response: 10 40 00 03 00 0F 01. |

This service has no known use.

Unlike the New3DS NFC-module, at least some of these commands are
stubbed in the Old3DS NFC-module(only returns an error).

# "nfc:u" and "nfc:m" command set

There are at least two different revisions of the NFC module. First
version was introduced on New3DS only with firmware
[8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink"). Second version made its
appearance with [9.3.0-X](9.3.0-21 "wikilink"), on both Old3DS and
New3DS.

These two versions are not interchangeable and not compatible, since the
newer version uses a different command set and has no implemented
commands from the older version. This does not introduce compatibility
problems since no retail software used the NFC module, before the system
titles added with [9.3.0-21](9.3.0-21 "wikilink") which use NFC.

## 9.3.0-X

| Command Header | Available since system-version   | Name                                                            | Input        | Output                                               | Notes                                                                                                                                                                            |
|----------------|----------------------------------|-----------------------------------------------------------------|--------------|------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010040     |                                  | [Initialize](NFC:Initialize "wikilink")                         | u8 inputval  | s32 result                                           |                                                                                                                                                                                  |
| 0x00020040     |                                  | [Shutdown](NFC:Shutdown "wikilink")                             | u8 inputval  | s32 result                                           |                                                                                                                                                                                  |
| 0x00030000     |                                  | [StartCommunication](NFC:StartCommunication "wikilink")         | void         | s32 result                                           |                                                                                                                                                                                  |
| 0x00040000     |                                  | [StopCommunication](NFC:StopCommunication "wikilink")           | void         | s32 result                                           |                                                                                                                                                                                  |
| 0x00050040     |                                  | [StartTagScanning](NFC:StartTagScanning "wikilink")             | u16 inval    | s32 result                                           |                                                                                                                                                                                  |
| 0x00060000     |                                  | [StopTagScanning](NFC:StopTagScanning "wikilink")               | void         | s32 result                                           |                                                                                                                                                                                  |
| 0x00070000     |                                  | [LoadAmiiboData](NFC:LoadAmiiboData "wikilink")                 |              |                                                      |                                                                                                                                                                                  |
| 0x00080000     |                                  | [ResetTagScanState](NFC:ResetTagScanState "wikilink")           |              |                                                      |                                                                                                                                                                                  |
| 0x00090002     |                                  | [UpdateStoredAmiiboData](NFC:UpdateStoredAmiiboData "wikilink") |              |                                                      |                                                                                                                                                                                  |
| 0x000A0000     |                                  | ???                                                             | void         | s32 result                                           |                                                                                                                                                                                  |
| 0x000B0000     |                                  | GetTagInRangeEvent(?)                                           | void         | s32 result, u32 copy handle descriptor, Handle event | amiibo applet ignores value 'descriptor'. It doesn't even read it from the command buffer.                                                                                       |
| 0x000C0000     |                                  | GetTagOutOfRangeEvent(?)                                        | void         | s32 result, u32 copy handle descriptor, Handle event | amiibo applet also ignores value 'descriptor' for this command.                                                                                                                  |
| 0x000D0000     |                                  | [GetTagState](NFC:GetTagState "wikilink")                       | void         | s32 result, u8 outval                                |                                                                                                                                                                                  |
| 0x000F0000     |                                  | [CommunicationGetStatus](NFC:CommunicationGetStatus "wikilink") |              |                                                      |                                                                                                                                                                                  |
| 0x00100000     |                                  | [GetTagInfo2](NFC:GetTagInfo2 "wikilink")                       |              |                                                      |                                                                                                                                                                                  |
| 0x00110000     |                                  | [GetTagInfo](NFC:GetTagInfo "wikilink")                         |              |                                                      |                                                                                                                                                                                  |
| 0x00120000     |                                  | [CommunicationGetResult](NFC:CommunicationGetResult "wikilink") |              |                                                      |                                                                                                                                                                                  |
| 0x00130040     |                                  | [OpenAppData](NFC:OpenAppData "wikilink")                       |              |                                                      |                                                                                                                                                                                  |
| 0x00140384     |                                  | [InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink") |              |                                                      |                                                                                                                                                                                  |
| 0x00150040     |                                  | [ReadAppData](NFC:ReadAppData "wikilink")                       |              |                                                      |                                                                                                                                                                                  |
| 0x00160242     |                                  | [WriteAppData](NFC:WriteAppData "wikilink")                     |              |                                                      |                                                                                                                                                                                  |
| 0x00170000     |                                  | [GetRegisterInfo](NFC:GetRegisterInfo "wikilink")               |              |                                                      |                                                                                                                                                                                  |
| 0x00180000     |                                  | [GetCommonInfo](NFC:GetCommonInfo "wikilink")                   |              |                                                      |                                                                                                                                                                                  |
| 0x00190000     |                                  | [GetAppDataInitStruct](NFC:GetAppDataInitStruct "wikilink")     |              |                                                      |                                                                                                                                                                                  |
| 0x001A0000     |                                  |                                                                 | None         | No additional output.                                |                                                                                                                                                                                  |
| 0x001B0000     |                                  | [GetModelInfo](NFC:GetModelInfo "wikilink")                     |              |                                                      |                                                                                                                                                                                  |
| 0x001C0040     | [9.6.0-X](9.6.0-24 "wikilink")   |                                                                 | u8 inputval  | No additional output.                                | ?                                                                                                                                                                                |
| 0x001D0040     | [9.6.0-X](9.6.0-24 "wikilink")   |                                                                 | u32 inputval | No additional output.                                | ?                                                                                                                                                                                |
| 0x001E0040     | [9.6.0-X](9.6.0-24 "wikilink")   |                                                                 | u8 inputval  | u8 outval at cmdreply\[2\].                          | ?                                                                                                                                                                                |
| 0x001F0080     | [10.0.0-X](10.0.0-27 "wikilink") | [StartOtherTagScanning](NFC:StartOtherTagScanning "wikilink")   |              |                                                      | Used by JPN eShop app "Megami Meguri".                                                                                                                                           |
| 0x00200102     | [10.0.0-X](10.0.0-27 "wikilink") | [SendTagCommand](NFC:SendTagCommand "wikilink")                 |              |                                                      |                                                                                                                                                                                  |
| 0x00210000     | [10.0.0-X](10.0.0-27 "wikilink") | ?                                                               |              |                                                      | Used by JPN eShop app "Megami Meguri". This can only be used when [initialized](NFC:Initialize "wikilink") with type3, and when the [TagState](NFC:GetTagState "wikilink") is 3. |
| 0x00220000     | [10.0.0-X](10.0.0-27 "wikilink") | ?                                                               |              |                                                      | This can only be used when [initialized](NFC:Initialize "wikilink") with type3, and when the [TagState](NFC:GetTagState "wikilink") is 3.                                        |

## Pre-9.3.0-X

| Pre-9.3.0-X command header | Command header starting with 9.3.0-X | Available since system-version              | Description                                                                                                                      |
|----------------------------|--------------------------------------|---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| 0x00010000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Initialize                                                                                                                       |
| 0x00020000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Shutdown                                                                                                                         |
| 0x00030000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | GetNFCState. This writes an output u8 to cmdreply\[2\]: 0 = not initialized, 1 = just initialized, 5 = data transfer ready, ...  |
| 0x00040000                 | 0x000B0000                           | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | This writes an output handle to cmdreply\[3\].                                                                                   |
| 0x00050000                 | 0x000C0000                           | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | This writes an output handle to cmdreply\[3\].                                                                                   |
| 0x00060040                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u8 input)                                                                                                                       |
| 0x00070000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | The user process must setup the output-buffer hdr+ptr data @ TLS+0x180 when using this. cmdreply\[2\] = actual output data size? |
| 0x00080100                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (\<0x10-bytes starting at cmdreq\[1\]\>)                                                                                         |
| 0x00090000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") |                                                                                                                                  |
| 0x000A0000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | The user process must setup the output-buffer hdr+ptr data @ TLS+0x180 when using this.                                          |
| 0x000B0042                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u32 size, ((Size\<\<14) \| 2), inbufptr)                                                                                        |
| 0x000C0044                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u32 size, 0x20, <procid set by kernel>, ((Size\<\<14) \| 0x402), inbufptr)                                                      |
| 0x000D0040                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u16 in)                                                                                                                         |
| 0x000E0000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") |                                                                                                                                  |
| 0x000F00C2                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u32 unk0, u32 unk1, u32 unk2, ((Size\<\<14) \| 0x802), inbufptr)                                                                |
| 0x00100040                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u32 in)                                                                                                                         |
| 0x00110040                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u32 in)                                                                                                                         |
| 0x00120040                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | (u32 in)                                                                                                                         |
| 0x00130000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | Writes an output u32 to cmdreply\[2\].                                                                                           |
| 0x00140000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | This writes an output 0x30-byte struct starting at cmdreply\[2\].                                                                |
| 0x00150000                 | 0x00110000                           | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") | This writes an output 0x2C-byte struct starting at cmdreply\[2\].                                                                |
| 0x00160000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") |                                                                                                                                  |
| 0x00170000                 | ?                                    | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink") |                                                                                                                                  |

# NFC services error codes

| Error-code | Description                                                                                                                  |
|------------|------------------------------------------------------------------------------------------------------------------------------|
| 0xc8a17600 | The current NFC tag [state](NFC:GetTagState "wikilink"), or other NFC state, is invalid with the NFC command which was used. |

# Data Types

## AdminInfo

| Offset | Size | Description                                                                                                                            |
|--------|------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x08 | Program ID (From the Wii U, 3DS or Switch title who created the application area)                                                      |
| 0x08   | 0x04 | [App ID](Amiibo#Games_using_Amiibo_AppData "wikilink")                                                                                 |
| 0x0C   | 0x02 | CRC32 Change Counter                                                                                                                   |
| 0x0E   | 0x01 | Flags (bit0 = amiibo initialized, bit1 = has application area, bit2/bit3 unknown)                                                      |
| 0x0F   | 0x01 | Unknown, hardcoded to 0x2                                                                                                              |
| 0x10   | 0x1  | 0xFF if there is no application area, related to the console of the application area game otherwise (0/2 = 3DS, 1 = Wii U, 3 = Switch) |
| 0x11   | 0x07 | Padding                                                                                                                                |
| 0x18   | 0x28 | Reserved                                                                                                                               |

## RegisterInfo

| Offset | Size | Description                                                                                                |
|--------|------|------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x60 | [Exported Mii Data](Mii_Maker#Mii_QR_Code_format "wikilink") (minus the AES-CCM used in the linked format) |
| 0x60   | 0x16 | Amiibo Name (NUL-Terminated)                                                                               |
| 0x76   | 0x01 | Flags (bit0 = amiibo initialized, bit1 = has application area)                                             |
| 0x77   | 0x01 | Font Region                                                                                                |
| 0x78   | 0x04 | Creation [Date](#Date "wikilink")                                                                          |
| 0x7C   | 0x2C | Reserved                                                                                                   |

This data originates from the [Amiibo](Amiibo "wikilink") settings data
stored under the encrypted NFC data.

## CommonInfo

| Offset | Size | Description                               |
|--------|------|-------------------------------------------|
| 0x00   | 0x04 | Last Write [Date](#Date "wikilink")       |
| 0x04   | 0x02 | Write Counter                             |
| 0x06   | 0x02 | Character ID                              |
| 0x08   | 0x01 | Character Variant                         |
| 0x09   | 0x01 | Amiibo Series                             |
| 0x0A   | 0x02 | Model Number                              |
| 0x0C   | 0x01 | Amiibo Type                               |
| 0x0D   | 0x01 | Version                                   |
| 0x0E   | 0x02 | Application Area Size (hardcoded to 0xD8) |
| 0x10   | 0x30 | Reserved                                  |

This data originates from the [Amiibo](Amiibo "wikilink") NFC data.

## ModelInfo

| Offset | Size | Description       |
|--------|------|-------------------|
| 0x00   | 0x02 | Character ID      |
| 0x02   | 0x01 | Character Variant |
| 0x03   | 0x01 | Amiibo Series     |
| 0x04   | 0x02 | Model Number      |
| 0x06   | 0x01 | Amiibo Type       |
| 0x07   | 0x01 | Version           |
| 0x08   | 0x2E | Reserved          |

This data originates from the [Amiibo](Amiibo "wikilink") NFC data.

## Date

| Offset | Size | Description |
|--------|------|-------------|
| 0x00   | 0x02 | Year        |
| 0x02   | 0x01 | Month       |
| 0x03   | 0x01 | Day         |

# NFC module savedata

- "/nfp_backup.dat" This contains raw data from the
  [Amiibo](Amiibo "wikilink") NFC data pages. The filesize is
  0x001fbd20-bytes. Certain service cmds will trigger writing to this
  savedata. This entire file is read during [amiibo
  Settings](amiibo_Settings "wikilink") startup, it's unknown what
  command(s) actually triggers that. It seems the Amiibo data here is
  updated each time the Amiibo NFC data is updated, and read each time
  the Amiibo NFC data is read. Data is written into this savedata when
  the Amiibo was never scanned on this system before. The data here is
  probably also updated when the scanned Amiibo NFC data doesn't match
  the data stored here.

During NFC writing, the NFC data being written can become corrupted if
the Amiibo figure is moved outside of range during writing. When this
happens, this nfp_backup data can be used to restore a previous version
of that data prior to the last failed write.

## nfp_backup.dat structure

| Offset | Size  | Description                                                                                                         |
|--------|-------|---------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x20  | Header                                                                                                              |
| 0x20   | 0x800 | Amiibo data table header                                                                                            |
| 0x7D20 | 0x21C | The NFC data for the first stored Amiibo is located here. This is the entire raw data from all 0x87 NFC data pages. |

### Header structure

| Offset | Size | Description                                                                                           |
|--------|------|-------------------------------------------------------------------------------------------------------|
| 0x0    | 0x8  | Unknown, normally the following data? "00 00 02 00 02 00 00 00" (as little-endian u32s: 0x20000, 0x2) |
| 0x8    | 0x14 | Unknown, normally all-zero?                                                                           |
| 0x1C   | 0x4  | Unknown. CRC32 / checksum maybe?                                                                      |

### Amiibo data table header

This is an array with 0x40(?) entries, where the size of each entry is
0x20-bytes. Entry structure:

| Offset | Size | Description                                                                                                                                      |
|--------|------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x8  | First 8-bytes from [Amiibo](Amiibo "wikilink") NFC serial-number.                                                                                |
| 0x8    | 0x3  | Unknown, normally zero?                                                                                                                          |
| 0xB    | 0x2  | u16 little-endian date value for when this Amiibo was initially written into this savedata, with the same format from [here](Amiibo "wikilink"). |
| 0xD    | 0xF  | Unknown, normally zero?                                                                                                                          |
| 0x1C   | 0x4  | Unknown. CRC32 / checksum maybe?                                                                                                                 |

# NFC module versions

| System version                 | New3DS title-version | Old3DS title-version | Changes                                                                                                                                                                                                                 |
|--------------------------------|----------------------|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [9.6.0-X](9.6.0-24 "wikilink") | v4102                | v4106                | New3DS and Old3DS: the only changes regarding new commands is that new commands were added for the nfcu/nfcm command-set and new commands for an unknown cmd-handler were added. It's unknown if there's other changes. |

# Errors

| Error code | Description                                                                                                                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0xC8A17600 | This is returned when the current state is invalid for this command.                                                                                                                                  |
| 0xC8A17620 | This is returned by [NFC:OpenAppData](NFC:OpenAppData "wikilink") when the appdata is uninitialized since [NFC:InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink") wasn't used previously. |
| 0xC8A17628 | This is returned by [NFC:GetAmiiboSettings](NFC:GetAmiiboSettings "wikilink") when the amiibo wasn't setup by the amiibo Settings applet.                                                             |
| 0xC8A17638 | This is returned by [NFC:OpenAppData](NFC:OpenAppData "wikilink") when the input AppID doesn't match the actual Amiibo AppID.                                                                         |
| 0xC8C1760C | Returned for HMAC-hash mismatch(data corruption), with HMAC-calculation input_buffer_size=0x34.                                                                                                       |
| 0xC8A17618 | HMAC-hash mismatch with input_buffer_size=0x1DF(see [here](Amiibo "wikilink")).                                                                                                                       |
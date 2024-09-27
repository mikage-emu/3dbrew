+++
title = 'Process Services'
categories = ["Services"]
+++

# PS service "ps:ps"

| Command Header  | Available since system version                               | Description                                                                                      |
|-----------------|--------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| 0x00010244      | [1.0.0-0](1.0.0-0 "wikilink")                                | [SignRsaSha256](PS:SignRsaSha256 "wikilink")                                                     |
| 0x00020244      | [1.0.0-0](1.0.0-0 "wikilink")                                | [VerifyRsaSha256](PS:VerifyRsaSha256 "wikilink")                                                 |
| Not implemented |                                                              | SetAesKey (just returns error 0xD8C107F4)                                                        |
| 0x00040204      | [1.0.0-0](1.0.0-0 "wikilink")                                | [EncryptDecryptAes](PS:EncryptDecryptAes "wikilink")                                             |
| 0x00050284      | [1.0.0-0](1.0.0-0 "wikilink")                                | [EncryptSignDecryptVerifyAesCcm](PS:EncryptSignDecryptVerifyAesCcm "wikilink")                   |
| 0x00060040      | [1.0.0-0](1.0.0-0 "wikilink")                                | GetRomId (u32 processID)                                                                         |
| 0x00070040      | [1.0.0-0](1.0.0-0 "wikilink")                                | GetRomId2 (u32 processID)                                                                        |
| 0x00080040      | [1.0.0-0](1.0.0-0 "wikilink")                                | GetRomMakerCode (u32 processID)                                                                  |
| 0x00090000      | [1.0.0-0](1.0.0-0 "wikilink")                                | [GetCTRCardAutoStartupBit](PS:GetCTRCardAutoStartupBit "wikilink")                               |
| 0x000A0000      | [1.0.0-0](1.0.0-0 "wikilink")                                | GetLocalFriendCodeSeed                                                                           |
| 0x000B0000      | [1.0.0-0](1.0.0-0 "wikilink")                                | GetDeviceId                                                                                      |
| 0x000C0000      | [1.0.0-0](1.0.0-0 "wikilink")                                | [SeedRNG](PS:SeedRNG "wikilink")                                                                 |
| 0x000D0042      | [1.0.0-0](1.0.0-0 "wikilink")                                | GenerateRandomBytes                                                                              |
| 0x000E0082      | 8.1.0-0_New3DS\]\], Old3DS = [9.0.0-20](9.0.0-20 "wikilink") | Interface for [Process_Services_PXI](Process_Services_PXI "wikilink") New3DS command 0x04010084. |
| 0x000F0082      | 8.1.0-0_New3DS\]\], Old3DS = [9.0.0-20](9.0.0-20 "wikilink") | Interface for [Process_Services_PXI](Process_Services_PXI "wikilink") New3DS command 0x04020082. |
| 0x00100042      | 8.1.0-0_New3DS\]\], Old3DS = [9.0.0-20](9.0.0-20 "wikilink") | Interface for [Process_Services_PXI](Process_Services_PXI "wikilink") New3DS command 0x04030044. |
| 0x00110042      | 8.1.0-0_New3DS\]\], Old3DS = [9.0.0-20](9.0.0-20 "wikilink") | Interface for [Process_Services_PXI](Process_Services_PXI "wikilink") New3DS command 0x04040044. |

These commands are an interface for
[Process_Services_PXI](Process_Services_PXI "wikilink").

For GetRomId, GetRomId2, and GetRomMakerCode, PS-module uses
[FS:GetProgramLaunchInfo](FS:GetProgramLaunchInfo "wikilink") with the
processID which was sent to PS-module via the command input. If
GetProgramLaunchInfo fails, PS-module returns error 0xC90107FA. When the
mediatype is value2 for gamecard, the PSPXI command is used, otherwise
PS-module just clears the output data for the command response.

PS module does not use any CheckNew3DS commands: commands
0x000E0082..0x00110042 are handled by PS module regardless of whether
this is running on Old3DS/New3DS. Using these commands on Old3DS will
result in Process9 returning an invalid command header error.
[NFC](NFC_Services "wikilink") module uses all of these new commands for
New3DS.

[Category:Services](Category:Services "wikilink")
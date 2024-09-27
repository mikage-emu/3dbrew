+++
title = 'ACT Services'
categories = ["Services"]
+++

The ACT module handles NNID accounts. This module behaves very similarly
to the [Wii
U](https://github.com/devkitPro/wut/blob/master/cafe/nn_act.def)
implementation (nn::act)

# ACT service "act:u"

These commands are common to both act:u and act:a

| Command Header | Available since system-version | Description                                                               |
|----------------|--------------------------------|---------------------------------------------------------------------------|
| 0x00010084     |                                | [Initialize](ACT:Initialize "wikilink")                                   |
| 0x00020040     |                                | [GetErrorCode](ACT:GetErrorCode "wikilink")                               |
| 0x00030000     |                                | GetLastResponseCode                                                       |
| 0x00040000     |                                | ?                                                                         |
| 0x00050082     |                                | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                            |
| 0x000600C2     |                                | [GetAccountDataBlock](ACTU:GetAccountDataBlock "wikilink")/GetAccountInfo |
| 0x00070082     |                                | GetResultAsync                                                            |
| 0x000800C2     |                                | GetMiiImageData                                                           |
| 0x00090180     |                                | SetNfsPassword                                                            |
| 0x000A0040?    |                                | ?                                                                         |
| 0x000B0042     |                                | AcquireEulaList                                                           |
| 0x000C0082     |                                | AcquireTimeZoneList                                                       |
| 0x000D0040     |                                | GenerateUuid                                                              |
| 0x000E0080     |                                | ?                                                                         |
| 0x000F0140     |                                | FindSlotNoByUuid                                                          |
| 0x00100000     |                                | SaveData                                                                  |
| 0x00110080     |                                | GetTransferableId                                                         |
| 0x00120102     |                                | AcquireNexServiceToken                                                    |
| 0x00130002     |                                | GetNexServiceToken                                                        |
| 0x00140382     |                                | AcquireIndependentServiceToken                                            |
| 0x00150002     |                                | GetIndependentServiceToken                                                |
| 0x00160082     |                                | AcquireAccountInfo                                                        |
| 0x00170084     |                                | AcquireAccountIdByPrincipalId                                             |
| 0x00180044     |                                | AcquirePrincipalIdByAccountId                                             |
| 0x00190044     |                                | AcquireMii                                                                |
| 0x001A0042     |                                | AcquireAccountInfoEx                                                      |
| 0x001B0084     |                                | AcquireOtherTypePrincipalID?                                              |
| 0x001C0342     |                                | ?                                                                         |
| 0x001D0004     |                                | InquireMailAddress                                                        |
| 0x001E0082     |                                | AcquireEula                                                               |
| 0x001F0082     |                                | AcquireEulaLanguageList                                                   |
| 0x00200382     |                                | ?                                                                         |
| 0x00210002     |                                | ?                                                                         |
| 0x00220342     |                                | ?                                                                         |
|                |                                |                                                                           |

# ACT service "act:a"

These commands are exclusive to act:a

| Command Header | Available since system-version | Description                                                  |
|----------------|--------------------------------|--------------------------------------------------------------|
| 0x04010080     |                                | ?                                                            |
| 0x04020000     |                                | [CreateConsoleAccount](ACTA:CreateConsoleAccount "wikilink") |
| 0x04030040     |                                | CommitConsoleAccount                                         |
| 0x04040080     |                                | [UnbindServerAccount](ACTA:UnbindServerAccount "wikilink")   |
| 0x04050040     |                                | DeleteConsoleAccount                                         |
| 0x04060240     |                                | ?                                                            |
| 0x04070000     |                                | UnloadConsoleAccount                                         |
| 0x04080080     |                                | EnableAccountPasswordCache                                   |
| 0x04090040     |                                | [SetDefaultAccount](ACTA:SetDefaultAccount "wikilink")       |
| 0x040A0040     |                                | ReplaceAccountId                                             |
| 0x040B0040     |                                | GetSupportContext                                            |
| 0x040C0100     |                                | ?                                                            |
| 0x040D00C0     |                                | ?                                                            |
| 0x040E02C0     |                                | ?                                                            |
| 0x040F0280     |                                | ?                                                            |
| 0x04100040     |                                | ?                                                            |
| 0x04110040     |                                | ?                                                            |
| 0x041207C0     |                                | [UpdateMii](ACTA:UpdateMii "wikilink")                       |
| 0x041300C2     |                                | UpdateMiiImage                                               |
| 0x04140182     |                                | InquireAccountIdAvailability                                 |
| 0x04150EC4     |                                | BindToNewServerAccount                                       |
| 0x041602C4     |                                | BindToExistentServerAccount                                  |
| 0x041702C4     |                                | InquireBindingToExistentServerAccount                        |
| 0x04180042     |                                | ?                                                            |
| 0x04190042     |                                | ?                                                            |
| 0x041A01C2     |                                | AcquireAccountTokenEx                                        |
| 0x041B0142     |                                | AgreeEula                                                    |
| 0x041C0042     |                                | SyncAccountInfo                                              |
| 0x041D0080     |                                | ?                                                            |
| 0x041E0182     |                                | UpdateAccountPassword                                        |
| 0x041F0042     |                                | ReissueAccountPassword                                       |
| 0x04200180     |                                | SetAccountPasswordInput                                      |
| 0x04210042     |                                | UploadMii                                                    |
| 0x04220042     |                                | ?                                                            |
| 0x04230082     |                                | ValidateMailAddress                                          |
| 0x04240044     |                                | ?                                                            |
| 0x04250042     |                                | SendConfirmationMail                                         |
| 0x04260044     |                                | ?                                                            |
| 0x04270084     |                                | ?                                                            |
| 0x04280044     |                                | ApproveByCreditCard                                          |
| 0x04290082     |                                | SendCoppaCodeMail                                            |
| 0x042A0080     |                                | ?                                                            |
| 0x042B01C4     |                                | ?                                                            |
| 0x042C0042     |                                | ?                                                            |
| 0x042D0042     |                                | ?                                                            |
| 0x042E0080     |                                | ?                                                            |
| 0x042F0084     |                                | UpdateAccountInfoEx                                          |
| 0x04300044     |                                | UpdateAccountMailAddress                                     |
| 0x04310042     |                                | ?                                                            |
| 0x04320042     |                                | ?                                                            |
| 0x04330042     |                                | ?                                                            |
| 0x04340003     |                                | ?                                                            |
| 0x04350042     |                                | DeleteServerAccount                                          |

This is the service used by regular applications.

# Account slots

Like the friends sysmodule, the ACT module supports multiple accounts
internally, although this functionality is not exposed to the users.
Unlike the Wii U which supports up to 12 accounts, the 3DS only has 8
account slots.

Some commands require require the account slot as an argument, which is
1-indexed. The value for using the current loaded account is 0xFE.

# DataBlocks

Data blocks can be accessed from specific commands depending on the data
that is requested. These follow a similar order to the Wii U
[ACTInfoTypes](https://github.com/decaf-emu/decaf-emu/blob/master/src/libdecaf/src/nn/act/nn_act_enum.h).

| BlkID | Size  | Command needed                                                                                       | Description                                                                                                                                                                                                           |
|-------|-------|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x1   | 0x1   | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                                                       | Number of accounts                                                                                                                                                                                                    |
| 0x2   | 0x1   | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                                                       | Current account slot                                                                                                                                                                                                  |
| 0x3   | 0x1   | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                                                       | Default account slot                                                                                                                                                                                                  |
| 0x4   | 0x8   | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                                                       | ?                                                                                                                                                                                                                     |
| 0x5   | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | PersistentId                                                                                                                                                                                                          |
| 0x6   | 0x8   | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")/[GetAccountInfo](ACTU:GetAccountDataBlock "wikilink") | CommonTransferableIdBase on GetCommonInfo / TransferableIdBase on GetAccountInfo                                                                                                                                      |
| 0x7   | 0x60  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | [MiiData](Mii#mii_format "wikilink")                                                                                                                                                                                  |
| 0x8   | 0x11  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | AccountId (ASCII NUL-terminated Nintendo Network ID)                                                                                                                                                                  |
| 0x9   | 0x101 | AcquireAccountInfo                                                                                   | Mail address                                                                                                                                                                                                          |
| 0xA   | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | Birthday {u16 year; u8 month; u8 day;}                                                                                                                                                                                |
| 0xB   | 0x3   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | ASCII NUL-terminated Country Name                                                                                                                                                                                     |
| 0xC   | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | PrincipalId                                                                                                                                                                                                           |
| 0xE   | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsPasswordCacheEnabled                                                                                                                                                                                                |
| 0xF   | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | Does nothing?                                                                                                                                                                                                         |
| 0x11  | 0xA0  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | struct{u32 PersistentID; u32 padding; u64 TransferableIDBase; u8\[0x60\] MiiData; char16_t\[0xB\] MachinUserName?; char\[0x11\] AccountID; u8 padding; struct{u16 year; u8 month; u8 day;}Birthday; u32 PrincipalID;} |
| 0x12  | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | ?                                                                                                                                                                                                                     |
| 0x13  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | Gender                                                                                                                                                                                                                |
| 0x14  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | LastAuthenticationResult                                                                                                                                                                                              |
| 0x15  | 0x11  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | AssignedAccountId (ASCII NUL-terminated Nintendo Network ID)                                                                                                                                                          |
| 0x16  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | ParentalControlSlotNo                                                                                                                                                                                                 |
| 0x17  | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | SimpleAddressId ([CountryInfo](Config_Savegame#countryinfo "wikilink"))                                                                                                                                               |
| 0x19  | 0x8   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | UtcOffset                                                                                                                                                                                                             |
| 0x1A  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsCommited                                                                                                                                                                                                            |
| 0x1B  | 0x16  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | MiiName (NUL-terminated UTF-16 Mii name)                                                                                                                                                                              |
| 0x1C  | 0x11  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | NfsPassword                                                                                                                                                                                                           |
| 0x1D  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | Bool: if EciVirtualAccount has a value                                                                                                                                                                                |
| 0x1E  | 0x41  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | TimeZoneId (ASCII Time Zone Location)                                                                                                                                                                                 |
| 0x1F  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsMiiUpdated                                                                                                                                                                                                          |
| 0x20  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsMailAddressValidated                                                                                                                                                                                                |
| 0x21  | 0x4C  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | ?                                                                                                                                                                                                                     |
| 0x24  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsServerAccountDeleted                                                                                                                                                                                                |
| 0x25  | 0x101 | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | MiiImageUrl (ASCII NUL-terminated URL to account mii image)                                                                                                                                                           |
| 0x26  | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | AssignedPrincipalId                                                                                                                                                                                                   |
| 0x27  | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | ? (Only accessible with param\[1\] = 0xFE)                                                                                                                                                                            |
| 0x28  | 0x24  | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | struct{char\[0x21\] NnasSubDomain?; char\[0x3\] NnasNfsEnv;}                                                                                                                                                          |
| 0x29  | 0x24  | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                                                       | struct{char\[0x21\] DefaultNnasSubDomain?; char\[0x3\] DefaultNnasNfsEnv;}                                                                                                                                            |
| 0x2A  | 0x8   | [GetCommonInfo](ACTU:GetCommonInfo "wikilink")                                                       | ?                                                                                                                                                                                                                     |
| 0x2B  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | FpLocalAccountId                                                                                                                                                                                                      |
| 0x2C  | 0x2   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | Age                                                                                                                                                                                                                   |
| 0x2D  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsEnabledReceiveAds                                                                                                                                                                                                   |
| 0x2E  | 0x1   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | IsOffDeviceAccessEnabled                                                                                                                                                                                              |
| 0x2F  | 0x4   | [GetAccountInfo](ACTU:GetAccountDataBlock "wikilink")                                                | [Translated](Cfg:TranslateCountryInfo "wikilink") SimpleAddressId ([CountryInfo](Config_Savegame#countryinfo "wikilink"))                                                                                             |

# HTTPS Requests

With each request, ACT-sysmodule specifies request-header
"X-Nintendo-Device-Model". This is the only \*dedicated\* request-header
that's contains anything Old3DS/New3DS specific. This was implemented
with [9.0.0-X](9.0.0-20 "wikilink"), and presumably
[8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink"). The value is from a string
initialized during ACT-sysmodule startup. The value-string is the
[codename](Cfg:GetSystemModel "wikilink") string for all 5 of the model
values from [Cfg:GetSystemModel](Cfg:GetSystemModel "wikilink"). When
the output from GetSystemModel is \>=5(switch statement default case),
it runs this: "len = snprintf(outstr, outmaxsize, "3DS-%u", model);"

## Trusted Root CAs

ACT module uses a [RootCertChain](HTTP_Services "wikilink") for all
HTTPS requests, the only trusted root CA is
[default](SSLC:RootCertChainAddDefaultCert "wikilink") CertID 0x3.

# New3DS

Even though ACT-sysmodule uses [ptm:s](PTM_Services "wikilink"), it
doesn't use CheckNew3DS at all.

[Category:Services](Category:Services "wikilink")

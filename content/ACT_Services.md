+++
title = 'ACT Services'
categories = ["Services"]
+++

The ACT module handles NNID accounts. This module behaves very similarly to the [Wii U](https://github.com/devkitPro/wut/blob/master/cafe/nn_act.def) implementation (nn::act)

# ACT User Service "act:u"

These commands are used generally by most titles, and are also present in act:a.

| Command Header | Description |
|----|----|
| 0x00010084 | [Initialize](ACTU:Initialize "wikilink") |
| 0x00020040 | [GetErrorCode](ACTU:GetErrorCode "wikilink") |
| 0x00030000 | [GetLastResponseResult](ACTU:GetLastResponseResult "wikilink") |
| 0x00040000 | [Cancel](ACTU:Cancel "wikilink") |
| 0x00050082 | [GetCommonInfo](ACTU:GetCommonInfo "wikilink") |
| 0x000600C2 | [GetAccountDataBlock](ACTU:GetAccountDataBlock "wikilink")/GetAccountInfo |
| 0x00070082 | [GetAsyncResult](ACTU:GetAsyncResult "wikilink") |
| 0x000800C2 | [GetMiiImage](ACTU:GetMiiImage "wikilink") |
| 0x00090180 | [SetNfsPassword](ACTU:SetNfsPassword "wikilink") |
| 0x000A0000 | [SetIsApplicationUpdateRequired](ACTU:SetIsApplicationUpdateRequired "wikilink") |
| 0x000B0042 | [AcquireEulaList](ACTU:AcquireEulaList "wikilink") |
| 0x000C0082 | [AcquireTimeZoneList](ACTU:AcquireTimeZoneList "wikilink") |
| 0x000D0040 | [GenerateUuid](ACTU:GenerateUuid "wikilink") |
| 0x000E0080 | [GetUuid](ACTU:GetUuid "wikilink") |
| 0x000F0140 | [FindSlotNoByUuid](ACTU:FindSlotNoByUuid "wikilink") |
| 0x00100000 | [Save](ACTU:Save "wikilink") |
| 0x00110080 | [GetTransferableId](ACTU:GetTransferableId "wikilink") |
| 0x00120102 | [AcquireNexServiceToken](ACTU:AcquireNexServiceToken "wikilink") |
| 0x00130002 | [GetNexServiceToken](ACTU:GetNexServiceToken "wikilink") |
| 0x00140382 | [AcquireIndependentServiceToken](ACTU:AcquireIndependentServiceToken "wikilink") |
| 0x00150002 | [GetIndependentServiceToken](ACTU:GetIndependentServiceToken "wikilink") |
| 0x00160082 | [AcquireAccountInfo](ACTU:AcquireAccountInfo "wikilink") |
| 0x00170084 | [AcquireAccountIdByPrincipalId](ACTU:AcquireAccountIdByPrincipalId "wikilink") |
| 0x00180044 | [AcquirePrincipalIdByAccountId](ACTU:AcquirePrincipalIdByAccountId "wikilink") |
| 0x00190044 | [AcquireMii](ACTU:AcquireMii "wikilink") |
| 0x001A0042 | [AcquireAccountInfoRaw](ACTU:AcquireAccountInfoRaw "wikilink") |
| 0x001B0084 | AcquireOtherTypePrincipalID (stubbed) |
| 0x001C0342 | [GetCachedIndependentServiceToken](ACTU:GetCachedIndependentServiceToken "wikilink") |
| 0x001D0004 | [InquireMailAddressAvailability](ACTU:InquireMailAddressAvailability "wikilink") |
| 0x001E0082 | [AcquireEula](ACTU:AcquireEula "wikilink") |
| 0x001F0082 | [AcquireEulaLanguageList](ACTU:AcquireEulaLanguageList "wikilink") |
| 0x00200382 | [AcquireIndependentServiceTokenV2](ACTU:AcquireIndependentServiceTokenV2 "wikilink") |
| 0x00210002 | [GetIndepdendentServiceTokenV2](ACTU:GetIndependentServiceTokenV2 "wikilink") |
| 0x00220342 | [GetCachedIndependentServiceTokenV2](ACTU:GetCachedIndependentServiceTokenV2 "wikilink") |

# ACT Admin Service "act:a"

This service is used mainly by the Nintendo Network ID Settings application accessible in System Settings.

| Command Header | Description |
|----|----|
| 0x04010080 | [SwapAccounts](ACTA:SwapAccounts "wikilink") |
| 0x04020000 | [CreateConsoleAccount](ACTA:CreateConsoleAccount "wikilink") |
| 0x04030040 | [CommitConsoleAccount](ACTA:CommitConsoleAccount "wikilink") |
| 0x04040080 | [UnbindServerAccount](ACTA:UnbindServerAccount "wikilink") |
| 0x04050040 | [DeleteConsoleAccount](ACTA:DeleteConsoleAccount "wikilink") |
| 0x04060240 | [LoadConsoleAccount](ACTA:LoadConsoleAccount "wikilink") |
| 0x04070000 | [UnloadConsoleAccount](ACTA:UnloadConsoleAccount "wikilink") |
| 0x04080080 | [EnableAccountPasswordCache](ACTA:EnableAccountPasswordCache "wikilink") |
| 0x04090040 | [SetDefaultAccount](ACTA:SetDefaultAccount "wikilink") |
| 0x040A0040 | [ReplaceAccountId](ACTA:ReplaceAccountId "wikilink") |
| 0x040B0040 | [GetSupportContext](ACTA:GetSupportContext "wikilink") |
| 0x040C0100 | [SetHostServerSettings](ACTA:SetHostServerSettings "wikilink") |
| 0x040D00C0 | [SetDefaultHostServerSettings](ACTA:SetDefaultHostServerSettings "wikilink") |
| 0x040E02C0 | [SetHostServerSettingsStr](ACTA:SetHostServerSettingsStr "wikilink") |
| 0x040F0280 | [SetDefaultHostServerSettingsStr](ACTA:SetDefaultHostServerSettingsStr "wikilink") |
| 0x04100040 | [SetPersistentIdHead](ACTA:SetPersistentIdHead "wikilink") |
| 0x04110040 | [SetTransferableIdCounter](ACTA:SetTransferableIdCounter "wikilink") |
| 0x041207C0 | [UpdateMiiData](ACTA:UpdateMiiData "wikilink") |
| 0x041300C2 | [UpdateMiiImage](ACTA:UpdateMiiImage "wikilink") |
| 0x04140182 | [InquireAccountIdAvailability](ACTA:InquireAccountIdAvailability "wikilink") |
| 0x04150EC4 | [BindToNewServerAccount](ACTA:BindToNewServerAccount "wikilink") |
| 0x041602C4 | [BindToExistentServerAccount](ACTA:BindToExistentServerAccount "wikilink") |
| 0x041702C4 | [InquireBindingToExistentServerAccount](ACTA:InquireBindingToExistentServerAccount "wikilink") |
| 0x04180042 | [DeleteServerAccount](ACTA:DeleteServerAccount "wikilink") |
| 0x04190042 | AcquireAccountToken (stubbed) |
| 0x041A01C2 | [AcquireAccountTokenEx](ACTA:AcquireAccountTokenEx "wikilink") |
| 0x041B0142 | [AgreeEula](ACTA:AgreeEula "wikilink") |
| 0x041C0042 | [SyncAccountInfo](ACTA:SyncAccountInfo "wikilink") |
| 0x041D0080 | [InvalidateAccountToken](ACTA:InvalidateAccountToken "wikilink") |
| 0x041E0182 | [UpdateAccountPassword](ACTA:UpdateAccountPassword "wikilink") |
| 0x041F0042 | [ReissueAccountPassword](ACTA:ReissueAccountPassword "wikilink") |
| 0x04200180 | [SetAccountPasswordInput](ACTA:SetAccountPasswordInput "wikilink") |
| 0x04210042 | [UploadMii](ACTA:UploadMii "wikilink") |
| 0x04220042 | [InactivateDeviceAssociation](ACTA:InactivateDeviceAssociation "wikilink") |
| 0x04230082 | [ValidateMailAddress](ACTA:ValidateMailAddress "wikilink") |
| 0x04240044 | [SendPostingApprovalMail](ACTA:SendPostingApprovalMail "wikilink") |
| 0x04250042 | [SendConfirmationMail](ACTA:SendConfirmationMail "wikilink") |
| 0x04260044 | [SendConfirmationMailForPin](ACTA:SendConfirmationMailForPin "wikilink") |
| 0x04270084 | [SendMasterKeyMailForPin](ACTA:SendMasterKeyMailForPin "wikilink") |
| 0x04280044 | [ApproveByCreditCard](ACTA:ApproveByCreditCard "wikilink") |
| 0x04290082 | [SendCoppaCodeMail](ACTA:SendCoppaCodeMail "wikilink") |
| 0x042A0080 | [SetIsMiiUpdated](ACTA:SetIsMiiUpdated "wikilink") |
| 0x042B01C4 | [ReserveTransfer](ACTA:ReserveTransfer "wikilink") |
| 0x042C0042 | [CompleteTransfer](ACTA:CompleteTransfer "wikilink") |
| 0x042D0042 | [InactivateAccountDeviceAssociation](ACTA:InactivateAccountDeviceAssociation "wikilink") |
| 0x042E0080 | [SetNetworkTime](ACTA:SetNetworkTime "wikilink") |
| 0x042F0084 | [UpdateAccountInfo](ACTA:UpdateAccountInfo "wikilink") |
| 0x04300044 | [UpdateAccountMailAddress](ACTA:UpdateAccountMailAddress "wikilink") |
| 0x04310042 | [DeleteDeviceAssociation](ACTA:DeleteDeviceAssociation "wikilink") |
| 0x04320042 | [DeleteAccountDeviceAssociation](ACTA:DeleteAccountDeviceAssociation "wikilink") |
| 0x04330042 | [CancelTransfer](ACTA:CancelTransfer "wikilink") |
| 0x04340003 | [ReloadAndBlockSaveData](ACTA:ReloadAndBlockSaveData "wikilink") |
| 0x04350042 | [ReserveServerAccountDeletion](ACTA:ReserveServerAccountDeletion "wikilink") |

# Account slots

Like the friends sysmodule, the ACT module has support for multiple [console accounts](ACT_Services#console_accounts "wikilink"). The ACT sysmodule has support for 8 account "slots", which are 1-indexed numbers (n) referring the to the `n`th account. This means that up to 8 different [console accounts](ACT_Services#console_accounts "wikilink") can be used with the ACT sysmodule, unlike the Wii U, which has support for 12. This multi-account functionality is not exposed to users, and the Nintendo Network ID Settings application only ever uses the default account slot.

When the ACT sysmodule is started, it loads the default account slot. The default account can be set using [ACTA:SetDefaultAccount](ACTA:SetDefaultAccount "wikilink").

It is also possible to change the account slot number of an account by using [ACTA:SwapAccounts](ACTA:SwapAccounts "wikilink").

Account slot -2 (0xFE) always refers to the currently loaded account.

## Console Accounts

A "console account" refers to a specific account slot, and may or may not be associated with a Nintendo Network ID (server account). By default, there is only one console account.

More console accounts can be created using [ACTA:CreateConsoleAccount](ACTA:CreateConsoleAccount "wikilink"), loaded using [ACTA:LoadConsoleAccount](ACTA:LoadConsoleAccount "wikilink"), unloaded using [ACTA:UnloadConsoleAccount](ACTA:UnloadConsoleAccount "wikilink"), or deleted using [ACTA:DeleteConsoleAccount](ACTA:DeleteConsoleAccount "wikilink").

## Server Accounts

A "server account" is essentially a Nintendo Network ID.

Associating a console account with a Nintendo Network ID (server-side) is facilitated by the commands [ACTA:BindToNewServerAccount](ACTA:BindToNewServerAccount "wikilink") (to create and link an NNID) or [ACTA:BindToExistentServerAccount](ACTA:BindToExistentServerAccount "wikilink") (to log into an existing linked NNID).

Nintendo Network IDs can be transferred to other consoles using [ACTA:ReserveTransfer](ACTA:ReserveTransfer "wikilink") initially, and then [ACTA:CompleteTransfer](ACTA:CompleteTransfer "wikilink").

NNIDs can be deleted using either [ACTA:DeleteServerAccount](ACTA:DeleteServerAccount "wikilink"), [ACTA:InactivateAccountDeviceAssociation](ACTA:InactivateAccountDeviceAssociation "wikilink"), [ACTA:DeleteAccountDeviceAssociation](ACTA:DeleteAccountDeviceAssociation "wikilink") or [ACTA:ReserveServerAccountDeletion](ACTA:ReserveServerAccountDeletion "wikilink").

# Password Management

The ACT sysmodule uses a distinct password management system.

## Password Hashing Algorithm

Passwords are not stored in plaintext. Instead, they are hashed using the following algorithm:

    void hash_password(void *out_hash, void *input, int input_size, unsigned int num_iterations, unsigned int principal_id) {
        static const unsigned char constant[4] = { 0x02, 0x65, 0x43, 0x46 };

        unsigned char hash_data[8 + 32] = { 0 };
        unsigned int bswap_pid = bswap32(principal_id);

        while ( num_iterations-- ) {
            memcpy(&hash_data[0], &bswap_pid, 4);
            memcpy(&hash_data[4], &constant, 4);
            memcpy(&hash_data[8], input, input_size);

            /* output, input, size */
            sha256(out_hash, hash_data, 8 + input_size);
            input_size = 32;
            input = out_hash;
        }
    }

## Account Password Hash

The AccountPasswordHash field in the account data is the result of one iteration of the above algorithm, using the plaintext password as the input. It is generally used to verify the input password in [ACTA:LoadConsoleAccount](ACTA:LoadConsoleAccount "wikilink").

This field in the account data is set when [ACTA:BindToNewServerAccount](ACTA:BindToNewServerAccount "wikilink"), [ACTA:BindToExistentServerAccount](ACTA:BindToExistentServerAccount "wikilink"), or [ACTA:UpdateAccountPassword](ACTA:UpdateAccountPassword "wikilink") is used.

## Account Password Cache

It is possible to cache the password for an account so the user isn't asked for it every time. This can be configured in Nintendo Network ID settings or during an NNID login prompt (e.g. in the eShop). The AccountPasswordCache field in the account data is the result of two iterations of the above algorithm, using the plaintext password as the input.

## Account Password Input

The account password input represents the in-memory input value of the password. It can be thought of as the value that will be autofilled by default in a login form. When the ACT sysmodule is started and the default account is loaded, the AccountPasswordCache is copied to the AccountPasswordInput, allowing automatic login.

However, it is possible to override this value using [ACTA:SetAccountPasswordInput](ACTA:SetAccountPasswordInput "wikilink"). The AccountPasswordInput value set using this command can then be saved to the account password cache by using [ACTA:EnableAccountPasswordCache](ACTA:EnableAccountPasswordCache "wikilink").

The account password cache can be enabled or disabled through [ACTA:EnableAccountPasswordCache](ACTA:EnableAccountPasswordCache "wikilink").

The AccountPasswordInput is always loaded into memory and is not saved to the system save data.

# Server Types

The ACT sysmodule uses two different server types for Nintendo Network accounts.

See below how these types are determined by default. These types can also be overridden using [ACTA:SetHostServerSettings](ACTA:SetHostServerSettings "wikilink"), [ACTA:SetDefaultHostServerSettings](ACTA:SetDefaultHostServerSettings "wikilink"), [ACTA:SetHostServerSettingsStr](ACTA:SetHostServerSettingsStr "wikilink"), and [ACTA:SetDefaultHostServerSettingsStr](ACTA:SetDefaultHostServerSettingsStr "wikilink").

The base URL for the Nintendo Network Account Server (NNAS) is: [`https://`](https://)`[`<prefix>`]account.nintendo.net`.

## NNAS (Nintendo Network Authentication Server) Types

This is used to determine the NNAS subdomain used for the account server.

| Value | Description | NNAS Subdomain | Complete NNAS URL |
|----|----|----|----|
| 0 | Production | (None) | `https://account.nintendo.net` |
| 1 | Game Development (also the default for debug mode on developer units) | `game-dev.` | `https://game-dev.account.nintendo.net` |
| 2 | System Development | `system-dev.` | `https://system-dev.account.nintendo.net` |
| 3 | Library Development | `library-dev.` | `https://library-dev.account.nintendo.net` |
| 4 | Staging | `staging.` | `https://staging.account.nintendo.net` |

Values beyond 4 are considered invalid.

### Default NNAS Server Types

By default, ACT uses the letter value from [FRDU:GetServerTypes](FRDU:GetServerTypes "wikilink") to determine the correct NNAS subdomain when a Nintendo Network ID is created.

| Value from [FRDU:GetServerTypes](FRDU:GetServerTypes "wikilink") | NNAS Server Type | Corresponding NNAS Subdomain | Corresponding complete NNAS URL |
|----|----|----|----|
| 0 (L) | Production (default on retail units) | (None) | `https://account.nintendo.net` |
| 2 (S) | Staging | `staging.` | `https://staging.account.nintendo.net` |
| 3 (D) | Game Development (also the default for debug mode on developer units) | `game-dev.` | `https://game-dev.account.nintendo.net` |
| 5 (T) | Library Development | `library-dev.` | `https://library-dev.account.nintendo.net` |
| 7 (J) | System Development | `system-dev.` | `https://system-dev.account.nintendo.net` |

## NFS (Nintendo Friend Server) Types

ACT uses the same [Server Types](Friend_Services#server_types "wikilink") as the friends sysmodule as the NfsType.

A small subset of these types are used in [ACTA:SetHostServerSettings](ACTA:SetHostServerSettings "wikilink"), [ACTA:SetDefaultHostServerSettings](ACTA:SetDefaultHostServerSettings "wikilink"), [ACTA:SetHostServerSettingsStr](ACTA:SetHostServerSettingsStr "wikilink"), and [ACTA:SetDefaultHostServerSettingsStr](ACTA:SetDefaultHostServerSettingsStr "wikilink"):

| Input value used in ACT commands | Corresponding [Friends Server Type](Friend_Services#server_types "wikilink") value |
|----|----|
| 0 | 0 (L) |
| 1 | 3 (D) |
| 2 | 2 (S) |
| 3 | 5 (T) |
| 4 | 7 (J) |

### Default NFS Server Types

By default, ACT uses [FRDU:GetServerTypes](FRDU:GetServerTypes "wikilink") to obtain the correct [NFS (Nintendo Friend Server) environment](Friend_Services#server_types "wikilink") to create Nintendo Network IDs.

This is necessary to ensure proper online play functionality, because the friends server account is tied to the Nintendo Network ID when one is linked.

# UUIDs

The ACT service generates UUIDs for accounts and for the console in general.

All UUIDs generated by the service are [RFC9562 Version 1 UUIDs](https://www.rfc-editor.org/rfc/rfc9562.html#name-uuid-version-1).

## Node Data

In general, the following 48-bit node data is used.

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1 | Always set to 1 |
| 0x1 | 0x1 | Always set to 0 (related to parental controls?) |
| 0x2 | 0x4 | Byte-Swapped value from [AM:GetDeviceId](AM:GetDeviceId "wikilink") |

## UUID Types

### Regular UUIDs

These are just standard [RFC9562 Version 1 UUIDs](https://www.rfc-editor.org/rfc/rfc9562.html#name-uuid-version-1) with the above node data.

### Title-specific UUIDs

These UUIDs are specific to the title that requested them to be generated, specifically, using the unique ID portion of the title ID of that title.

The following technique is used internally to generate these UUIDs:

\- Generate or use an existing regular UUID the with the above mentioned node data (`regular_uuid`)

\- `hash = SHA256 ( byte-swapped unique ID (thus, big endian) + 095E273A + 48-bit node data from regular_uuid )`

\- `output_uuid = regular_uuid[0:9] + hash[10] | 0x1 + hash[11:16]`

# Independent Service Tokens

In addition to NEX tokens for gameserver authentication in combination with Nintendo Network, app developers have the ability to use their own independent services. For authenticating with such services through Nintendo Network, the service's client ID is used to request a token from the account server.

## Independent Service Token Versions

There are two versions of independent service tokens.

### V1 Independent Service Token

These are more basic, consisting of only a base64 token. These can be requested and cached using [ACTU:AcquireIndependentServiceToken](ACTU:AcquireIndependentServiceToken "wikilink"), retrieved either immediately after requesting them using [ACTU:GetIndependentServiceToken](ACTU:GetIndependentServiceToken "wikilink") or from an internal cache using [ACTU:GetCachedIndependentServiceToken](ACTU:GetCachedIndependentServiceToken "wikilink").

| Offset | Size      | Description                  |
|--------|-----------|------------------------------|
| 0x0    | 0x200 + 1 | base64 NULL-terminated Token |

### V2 Independent Service Token

V2 indpendent service tokens include more fields like an IV, signature, and account server environment compared to V1 tokens.

They can be requested and cached using [ACTU:AcquireIndependentServiceTokenV2](ACTU:AcquireIndependentServiceTokenV2 "wikilink"), retrieved either immediately after requesting them using [ACTU:GetIndependentServiceTokenV2](ACTU:GetIndependentServiceTokenV2 "wikilink") or from an internal cache using [ACTU:GetCachedIndependentServiceTokenV2](ACTU:GetCachedIndependentServiceTokenV2 "wikilink").

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x200 + 1 | base64 NULL-terminated Token |
| 0x201 | 0x18 + 1 | base64 NULL-terminated IV |
| 0x21A | 0x158 + 1 | base64 NULL-terminated Signature |
| 0x373 | 0x2 + 1 | ASCII [Server Environment](Friend_Services#server_types "wikilink") type and number |

# DataBlocks

Data blocks can be accessed from specific commands depending on the data that is requested. These follow a similar order to the Wii U [ACTInfoTypes](https://github.com/decaf-emu/decaf-emu/blob/master/src/libdecaf/src/nn/act/nn_act_enum.h).

<table>
<thead>
<tr>
<th>BlkID</th>
<th>Size</th>
<th>Command needed</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x1</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>Number of accounts</td>
</tr>
<tr>
<td>0x2</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>Current account slot</td>
</tr>
<tr>
<td>0x3</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>Default account slot</td>
</tr>
<tr>
<td>0x4</td>
<td>0x8</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>NetworkTimeDifference: Difference between server time and UTC device time (in nanoseconds)</td>
</tr>
<tr>
<td>0x5</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>PersistentId</td>
</tr>
<tr>
<td>0x6</td>
<td>0x8</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a>/<a {{% href "ACTU:GetAccountDataBlock" "broken" %}} title="wikilink">GetAccountInfo</a></td>
<td>CommonTransferableIdBase on GetCommonInfo / TransferableIdBase on GetAccountInfo</td>
</tr>
<tr>
<td>0x7</td>
<td>0x60</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td><a {{% href "../Mii" %}} title="wikilink">Mii CFLStoreData</a></td>
</tr>
<tr>
<td>0x8</td>
<td>0x11</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>AccountId (ASCII NULL-terminated Nintendo Network ID)</td>
</tr>
<tr>
<td>0x9</td>
<td>0x101</td>
<td><a {{% href "../ACTU:AcquireAccountInfo" %}} title="wikilink">AcquireAccountInfo</a></td>
<td>Mail address</td>
</tr>
<tr>
<td>0xA</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">Birth Date</a></td>
</tr>
<tr>
<td>0xB</td>
<td>0x3</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>ASCII NULL-terminated Country Name</td>
</tr>
<tr>
<td>0xC</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>PrincipalId</td>
</tr>
<tr>
<td>0xE</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsPasswordCacheEnabled</td>
</tr>
<tr>
<td>0xF</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>Does not return anything.</td>
</tr>
<tr>
<td>0x11</td>
<td>0xA0</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
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
<td>u32 PersistentID</td>
</tr>
<tr>
<td>0x4</td>
<td>0x4</td>
<td>padding</td>
</tr>
<tr>
<td>0x8</td>
<td>0x8</td>
<td>u64 TransferableIDBase</td>
</tr>
<tr>
<td>0x10</td>
<td>0x60</td>
<td><a {{% href "../Mii" %}} title="wikilink">Mii CFLStoreData</a></td>
</tr>
<tr>
<td>0x70</td>
<td>(10 + 1) * 2</td>
<td>10-character UTF-16 Mii Display Name</td>
</tr>
<tr>
<td>0x86</td>
<td>0x11</td>
<td>ASCII NULL-terminated NNID Account ID (username)</td>
</tr>
<tr>
<td>0x97</td>
<td>1</td>
<td>padding</td>
</tr>
<tr>
<td>0x98</td>
<td>0x4</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">Birth Date</a></td>
</tr>
<tr>
<td>0x9C</td>
<td>0x4</td>
<td>u32, PrincipalID</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x12</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>Account server types</p>
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
<td><a {{% href "../ACT_Services" %}} title="wikilink">NNAS (Nintendo Network Authentication Server) Type</a></td>
</tr>
<tr>
<td>0x1</td>
<td>0x1</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">NFS (Nintendo Friend Server) Type Value</a></td>
</tr>
<tr>
<td>0x2</td>
<td>0x1</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">NFS (Nintendo Friend Server) Number</a></td>
</tr>
<tr>
<td>0x3</td>
<td>0x1</td>
<td>padding (0)</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x13</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>Gender</td>
</tr>
<tr>
<td>0x14</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>LastAuthenticationResult</td>
</tr>
<tr>
<td>0x15</td>
<td>0x11</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>AssignedAccountId (ASCII NULL-terminated Nintendo Network ID)</td>
</tr>
<tr>
<td>0x16</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>ParentalControlSlotNo</td>
</tr>
<tr>
<td>0x17</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>SimpleAddressId (<a {{% href "../Config_Savegame" %}} title="wikilink">CountryInfo</a>)</td>
</tr>
<tr>
<td>0x19</td>
<td>0x8</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>UtcOffset</td>
</tr>
<tr>
<td>0x1A</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsCommitted</td>
</tr>
<tr>
<td>0x1B</td>
<td>0x16</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>10-character UTF-16 Mii Name (10 characters + NULL termination)</td>
</tr>
<tr>
<td>0x1C</td>
<td>0x11</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>ASCII NULL-terminated NfsPassword</td>
</tr>
<tr>
<td>0x1D</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>HasEciVirtualAccount (checks whether EciVirtualAccount has a value)</td>
</tr>
<tr>
<td>0x1E</td>
<td>0x41</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>TimeZoneId (ASCII Time Zone Location)</td>
</tr>
<tr>
<td>0x1F</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsMiiUpdated</td>
</tr>
<tr>
<td>0x20</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsMailAddressValidated</td>
</tr>
<tr>
<td>0x21</td>
<td>0x4C</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>(Developer units only) Account access token</p>
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
<td>Access token state (0: uninitialized, 1: expired, 2: valid)</td>
</tr>
<tr>
<td>0x1</td>
<td>0x21</td>
<td>ASCII NULL-terminated access token</td>
</tr>
<tr>
<td>0x22</td>
<td>0x29</td>
<td>ASCII NULL-terminated refresh token</td>
</tr>
<tr>
<td>0x4B</td>
<td>0x1</td>
<td>padding</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x22</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>IsApplicationUpdateRequired</td>
</tr>
<tr>
<td>0x23</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>Default account server types</p>
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
<td><a {{% href "../ACT_Services" %}} title="wikilink">NNAS (Nintendo Network Authentication Server) Type</a></td>
</tr>
<tr>
<td>0x1</td>
<td>0x1</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">NFS (Nintendo Friend Server) Type Value</a></td>
</tr>
<tr>
<td>0x2</td>
<td>0x1</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">NFS (Nintendo Friend Server) Number</a></td>
</tr>
<tr>
<td>0x3</td>
<td>0x1</td>
<td>padding (0)</td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x24</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsServerAccountDeleted</td>
</tr>
<tr>
<td>0x25</td>
<td>0x101</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>MiiImageUrl (ASCII NULL-terminated URL to account mii image)</td>
</tr>
<tr>
<td>0x26</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>AssignedPrincipalId</td>
</tr>
<tr>
<td>0x27</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>Account Access token state, only accessible with account slot = 0xFE: (0: uninitialized, 1: expired, 2: valid)</td>
</tr>
<tr>
<td>0x28</td>
<td>0x24</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>Account server environment</p>
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
<td>0x21</td>
<td>ASCII NULL-terminated <a {{% href "../ACT_Services" %}} title="wikilink">NNAS</a> subdomain</td>
</tr>
<tr>
<td>0x21</td>
<td>0x3</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">NFS (Nintendo Friend Server) Type</a></td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x29</td>
<td>0x24</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>Server environment of default account</p>
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
<td>0x21</td>
<td>ASCII NULL-terminated <a {{% href "../ACT_Services" %}} title="wikilink">NNAS</a> subdomain</td>
</tr>
<tr>
<td>0x21</td>
<td>0x3</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">NFS (Nintendo Friend Server) Type</a></td>
</tr>
</tbody>
</table></td>
</tr>
<tr>
<td>0x2A</td>
<td>0x8</td>
<td><a {{% href "../ACTU:GetCommonInfo" %}} title="wikilink">GetCommonInfo</a></td>
<td>DeviceHash: first 8 bytes of <code>SHA256 ( </code><a {{% href "../AM:GetDeviceId" %}} title="wikilink"><code>AM:GetDeviceId</code></a><code>() as 4 little endian bytes + A2257354 )</code></td>
</tr>
<tr>
<td>0x2B</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>FpLocalAccountId (local account ID of <a {{% href "../Friend_Services" %}} title="wikilink">friends sysmodule</a>)</td>
</tr>
<tr>
<td>0x2C</td>
<td>0x2</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>Age (calculated using server time, not device time)</td>
</tr>
<tr>
<td>0x2D</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsEnabledReceiveAds</td>
</tr>
<tr>
<td>0x2E</td>
<td>0x1</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td>IsOffDeviceAccessEnabled</td>
</tr>
<tr>
<td>0x2F</td>
<td>0x4</td>
<td><a {{% href "../ACTU:GetAccountDataBlock" %}} title="wikilink">GetAccountInfo</a></td>
<td><a {{% href "../Cfg:TranslateCountryInfo" %}} title="wikilink">Translated</a> SimpleAddressId (<a {{% href "Config_Savegame#countryinfo" "broken" %}} title="wikilink">CountryInfo</a>)</td>
</tr>
</tbody>
</table>

# Types

## Birthdate

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x2  | u16, Year   |
| 0x2    | 0x1  | u8, Month   |
| 0x3    | 0x1  | u8, Day     |

## Mii Image Types

| Value | Description       |
|-------|-------------------|
| 0     | Primary Mii Image |
| 1     | Unknown           |
| 2     | Unknown           |
| 3     | Unknown           |
| 4     | Unknown           |
| 5     | Unknown           |
| 6     | Unknown           |
| 7     | Unknown           |
| 8     | Unknown           |

## Timezone

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x40 + 1 | ASCII NULL-terminated TimezoneArea (max. 64 characters + NULL termination) |
| 0x41 | 0x3 | padding |
| 0x44 | 0x40 + 1 | ASCII NULL-terminated TimezoneId (max. 64 characters + NULL termination) |
| 0x85 | 0x3 | padding |
| 0x88 | 0x8 | s64, UtcOffset in seconds |

## AcquireTimeZoneListData

| Offset | Size             | Description                                   |
|--------|------------------|-----------------------------------------------|
| 0x0    | 0x4              | u32, Capacity (32)                            |
| 0x4    | 0x4              | u32, Count                                    |
| 0x8    | 0x90 \* Capacity | [Timezones](ACT_Services#timezone "wikilink") |

## EulaInfo

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x2 + 1 | ASCII NULL-terminated two-letter country code (2 characters + NULL termination) |
| 0x3 | 0x2 + 1 | ASCII NULL-terminated two-letter language code (2 characters + NULL termination) |
| 0x6 | 0x2 | u16, EULA version |

## InquireBindingToExistentServerAccountData

Represents the device information for the console linked to the NNID.

| Offset | Size      | Description                                        |
|--------|-----------|----------------------------------------------------|
| 0x0    | 0x1       | bool, HasMii                                       |
| 0x1    | 0x3       | padding                                            |
| 0x4    | 0x60      | [Mii CFLStoreData](Mii#cflstoredata "wikilink")    |
| 0x64   | 0x4       | u32, PrincipalId                                   |
| 0x68   | 0x1       | bool, CoppaRequiredFlag                            |
| 0x69   | 0x3       | padding                                            |
| 0x6C   | 0x5 + 1   | ASCII 5-character CoppaCode + NULL termination     |
| 0x72   | 0x100 + 1 | ASCII 256-character ParentEmail + NULL termination |
| 0x173  | 0x1       | padding                                            |
| 0x174  | 0x4       | [Birth Date](ACT_Services#birthdate "wikilink")    |

## SendCoppaCodeMailData

| Offset | Size      | Description                                        |
|--------|-----------|----------------------------------------------------|
| 0x0    | 0x5 + 1   | 5-character ASCII CoppaCode + NULL termination     |
| 0x6    | 0x100 + 1 | 256-character ASCII ParentEmail + NULL termination |

## AcquireEulaData/AcquireEulaListData

Data returned from [ACTU:AcquireEula](ACTU:AcquireEula "wikilink") and [ACTU:AcquireEulaList](ACTU:AcquireEulaList "wikilink") uses a special format.

### EulaHeader

| Offset | Size | Description                                        |
|--------|------|----------------------------------------------------|
| 0x0    | 0x3  | 2-character Country code + NULL termination        |
| 0x3    | 0x1  | padding                                            |
| 0x4    | 0x3  | 2-character Language code + NULL termination       |
| 0x7    | 0x1  | padding                                            |
| 0x8    | 0x2  | u16, Version                                       |
| 0xA    | 0x2  | padding                                            |
| 0xC    | 0x4  | u32, end offset of this EULA within full data blob |
| 0x10   | 0x4  | EulaType offset                                    |
| 0x14   | 0x4  | AgreeText offset                                   |
| 0x18   | 0x4  | NonAgreeText offset                                |
| 0x1C   | 0x4  | LanguageName offset                                |
| 0x20   | 0x4  | MainTitle offset                                   |
| 0x24   | 0x4  | MainText offset                                    |
| 0x28   | 0x4  | SubTitle offset                                    |
| 0x2C   | 0x4  | SubText offset                                     |

`X offset` refers to an offset to a NULL-terminated ASCII string value for `X` within the full EULA data blob (see below).

### EulaList

This is the full data blob retrieved using [ACTU:GetAsyncResult](ACTU:GetAsyncResult "wikilink").
Each EULA list entry is appended at the very end of the previous one. The end offset in the header can be used to get to subsequent EULA list entries.

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
<td>u8, Number of EULA list entries (n)</td>
</tr>
<tr>
<td>0x1</td>
<td>n * (...)</td>
<td>concatenated EULA list entries</p>
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
<td>0x30</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">EulaHeader</a></td>
</tr>
<tr>
<td>0x30</td>
<td>...</td>
<td>EULA data</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

# HTTPS Requests

With each request, ACT-sysmodule specifies request-header "X-Nintendo-Device-Model". This is the only \*dedicated\* request-header that's contains anything Old3DS/New3DS specific. This was implemented with [9.0.0-X](9.0.0-20 "wikilink"), and presumably [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink"). The value is from a string initialized during ACT-sysmodule startup. The value-string is the [codename](Cfg:GetSystemModel "wikilink") string for all 5 of the model values from [Cfg:GetSystemModel](Cfg:GetSystemModel "wikilink"). When the output from GetSystemModel is \>=5(switch statement default case), it runs this: "len = snprintf(outstr, outmaxsize, "3DS-%u", model);"

## Trusted Root CAs

ACT module uses a [RootCertChain](HTTP_Services "wikilink") for all HTTPS requests, the only trusted root CA is [default](SSLC:RootCertChainAddDefaultCert "wikilink") CertID 0x3.

# New3DS

Even though ACT-sysmodule uses [ptm:s](PTM_Services "wikilink"), it doesn't use CheckNew3DS at all.

[Category:Services](Category:Services "wikilink")

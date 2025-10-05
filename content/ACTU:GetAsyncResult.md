+++
title = 'ACTU:GetAsyncResult'
+++

# Request

{{% ipc/request header="0x00070082" %}}
{{% ipc/param %}}Output buffer size{{% / %}}
{{% ipc/param %}}[Async Request Type](ACTU:GetAsyncResult#async_request_types "wikilink"){{% / %}}
{{% ipc/mapbuffer w %}}Output buffer pointer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00070082" %}}
{{% ipc/result %}}
{{% ipc/param %}}Size of returned data{{% / %}}
{{% ipc/mapbuffer w %}}Output buffer pointer{{% / %}}
{{% / %}}

# Async Request Types

| Type | Corresponding command | Data size | Data format | Accessible with |
|----|----|----|----|----|
| 1 | [InquireBindingToExistentServerAccount](ACTA:InquireBindingToExistentServerAccount "wikilink") | 0x178 | [InquireBindingToExistentServerAccountData](ACT_Services#inquirebindingtoexistentserveraccountdata "wikilink") | [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 2 | [BindToExistentServerAccount](ACTA:BindToExistentServerAccount "wikilink") | 0x4 | u32, ParentalConsentApprovalId | [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 3 | [AcquireEula](ACTU:AcquireEula "wikilink")/[AcquireEulaList](ACTU:AcquireEula "wikilink") | varies | [AcquireEulaData/AcquireEulaListData](ACT_Services#acquireeuladataacquireeulalistdata "wikilink") | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 4 | [AcquireTimeZoneList](ACTU:AcquireTimeZoneList "wikilink") | 0x1208 | [AcquireTimeZoneListData](ACT_Services#acquiretimezonelistdata "wikilink") | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 5 | [AcquireAccountInfo](ACTU:AcquireAccountInfo "wikilink") | 0x101 | 256-character ASCII email address + NULL termination | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 6 | [AcquireAccountIdByPrincipalId](ACTU:AcquireAccountIdByPrincipalId "wikilink") (multiple) | (0x10 + 1) \* count (max count 100) | array of 16-character ASCII AccountId + NULL termination | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 7 | [AcquireAccountIdByPrincipalId](ACTU:AcquireAccountIdByPrincipalId "wikilink") (single) | 0x10 + 1 | 16-character ASCII AccountId + NULL termination | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 8 | [AcquirePrincipalIdByAccountId](ACTU:AcquirePrincipalIdByAccountId "wikilink") (multiple) | 0x4 \* count (max count 100) | u32\[count\], PrincipalIds | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 9 | [AcquirePrincipalIdByAccountId](ACTU:AcquirePrincipalIdByAccountId "wikilink") (single) | 0x4 | u32, PrincipalId | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 10 | [ApproveByCreditCard](ACTA:ApproveByCreditCard "wikilink") | 0x4 | u32, ApprovalId | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 11 | [SendCoppaCodeMail](ACTA:SendCoppaCodeMail "wikilink") | 0x107 | [SendCoppaCodeMailData](ACT_Services#sendcoppacodemaildata "wikilink") | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 12 | [AcquireMii](ACTU:AcquireMii "wikilink") | 0x60 \* count (max count 100) | [Mii CFLStoreData](Mii#cflstoredata "wikilink") array corresponding to each PersistentId | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |
| 13 | [AcquireAccountInfoRaw](ACTU:AcquireAccountInfoRaw "wikilink") | 0xC00 + 1 | NULL-terminated raw ASCII account profile XML data | [act:u](ACT_Services#act_user_service_actu "wikilink"), [act:a](ACT_Services#act_admin_service_acta "wikilink") |

# Description

Returns data returned from the account server for the specified async request.

# Possible Result Codes

| Result code | Reason |
|----|----|
| 0xE0A14CC8 | The input async request type does not correspond to the last async request sent with the respective command, or the input async request type is invalid. |
| 0xE0A14CCB | The input buffer is not large enough to store the output data. |
| 0xE0A14C6F | No async request was sent prior to using this command. |
| 0xE0A14CC9 | The input buffer was not given or is invalid. |

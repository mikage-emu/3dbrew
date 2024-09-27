+++
title = 'NIM Services'
categories = ["Services"]
+++

__TOC__

# NIM updater service "nim:u"

| Command Header | Description                                                                                        |
|----------------|----------------------------------------------------------------------------------------------------|
| 0x00010000     | [StartNetworkUpdate](NIMU:StartNetworkUpdate "wikilink")                                           |
| 0x00020000     | [GetProgress](NIMU:GetProgress "wikilink")                                                         |
| 0x00030000     | [Cancel](NIMU:Cancel "wikilink")                                                                   |
| 0x00040000     | [CommitSystemTitles](NIMU:CommitSystemTitles "wikilink")                                           |
| 0x00050000     | [GetBackgroundEventForMenu](NIMU:GetBackgroundEventForMenu "wikilink")                             |
| 0x00060000     | [GetBackgroundEventForNews](NIMU:GetBackgroundEventForNews "wikilink")                             |
| 0x00070000     | [FormatSaveData](NIMU:FormatSaveData "wikilink")                                                   |
| 0x00080000     | [GetCustomerSupportCode](NIMU:GetCustomerSupportCode "wikilink")                                   |
| 0x00090000     | [IsCommittableAllSystemTitles](NIMU:IsCommittableAllSystemTitles "wikilink")                       |
| 0x000A0000     | [GetBackgroundProgress](NIMU:GetBackgroundProgress "wikilink")                                     |
| 0x000B0000     | [GetSavedHash](NIMU:GetSavedHash "wikilink")                                                       |
| 0x000C0082     | [UnregisterTask](NIMU:UnregisterTask "wikilink")                                                   |
| 0x000D0080     | [IsRegistered](NIMU:IsRegistered "wikilink")                                                       |
| 0x000E0080     | [FindTaskInfo](NIMU:FindTaskInfo "wikilink")                                                       |
| 0x000F0042     | [GetTaskInfos](NIMU:GetTaskInfos "wikilink")                                                       |
| 0x00100000     | [DeleteUnmanagedContexts](NIMU:DeleteUnmanagedContexts "wikilink")                                 |
| 0x00110000     | [UpdateAutoTitleDownloadTasksAsync](NIMU:UpdateAutoTitleDownloadTasksAsync "wikilink")             |
| 0x00120000     | [StartPendingAutoTitleDownloadTasksAsync](NIMU:StartPendingAutoTitleDownloadTasksAsync "wikilink") |
| 0x00130000     | [GetAsyncResult](NIMU:GetAsyncResult "wikilink")                                                   |
| 0x00140000     | [CancelAsyncCall](NIMU:CancelAsyncCall "wikilink")                                                 |
| 0x00150000     | [IsPendingAutoTitleDownloadTasks](NIMU:IsPendingAutoTitleDownloadTasks "wikilink")                 |
| 0x00160000     | [GetNumAutoTitleDownloadTasks](NIMU:GetNumAutoTitleDownloadTasks "wikilink")                       |
| 0x00170042     | [GetAutoTitleDownloadTaskInfos](NIMU:GetAutoTitleDownloadTaskInfos "wikilink")                     |
| 0x00180080     | [CancelAutoTitleDownloadTask](NIMU:CancelAutoTitleDownloadTask "wikilink")                         |
| 0x00190002     | [SetAutoDbgDat](NIMU:SetAutoDbgDat "wikilink")                                                     |
| 0x001A0002     | [GetAutoDbgDat](NIMU:GetAutoDbgDat "wikilink")                                                     |
| 0x001B0042     | [SetDbgTasks](NIMU:SetDbgTasks "wikilink")                                                         |
| 0x001C0042     | [GetDbgTasks](NIMU:GetDbgTasks "wikilink")                                                         |
| 0x001D0000     | [DeleteDbgData](NIMU:DeleteDbgData "wikilink")                                                     |
| 0x001E0042     | [SetTslXml](NIMU:SetTslXml "wikilink")                                                             |
| 0x001F0000     | [GetTslXmlSize](NIMU:GetTslXmlSize "wikilink")                                                     |
| 0x00200042     | [GetTslXml](NIMU:GetTslXml "wikilink")                                                             |
| 0x00210000     | [DeleteTslXml](NIMU:DeleteTslXml "wikilink")                                                       |
| 0x00220042     | [SetDtlXml](NIMU:SetDtlXml "wikilink")                                                             |
| 0x00230000     | [GetDtlXmlSize](NIMU:GetDtlXmlSize "wikilink")                                                     |
| 0x00240042     | [GetDtlXml](NIMU:GetDtlXml "wikilink")                                                             |
| 0x00250000     | [UpdateAccountStatus](NIMU:UpdateAccountStatus "wikilink")                                         |
| 0x00260180     | [StartTitleDownload](NIMU:StartTitleDownload "wikilink")                                           |
| 0x00270000     | [StopTitleDownload](NIMU:StopTitleDownload "wikilink")                                             |
| 0x00280000     | [GetTitleDownloadProgress](NIMU:GetTitleDownloadProgress "wikilink")                               |
| 0x00290246     | [RegisterTask](NIMU:RegisterTask "wikilink")                                                       |
| 0x002A0000     | [IsSystemUpdateAvailable](NIMU:IsSystemUpdateAvailable "wikilink")                                 |
| 0x002B0000     | ? (Response: 0 = 0x002B0040, 1 = Result Code)                                                      |
| 0x002C0000     | [UpdateTickets](NIMU:UpdateTickets "wikilink")                                                     |
| 0x002D00C0     | [DownloadTitleSeedAsync](NIMU:DownloadTitleSeedAsync "wikilink")                                   |
| 0x002E0000     | [DownloadMissingTitleSeedsAsync](NIMU:DownloadMissingTitleSeedsAsync "wikilink")                   |
|                |                                                                                                    |

# NIM shop service "nim:s"

| Command Header | Description                                                                                                                             |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010200     | [StartDownloadSimple](NIMS:StartDownloadSimple "wikilink")                                                                              |
| 0x00020000     | [CancelDownload](NIMS:CancelDownload "wikilink")                                                                                        |
| 0x00030000     | [GetProgress](NIMS:GetProgress "wikilink")                                                                                              |
| 0x00050082     | [UnregisterTask](NIMS:UnregisterTask "wikilink")                                                                                        |
| 0x00060080     | [IsTaskRegistered](NIMS:IsTaskRegistered "wikilink")                                                                                    |
| 0x00070080     | GetTaskInfoFromTitleId                                                                                                                  |
| 0x00080042     | GetTaskList                                                                                                                             |
| 0x0009xxxx     | Returns 0xE0C0D3F4, not implemented.                                                                                                    |
| 0x000A0000     | [CheckSysupdateAvailableSOAP](NIMS:CheckSysupdateAvailableSOAP "wikilink")                                                              |
| 0x000B0084     | [SetAttribute](NIMS:SetAttribute "wikilink")                                                                                            |
| 0x000C0082     | SetAttributeInt32                                                                                                                       |
| 0x000D0082     | Connect                                                                                                                                 |
| 0x000E0000     | UnregisterSOAP, aka soap account delete                                                                                                 |
| 0x000F0042     | SetCountrySOAP, change effective country registry                                                                                       |
| 0x00100080     | Returns 0xE0C0D3F4, not implemented, reads for an int64 in IPC.                                                                         |
| 0x001100C4     | Returns 0xE0C0D3F4, not implemented, reads for IPC parameters.                                                                          |
| 0x00120084     | SetExternalAccountSOAP                                                                                                                  |
| 0x00130042     | DeleteExternalAccountSOAP                                                                                                               |
| 0x00140000     | DeleteSavedCardSOAP                                                                                                                     |
| 0x00150082     | ListCashReplenishAmountsSOAP                                                                                                            |
| 0x0016020A     | [ListTitles](NIMS:ListTitles "wikilink")                                                                                                |
| 0x0017020A     | ListContentSetsExSOAP                                                                                                                   |
| 0x0018020A     | ListItemsSOAP                                                                                                                           |
| 0x0019028C     | ListContentSetGroupsSOAP                                                                                                                |
| 0x001E0104     | GetTaxesSOAP                                                                                                                            |
| 0x001F0106     | GetTaxLocationSOAP                                                                                                                      |
| 0x00220080     | AccountDeleteTitleETicketsSOAP. The SOAP request is sent only after the ticket for the specified titleID has been successfully deleted. |
| 0x00290000     | [AccountCheckBalanceSOAP](NIMS:AccountCheckBalanceSOAP "wikilink")                                                                      |
| 0x002D0042     | [DownloadTickets](NIMS:DownloadTickets "wikilink")                                                                                      |
| 0x0036xxxx     | Returns 0xE0C0D3F4, not implemented.                                                                                                    |
| 0x003C0002     | [RegisterSelf](NIMS:RegisterSelf "wikilink")                                                                                            |
| 0x003F0000     | GetInitializeResult. Checks whether nim is properly initialized or not. If it is not, the result code returned is non-zero.             |
| 0x00420240     | [StartDownload](NIMS:StartDownload "wikilink")                                                                                          |
| 0x00550246     | [RegisterTask](NIMS:RegisterTask "wikilink")                                                                                            |
| 0x00570082     | [ConnectNoTicketDownload](NIMS:ConnectNoTicketDownload "wikilink")                                                                      |
| 0x005B0000     | DeleteInitAccSavedData                                                                                                                  |
| 0x005C0000     | DeleteAccountSavedData                                                                                                                  |
| 0x005F00C0     | DownloadTitleSeed                                                                                                                       |

# NIM server service "nim:aoc"

| Command Header | Description                   |
|----------------|-------------------------------|
| 0x00030042     | SetApplicationId              |
| 0x00040042     | SetTin                        |
| 0x000902D0     | ListContentSetsEx             |
| 0x00180000     | GetBalance                    |
| 0x001D0000     | GetCustomerSupportCode        |
| 0x00210000     | Initialize                    |
| 0x00240282     | CalculateContentsRequiredSize |
| 0x00250000     | RefreshServerTime             |

# NIM service "nim:ndm"

| Command Header | Description                    |
|----------------|--------------------------------|
| 0x00010000     | GetDaemonEventHandle           |
| 0x00020000     | Does nothing, always returns 0 |
| 0x00030000     | SetDaemonToWorkingState        |
| 0x00040040     | SetDaemonToSuspendedState      |
| 0x00050000     | GetDaemonState                 |
|                |                                |

# kagiya server

The nim system module communicates with a server called kagiya
(kagiya-ctr.cdn.nintendo.net or kagiya-dev-ctr.cdn.nintendo.net for
development units). It provides the 9.6 crypto seed in binary form for
any given title ID under (HTTPS)
kagiya-ctr.cdn.nintendo.net/title/0x%16llx/ext_key?country=%s, where
%16llx is the title ID and %s is a country code as used in the
[eShop](EShop "wikilink").

# New3DS

NIM module only uses [CheckNew3DS](PTMSYSM:CheckNew3DS "wikilink") for
determining what heap sizes to use, in two functions. One is for the
size of the 0x08000000 vmem heap, the other is probably for some buffer
allocated on that heap. The New3DS version of these sizes are
0x1C000-bytes larger than the Old3DS sizes here.

# HTTPS requests

## Trusted RootCAs

During startup NIM-module creates two RootCertChains with
[HTTPC](HTTP_Services "wikilink"). Both of these only contain the same
[default](HTTPC:RootCertChainAddDefaultCert "wikilink") cert with ID
0x3. The first RootCertChain is used with NetUpdateSOAP. Requests such
as the "notifications.json" page don't use these RootCertChains(in this
case just [default](HTTPC:AddDefaultCert "wikilink") certID 0xB is
used).

## SOAP

### NetUpdateSOAP

There are exactly 3 types of network SOAP requests used with
[NetUpdateSOAP](https://nus.c.shop.nintendowifi.net/nus/services/NetUpdateSOAP)
by NIM module, described below. This URL contained in NIM module itself
is only used with GetSystemTitleHash. The other requests use an
identical URL loaded from an ECommerceSOAP response instead.

See also [here](https://github.com/yellows8/ninupdates).

#### GetSystemUpdate

Returns the current sysupdate title-listing. This also contains the
SystemTitleHash returned by GetSystemTitleHash.

#### GetSystemTitleHash

Returns the current SystemTitleHash for the current sysupdate
title-listing.

#### GetSystemCommonETicket

Returns the Base64-encoded cetk for each specified TitleId entry.

This is only used when installing new titles. This means with CDN
system-updates, tickets are never installed except when a title is being
installed for the first time. For example, a system on the latest
system-version that was only ever updated via CDN has the same
NATIVE_FIRM ticket installed from the factory.

# Sysupdate checking process

This section describes the process used when checking whether a
sysupdate is required.

First the GetSystemTitleHash SOAP request is done. Then the
SystemTitleHash in savedata hash.dat is compared with the received one.
If they match and the SystemTitleHash flag is set to value 0x03, it will
immediately return that no sysupdate is required. Otherwise it will
start the GetSystemUpdate SOAP request handling.

The GetSystemUpdate SOAP request contains a titlelist of all NAND
system-titles. For GetSystemUpdate response parsing, it compares each
SOAP title_entry with the NAND system titlelist. If a SOAP titleID isn't
found in the NAND titlelist, this means NAND is missing a new title and
hence a sysupdate is required for installing that title. If a NAND
title_entry-version is less than the SOAP title_entry-version, this
means the title needs updated and hence a sysupdate is required.

At least one <TitleVersion> entry with valid data in the GetSystemUpdate
response is required.

The titleIDs sent in the GetSystemUpdate SOAP request are decimal, while
the titleIDs in the response are hex.

# NIM [System_SaveData](System_SaveData "wikilink")

## hash.dat

| Offset | Size | Description                                                                                                                                                             |
|--------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x60   | 0x1  | u8 flag used with the SystemTitleHash. 0x01 = latest sysupdate isn't installed as of last SOAP requests, 0x03 = latest sysupdate is installed as of last SOAP requests. |
| 0x61   | 0x21 | ASCII hex SystemTitleHash, including NUL-terminator. This is the latest SystemTitleHash which NIM module received from SOAP.                                            |

# Types

## SystemUpdateProgress

| Offset | Length | Description                                          |
|--------|--------|------------------------------------------------------|
| 0x00   | 0x01   | [System Update State](#SystemUpdateState "wikilink") |
| 0x01   | 0x03   | Padding                                              |
| 0x04   | 0x04   | Last Operation Result Code                           |
| 0x08   | 0x08   | Current Title Downloaded Bytes                       |
| 0x10   | 0x08   | Current Title Total Bytes                            |
| 0x18   | 0x08   | Titles Downloaded                                    |
| 0x20   | 0x08   | Titles Total                                         |

## SystemUpdateState

| Value | Description                                       |
|-------|---------------------------------------------------|
| 0     | Not Initialized                                   |
| 1     | Starting System Update                            |
| 2     | Fetching System Hash and Account Status           |
| 3     | Installing New Tickets                            |
| 4     | Installing Titles                                 |
| 5     | Update Complete                                   |
| 6     | Failed - System Updates Disabled (Dev Units Only) |
| 7     | ? (Only for background updates)                   |
| 8     | ? (Only for background updates)                   |

## TitleDownloadProgress

| Offset | Length | Description                                            |
|--------|--------|--------------------------------------------------------|
| 0x00   | 0x01   | [Title Download State](#TitleDownloadState "wikilink") |
| 0x01   | 0x03   | Padding                                                |
| 0x04   | 0x04   | Last Operation Result Code                             |
| 0x08   | 0x08   | Downloaded Bytes                                       |
| 0x10   | 0x08   | Total Bytes                                            |

## TitleDownloadState

| Value | Description                                             |
|-------|---------------------------------------------------------|
| 0     | Not Initialized                                         |
| 1     | Starting Title Download                                 |
| 2     | Downloading and Installing TMD                          |
| 3     | Committing TMD                                          |
| 4     | Downloading and Installing Contents                     |
| 5     | Contents Installed                                      |
| 6     | [Committing Titles](AM:CommitImportPrograms "wikilink") |
| 7     | Finished                                                |
| 8     | ? (Unknown error regarding title version?)              |
| 9     | ? (Creating the .ctx file (or error doing so)?)         |
| 10    | Background Download Failed                              |

## TitleDownloadConfig

| Offset | Length | Description                                            |
|--------|--------|--------------------------------------------------------|
| 0x00   | 0x08   | Title ID                                               |
| 0x08   | 0x04   | Title version                                          |
| 0x0C   | 0x04   | Unknown (always 0?)                                    |
| 0x10   | 0x01   | Age Rating (for HOME Menu parental controls)           |
| 0x11   | 0x01   | [Media Type](Filesystem_services#MediaType "wikilink") |
| 0x12   | 0x02   | Padding                                                |
| 0x14   | 0x04   | Unknown (always 0?)                                    |

## BackgroundTitleDownloadConfig

| Offset | Length | Description                                              |
|--------|--------|----------------------------------------------------------|
| 0x000  | 0x018  | [Title Download Config](#TitleDownloadConfig "wikilink") |
| 0x018  | 0x001  | Unknown                                                  |
| 0x019  | 0x001  | Unknown                                                  |
| 0x01A  | 0x006  | Padding                                                  |
| 0x020  | 0x008  | Requester Title ID                                       |
| 0x028  | 0x090  | Title Name (UTF-16)                                      |
| 0x0B8  | 0x002  | Title Name Forced NUL Terminator (always 0)              |
| 0x0BA  | 0x048  | Developer Name (UTF-16)                                  |
| 0x102  | 0x002  | Developer Name Forced NUL Terminator (always 0)          |

## BackgroundTitleDownloadTaskInfo

| Offset | Length | Description                                                                   |
|--------|--------|-------------------------------------------------------------------------------|
| 0x000  | 0x104  | [Background Title Download Config](#BackgroundTitleDownloadConfig "wikilink") |
| 0x104  | 0x004  | Padding                                                                       |
| 0x108  | 0x018  | [Title Download Progress](#TitleDownloadProgress "wikilink")                  |

## AutoTitleDownloadTaskInfo

| Offset | Length | Description                                     |
|--------|--------|-------------------------------------------------|
| 0x000  | 0x008  | Task ID                                         |
| 0x008  | 0x008  | Title ID                                        |
| 0x010  | 0x004  | Title Version                                   |
| 0x014  | 0x014  | Unknown                                         |
| 0x028  | 0x008  | Required Storage Space                          |
| 0x030  | 0x004  | Last Operation Result code                      |
| 0x034  | 0x004  | Last Operation Customer Support Code            |
| 0x038  | 0x090  | Title Name (UTF-16)                             |
| 0x0C8  | 0x002  | Title Name Forced NUL Terminator (always 0)     |
| 0x0CA  | 0x048  | Developer Name (UTF-16)                         |
| 0x112  | 0x002  | Developer Name Forced NUL Terminator (always 0) |
| 0x114  | 0x024  | Unknown                                         |

## InstallationMode

| Value | Description          |
|-------|----------------------|
| 0     | Initial Installation |
| 1     | Unknown              |
| 2     | Unknown              |
| 3     | Re-installation      |

## Autodbg

Despite this being for debug purposes, it's used in retail if present.

| Offset | Length | Description                           |
|--------|--------|---------------------------------------|
| 0x000  | 0x004  | Debug flags                           |
| 0x004  | 0x004  | Number of debug tasks in dbgtasks.dat |
| 0x008  | 0x100  | Debug URL dst.xml override            |

### Autodbg flag bits

| Bit | Description                                                                                        |
|-----|----------------------------------------------------------------------------------------------------|
| 0   | Use the tasks stored in dbgtasks.dat                                                               |
| 1   | Use provided debug dtl.xml URL override                                                            |
| 2   | Disable the download of dtl.xml                                                                    |
| 3   | Skip connecting to SOAP EC and download ETickets with a false success result during TSL processing |
| 4   | Fake assume always ticket is present during TSL task condition processing                          |
| 5   | Skip NPNS notification fetch for auto title downloads with a false success result                  |

# Error Results

## NIM Results

<table>
<thead>
<tr class="header">
<th><p>Result</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0xE0E0D001</p></td>
<td><p>Non-null terminated string on IPC parameter for given
length.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D003</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of
unhandled values or -4199.</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D004</p></td>
<td><p>Unexpected/invalid state enums. (generic)</p></td>
</tr>
<tr class="even">
<td><p>0xC820D005</p></td>
<td><p>Invalid state under one title install manager.</p></td>
</tr>
<tr class="odd">
<td><p>0xD8A0D006</p></td>
<td><p>Error state enum value. (generic)</p></td>
</tr>
<tr class="even">
<td><p>0xC920D008</p></td>
<td><p>When content downloading, HTTP Status was not 200 or 206 when
connecting, and when status is 206, the Content-Range values failed
sanity check.</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D009</p></td>
<td><p>Mismatch system title hash with server system title
hash.</p></td>
</tr>
<tr class="even">
<td><p>0xC960D00C</p></td>
<td><p>Failed to convert country enum value in CFG save block 0xB0000 to
country ISO 3166-1 Alpha-2 code.</p></td>
</tr>
<tr class="odd">
<td><p>0xC960D00D</p></td>
<td><p>CFG didn't reply any serial number or dummy serial number
"000000000000000" was given.</p></td>
</tr>
<tr class="even">
<td><p>0xC860D00E</p></td>
<td><p>Max total size exceeded for system update pending titles. (128
MiB)</p></td>
</tr>
<tr class="odd">
<td><p>0xC880D00F</p></td>
<td><p>*to be filled*</p></td>
</tr>
<tr class="even">
<td><p>0xC8E0D011</p></td>
<td><p>Bad condition, title id for purpose or size under one title
install manager.</p></td>
</tr>
<tr class="odd">
<td><p>0xC960D012</p></td>
<td><p>Invalid .dat or less than expected size of buffer length read
from .dat save files during raw data load.</p></td>
</tr>
<tr class="even">
<td><p>0xC960D013</p></td>
<td><p>Daemon service is suspended.</p></td>
</tr>
<tr class="odd">
<td><p>0xC8A0D014</p></td>
<td><p>*to be filled*</p></td>
</tr>
<tr class="even">
<td><p>0xC960D015</p></td>
<td><p>Version mismatch for reinstall condition.</p></td>
</tr>
<tr class="odd">
<td><p>0xC960D016</p></td>
<td><p>Used in a few contexts where length does not match expected or
the limit. Example, seed data size from HTTP is not 16 bytes.</p></td>
</tr>
<tr class="even">
<td><p>0xC920D017</p></td>
<td><p>SetIVSData will not perform, conditions are not adequate to set
IVS. In Service Standby mode or not registered successfully in
IAS.</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D019</p></td>
<td><p>Certain EC connect flows disallowed to continue while IVS is
waiting to be synced from servers. System Transfer has previously
occurred and IVS is pending.</p></td>
</tr>
<tr class="even">
<td><p>0xC920D01A</p></td>
<td><p>For nim:s IPC cmd id 0x40, IVS not flagged for synchronization on
target console on EC connect after system transfer.</p></td>
</tr>
<tr class="odd">
<td><p>0xC960D01B</p></td>
<td><p>Failed to convert language enum value in CFG save block 0xA0002
to language ISO 639-1 code.</p></td>
</tr>
<tr class="even">
<td><p>0xE0E0D01C</p></td>
<td><p>Invalid installation mode for some IPC contexts.</p></td>
</tr>
<tr class="odd">
<td><p>0xE0C0D01E</p></td>
<td><p>May be either:</p>
<ul>
<li>Trying to set autodbg or dbgtasks with too many tasks on nim:u IPC
cmd ids 0x19 and 0x1B, respectively.</li>
<li>Non debug ENVINFO when calling debug version of get balance nim:s
IPC cmd id 0x56.</li>
<li>A boolean parameter for nim:s IPC cmd id 0x58 was set false.</li>
</ul></td>
</tr>
<tr class="even">
<td><p>0xD860D020</p></td>
<td><p>May be either:</p>
<ul>
<li>Result translation of 0xC860D06E if returned by the early attributes
filter handler.</li>
<li>If the internal Work-only heap fails to initialize with buffer
length lesser than 32 bytes. This buffer is given over IPC.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>0xC860D021</p></td>
<td><p>Task manager has run out of task slots.</p></td>
</tr>
<tr class="even">
<td><p>0xC920D022</p></td>
<td><p>Buffer size too small for ticket length on nim:aoc IPC cmd id
0x1B.</p></td>
</tr>
<tr class="odd">
<td><p>0xD880D023</p></td>
<td><p>When Account Id missing for nim:aoc IPC cmd id 0x1B and 0x20 or
when Account Id or Token are missing for nim:s IPC cmd id 0x53.</p></td>
</tr>
<tr class="even">
<td><p>0xD860D024</p></td>
<td><p>Failed to initialize Data Heap using buffer given over
IPC.</p></td>
</tr>
<tr class="odd">
<td><p>0xD920D025</p></td>
<td><p>SOAP reply implied that Service Standby mode is enabled. Certain
EC flows cancelled.</p></td>
</tr>
<tr class="even">
<td><p>0xC8A0D026</p></td>
<td><p>May be either:</p>
<ul>
<li>Result translation, NIM ran into NPNS result 0xD8A15C06 or NIM
result 0xD960D02B.</li>
<li>System updates pending while trying to SOAP EC connect with ETicket
download while processing auto downloads.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>0xC8A0D027</p></td>
<td><p>This occurs under certain code paths.</p>
<ol>
<li>Result translation of result error from:</li>
</ol>
<ul>
<li>HTTP module</li>
</ul>
<ul>
<li>SSL module</li>
</ul>
<ul>
<li>NIM module if description is between 100 to 299 (inclusive), 200
descriptions to fit the reserved range of the SOAP manager internal
error range of -4000 to -4199</li>
</ul>
<li>
<p>Unexpected HTTP status, followed up also by generating error integer
with 54400 + http status, result value used as a 005-xxxx error</p>
</li>
</ol></td>
</tr>
<tr class="even">
<td><p>0xD960D028</p></td>
<td><p>Generic XML parsing error. Not related to SOAP XML.</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D029</p></td>
<td><p>XML processor stub function called. Not related to SOAP
XML.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D02A</p></td>
<td><p>Generic XML data processing error: bad length or insufficient
memory. Not related to SOAP XML.</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D02B</p></td>
<td><p>Result translation of 0xD960D028.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D02C</p></td>
<td><p>Auto download programmed max task count exceeded trying to add
more to list. (64)</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D02D</p></td>
<td><p>tsl.xml or tsl.xml.tmp couldn't be opened. FS result translation
of description between 100 and 179, inclusive.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D02E</p></td>
<td><p>During tsl.xml task condition check. Still unclear, type of task
check</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D030</p></td>
<td><p>During tsl.xml task condition check. Ticket missing for title
when expected. Will not occur with autodbg flag bit 4 set.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D031</p></td>
<td><p>During tsl.xml task condition check. Title already installed when
not overwrite mode.</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D032</p></td>
<td><p>During tsl.xml task condition check. Task for title already
exists with same or higher version in task.dat.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D033</p></td>
<td><p>During tsl.xml task condition check. Task for title already
exists in task.dat.</p></td>
</tr>
<tr class="odd">
<td><p>0xD8E0D034</p></td>
<td><p>During tsl.xml task condition check. Unexpected task title
type.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D035</p></td>
<td><p>During tsl.xml task condition check. Tsl.xml task will not be
processed while max programmed maximum for tasks pending in task.dat is
equal or exceeded. (10)</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D037</p></td>
<td><p>Failed to load saved dtl.xml with result error of FS with
description between 100 and 179, inclusive.</p></td>
</tr>
<tr class="even">
<td><p>0xD960D038</p></td>
<td><p>During tsl.xml task condition check. Not enough space for target
SDMC user title.</p></td>
</tr>
<tr class="odd">
<td><p>0xD8A0D03A</p></td>
<td><p>No valid NPNS X-Device-Token was available while trying to fetch
it from CFG save block 0xF0006.</p></td>
</tr>
<tr class="even">
<td><p>0xD940D03B</p></td>
<td><p>Selected tsl.xml task was cancelled with nim:u IPC cmd id
0x18.</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D03C</p></td>
<td><p>Result translation for 0xD960D028 while trying to read XML. Not
related to SOAP XML.</p></td>
</tr>
<tr class="even">
<td><p>0xD8A0D03D</p></td>
<td><p>During tsl.xml task condition check. SDMC not inserted or
non-writable for SDMC title. (bad media status)</p></td>
</tr>
<tr class="odd">
<td><p>0xD960D03E</p></td>
<td><p>During tsl.xml task condition check. Not enough space for target
TWL user title.</p></td>
</tr>
<tr class="even">
<td><p>0xD940D03F</p></td>
<td><p>NPNS notification url is not HTTPS.</p></td>
</tr>
<tr class="odd">
<td><p>0xD940D040</p></td>
<td><p>NIM ran into NPNS result 0xD8A15C07. Result translation.</p></td>
</tr>
<tr class="even">
<td><p>0xD860D041</p></td>
<td><p>During tsl.xml task condition check. Pending task count of
task.dat and installed SDMC user title count exceed programmed max.
(300)</p></td>
</tr>
<tr class="odd">
<td><p>0xD860D042</p></td>
<td><p>During tsl.xml task condition check. Pending task count of
task.dat and installed TWL user title count exceed programmed max.
(40)</p></td>
</tr>
<tr class="even">
<td><p>0xD880D043</p></td>
<td><p>HTTP 404 while fetching title crypto seed from kagiya.</p></td>
</tr>
<tr class="odd">
<td><p>0xD880D044</p></td>
<td><p>HTTP 503 while fetching title crypto seed from kagiya.</p></td>
</tr>
<tr class="even">
<td><p>0xC960D065</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4001</p></td>
</tr>
<tr class="odd">
<td><p>0xE0C0D066</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4002</p></td>
</tr>
<tr class="even">
<td><p>0xE0E0D068</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4004</p></td>
</tr>
<tr class="odd">
<td><p>0xC860D069</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4005</p></td>
</tr>
<tr class="even">
<td><p>0xC880D06A</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4006</p></td>
</tr>
<tr class="odd">
<td><p>0xC8A0D06B</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4007</p></td>
</tr>
<tr class="even">
<td><p>0xC8A0D06C</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4008</p></td>
</tr>
<tr class="odd">
<td><p>0xC860D06E</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4010</p></td>
</tr>
<tr class="even">
<td><p>0xC920D073</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4015</p></td>
</tr>
<tr class="odd">
<td><p>0xC900D075</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4017</p></td>
</tr>
<tr class="even">
<td><p>0xC860D076</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4018</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D077</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4019</p></td>
</tr>
<tr class="even">
<td><p>0xC900D084</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4032</p></td>
</tr>
<tr class="odd">
<td><p>0xC900D085</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4033</p></td>
</tr>
<tr class="even">
<td><p>0xC920D086</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4034</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D08A</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4038</p></td>
</tr>
<tr class="even">
<td><p>0xC900D08B</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4039</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D08C</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4040</p></td>
</tr>
<tr class="even">
<td><p>0xE0A0D08D</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4041</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D08F</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4043</p></td>
</tr>
<tr class="even">
<td><p>0xC920D095</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4049</p></td>
</tr>
<tr class="odd">
<td><p>0xE0E0D099</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4053</p></td>
</tr>
<tr class="even">
<td><p>0xC900D09F</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4059</p></td>
</tr>
<tr class="odd">
<td><p>0xE100D0A0</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4060</p></td>
</tr>
<tr class="even">
<td><p>0xE100D0A1</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4061</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D0A4</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4064</p></td>
</tr>
<tr class="even">
<td><p>0xC920D0A7</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4067</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D0A8</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4068</p></td>
</tr>
<tr class="even">
<td><p>0xE0A0D0A9</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4069</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D0AD</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4073</p></td>
</tr>
<tr class="even">
<td><p>0xC920D0B1</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4077</p></td>
</tr>
<tr class="odd">
<td><p>0xC920D0B3</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4079</p></td>
</tr>
<tr class="even">
<td><p>0xC920D0B5</p></td>
<td><p>SOAP EC/NUP manager internal error number translation of value
-4081</p></td>
</tr>
</tbody>
</table>

## NPNS Results

NPNS has a module number for results, but no module exists, but can be
at least in part found inside NIM.

| Result     | Description                                                                    |
|------------|--------------------------------------------------------------------------------|
| 0xC9215C00 | Result translation, HTTP result 0xD8A0A018.                                    |
| 0xD8615C01 | Allocation error, insufficient memory.                                         |
| 0xD8A15C02 | HTTP non 2xx, json message processing, default error code switch result error. |
| 0xD8A15C03 | JSON processing errors.                                                        |
| 0xD8A15C04 | Notifications array bigger than expected.                                      |
| 0xD8A15C05 | HTTP Empty body response.                                                      |
| 0xD8A15C06 | HTTP non 2xx, json message processing, error code 1003 given in json body.     |
| 0xD8A15C07 | HTTP non 2xx, json message processing, error code 1000 given in json body.     |
| 0xD8A15C08 | HTTP non 2xx, json message processing, error code 1004 given in json body.     |

## Other Results

Any other result that is not given by other modules as a response, but
found internally in NIM.

| Result     | Module value | Description                                                                                                                |
|------------|--------------|----------------------------------------------------------------------------------------------------------------------------|
| 0xD8600801 | Util (2)     | Encoding errors. In NIM, if error while encoding base64 for X-Authentication-Key or X-Authentication-Data HTTP parameters. |

[Category:Services](Category:Services "wikilink")
+++
title = 'DLP Services'
+++

Download Play services are not used by the Download Play child
application at all(the title which runs on the Download Play clients).
This is used instead:
[<APT:GetWirelessRebootInfo>](APT:GetWirelessRebootInfo "wikilink"). The
DLP-child is launched by the dlplay system-application the same way as
any other system-application-\>system-application launching(besides
using
[NSS:SetWirelessRebootInfo](NSS:SetWirelessRebootInfo "wikilink")).

There can only be one session open for each individual DLP service at a
time.

# Download Play Client Service "dlp:CLNT"

| Command Header | Available since system version | Description                                                               |
|----------------|--------------------------------|---------------------------------------------------------------------------|
| 0x000100C3     | ?                              | Initialize                                                                |
| 0x00020000     | ?                              | Finalize                                                                  |
| 0x00030000     | ?                              | GetEventDesc. Writes 0x18-bytes of output starting at cmdreply\[2\].      |
| 0x00040000     | ?                              | GetChannel. Writes an output u16 to cmdreply\[2\].                        |
| 0x00050180     | ?                              | StartScan                                                                 |
| 0x00060000     | ?                              | StopScan                                                                  |
| 0x00070080     | ?                              | GetServerInfo                                                             |
| 0x00080100     | ?                              | GetTitleInfo                                                              |
| 0x00090040     | ?                              | GetTitleInfoInOrder                                                       |
| 0x000A0080     | ?                              | DeleteScanInfo                                                            |
| 0x000B0100     | ?                              | PrepareForSystemDownload                                                  |
| 0x000C0000     | ?                              | StartSystemDownload                                                       |
| 0x000D0100     | ?                              | StartTitleDownload                                                        |
| 0x000E0000     | ?                              | GetMyStatus                                                               |
| 0x000F0040     | ?                              | GetConnectingNodes                                                        |
| 0x00100040     | ?                              | GetNodeInfo                                                               |
| 0x00110000     | ?                              | [GetWirelessRebootPassphrase](DLP:GetWirelessRebootPassphrase "wikilink") |
| 0x00120000     | ?                              | StopSession                                                               |
| 0x00130100     | ?                              | GetCupVersion                                                             |
| 0x00140100     | ?                              | GetDupAvailability                                                        |

# Download Play Server Service "dlp:SRVR"

| Command Header | Available since system version | Description                                                                     |
|----------------|--------------------------------|---------------------------------------------------------------------------------|
| 0x00010183     |                                | [Initialize](DLPSRVR:Initialize "wikilink")                                     |
| 0x00020000     |                                | [Finalize](DLPSRVR:Finalize "wikilink")                                         |
| 0x00030000     |                                | [GetServerState](DLPSRVR:GetServerState "wikilink")                             |
| 0x00040000     |                                | [GetEventDescription](DLPSRVR:GetEventDescription "wikilink")                   |
| 0x00050080     |                                | [StartAccepting](DLPSRVR:StartAccepting "wikilink")                             |
| 0x00060000     |                                | [EndAccepting](DLPSRVR:EndAccepting "wikilink")                                 |
| 0x00070000     |                                | [StartDistribution](DLPSRVR:StartDistribution "wikilink")                       |
| 0x000800C0     |                                | [SendWirelessRebootPassphrase](DLPSRVR:SendWirelessRebootPassphrase "wikilink") |
| 0x00090040     |                                | [AcceptClient](DLPSRVR:AcceptClient "wikilink")                                 |
| 0x000A0040     |                                | [DisconnectClient](DLPSRVR:DisconnectClient "wikilink")                         |
| 0x000B0042     |                                | [GetConnectingClients](DLPSRVR:GetConnectingClients "wikilink")                 |
| 0x000C0040     |                                | [GetClientInfo](DLPSRVR:GetClientInfo "wikilink")                               |
| 0x000D0040     |                                | [GetClientState](DLPSRVR:GetClientState "wikilink")                             |
| 0x000E0040     |                                | [IsChild](DLPSRVR:IsChild "wikilink")                                           |
| 0x000F0303     |                                | [InitializeWithName](DLPSRVR:InitializeWithName "wikilink")                     |
| 0x00100000     |                                | [GetDupNoticeNeed](DLPSRVR:GetDupNoticeNeed "wikilink")                         |

# Download Play Fake Client Service "dlp:FKCL"

| Command Header | Available since system version | Description                                                               |
|----------------|--------------------------------|---------------------------------------------------------------------------|
| 0x00010083     | ?                              | Initialize                                                                |
| 0x00020000     | ?                              | Finalize                                                                  |
| 0x00030000     | ?                              | GetEventDesc                                                              |
| 0x00040000     | ?                              | GetChannels                                                               |
| 0x00050180     | ?                              | StartScan                                                                 |
| 0x00060000     | ?                              | StopScan                                                                  |
| 0x00070080     | ?                              | GetServerInfo                                                             |
| 0x00080100     | ?                              | GetTitleInfo                                                              |
| 0x00090040     | ?                              | GetTitleInfoInOrder                                                       |
| 0x000A0080     | ?                              | DeleteScanInfo                                                            |
| 0x000B0100     | ?                              | StartFakeSession                                                          |
| 0x000C0000     | ?                              | GetMyStatus                                                               |
| 0x000D0040     | ?                              | GetConnectingNodes                                                        |
| 0x000E0040     | ?                              | GetNodeInfo                                                               |
| 0x000F0000     | ?                              | [GetWirelessRebootPassphrase](DLP:GetWirelessRebootPassphrase "wikilink") |
| 0x00100000     | ?                              | Same as dlp:CLNT cmd12 (StopSession).                                     |
| 0x00110203     | ?                              | Calls the same function as DLPFKCL:Initialize.                            |

# WirelessRebootPassphrase

This 9-byte UDS passphrase is sent by the DLP host application to the
DLP clients via
[DLPSRVR:SendWirelessRebootPassphrase](DLPSRVR:SendWirelessRebootPassphrase "wikilink").
The dlplay client system-application then loads it via
[DLP:GetWirelessRebootPassphrase](DLP:GetWirelessRebootPassphrase "wikilink")
for [setting](NSS:SetWirelessRebootInfo "wikilink") the NS
[WirelessRebootInfo](NS_and_APT_Services#WirelessRebootInfo "wikilink").
Afterwards once launched, the DLP child application can then use
[<APT:GetWirelessRebootInfo>](APT:GetWirelessRebootInfo "wikilink") to
load that data.

Normally this a randomly-generated ASCII hex string, however it can be
arbitrary. These strings are less than 9-bytes for some titles, the
unused bytes are cleared to zero. This is the passphrase for the new UDS
network which will be used by the clients and host for communicating,
once the DLP child titles on those clients launch. This entire 9-byte
passphrase is passed directly to the [UDS](NWM_Services "wikilink")
network connection/creation commands.
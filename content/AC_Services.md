+++
title = 'AC Services'
categories = ["Services"]
+++

# AC service "ac:u"

These commands are common to both ac:u and ac:i

| Command Header | Description                                                                                                      |
|----------------|------------------------------------------------------------------------------------------------------------------|
| 0x00010000     | CreateDefaultConfig                                                                                              |
| 0x00015004     | ExclusiveAsync                                                                                                   |
| 0x00020042     | DebugSetApType                                                                                                   |
| 0x00030042     | DebugSetNetworkArea                                                                                              |
| 0x00040006     | ConnectAsync                                                                                                     |
| 0x00050002     | GetConnectResult                                                                                                 |
| 0x000600C6     | DebugSetNetworkSetting1                                                                                          |
| 0x00070002     | CancelConnectAsync                                                                                               |
| 0x00080004     | CloseAsync                                                                                                       |
| 0x00090002     | GetCloseResult                                                                                                   |
| 0x000A0000     | GetLastErrorCode                                                                                                 |
| 0x000B0000     | GetLastDetailErrorCode                                                                                           |
| 0x000C0000     | GetStatus                                                                                                        |
| 0x000D0000     | [GetWifiStatus](ACU:GetWifiStatus "wikilink")                                                                    |
| 0x000E0042     | [GetCurrentAPInfo](ACU:GetCurrentAPInfo "wikilink")                                                              |
| 0x000F0000     | GetConnectingInfraPriority                                                                                       |
| 0x00100042     | [GetCurrentNZoneInfo](ACU:GetCurrentNZoneInfo "wikilink")                                                        |
| 0x00110042     | [GetNZoneApNumService](ACU:GetNZoneApNumService "wikilink")                                                      |
| 0x00120042     | GetConnectingHotspot                                                                                             |
| 0x00130042     | GetConnectingHotspotSubset                                                                                       |
| 0x00140002     | GetConnectingLocation                                                                                            |
| 0x00160002     | GetExclusiveResult                                                                                               |
| 0x00170004     | UnExclusiveAsync                                                                                                 |
| 0x00180002     | GetUnExcusiveResult                                                                                              |
| 0x00190004     | CloseAllASync                                                                                                    |
| 0x001A0002     | GetCloseAllResult                                                                                                |
| 0x001B0004     | LogoutHotspotAsync                                                                                               |
| 0x001C0002     | GetLogoutHotspotResult                                                                                           |
| 0x001D0042     | [ScanAPs](AC:ScanAPs "wikilink") System Settings uses this via ac:i, this is presumably accessible via ac:u too. |
| 0x001E0042     | ScanNintendoZone                                                                                                 |
| 0x001F0042     | ScanNintendoZoneSubset                                                                                           |
| 0x00200005     | BeginScanUsbAccessPoint                                                                                          |
| 0x00210002     | EndScanUsbAccessPoint                                                                                            |
| 0x00220042     | SetAllowApType                                                                                                   |
| 0x00230042     | AddAllowApType                                                                                                   |
| 0x00240042     | AddDenyApType                                                                                                    |
| 0x00250042     | SetNetworkArea                                                                                                   |
| 0x00260042     | SetInfraPriority                                                                                                 |
| 0x00270002     | GetInfraPriority                                                                                                 |
| 0x00280042     | SetPowerSaveMode                                                                                                 |
| 0x00290002     | GetPowerSaveMode                                                                                                 |
| 0x002A0004     | SetBssidFilter                                                                                                   |
| 0x002B0004     | SetApNumFilter                                                                                                   |
| 0x002C0042     | SetFromApplication                                                                                               |
| 0x002D0082     | SetRequestEulaVersion                                                                                            |
| 0x002E00C4     | ConvertPassphraseToPsk                                                                                           |
| 0x002F0004     | GetNZoneBeaconNotFoundEvent                                                                                      |
| 0x00300004     | RegisterDisconnectEvent                                                                                          |
| 0x00310002     | GetStatusChangeEvent                                                                                             |
| 0x00320042     | SetAuthServerType                                                                                                |
| 0x00330000     | [GetConnectingSecurityMode](ACU:GetConnectingSecurityMode "wikilink")                                            |
| 0x00340000     | GetConnectingSsid                                                                                                |
| 0x00350000     | [GetConnectingSsidLength](ACU:GetConnectingSsidLength "wikilink")                                                |
| 0x00360000     | GetConnectingProxyEnable                                                                                         |
| 0x00370000     | GetConnectingProxyAuthType                                                                                       |
| 0x00380000     | GetConnectingProxyPort                                                                                           |
| 0x00390000     | GetConnectingProxyHost                                                                                           |
| 0x003A0000     | GetConnectingProxyUserName                                                                                       |
| 0x003B0000     | GetConnectingProxyPassword                                                                                       |
| 0x003C0042     | [GetAPSSIDList](ACU:GetAPSSIDList "wikilink")                                                                    |
| 0x003D0042     | SetZoneMacFilter                                                                                                 |
| 0x003E0042     | IsConnected                                                                                                      |
| 0x003F0040     | GetNotAwakeMacFilter                                                                                             |
| 0x00400042     | [SetClientVersion](ACU:SetClientVersion "wikilink")                                                              |
| 0x004100C6     | SetTemporaryNetworkSettings                                                                                      |
|                |                                                                                                                  |

# AC service "ac:i"

These commands are exclusive to ac:i

| Command Header | Description                                                         |
|----------------|---------------------------------------------------------------------|
| 0x04010040     | [LoadNetworkSetting](ACI:LoadNetworkSetting "wikilink")             |
| 0x04020040     | [UpdateNetworkSetting](ACI:UpdateNetworkSetting "wikilink")         |
| 0x04030040     | [RemoveNetworkSetting](ACI:RemoveNetworkSetting "wikilink")         |
| 0x04040000     | [FlushNetworkSetting](ACI:FlushNetworkSetting "wikilink")           |
| 0x04050084     | ConvertNetworkSettingNdsTo3ds                                       |
| 0x04060040     | [InitializeNetworkSetting](ACI:InitializeNetworkSetting "wikilink") |
| 0x04070000     | GetNetworkSettingVersion                                            |
| 0x04080040     | SetNetworkSettingVersion                                            |
| 0x04090000     | [GetNetworkSetting_Crc](ACI:GetNetworkSetting_Crc "wikilink")       |
| 0x040A0040     | SetNetworkSetting_Crc                                               |
| 0x040B0000     | GetNetworkWirelessEnable                                            |
| 0x040C0040     | SetNetworkWirelessEnable                                            |
| 0x040D0000     | GetNetworkWirelessEditableEssidSecurity                             |
| 0x040E0040     | SetNetworkWirelessEditableEssidSecurity                             |
| 0x040F0000     | GetNetworkWirelessEssidSecuritySsid                                 |
| 0x04100002     | SetNetworkWirelessEssidSecuritySsid                                 |
|                |                                                                     |
| 0x04110000     | GetNetworkWireleesEssidSsidLength                                   |
| 0x04120040     | SetNetworkWirelessEssidSsidLength                                   |
| 0x04130000     | GetNetworkWirelessEssidSecurityMode                                 |
| 0x04140040     | SetNetworkWirelessEssidSecurityMode                                 |
| 0x04150000     | GetNetworkWirelessEssidPassphrase                                   |
| 0x04160002     | SetNetworkWirelessEssidPassphrase                                   |
| 0x41700000     | GetNetworkWirelessEssidSecurityKey                                  |
| 0x04180002     | SetNetworkWirelessEssidSecurityKey                                  |
| 0x04190000     | GetNetworkMultiSSIDEnable(bool)                                     |
| 0x041A0040     | SetNetworkMultiSSIDEnable                                           |
| 0x041B0000     | GetNetworkWirelesMultiSsidMultiSsidType                             |
| 0x041C0040     | SetNetworkWirelesMultiSsidMultiSsidType                             |
| 0x041D0000     | GetNetworkWirelessMultiSsidSettingNum                               |
| 0x041E0040     | SetNetworkWirelessMultiSsidSettingNum                               |
| 0x041F0000     | GetNetworkWirelessMultiSsidSetting0Ssid                             |
| 0x04200002     | SetNetworkWirelessMultiSsidSetting0Ssid                             |
| 0x04210000     | GetNetworkWirelessMultiSsidSetting0SsidLength                       |
| 0x04220040     | ?                                                                   |
| 0x04240040     | ?                                                                   |
| 0x04250000     | GetNetworkWirelessMultiSsidSetting0PassPhrase                       |
| 0x04260002     | ?                                                                   |
| 0x04270000     | GetNetworkWirelessMultiSsidSetting0Key                              |
| 0x04280002     | SetNetworkWirelessMultiSsidSetting0Key                              |
| 0x04290000     | GetNetworkMultiSsidSetting1Ssid                                     |
| 0x042A0002     | SetNetworkMultiSsidSetting1Ssid                                     |
| 0x042B0000     | GetNetworkMultiSsidSetting1SsidLength                               |
| 0x042C0040     | ?                                                                   |
| 0x042E0040     | ?                                                                   |
| 0x42F00000     | GetNetworkWirelessMultiSsidSetting1PassPhrase                       |
| 0x04300002     | ?                                                                   |
| 0x04310000     | GetNetworkWirelessMultiSsidSetting1Key                              |
| 0x04320002     | SetNetworkWirelessMultiSsidSetting1Key                              |
| 0x04330000     | GetNetworkWirelessMultiSsidSetting2Ssid                             |
| 0x04340002     | SetNetworkWirelessMultiSsidSetting2Ssid                             |
| 0x04360040     | ?                                                                   |
| 0x04380040     | ?                                                                   |
| 0x04390000     | GetNetworkWirelessMultiSsidSetting2Passphrase                       |
| 0x043A0040     | ?                                                                   |
| 0x043B0000     | GetNetworkWirelessMultiSsidSetting2Key                              |
| 0x043C0002     | SetNetworkWirelessMultiSsidSetting2Key                              |
| 0x043D0000     | GetNetworkWirelessMultiSsidSetting3Ssid                             |
| 0x043E0002     | SetNetworkWirelessMultiSsidSetting3Ssid                             |
| 0x04440002     | ?                                                                   |
| 0x04450000     | GetNetworkWirelessMultiSsidSetting3Key                              |
| 0x04460002     | SetNetworkWirelessMultiSsidSetting3Key                              |
| 0x04470000     | GetNetworkIpEnableDHCP                                              |
| 0x04480040     | SetNetworkIpEnableDHCP                                              |
| 0x04490000     | GetNetworkAutoDNSSetting                                            |
| 0x044A0040     | SetNetworkAutoDNSSetting                                            |
| 0x044B0000     | GetNetworkIpAddress                                                 |
| 0x044C0002     | SetNetworkIpAddress                                                 |
| 0x044D0000     | GetNetworkDefaultGateway                                            |
| 0x044E0002     | SetNetworkDefaultGateway                                            |
| 0x044F0000     | GetNetworkIpNetmask                                                 |
| 0x04500002     | SetNetworkIpNetMask                                                 |
| 0x04510000     | GetNetworkIpPrimaryDNS                                              |
| 0x04520002     | SetNetworkIpPrimaryDNS                                              |
| 0x04530000     | GetNetworkIpSecondaryDNS                                            |
| 0x04540002     | SetNetworkIpSecondaryDNS                                            |
| 0x04550000     | GetNetworkIpScanlessConnectHasConnected                             |
| 0x04560040     | SetNetworkIpScanlessConnectHasConnected                             |
| 0x0459000      | GetNetworkIpScanlessConnectLastConnectedBssid                       |
| 0x045A002      | SetNetworkIpScanlessConnectLastConnectedBssid                       |
| 0x045F0000     | [GetNetworkProxyEnable](ACI:GetNetworkProxyEnable "wikilink")       |
| 0x04600040     | SetNetworkProxyEnable                                               |
| 0x04610000     | GetNetworkProxyAuthType                                             |
| 0x04620040     | SetNetworkProxyAuthType                                             |
| 0x04630000     | GetNetworkProxyPort                                                 |
| 0x04640040     | SetNetworkProxyPort                                                 |
| 0x04650000     | GetNetworkProxyHost                                                 |
| 0x04660002     | SetNetworkProxyHost                                                 |
| 0x04670000     | GetNetworkSettingProxyUserName                                      |
| 0x04680002     | SetNetworkSettingProxyUserName                                      |
| 0x04690000     | GetNetworkSettingProxyPassword                                      |
| 0x046A0002     | SetNetworkSettingProxyPassword                                      |
| 0x046B0000     | GetNetworkEnableUPnP                                                |
| 0x046C0040     | SetNetworkEnableUPnP                                                |
| 0x046D0000     | GetNetworkOtherMtu                                                  |
| 0x046E0040     | SetNetworkOtherMtu                                                  |
| 0x046F0000     | GetConnectingNetworkSettingVersion(?)                               |
| 0x04700000     | GetConnectingNetworkCrc                                             |
| 0x04710000     | GetConnectingNetworkWirelessEnable                                  |
| 0x04730000     | GetConnectingNetworkWirelessEssidSsid                               |
| 0x04770000     | GetConnectingNetworkWirelessEssidSecurityKey                        |
| 0x04780000     | GetConnectingNetworkMultiSsidEnable                                 |
| 0x048F0000     | GetConnectingNetworkEnableDHCP(bool)                                |
| 0x04900000     | GetConnectingNetworkIpAutoDNSSetting                                |
| 0x04910000     | GetConnectingNetworkIpAddress                                       |
| 0x04920000     | GetConnectingNetworkIpDefaultGateway                                |
| 0x04930000     | GetConnectingNetworkIpNetmask                                       |
| 0x04940000     | GetConnectingNetworkPrimaryDNS                                      |
| 0x04950000     | GetConnectingNetworkSecondaryDNS                                    |
| 0x049B0000     | GetConnectingNetworkProxyEnable(bool)                               |
| 0x049C0000     | GetConnectingNetworkProxyAuthType                                   |
| 0x049D0000     | GetConnectingNetworkProxyPort                                       |
| 0x049E0000     | GetConnectingNetworkProxyHost                                       |
| 0x049F0000     | GetConnectingNetworkProxyUserName                                   |
| 0x04A00000     | GetConnectingNetworkProxyPassword                                   |
| 0x04A10000     | GetConnectingNetworkEnableUPnP(bool)                                |
| 0x04A20000     | GetConnectingNetworkMtu                                             |

[Category:Services](Category:Services "wikilink")

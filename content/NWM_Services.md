+++
title = 'NWM Services'
categories = ["Services"]
+++

These NWM services are used for local-WLAN communications, NWM module handles regular wifi APs as well. These services are used for creating/connecting to networks, and for sending/receiving data over the network etc. NWM module uses the wifi SDIO hardware via the IO registers for this.

# NWM local-WLAN service "nwm::UDS"

| Command Header | Available since system version | Description |
|----|----|----|
| 0x000102C2 |  | Initialize Deprecated. Appears to be handled about the same way as [NWMUDS:InitializeWithVersion](NWMUDS:InitializeWithVersion "wikilink"), except this uses version=0x100 internally instead of loading it from the command request. |
| 0x00020000 |  | Scrap Not used by sub-wars. This sets a state value to 0x2 then signals an event. This is probably some sort of shutdown command since this state write will result in all UDS commands returning an error if used afterwards. |
| 0x00030000 |  | [Finalize](NWMUDS:Finalize "wikilink") |
| 0x00040402 |  | CreateNetwork Deprecated. Only used by very old titles. |
| 0x00050040 |  | [EjectClient](NWMUDS:EjectClient "wikilink") |
| 0x00060000 |  | [EjectSpectator](NWMUDS:EjectSpectator "wikilink") |
| 0x00070080 |  | [UpdateNetworkAttribute](NWMUDS:UpdateNetworkAttribute "wikilink") |
| 0x00080000 |  | [DestroyNetwork](NWMUDS:DestroyNetwork "wikilink") |
| 0x00090442 |  | ConnectNetwork Deprecated. Only used by very old titles. |
| 0x000A0000 |  | [DisconnectNetwork](NWMUDS:DisconnectNetwork "wikilink") |
| 0x000B0000 |  | [GetConnectionStatus](NWMUDS:GetConnectionStatus "wikilink") |
| 0x000C0000 |  | This writes two output u8 values to cmdreply\[2\] +0/+1. Not used by sub-wars. |
| 0x000D0040 |  | [GetNodeInformation](NWMUDS:GetNodeInformation "wikilink") |
| 0x000E0006 |  | *Identical* to [GetNodeInformationList](NWMUDS:GetNodeInformationList "wikilink"). Deprecated, only used by old titles. |
| 0x000F0404 |  | [StartScan](NWMUDS:StartScan "wikilink") |
| 0x00100042 |  | [SetApplicationData](NWMUDS:SetApplicationData "wikilink") |
| 0x00110040 |  | [GetApplicationData](NWMUDS:GetApplicationData "wikilink") |
| 0x00120100 |  | [Bind](NWMUDS:Bind "wikilink") |
| 0x00130040 |  | [Unbind](NWMUDS:Unbind "wikilink") |
| 0x001400C0 |  | [PullPacket](NWMUDS:PullPacket "wikilink") |
| 0x00150080 |  | SetMaxSendDelay(u64 unk) Not used by sub-wars. |
| 0x00160040 |  | (u8 inputval) Unknown. Not used by sub-wars. |
| 0x00170182 |  | [SendTo](NWMUDS:SendTo "wikilink") |
| 0x00180040 |  | (u16 inputval) Unknown. Not used by sub-wars. |
| 0x00190040 |  | (u32 inputval) Unknown. Not used by sub-wars. |
| 0x001A0000 |  | [GetChannel](NWMUDS:GetChannel "wikilink") |
| 0x001B0302 |  | [InitializeWithVersion](NWMUDS:InitializeWithVersion "wikilink") |
| 0x001C0040 |  | (u8 inputval) Unknown. Not used by sub-wars. |
| 0x001D0044 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | [CreateNetwork2](NWMUDS:CreateNetwork2 "wikilink") This is a replacement for the original network-creation command. |
| 0x001E0084 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | [ConnectNetwork2](NWMUDS:ConnectNetwork2 "wikilink") This is a replacement for the original network-connection command. |
| 0x001F0006 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | [GetNodeInformationList](NWMUDS:GetNodeInformationList "wikilink") |
| 0x00200040 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | Flush (u8 data_frame_index) Unknown. Not used by sub-wars. |
| 0x00210080 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | [SetProbeResponseParam](NWMUDS:SetProbeResponseParam "wikilink") |
| 0x00220402 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | [ScanOnConnection](NWMUDS:ScanOnConnection "wikilink") |
| 0x00230000 | Unknown, \>[2.0.0-2](2.0.0-2 "wikilink") | This writes an output u16 value to cmdreply\[2\]. Unknown. Not used by sub-wars. |

PullPacket is used for receiving data over the network and SendTo is for sending data over the network.

# NWM infrastructure service "nwm::INF"

| Command Header | Description |
|----|----|
| 0x00010000 | ? |
| 0x00020000 | ? |
| 0x00030000 | ? |
| 0x00040000 | ? |
| 0x00050000 | ? |
| 0x000603C4 | [RecvBeaconBroadcastData](NWMINF:RecvBeaconBroadcastData "wikilink") |
| 0x00070742 | [ConnectToEncryptedAP](NWMINF:ConnectToEncryptedAP "wikilink") |
| 0x00080302 | [ConnectToAP](NWMINF:ConnectToAP "wikilink") |
| 0x00090000 | ? |
| 0x000A0000 | ? |
| 0x000B0000 | ?, return event handle in cmdbuf\[3\] |
| 0x000C0040 | ? |
| 0x000D0000 | ? |
| 0x000E0002 | ? |
| 0x000F0082 | ? |
| 0x00100040 | ? |

# NWM socket service "nwm::SOC"

| Command Header | Description |
|----|----|
| 0x00010042 | (u32 size, <static_buffer translate-hdr with static_buf_id=0>, addr) ? |
| 0x00020080 | (u32 unk, u32 size) Unknown. Uses size=0x5F8 internally unless the input is \<=0x5F8. Uses an ipc static_buffer(static_buf_id=0) for output with the specified size(also used when writing the translate-hdr). Writes an output u32 to cmdreply\[2\]. |
| 0x00030042 | (u32 unk, u32 size, <static_buffer translate-hdr with static_buf_id=0>, addr) ? |
| 0x00040042 | (u32 size, u32 unk, <static_buffer translate-hdr with static_buf_id=1>, addr) ? |
| 0x00050040 | (u32 unk) ? |
| 0x00060080 | (u32 unk0, u16 unk1) ? |
| 0x00070040 | (u16 unk) This writes an output u32 to cmdreply\[2\]. |
| 0x00080040 | [GetMACAddress](NWMSOC:GetMACAddress "wikilink") |
| 0x00090000 | This just copies data from state to the cmdreply, this always returns 0. u32 cmdreply\[2\] = sharedmem_size, cmdreply\[4\] = [sharedmem_handle](NWM_Shared_Memory "wikilink"), cmdreply\[5\] = eventhandle. |
| 0x000A0040 | (u32 unk) ? |
| 0x000B0040 | (u32 unk) This writes an output u32 to cmdreply\[2\]. |
| 0x000C0040 | (u32 unk) ? |
| 0x000D0002 | ([kernel_processid_translatehdr](IPC "wikilink"), u32 processid) ? |

The only sysmodule which uses this is [socket](Socket_Services "wikilink")-sysmodule. The first command used by socket-module is cmd9.

# NWM service "nwm::SAP"

# NWM local-WLAN [StreetPass](StreetPass "wikilink") service "nwm::CEC"

| Command Header | Description |
|----|----|
| 0x00060002 | Unknown, called by CECD module, cmdbuf\[2\] takes an event handle. |
| 0x000D0082 | [SendProbeRequest](NWMCEC:SendProbeRequest "wikilink") |

# NWM service "nwm::EXT"

| Command Header | Available since system version | Description |
|----|----|----|
| 0x00010000 | \<=[2.0.0-2](2.0.0-2 "wikilink") | ? |
| 0x00020000 | \<=[2.0.0-2](2.0.0-2 "wikilink") | ? |
| 0x00030000 | \<=[2.0.0-2](2.0.0-2 "wikilink") | ? |
| 0x00040040 | \<=[2.0.0-2](2.0.0-2 "wikilink") | SetWifiLinkLevel |
| 0x00050002 | \<=[2.0.0-2](2.0.0-2 "wikilink") | ? |
| 0x00060000 | \<=[2.0.0-2](2.0.0-2 "wikilink") | ? |
| 0x00070000 | \<=[2.0.0-2](2.0.0-2 "wikilink") | This copies 0x1C-bytes from NWM-module state to the data starting at cmdreply\[2\]. |
| 0x00080040 | \<=[2.0.0-2](2.0.0-2 "wikilink") | [ControlWirelessEnabled](NWMEXT:ControlWirelessEnabled "wikilink") |
| 0x00090000 | \<=[2.0.0-2](2.0.0-2 "wikilink") | ? |

# NWM service "nwm::TST"

# BeaconDataReply Structure

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | Max output size, from the command request. |
| 0x4 | 0x4 | Total amount of output data written relative to struct+0. 0xC when there's no entries. |
| 0x8 | 0x4 | Total entries, 0 for none. |
| 0xC | <Rest of the structure> | Beacon entries. |

Beacon entry:

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | Size of this entire entry. The next entry starts at curentry_startoffset+curentry_size. |
| 0x4 | 0x1 | ? |
| 0x5 | 0x1 | AP wifi channel. |
| 0x6 | 0x1 | ? |
| 0x7 | 0x1 | ? |
| 0x8 | 0x6 | AP MAC address. |
| 0xE | 0x6 | ? |
| 0x14 | 0x4 | Size of this entire entry, games use this value to traverse the beacons list. |
| 0x18 | 0x4 | Value 0x1C(size of this header and/or offset to the actual beacon data). |
| 0x1C | Entry_size - 0x1C | The actual beacon data is located here, starting at the 802.11 management frame header. |

This section describes the structure returned by [NWMINF:RecvBeaconBroadcastData](NWMINF:RecvBeaconBroadcastData "wikilink") and [NWMUDS:RecvBeaconBroadcastData](NWMUDS:RecvBeaconBroadcastData "wikilink").

# ScanInputStruct

| Index Word | Description |
|----|----|
| 0 | Two unknown u16s. |
| 1 | Two unknown u16s. |
| 2-3 | Host MAC address. The 6-bytes located here are normally all 0xFF, for all hosts. Otherwise when not set to broadcast-MAC, the command will only return info for the specified host MAC address. |
| 4-12 | Uninitialized for UDS. |

This section describes the 0x34-byte input structure used by [NWMINF:RecvBeaconBroadcastData](NWMINF:RecvBeaconBroadcastData "wikilink") and [NWMUDS:RecvBeaconBroadcastData](NWMUDS:RecvBeaconBroadcastData "wikilink").

# Local-WLAN

UDS is used for 3DS\<\>3DS local-WLAN communications, and for 3DS\<\>Wii U communications. The latter is mainly only used for multi-player in games.

All UDS local-WLAN communications have the CCMP key for data encryption generated via NWM module. The CCMP key passed to nwm::CEC commands(stored in a 0x44-byte input structure) for [StreetPass](StreetPass "wikilink") is generated by the CECD module. The input data used with [EncryptDecryptAes](Process_Services "wikilink") with [keytype1](PSPXI:EncryptDecryptAes "wikilink") is a MD5 hash over the input passphrase. This input passphrase is fixed for [Download Play](Download_Play "wikilink"), it's unique per local-WLAN application. The CTR is a MD5 hash over the below 0x10-byte structure. The output from encrypting that data with AES-CTR is the final CCMP key. This passphrase is a raw input buffer: while the passphrase specified by user-processes is normally a string with the NUL-terminator included, it can be anything(like the [WirelessRebootPassphrase](DLP_Services "wikilink") for example).

The maximum number of nodes(including the host) which can be on an UDS network is 16.

## NodeID

There are two types of client connections: regular Client, and Spectator. The latter *never* sends *any* 802.11 frame at all to the host, hence *nothing* actually connected to the network(including the host) can know about any spectators. Once a spectator is "connected" to a network, it can only receive broadcasted data, no sending.

DLP-client connects to the network as a spectator during DLP scanning to get various [metadata](Download_Play "wikilink") including icon data.

### NetworkNodeID

This is the network u16 ID for each device on the UDS network. NodeID 0xFFFF is a broadcast alias. 0x1 is for the host, the 0x2 for the first client, 0x3 for the second client, and so on.

The spectator doesn't have a NetworkNodeID, since it can't [send](NWMUDS:SendTo "wikilink") any data.

NetworkNodeIDs for clients do not change when any clients disconnect, likewise for the encrypted node-listing stored in the wifi beacons. When a client disconnects, the corresponding NetworkNodeID bit in the [node_bitmask](NWMUDS:GetConnectionStatus "wikilink") is cleared. When a client is connecting, the client is assigned the NetworkNodeID with the lowest corresponding clear-bit in the [node_bitmask](NWMUDS:GetConnectionStatus "wikilink"), then that bit is set.

### BindNodeID

This u32 is an ID only used on the local device. How many devices are on the network or which device this system is does not affect this ID.

The spectator uses BindNodeID 0x1. DLP uses BindNodeID 0x3 when connecting as an actual client. Hence, it seems BindNodeID bit0 is spectator-related. All normal nodes(host/client) start with BindNodeID 0x2. When connecting to a network again(and probably with network creation) without reinitializing NWMUDS, official user processes increase the used BindNodeID by 0x2.

BindNodeID value 0x0 is invalid. The maximum number of BindNodeIDs which can be open at the same time is 16.

## Application data transfer

The protocol used for sending/receiving data over the network with UDS by official applications is [PRUDP](PRUDP "wikilink")(in some cases at least). Mario Kart 7 uses PRUDP here. Triforce Heroes uses plaintext for whatever protocol it uses for UDS.

The UDS version of [PRUDP](PRUDP "wikilink") is different from the normal UDP version it appears(no afa1/a1af data for example).

## Communication protocol

The process of connecting to a host and exchanging data follows the sequence:

Client-\>Server: Authentication frame SEQ1

Server-\>Client: Authentication frame SEQ2

\[There does not appear to be an association request frame sent by the client to the server, it is however possible that it was sent and just not captured by the test equipment\]

Server-\>Client: Association Response frame with association id

\[From here on, the client is connected to the server\]

Client-\>Server: Encrypted data packet containing an 8-byte 802.2 LLC header with ethertype = EAPoL (0x888E) and an u16 header of 0x201 ([EAPoL-Start](NWM_Services#eapol-start-frame "wikilink"))

Server-\>Broadcast: Encrypted data packet containing the updated node information after the client connected (Using ethertype = SecureData).

Server-\>Client: Encrypted data packet containing an 8-byte 802.2 LLC header with ethertype = EAPoL (0x888E) and an u16 header of 0x0202([EAPoL-Logoff](NWM_Services#eapol-logoff-frame "wikilink"))

\[From here on, data packets sent using SendTo are encapsulated with an LLC header with ethertype = 0x876D ([SecureData](NWM_Services#securedata_nwm_header "wikilink"))\]

\[The client also sends periodic SecureData data frames on its own, these are probably ping frames\]

## Data frames

Data is transferred over the network using [NWMUDS:PullPacket](NWMUDS:PullPacket "wikilink")/[NWMUDS:SendTo](NWMUDS:SendTo "wikilink"). That data is transferred using 802.11 data frames using CCMP encryption. The encrypted data contained in the frame starts with the 0x8-byte [LLC header](https://en.wikipedia.org/wiki/Subnetwork_Access_Protocol#Use), then the 0xE-byte NWM header, followed by the actual application data from the previously mentioned commands. When [NWMUDS:SendTo](NWMUDS:SendTo "wikilink") was used with dst_NodeID = broadcast, the data frame is sent to the 802.11 broadcast MAC address. Otherwise with a specific NodeID, the data frame is sent to the actual MAC address for that device.

Official application data is normally stored here as big-endian.

Application data packets are sent to the host using 802.11 unicast, which then acts as a router and forwards the packet to the right destination node id based on the SecureData header using either broadcast or unicast, it is not yet known how it chooses which to use.

## Special data channels

| Channel | Description |
|----|----|
| 0x101 | Used when broadcasting the updated node information after a new client connects. |
| 0x103 | Used when sending what appears to be "ping" or "null" frames. |
| 0x104 | Used to signal the ejection of all spectators in the network. |

## SecureData NWM header

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x2 | Size of the entire frame minus the 8 bytes from the LLC header. |
| 0x2 | 0x2 | unknown |
| 0x4 | 0x2 | Size of the entire frame minus 12 bytes. |
| 0x6 | 0x2 | Data channel. Applications can only use the low 8 bits, channels greater than 255 are reserved for management functions. |
| 0x8 | 0x2 | Sequence number, incremented after each sent packet. |
| 0xA | 0x2 | Destination network node id |
| 0xC | 0x2 | Source network node id |

This data is stored as big-endian.

## EAPoL-Start frame

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x2 | Always 0x201 in big-endian. |
| 0x2 | 0x2 | Association id of the sending client in big-endian. |
| 0x4 | 0x2 | Unknown. Always 0x1 in big-endian. The parser for this packet errors out if this is \> 3. |
| 0x6 | 0x2 | Unknown |
| 0x8 | 0x28 | NodeInfo structure with all fields in big-endian |

This data is stored as big-endian.

## EAPoL-Logoff frame

| Offset | Size  | Description                                                  |
|--------|-------|--------------------------------------------------------------|
| 0x0    | 0x2   | Always 0x202 in big-endian.                                  |
| 0x2    | 0x2   | Unknown. Always 0?                                           |
| 0x4    | 0x2   | Assigned network node id.                                    |
| 0x6    | 0x6   | Mac address of the newly connected client.                   |
| 0xC    | 0x4   | Unknown                                                      |
| 0x10   | 0x2   | Unknown. Always 0.                                           |
| 0x12   | 0x1   | Number of connected nodes, including the new client.         |
| 0x13   | 0x1   | Max number of nodes.                                         |
| 0x14   | 0x2   | Always 0.                                                    |
| 0x16   | 0x2   | Unknown.                                                     |
| 0x18   | 0x280 | List of 16 NodeInfo structures with all fields in big-endian |

This data is stored as big-endian.

## Structure used for generating the CTR for CCMP key generation

| Offset | Size | Description       |
|--------|------|-------------------|
| 0x0    | 0x4  | wlancommID        |
| 0x4    | 0x4  | networkID         |
| 0x8    | 0x6  | Host MAC address. |
| 0xE    | 0x2  | id8               |

This data is stored as little-endian.

## CTR used for beacon tags crypto

| Offset | Size | Description          |
|--------|------|----------------------|
| 0x0    | 0x6  | Host MAC address     |
| 0x6    | 0x4  | wlancommID           |
| 0xA    | 0x1  | id8                  |
| 0xB    | 0x1  | Padding, value zero. |
| 0xC    | 0x4  | networkID            |

This data is stored as little-endian. All data here is all-zero except for the MAC address, when the u8 at offset 0x8 in the network-struct is 0.

## Network structure

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
<td>0x6</td>
<td>This is the MAC address of the host. This is used for when <a {{% href "../NWMUDS:ConnectToNetwork" %}} title="wikilink">connecting</a> to the network.</td>
</tr>
<tr>
<td>0x6</td>
<td>0x1</td>
<td>This is actually written as an u16 without byte-swapping. This is the network wifi channel. When connecting this is normally non-zero. When hosting, this can be 0 to automatically select a channel, otherwise the specified channel is used. When non-zero official user-processes require this value to be one of the following when hosting: 1, 6, or 11.</td>
</tr>
<tr>
<td>0x7</td>
<td>0x1</td>
<td>Padding</td>
</tr>
<tr>
<td>0x8</td>
<td>0x1</td>
<td>Initialized flag. Must be non-zero otherwise NWM-module will use value 0x0 for most/all(?) fields in this structure when reading these fields.</td>
</tr>
<tr>
<td>0xC</td>
<td>0x3</td>
<td>This is the OUI value for use with the beacon tags. Normally this is 001F32.</td>
</tr>
<tr>
<td>0xF</td>
<td>0x1</td>
<td>OUI type (21/0x15)</td>
</tr>
<tr>
<td>0x10</td>
<td>0x4</td>
<td>wlancommID. Local-WLAN communication ID, normally this is: (user_process <a {{% href "../Title_list" %}} title="wikilink">uniqueID</a> &lt;&lt; 8) | val. Where val is 0x10 on retail(<a {{% href "Configuration_Memory#envinfo" "broken" %}} title="wikilink">ENVINFO</a> bit0 set), 0x90 for devunit. Official software includes an input bool flag parameter for setting bit0 in this wlancommID, normally that flag isn't set. For <a {{% href "Download_Play" "broken" %}} title="wikilink">Download Play</a>, this is always 0x2810 on retail(0x2890 on devunit).</p>
<p>This wlancommID can have the side affect of region-locking when the title uses the uniqueID for the current title(hard-coded in .text normally), instead of using a fixed input uniqueID for each region of the title.</td>
</tr>
<tr>
<td>0x14</td>
<td>0x1</td>
<td>id8. ID, for <a {{% href "../Download_Play" %}} title="wikilink">Download Play</a> this is 0x55. 0x55/'U' seems to be used for networks where Wii U can host it(Download Play, Smash Bros, ...) - this value isn't known to be actually checked anywhere however.</td>
</tr>
<tr>
<td>0x15</td>
<td>0x1</td>
<td>Number of times the network structure hash was updated.</td>
</tr>
<tr>
<td>0x16</td>
<td>0x2</td>
<td>This network attributes u16 bitmask can be written via <a {{% href "../NWMUDS:UpdateNetworkAttribute" %}} title="wikilink">NWMUDS:UpdateNetworkAttribute</a>.
Bitmasks:</p>
<ul>
<li>0x1: When set, spectators are not allowed to connect(see <a {{% href "../NWMUDS:EjectSpectator" %}} title="wikilink">here</a>). Checked by official user-processes before using <a {{% href "NWMUDS:ConnectToNetwork" "broken" %}} title="wikilink">NWMUDS:ConnectToNetwork</a>, when connecting as a Spectator. Must be clear otherwise that code returns error 0xE10113EA. If the initialized_flag at offset 0x8 is zero, this code handles it the same way as if this bit was set. The latest NWM-module handles checking this bit itself however.</li>
<li>0x2: When set, new regular-clients are not allowed to connect.</li>
<li>0x4: Unknown, has no affect on new clients/spectators connecting. Official software has an option for setting this bit via an input flag from the same code using bitmask 0x2. Official software always clears bitmask 0x6 when unblocking new connections.</li>
</ul></td>
</tr>
<tr>
<td>0x18</td>
<td>0x4</td>
<td>u32 networkID, randomly-generated when creating the network. The network SSID used when a client connects to the network is sprintf(out, "%08X", networkID).</td>
</tr>
<tr>
<td>0x1C</td>
<td>0x1</td>
<td>Total number of currently connected nodes, including the host.</td>
</tr>
<tr>
<td>0x1D</td>
<td>0x1</td>
<td>Maximum number of nodes, including the host. This also is the total number of entries stored under the array in the encrypted beacon data.</td>
</tr>
<tr>
<td>0x1E</td>
<td>0xD</td>
<td>?</td>
</tr>
<tr>
<td>0x2B</td>
<td>0x14</td>
<td>SHA1 hash of the network structure, starting at the OUI field (offset 0xC) and spanning SizeOfAppData + 0x34. The unused space of the app data buffer is not hashed.</td>
</tr>
<tr>
<td>0x3F</td>
<td>0x1</td>
<td>Size of appdata.</td>
</tr>
<tr>
<td>0x40</td>
<td>0xC8</td>
<td>Appdata(Application data), if any. Size of the appdata is specified via the u8 at offset 0x3F. This data is not used when the size-field is zero.</td>
</tr>
</tbody>
</table>

This 0x108-byte structure is used for [NWMUDS:BeginHostingNetwork](NWMUDS:BeginHostingNetwork "wikilink"), [NWMUDS:ConnectToNetwork](NWMUDS:ConnectToNetwork "wikilink"), etc. This data is stored as big-endian.

## NodeInfo structure

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x8 | u64 ID, this is the UDS version of the FriendCodeSeed. This is loaded from BlkID 0x00090000 in the [system-config](Config_Savegame "wikilink") via [CfgS:GetConfigInfoBlk2](CfgS:GetConfigInfoBlk2 "wikilink"). |
| 0x8 | 0x14 | The first 0x18-bytes from BlkID 0x000A0000 in the [system-config](Config_Savegame "wikilink") loaded via [CfgS:GetConfigInfoBlk2](CfgS:GetConfigInfoBlk2 "wikilink") is written here by user-processes. However, the data at +0x14(absolute offset 0x1C) is written by NWM-module later. |
| 0x1C | 0x2 | u16, unknown. Set to 0x0 with the output from [NWMUDS:DecryptBeaconData](NWMUDS:DecryptBeaconData "wikilink"). |
| 0x1E | 0x1 | u8 flag, unknown. Originates from the u16 bitmask in the beacon node-list header. This flag is normally 0 since that bitmask is normally 0? |
| 0x1F | 0x1 | Padding? |
| 0x20 | 0x2 | u16 NetworkNodeID |
| 0x22 | 0x6 | Normally zero? |

The first 0x20-bytes are written by the user-process before using this structure with [NWMUDS:InitializeWithVersion](NWMUDS:InitializeWithVersion "wikilink"). The data starting at offset 0x8 is only initialized by NWM-module.

## UDS Beacons

The UDS host broadcasts a beacon containing at least two Nintendo-vendor tags(tag number 0xDD, see above for the OUI), normally the data stored in these tags are static. The second tag contains the big-endian u32 networkID, used by the clients when connecting to the host and for the above CCMP key generation. The Nintendo-vendor tag(s) following the first two are unique to the process using UDS, these tags are used for broadcasting metadata regarding the host.

A tool for these beacons is available here: [1](https://github.com/yellows8/ctr-wlanbeacontool)

### UDS Beacon Tags

The following is the structure of each tag, starting at the OUI. The order of the tags is the same as listed below. All data stored under these tags are stored as big-endian.

#### OUI Type 20

| Offset | Size | Description           |
|--------|------|-----------------------|
| 0x0    | 0x3  | OUI, see above.       |
| 0x3    | 0x1  | OUI type (20/0x14)    |
| 0x4    | 0x3  | Sample data: 0a 00 00 |

Normally the size of this tag(from the tag size field) is 0x07.

#### OUI Type 21

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1F | This is the network structure starting at offset 0xC, with the first 0x1F-bytes from there. |
| 0x1F | 0x14 | SHA1 hash. When doing the hashing, this hash is cleared to zero. The hash data starts at offset 0x0(OUI), and the size is 0x34 + \<value of the u8 at offset 0x33\>. |
| 0x33 | 0x1 | Size of appdata. Normally zero. When non-zero this appdata is located at offset 0x34. |

Normally the size of this tag(from the tag size field) is 0x34, not including appdata.

#### OUI Type 24

| Offset | Size      | Description        |
|--------|-----------|--------------------|
| 0x0    | 0x3       | OUI, see above.    |
| 0x3    | 0x1       | OUI type (24/0x18) |
| 0x4    | See below | Encrypted data     |

This is the tag0 used with [NWMUDS:DecryptBeaconData](NWMUDS:DecryptBeaconData "wikilink"). The size of data stored under this tag has a maximum size of 0xFA-bytes, however normally the size is smaller than that. Additional encrypted data, if any, is stored under the below tag1.

#### OUI Type 25

| Offset | Size      | Description        |
|--------|-----------|--------------------|
| 0x0    | 0x3       | OUI, see above.    |
| 0x3    | 0x1       | OUI type (25/0x19) |
| 0x4    | See above | Encrypted data     |

When this exists in the beacon, this is the tag1 used with [NWMUDS:DecryptBeaconData](NWMUDS:DecryptBeaconData "wikilink"). The data stored here is the 0xFA-bytes following the previous encrypted data in tag0, for more space for storing the encrypted data.

#### Encrypted beacon data

The following structure is for the plaintext version of the encrypted data, stored as big-endian.

This data is encrypted with AES-CTR, by NWM module in software. The AES key is stored in NWM module itself. See above for the CTR. The size of this encrypted data is 0x12 + (0x1E\*val), where val is the u8 from networkstruct offset 0x1D.

##### Structure

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x10 | MD5 over the rest of the data following this(plaintext). |
| 0x10 | 0x2 | u16 bitmask. Unknown, normally 0? Bit0 is for entry0, bit1 for entry1, and so on. |
| 0x12 | 0x1E \* <total array entries> | This is an array of entries for each of the devices on this network, the first entry is for the host and the rest is for the client(s). |

##### Array entry

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1C | This is the first 0x1C-bytes of the NodeInfo structure, stored as big-endian. |
| 0x1C | 0x2 | u16 NetworkNodeID, stored as big-endian. |

Each entry is for a node.

# Mapped IO

*All* of the [IO](IO_Registers "wikilink") mapped under the NWM-module process is listed below:

| Userland address | Physical address | Size | Description |
|----|----|----|----|
| 0x1EC22000 | 0x10122000 | 0x1000 | [WIFI_Registers](WIFI_Registers "wikilink") |
| 0x1EC40000 | 0x10140000 | 0x1000 | [PDN_Registers](PDN_Registers "wikilink") |
| 0x1EE22000 | 0x10322000 | 0x1000 |  |

# Errors

| Error code | Description |
|----|----|
| 0xC8A06C0D | The operation being performed is already done (e.g., if you run NWMEXT_ControlWirelessEnabled to turn wifi on when it's on already, you can't turn it on again). |
| 0xC8A113EA | Returned when the command isn't allowed to be used on this device. |
| 0xC90113FA | Node doesn't exist / invalid NetworkNodeID? |
| 0xC92113FB | Returned when trying to connect to a host when the host has the specified connection-type blocked via the network attributes. There might be other causes too. |
| 0xE10113E9 | Returned when the input size is invalid. Returned by [NWMUDS:PullPacket](NWMUDS:PullPacket "wikilink") when the input size is smaller than the frame_size. |
| 0xE10113EA | Invalid bind / data_channel is invalid(0x0). |

[Category:Services](Category:Services "wikilink")

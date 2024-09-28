+++
title = 'News Services'
+++

This system module handles the system notifications.

The maximum number of notifications that can be stored/handled is 100,
hence the intended range for notificationIDs is 0-99.

# News service "news:u"

| Command Header | Description                                         |
|----------------|-----------------------------------------------------|
| 0x000100C8     | [AddNotification](NEWSU:AddNotification "wikilink") |

This service only has *one* command.

# News service "news:s"

| Command Header | Description                                                                   |
|----------------|-------------------------------------------------------------------------------|
| 0x000100C6     | [AddNotification](NEWSS:AddNotification "wikilink")                           |
| 0x0002....     | Stubbed, only returns 0.                                                      |
| 0x0003....     | Stubbed, only returns 0.                                                      |
| 0x00040000     | [ResetNotifications](NEWSS:ResetNotifications "wikilink")                     |
| 0x00050000     | [GetTotalNotifications](NEWSS:GetTotalNotifications "wikilink")               |
| 0x00060042     | [SetNewsDBHeader](NEWSS:SetNewsDBHeader "wikilink")                           |
| 0x00070082     | [SetNotificationHeader](NEWSS:SetNotificationHeader "wikilink")               |
| 0x00080082     | [SetNotificationMessage](NEWSS:SetNotificationMessage "wikilink")             |
| 0x00090082     | [SetNotificationImage](NEWSS:SetNotificationImage "wikilink")                 |
| 0x000A0042     | [GetNewsDBHeader](NEWSS:GetNewsDBHeader "wikilink")                           |
| 0x000B0082     | [GetNotificationHeader](NEWSS:GetNotificationHeader "wikilink")               |
| 0x000C0082     | [GetNotificationMessage](NEWSS:GetNotificationMessage "wikilink")             |
| 0x000D0082     | [GetNotificationImage](NEWSS:GetNotificationImage "wikilink")                 |
| 0x000E0040     | [SetInfoLEDPattern](NEWSS:SetInfoLEDPattern "wikilink")                       |
| 0x000F0000     | [SyncArrivedNotifications](NEWSS:SyncArrivedNotifications "wikilink")         |
| 0x00100040     | [SyncOneArrivedNotification](NEWSS:SyncOneArrivedNotification "wikilink")     |
| 0x00110040     | [SetAutomaticSyncFlag](NEWSS:SetAutomaticSyncFlag "wikilink")                 |
| 0x00120082     | [SetNotificationHeaderOther](NEWSS:SetNotificationHeaderOther "wikilink")     |
| 0x00130000     | [WriteNewsDBSavedata](NEWSS:WriteNewsDBSavedata "wikilink")                   |
| 0x00140000     | [GetTotalArrivedNotifications](NEWSS:GetTotalArrivedNotifications "wikilink") |

# News module NAND [savedata](System_SaveData "wikilink")

- "news.db": This is the main save-file, the filesize is fixed to
  0x2BD0-bytes.
- "newsXXX.txt" This is the [message](NEWSS:AddNotification "wikilink")
  data for this notification, where XXX is the decimal
  notification-index in the below headers-array. The filesize should be
  \<= \<size listed [here](NEWSS:GetNotificationMessage "wikilink")\>,
  since that's the max size read by the notifications applet.
- "newsXXX.mpo" This is the [MPO](NEWSS:AddNotification "wikilink") data
  for this notification if any, where XXX is the decimal
  notification-index in the below headers-array. The filesize should be
  \<= \<size listed [here](NEWSS:GetNotificationImage "wikilink")\>,
  since that's the max size read by the notifications applet.

## news.db

| Offset | Size                 | Description                                                                 |
|--------|----------------------|-----------------------------------------------------------------------------|
| 0x0    | 0x10                 | Header, see below.                                                          |
| 0x10   | 0x2BC0 (100 \* 0x70) | Array of [headers](NEWSS:AddNotification "wikilink") for each notification. |

### Header

| Offset | Size | Description             |
|--------|------|-------------------------|
| 0x0    | 0x1  | Must be 0x1 "is valid". |
| 0x1    | 0x1  | Flags                   |
| 0x2    | 0xE  | Normally zero?          |

### Flags

| Bit | Description                                                                                                                                                                                                             |
|-----|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0   | Set by news module when handling BOSS notifications and the AddNotification commands. This indicates that there's "unread" notifications, the notifications applet clears this once all notifications have been "read". |
| 1   | Set by news module when handling CECD notifications.                                                                                                                                                                    |

# News module startup

The actual main function called by main() does the following:

- srv_init()
- Registers services "news:u" and "news:s".
- Initializes the service session handle for "ptm:sysm".
- Loads 4 handles from somewhere, which gets used with
  svcReplyAndReceive later.
- Does notificationID state init, uses
  [SRV:GetNotificationSemaphore](SRV:GetNotificationSemaphore "wikilink"),
  then subscribes to srv notifications 0x104 and 0x106.
- <Some func calls>
- Here [PTMSYSM:SetInfoLEDPattern](PTMSYSM:SetInfoLEDPattern "wikilink")
  is used.
- Some state init is done, then the usual svcReplyAndReceive loop
  begins.

# Errors

| Error code | Description                                                                                                                    |
|------------|--------------------------------------------------------------------------------------------------------------------------------|
| 0xC8A12805 | The news.db or notification header data for the specified notificationID is not set(the specified notification doesn't exist). |

# Title Versions

<table>
<thead>
<tr class="header">
<th>Title version</th>
<th>System version</th>
<th>Changes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>v7168</td>
<td><a {{% href "../9.7.0-25" %}} title="wikilink">9.7.0-X</a></td>
<td>All of the changes are the following:</p>
<ul>
<li>See <a {{% href "../9.7.0-25" %}} title="wikilink">here</a> regarding the
updated CTRSDK function code.</li>
<li>This function is eventually called by newss_cmdf, newss_cmd10, and
<certain function>. When calling a certain function fails in here, this
code now calls <another certain function> before returning.</li>
<li>Mutex enter/leave function calls were added to a certain
function.</li>
<li>More state init was added to the start of an initialization function
called during news module startup(crt0?).</li>
<li>0x14 new bytes were added to .rodata.</li>
</ul></td>
</tr>
</tbody>
</table>

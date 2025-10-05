+++
title = 'Friend Services'
categories = ["Services"]
+++

# Friend User Service "frd:u"

| Command Header | Description |
|----|----|
| 0x00010000 | [HasLoggedIn](FRDU:HasLoggedIn "wikilink") |
| 0x00020000 | [IsOnline](FRDU:IsOnline "wikilink") |
| 0x00030002 | [Login](FRDU:Login "wikilink") |
| 0x00040000 | [Logout](FRDU:Logout "wikilink") |
| 0x00050000 | [GetMyFriendKey](FRDU:GetMyFriendKey "wikilink") |
| 0x00060000 | [GetMyPreference](FRDU:GetMyPreference "wikilink") |
| 0x00070000 | [GetMyProfile](FRDU:GetMyProfile "wikilink") |
| 0x00080000 | [GetMyPresence](FRDU:GetMyPresence "wikilink") |
| 0x00090000 | [GetMyScreenName](FRDU:GetMyScreenName "wikilink") |
| 0x000A0000 | [GetMyMii](FRDU:GetMyMii "wikilink") |
| 0x000B0000 | [GetMyLocalAccountId](FRDU:GetMyLocalAccountId "wikilink") |
| 0x000C0000 | [GetMyPlayingGame](FRDU:GetMyPlayingGame "wikilink") |
| 0x000D0000 | [GetMyFavoriteGame](FRDU:GetMyFavoriteGame "wikilink") |
| 0x000E0000 | [GetMyNcPrincipalId](FRDU:GetMyNcPrincipalId "wikilink") |
| 0x000F0000 | [GetMyComment](FRDU:GetMyComment "wikilink") |
| 0x00100040 | [GetMyPassword](FRDU:GetMyPassword "wikilink") |
| 0x00110080 | [GetFriendKeyList](FRDU:GetFriendKeyList "wikilink") |
| 0x00120042 | [GetFriendPresence](FRDU:GetFriendPresence "wikilink") |
| 0x00130142 | [GetFriendScreenName](FRDU:GetFriendScreenName "wikilink") |
| 0x00140044 | [GetFriendMii](FRDU:GetFriendMii "wikilink") |
| 0x00150042 | [GetFriendProfile](FRDU:GetFriendProfile "wikilink") |
| 0x00160042 | [GetFriendRelationship](FRDU:GetFriendRelationship "wikilink") |
| 0x00170042 | [GetFriendAttributeFlags](FRDU:GetFriendAttributeFlags "wikilink") |
| 0x00180044 | [GetFriendPlayingGame](FRDU:GetFriendPlayingGame "wikilink") |
| 0x00190042 | [GetFriendFavoriteGame](FRDU:GetFriendFavoriteGame "wikilink") |
| 0x001A00C4 | [GetFriendInfo](FRDU:GetFriendInfo "wikilink") |
| 0x001B0080 | [IsIncludedInFriendList](FRDU:IsIncludedInFriendList "wikilink") |
| 0x001C0042 | [UnscrambleLocalFriendCode](FRDU:UnscrambleLocalFriendCode "wikilink") |
| 0x001D0002 | [UpdateGameModeDescription](FRDU:UpdateGameModeDescription "wikilink") |
| 0x001E02C2 | [UpdateMyPresence](FRDU:UpdateMyPresence "wikilink") |
| 0x001F0042 | [SendInvitation](FRDU:SendInvitation "wikilink") |
| 0x00200002 | [AttachToEventNotification](FRDU:AttachToEventNotification "wikilink") |
| 0x00210040 | [SetNotificationMask](FRDU:SetNotificationMask "wikilink") |
| 0x00220040 | [GetEventNotification](FRDU:GetEventNotification "wikilink") |
| 0x00230000 | [GetLastResponseResult](FRDU:GetLastResponseResult "wikilink") |
| 0x00240040 | [PrincipalIdToFriendCode](FRDU:PrincipalIdToFriendCode "wikilink") |
| 0x00250080 | [FriendCodeToPrincipalId](FRDU:FriendCodeToPrincipalId "wikilink") |
| 0x00260080 | [IsValidFriendCode](FRDU:IsValidFriendCode "wikilink") |
| 0x00270040 | [ResultToErrorCode](FRDU:ResultToErrorCode "wikilink") |
| 0x00280244 | [RequestGameAuthentication](FRDU:RequestGameAuthentication "wikilink") |
| 0x00290000 | [GetGameAuthenticationData](FRDU:GetGameAuthenticationData "wikilink") |
| 0x002A0204 | [RequestServiceLocator](FRDU:RequestServiceLocator "wikilink") |
| 0x002B0000 | [GetServiceLocatorData](FRDU:GetServiceLocatorData "wikilink") |
| 0x002C0002 | [DetectNatProperties](FRDU:DetectNatProperties "wikilink") |
| 0x002D0000 | [GetNatProperties](FRDU:GetNatProperties "wikilink") |
| 0x002E0000 | [GetServerTimeDifference](FRDU:GetServerTimeDifference "wikilink") |
| 0x002F0040 | [AllowHalfAwake](FRDU:AllowHalfAwake "wikilink") |
| 0x00300000 | [GetServerTypes](FRDU:GetServerTypes "wikilink") |
| 0x00310082 | [GetFriendComment](FRDU:GetFriendComment "wikilink") |
| 0x00320042 | [SetClientSdkVersion](FRDU:SetClientSdkVersion "wikilink") |
| 0x00330000 | [GetMyApproachContext](FRDU:GetMyApproachContext "wikilink") |
| 0x00340046 | [AddFriendWithApproach](FRDU:AddFriendWithApproach "wikilink") |
| 0x00350082 | [DecryptApproachContext](FRDU:DecryptApproachContext "wikilink") |
| 0x00360000 | [GetExtendedNatProperties](FRDU:GetExtendedNatProperties "wikilink") |

# Friend Network Daemon Service "frd:n"

| Command Header | Description |
|----|----|
| 0x00010000 | [GetHandleOfNdmStatusChangedEvent](FRDN:GetHandleOfNdmStatusChangedEvent "wikilink") |
| 0x00020000 | [Resume](FRDN:Resume "wikilink") |
| 0x00030040 | [SuspendAsync](FRDN:SuspendAsync "wikilink") |
| 0x00040000 | [QueryStatus](FRDN:QueryStatus "wikilink") |

# Friend Admin Service "frd:a"

Includes all the commands in [frd:u](Friend_Services#friend_user_service_frdu "wikilink"), and, in addition:

| Command Header | Description |
|----|----|
| 0x04010100 | [CreateLocalAccount](FRDA:CreateLocalAccount "wikilink") |
| 0x04020040 | [DeleteLocalAccount](FRDA:DeleteLocalAccount "wikilink") |
| 0x04030040 | [LoadLocalAccount](FRDA:LoadLocalAccount "wikilink") |
| 0x04040000 | [UnloadLocalAccount](FRDA:UnloadLocalAccount "wikilink") |
| 0x04050000 | [SaveLocalAccountData](FRDA:SaveLocalAccountData "wikilink") |
| 0x04060042 | [AddFriendOnline](FRDA:AddFriendOnline "wikilink") |
| 0x04070D80 | [AddFriendOffline](FRDA:AddFriendOffline "wikilink") |
| 0x040802C0 | [UpdateFriendScreenName](FRDA:UpdateFriendScreenName "wikilink") |
| 0x04090100 | [RemoveFriend](FRDA:RemoveFriend "wikilink") |
| 0x040A0100 | [UpdatePlayingGame](FRDA:UpdatePlayingGame "wikilink") |
| 0x040B00C0 | [UpdatePreference](FRDA:UpdatePreference "wikilink") |
| 0x040C0800 | [UpdateMii](FRDA:UpdateMii "wikilink") |
| 0x040D0100 | [UpdateFavoriteGame](FRDA:UpdateFavoriteGame "wikilink") |
| 0x040E0040 | [SetNcPrincipalId](FRDA:SetNcPrincipalId "wikilink") |
| 0x040F0240 | [UpdateComment](FRDA:UpdateComment "wikilink") |
| 0x04100000 | [IncrementMoveCount](FRDA:IncrementMoveCount "wikilink") |

# Save Data

See [FRD Savegame](FRD_Savegame "wikilink").

# HTTPS Requests

## Trusted RootCAs

No RootCertChain(s) are used. For the nasc site, friends-module uses [HTTPC:AddDefaultCert](HTTPC:AddDefaultCert "wikilink") with the following certIDs: 0x1, 0x2, and 0x3.

# Types

## FriendKey

| Offset | Size | Description  |
|--------|------|--------------|
| 0x0    | 0x4  | Principal ID |
| 0x4    | 0x4  | padding      |
| 0x8    | 0x8  | Friend Code  |

## GameKey

| Offset | Size | Description        |
|--------|------|--------------------|
| 0x0    | 0x8  | u64, Title ID      |
| 0x8    | 0x2  | u16, Title Version |
| 0xA    | 0x6  | Unused padding.    |

## Presence

| Offset | Size | Description              |
|--------|------|--------------------------|
| 0x0    | 0x4  | u32 JoinAvailabilityFlag |
| 0x4    | 0x4  | u32 MatchmakeSystemType  |
| 0x8    | 0x4  | u32 JoinGameID           |
| 0xC    | 0x4  | u32 JoinGameMode         |
| 0x10   | 0x4  | u32 OwnerPrincipalID     |
| 0x14   | 0x4  | u32 JoinGroupID          |
| 0x18   | 0x14 | u8 ApplicationArg\[20\]  |

## Preference

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1 | bool IsPublicMode, whether or not the online status is shown |
| 0x1 | 0x1 | bool IsShowGameMode, whether or not the currently played game is shown |
| 0x2 | 0x1 | bool IsShowPlayedMode, whether or not the play history is shown |

## Profile

| Offset | Size | Description                           |
|--------|------|---------------------------------------|
| 0x0    | 0x1  | u8, Region                            |
| 0x1    | 0x1  | u8, Country                           |
| 0x2    | 0x1  | u8, Area                              |
| 0x3    | 0x1  | u8, Language                          |
| 0x4    | 0x1  | u8, Platform, always 2 (PLATFORM_CTR) |
| 0x5    | 0x3  | padding                               |

## FriendProfile

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x8 | [Profile](Friend_Services#profile "wikilink") |
| 0x8 | 0x10 | [GameKey](Friend_Services#gamekey "wikilink") of favorite game |
| 0x18 | 0x4 | u32, NcPrincipalID |
| 0x1C | 0x22 | 16-Character UTF-16 Personal Message (16 characters + null termination) |
| 0x3E | 0x2 | padding |
| 0x40 | 0x8 | NEX Timestamp when this friend was last seen online |

## FriendInfo

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x10 | [FriendKey](Friend_Services#friendkey "wikilink") of this friend |
| 0x10 | 0x8 | NEX Timestamp when this friend was added to the friends list |
| 0x18 | 0x1 | The [relationship](Friend_Services#relationship_types "wikilink") with this friend |
| 0x19 | 0x7 | padding |
| 0x20 | 0x48 | [FriendProfile](Friend_Services#friendprofile "wikilink") of this friend |
| 0x68 | 0x16 | 10-Character UTF-16 Screen Name (10 characters + null termination) |
| 0x7E | 0x1 | u8, [Mii character set](Mii#mii_format "wikilink") |
| 0x7F | 0x1 | padding |
| 0x80 | 0x60 | This friend's [Mii](Mii#cflstoredata "wikilink") |

## GameAuthenticationData

| Offset | Size  | Description                                                 |
|--------|-------|-------------------------------------------------------------|
| 0x0    | 0x4   | [NASC Login Result](Friend_Services#nasc_result "wikilink") |
| 0x4    | 0x4   | HTTP Status Code                                            |
| 0x8    | 0x20  | Server Address (string)                                     |
| 0x28   | 0x2   | Server Port                                                 |
| 0x2A   | 0x6   | padding                                                     |
| 0x30   | 0x100 | Token for game server authentication (string)               |
| 0x130  | 0x8   | NEX Timestamp for server time                               |

## ServiceLocatorData

| Offset | Size  | Description                                                  |
|--------|-------|--------------------------------------------------------------|
| 0x0    | 0x4   | [NASC SVCLOC Result](Friend_Services#nasc_result "wikilink") |
| 0x4    | 0x4   | HTTP Status Code                                             |
| 0x8    | 0x80  | Service Host (string)                                        |
| 0x88   | 0x100 | Service Token (string)                                       |
| 0x188  | 0x1   | `statusdata` from NASC response                              |
| 0x189  | 0x7   | padding                                                      |
| 0x190  | 0x8   | NEX Timestamp for server time                                |

# Approach Contexts

The approach context (in the form of an [encrypted payload](Friend_Services#encrypted_approachcontext_payload "wikilink")) of the console can be retrieved using [FRDU:GetMyApproachContext](FRDU:GetMyApproachContext "wikilink").

[Encrypted payloads](Friend_Services#encrypted_approachcontext_payload "wikilink") can be decrypted using [FRDU:DecryptApproachContext](FRDU:DecryptApproachContext "wikilink").

It is possible to add a friend using an [encrypted payload](Friend_Services#encrypted_approachcontext_payload "wikilink") using [FRDU:AddFriendWithApproach](FRDU:AddFriendWithApproach "wikilink").

## ApproachContext

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x48 | [Friend Profile](Friend_Services#friend_profile "wikilink") of the console that created this approach context |
| 0x48 | 0x1 | bool, Has Mii |
| 0x49 | 0x1 | bool, Profanity Flag |
| 0x4A | 0x1 | u8, [Mii Character Set](Mii#mii_format "wikilink") |
| 0x4B | 0x70 | Friend [Mii Data](Mii#cflstoredata "wikilink") wrapped using <APT:Wrap> (Unwrapped size: 0x60) |
| 0xBB | 0x16 | 10-Character UTF-16 Screen Name (10 characters + null termination) |
| 0xD1 | 0x10F | unused |

## Encrypted ApproachContext Payload

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1 | (u8) unknown, initialized to 1 internally, set to 1 when the PS encryption command succeeds, otherwise 0. Must be 1 when decrypting, otherwise error 0xE0E0C4E9 is returned |
| 0x1 | 0x1 | (u8) unknown, always set to 0 |
| 0x2 | 0x1 | (u8) unknown, initialized to 2 internally, always set to either 1 when the PS encryption command succeeds, or otherwise 0. Must be 1 when decrypting, otherwise error 0xE0E0C4E9 is returned |
| 0x3 | 0x1 | (u8) unknown, always set to 0 |
| 0x4 | 0x4 | u32, Principal ID (part of nonce) |
| 0x8 | 0x8 | u64, Friend Code (part of nonce) |
| 0x10 | 0x1E0 | [ApproachContext](Friend_Services#approachcontext "wikilink") |
| 0x1F0 | 0x10 | AES-CCM MAC over the encrypted payload at 0x10 thru 0x1F0 |

## Decrypted ApproachContext Payload

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1 | (u8) unknown, initialized to 1 internally, set to 1 when the PS encryption command succeeds, otherwise 0. Must be 1 when decrypting, otherwise error 0xE0E0C4E9 is returned |
| 0x1 | 0x1 | (u8) unknown, always set to 0 |
| 0x2 | 0x1 | (u8) unknown, initialized to 2 internally, always set to either 1 when the PS encryption command succeeds, or otherwise 0. Must be 1 when decrypting, otherwise error 0xE0E0C4E9 is returned |
| 0x3 | 0x1 | (u8) unknown, always set to 0 |
| 0x4 | 0x1 | bool, Has Mii |
| 0x5 | 0x1 | bool, Profanity Flag |
| 0x6 | 0x1 | u8, [Mii Character Set](Mii#mii_format "wikilink") |
| 0x7 | 0x1 | padding |
| 0x8 | 0x10 | [FriendKey](Friend_Services#friendkey "wikilink") of the console that created this approach context |
| 0x18 | 0x48 | [FriendProfile](Friend_Services#friendprofile "wikilink") of the console that created this approach context |
| 0x60 | 0x60 | Friend [Mii Data](Mii#cflstoredata "wikilink") of the console that created this approach context |
| 0xC0 | 0x16 | 10-Character UTF-16 Screen Name (10 characters + null termination) |
| 0xD6 | 0x12A | unused |

# Notification Events

The friends module exposes a "Notification Events" system that allows client sessions to be notified of various related events.

A client sets its per-session notification event signaling handle using [FRDU:AttachToEventNotification](FRDU:AttachToEventNotification "wikilink").

The client can then customize for which [Notification Event Types](Friend_Services#notification_event_types "wikilink") it shall receive notifications using [FRDU:SetNotificationMask](FRDU:SetNotificationMask "wikilink").

Once the handle has been signaled by the friends module, the client can use [FRDU:GetEventNotification](FRDU:GetEventNotification "wikilink") to receive the notifications.

## Notification Event Types

The following event types are accessible to all frd:u and frd:a sessions:

| Value | Description |
|----|----|
| 1 | The console went online. |
| 2 | The console went offline. |
| 3 | A friend is now present (went online). |
| 4 | A friend changed their presence, and the current system's JoinGameID is the same as their new or old JoinGameID. |
| 5 | A friend changed their Mii. |
| 6 | A friend changed their [Profile](Friend_Services#profile "wikilink"). |
| 7 | A friend is no longer present (went offline). |
| 8 | A friend has added you back as a friend (if you had added them before as a "provisionally registered" friend). |
| 9 | A friend sent you an invitation, and the current system's JoinGameID matches that of the friend. |

The following values, while signaled internally normally, are not exposed to sessions in any way:

| Value | Description |
|----|----|
| 145 | A friend changed their game mode description. |
| 146 | A friend changed their favorite game. |
| 147 | A friend changed their personal message. |
| 148 | A friend changed their presence, but their JoinGameID does not match that of the system. |
| 149 | A friend sent you an invitation, but their JoinGameID does not match that of the system. |

## EventNotification

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x1 | u8, [Event Type](Friend_Services#notification_event_types "wikilink") |
| 0x1 | 0x7 | padding |
| 0x8 | 0x10 | [FriendKey](Friend_Services#friendkey "wikilink") of the friend who caused this notification to be sent |

# Relationship Types

Every valid entry in the internal friends list contains a relationship field.

| Value | Description |
|----|----|
| 0 | The target has been added locally and on the server, but is only "provisionally registered." The target has not added you as a friend. |
| 1 | The target has been added locally and on the server and is fully registered: the target has also added you as a friend. |
| 2 | No relationship between you and the target has been found: neither you nor the target have added each other. |
| 3 | The relationship has been deleted: the target has deleted your friend card. |
| 4 | The target has been added locally: you were not online when you added the target. (presumably only happens when the "Local" method of adding a friend is used. When the system connects to the internet, a background task runs to register this relationship on the friends server.) |

# Attribute Flags

| Flag | Description |
|----|----|
| 0x1 | Unknown (something like "target ever registered you"?), set when relationship type is 1, 3 or 4 |
| 0x2 | Unknown, set only when relationship type is 1 |

# NASC Result

| Value | Description                         |
|-------|-------------------------------------|
| 001   | Success.                            |
| 101   | Game server is under maintenance.   |
| 102   | Device is banned.                   |
| 107   | Invalid product code.               |
| 109   | Invalid/missing request parameter.  |
| 110   | Game server is no longer available. |
| 112   | Invalid SVC.                        |
| 119   | Invalid FPD version.                |
| 120   | Invalid title version.              |
| 121   | Invalid device certificate.         |
| 122   | Invalid PID HMAC.                   |
| 123   | ROM ID is banned.                   |
| 125   | Invalid Game ID.                    |
| 127   | Invalid key hash.                   |

# Server Types

The server type is stored internally as a combination of two values, the first value represents the server type letter and the second value is the number that follows it. For example, the production server type is "L1", so the first value is 0 and the second value is 1.

[Official servers](https://github.com/kinnay/NintendoClients/wiki/Hpp-Server) only support the letters L, C, S, D, I, T, J or U.

| Value | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | \>=26 |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| Letter | L | C | S | D | I | T | U (fallback to default value) | J | X | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | U |

[Category:Services](Category:Services "wikilink")

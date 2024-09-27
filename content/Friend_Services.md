# Friend Service "frd:u"

| Command Header | Description                                                            |
|----------------|------------------------------------------------------------------------|
| 0x00010000     | [HasLoggedIn](FRDU:HasLoggedIn "wikilink")                             |
| 0x00020000     | [IsOnline](FRDU:IsOnline "wikilink")                                   |
| 0x00030002     | [Login](FRDU:Login "wikilink")                                         |
| 0x00040000     | [Logout](FRDU:Logout "wikilink")                                       |
| 0x00050000     | [GetMyFriendKey](FRDU:GetMyFriendKey "wikilink")                       |
| 0x00060000     | [GetMyPreference](FRDU:GetMyPreference "wikilink")                     |
| 0x00070000     | [GetMyProfile](FRDU:GetMyProfile "wikilink")                           |
| 0x00080000     | [GetMyPresence](FRDU:GetMyPresence "wikilink")                         |
| 0x00090000     | [GetMyScreenName](FRDU:GetMyScreenName "wikilink")                     |
| 0x000A0000     | [GetMyMii](FRDU:GetMyMii "wikilink")                                   |
| 0x000B0000     | [GetMyLocalAccountId](FRDU:GetMyLocalAccountId "wikilink")             |
| 0x000C0000     | [GetMyPlayingGame](FRDU:GetMyPlayingGame "wikilink")                   |
| 0x000D0000     | [GetMyFavoriteGame](FRDU:GetMyFavoriteGame "wikilink")                 |
| 0x000E0000     | [GetMyNcPrincipalId](FRDU:GetMyNcPrincipalId "wikilink")               |
| 0x000F0000     | [GetMyComment](FRDU:GetMyComment "wikilink")                           |
| 0x00100040     | [GetMyPassword](FRDU:GetMyPassword "wikilink")                         |
| 0x00110080     | [GetFriendKeyList](FRDU:GetFriendKeyList "wikilink")                   |
| 0x00120042     | [GetFriendPresence](FRDU:GetFriendPresence "wikilink")                 |
| 0x00130142     | [GetFriendScreenName](FRDU:GetFriendScreenName "wikilink")             |
| 0x00140044     | [GetFriendMii](FRDU:GetFriendMii "wikilink")                           |
| 0x00150042     | [GetFriendProfile](FRDU:GetFriendProfile "wikilink")                   |
| 0x00160042     | [GetFriendRelationship](FRDU:GetFriendRelationship "wikilink")         |
| 0x00170042     | [GetFriendAttributeFlags](FRDU:GetFriendAttributeFlags "wikilink")     |
| 0x00180044     | [GetFriendPlayingGame](FRDU:GetFriendPlayingGame "wikilink")           |
| 0x00190042     | [GetFriendFavoriteGame](FRDU:GetFriendFavoriteGame "wikilink")         |
| 0x001A00C4     | [GetFriendInfo](FRDU:GetFriendInfo "wikilink")                         |
| 0x001B0080     | [IsIncludedInFriendList](FRDU:IsIncludedInFriendList "wikilink")       |
| 0x001C0042     | [UnscrambleLocalFriendCode](FRDU:UnscrambleLocalFriendCode "wikilink") |
| 0x001D0002     | [UpdateGameModeDescription](FRDU:UpdateGameModeDescription "wikilink") |
| 0x001E02C2     | [UpdateGameMode](FRDU:UpdateGameMode "wikilink")                       |
| 0x001F0042     | [SendInvitation](FRDU:SendInvitation "wikilink")                       |
| 0x00200002     | [AttachToEventNotification](FRDU:AttachToEventNotification "wikilink") |
| 0x00210040     | [SetNotificationMask](FRDU:SetNotificationMask "wikilink")             |
| 0x00220040     | [GetEventNotification](FRDU:GetEventNotification "wikilink")           |
| 0x00230000     | [GetLastResponseResult](FRDU:GetLastResponseResult "wikilink")         |
| 0x00240040     | [PrincipalIdToFriendCode](FRDU:PrincipalIdToFriendCode "wikilink")     |
| 0x00250080     | [FriendCodeToPrincipalId](FRDU:FriendCodeToPrincipalId "wikilink")     |
| 0x00260080     | [IsValidFriendCode](FRDU:IsValidFriendCode "wikilink")                 |
| 0x00270040     | [ResultToErrorCode](FRDU:ResultToErrorCode "wikilink")                 |
| 0x00280244     | [RequestGameAuthentication](FRDU:RequestGameAuthentication "wikilink") |
| 0x00290000     | [GetGameAuthenticationData](FRDU:GetGameAuthenticationData "wikilink") |
| 0x002A0204     | [RequestServiceLocator](FRDU:RequestServiceLocator "wikilink")         |
| 0x002B0000     | [GetServiceLocatorData](FRDU:GetServiceLocatorData "wikilink")         |
| 0x002C0002     | [DetectNatProperties](FRDU:DetectNatProperties "wikilink")             |
| 0x002D0000     | [GetNatProperties](FRDU:GetNatProperties "wikilink")                   |
| 0x002E0000     | [GetServerTimeInterval](FRDU:GetServerTimeInterval "wikilink")         |
| 0x002F0040     | [AllowHalfAwake](FRDU:AllowHalfAwake "wikilink")                       |
| 0x00300000     | [GetServerTypes](FRDU:GetServerTypes "wikilink")                       |
| 0x00310082     | [GetFriendComment](FRDU:GetFriendComment "wikilink")                   |
| 0x00320042     | [SetClientSdkVersion](FRDU:SetClientSdkVersion "wikilink")             |
| 0x00330000     | [GetMyApproachContext](FRDU:GetMyApproachContext "wikilink")           |
| 0x00340046     | [AddFriendWithApproach](FRDU:AddFriendWithApproach "wikilink")         |
| 0x00350082     | [DecryptApproachContext](FRDU:DecryptApproachContext "wikilink")       |
| 0x00360000     | [GetExtendedNatProperties](FRDU:GetExtendedNatProperties "wikilink")   |

# "frd:n"

| Command Header | Description                      |
|----------------|----------------------------------|
| 0x00010000     | GetHandleOfNdmStatusChangedEvent |
| 0x00020000     | Resume                           |
| 0x00030040     | SuspendAsync                     |
| 0x00040000     | QueryStatus                      |

# "frd:a"

This contains a similar (probably the same) command handler from
0x0001.... to 0x002F.... as them in frd:u. In addition, it also contains

| Command Header | Description                                              |
|----------------|----------------------------------------------------------|
| 0x04010100     | [CreateLocalAccount](FRDA:CreateLocalAccount "wikilink") |
| 0x04020040     | ?                                                        |
| 0x04030040     | [SetLocalAccountId](FRDA:SetLocalAccountId "wikilink")   |
| 0x04040000     | ?                                                        |
| 0x04050000     | Used in creating the user Mii. No cmdbuff parameters.    |
| 0x04060042     | [AddFriendOnline](FRDA:AddFriendOnline "wikilink")       |
| 0x04070D80     | AddFriendOffline                                         |
| 0x040802C0     | ?                                                        |
| 0x04090100     | [RemoveFriend](FRDA:RemoveFriend "wikilink")             |
| 0x040A0100     | UpdatePlayingGame                                        |
| 0x040B00C0     | UpdatePreferences                                        |
| 0x040C0800     | [UpdateMii](FRDA:UpdateMii "wikilink")                   |
| 0x040D0100     | UpdateFavoriteGame                                       |
| 0x040E0040     | UpdateNcPrincipalId                                      |
| 0x040F...      | UpdateComment                                            |
| 0x04100000     | ?                                                        |

# HTTPS Requests

## Trusted RootCAs

No RootCertChain(s) are used. For the nasc site, friends-module uses
[HTTPC:AddDefaultCert](HTTPC:AddDefaultCert "wikilink") with the
following certIDs: 0x1, 0x2, and 0x3.

# Server Types

The server type is stored internally as a combination of two values, the
first value represents the server type letter and the second value is
the number that follows it. For example, the production server type is
"L1", so the first value is 0 and the second value is 1.

[Official
servers](https://github.com/kinnay/NintendoClients/wiki/Hpp-Server) only
support the letters L, C, S, D, I, T, J or U.

| Value | Server Type Letter            |
|-------|-------------------------------|
| 0     | L                             |
| 1     | C                             |
| 2     | S                             |
| 3     | D                             |
| 4     | I                             |
| 5     | T                             |
| 6     | U (fallback to default value) |
| 7     | J                             |
| 8     | X                             |
| 9     | A                             |
| 10    | B                             |
| 11    | C                             |
| 12    | D                             |
| 13    | E                             |
| 14    | F                             |
| 15    | G                             |
| 16    | H                             |
| 17    | I                             |
| 18    | J                             |
| 19    | K                             |
| 20    | L                             |
| 21    | M                             |
| 22    | N                             |
| 23    | O                             |
| 24    | P                             |
| 25    | Q                             |
| \>=26 | U                             |

[Category:Services](Category:Services "wikilink")
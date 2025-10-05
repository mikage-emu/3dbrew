+++
title = 'FRDA:AddFriendOffline'
+++

# Request

{{% ipc/request header="0x04070d80" %}}
{{% ipc/param span=4 %}}[FriendKey](Friend_Services#friendkey "wikilink"){{% / %}}
{{% ipc/param span=24 %}}Friend [Mii Data](Mii#cflstoredata "wikilink"){{% / %}}
{{% ipc/param span=18 %}}[FriendProfile](Friend_Services#friendprofile "wikilink"){{% / %}}
{{% ipc/param span=6 %}}10-Character UTF-16 Screen Name (10 characters + null termination){{% / %}}
{{% ipc/param %}}bool, profanity flag{{% / %}}
{{% ipc/param %}}u8, [Mii Character Set](Mii#mii_format "wikilink"){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x04070040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Adds a friend to the local friends list, <b>without</b> registering it to the friends server.

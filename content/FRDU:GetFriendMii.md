+++
title = 'FRDU:GetFriendMii'
+++

# Request

{{% ipc/request header="0x00140044" %}}
{{% ipc/param %}}Count{{% / %}}
{{% ipc/staticbuffer id=0 %}}Input [FriendKey](Friend_Services#friendkey "wikilink") buffer{{% / %}}
{{% ipc/mapbuffer w %}}Output [Mii data](Mii#cflstoredata "wikilink") buffer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00140042" %}}
{{% ipc/result %}}
{{% ipc/mapbuffer w %}}Output [Mii data](Mii#cflstoredata "wikilink") buffer{{% / %}}
{{% / %}}

# Description

Gets the [Mii data](Mii#cflstoredata "wikilink") for the specified friend keys. If an input friend key was not found in the friends list, an internal default placeholder friend entry will be used to populate the data.

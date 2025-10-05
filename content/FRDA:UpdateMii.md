+++
title = 'FRDA:UpdateMii'
+++

# Request

{{% ipc/request header="0x040C0800" %}}
{{% ipc/param span=24 %}}Friend [Mii Data](Mii#cflstoredata "wikilink"){{% / %}}
{{% ipc/param span=6 %}}10-Character UTF-16 Screen Name (10 characters + null termination){{% / %}}
{{% ipc/param %}}bool, profanity flag{{% / %}}
{{% ipc/param %}}u8, [Mii Character Set](Mii#mii_format "wikilink"){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x040C0040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Updates the Mii data of the personal Mii shown in the own friend card of the friends list.

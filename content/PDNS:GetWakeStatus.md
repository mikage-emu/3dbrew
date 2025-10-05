+++
title = 'PDNS:GetWakeStatus'
+++

# Request

{{% ipc/request header="0x00010000" %}}
{{% / %}}

# Response

{{% ipc/request header="0x000100c0" %}}
{{% ipc/result %}}
{{% ipc/param %}}[PDN_WAKE_ENABLE](PDN_Registers#pdn_wake_enable "wikilink") value{{% / %}}
{{% ipc/param %}}[PDN_WAKE_REASON](PDN_Registers#pdn_wake_reason "wikilink") value{{% / %}}
{{% / %}}

# Description

Returns the current values of the [PDN_WAKE_REASON](PDN_Registers#pdn_wake_reason "wikilink") and [PDN_WAKE_ENABLE](PDN_Registers#pdn_wake_enable "wikilink") registers.

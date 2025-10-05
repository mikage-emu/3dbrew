+++
title = 'PDNS:Acknowledge'
+++

# Request

{{% ipc/request header="0x00030040" %}}
{{% ipc/param %}}[Wake events](PDN_Registers#pdn_wake_enable "wikilink") to clear/acknowledge{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00030040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Acknowledges the specified wake events.

This writes to [PDN_WAKE_REASON](PDN_Registers#pdn_wake_reason "wikilink") to acknowledge the specified set of wake events.

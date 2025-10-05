+++
title = 'PDNS:ConfigureWakeEvents'
+++

# Request

{{% ipc/request header="0x00020080" %}}
{{% ipc/param %}}[Wake events](PDN_Registers#pdn_wake_enable "wikilink") to enable{{% / %}}
{{% ipc/param %}}[Wake events](PDN_Registers#pdn_wake_enable "wikilink") to clear/acknowledge{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00020040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Configures events that will wake the system, and acknowledges specified wake events.

First, wake events that should be enabled are acknowledged (because they occurred before this policy change) using [PDN_WAKE_REASON](PDN_Registers#pdn_wake_reason "wikilink"). Then, [PDN_WAKE_ENABLE](PDN_Registers#pdn_wake_enable "wikilink") is updated to the given set of events to enable. Finally, all wake events other than the enabled ones are cleared/acknowledged in [PDN_WAKE_REASON](PDN_Registers#pdn_wake_reason "wikilink").

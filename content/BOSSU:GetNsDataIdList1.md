+++
title = 'BOSSU:GetNsDataIdList1'
+++

# Request

{{% ipc/request header="0x00110102" %}}
{{% ipc/param span=6 %}}Identical to [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink"){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x001100c2" %}}
{{% ipc/result %}}
{{% ipc/param span=4 %}}Identical to [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink"){{% / %}}
{{% / %}}

# Description

Identical to [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink"), except the called function mentioned [here](BOSSU:GetNsDataIdList#internals "wikilink") is used with the following type parameters: 0, 1, 0. Thus, this command doesn't filter by either the new flag or the program ID of the current session.

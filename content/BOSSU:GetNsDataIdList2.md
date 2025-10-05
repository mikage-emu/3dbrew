+++
title = 'BOSSU:GetNsDataIdList2'
+++

# Request

{{% ipc/request header="0x00120102" %}}
{{% ipc/param span=6 %}}Identical to [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink"){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x001200c2" %}}
{{% ipc/result %}}
{{% ipc/param span=4 %}}Identical to [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink"){{% / %}}
{{% / %}}

# Description

Identical to [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink"), except the called function mentioned [here](BOSSU:GetNsDataIdList#internals "wikilink") is used with the following type parameters: 1, 1, 1. Thus, this parameter filters by entries which don't have the new flag set and those with a matching program ID of the current session.

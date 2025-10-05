+++
title = 'BOSSU:SetTaskQuery'
+++

# Request

{{% ipc/request header="0x00360084" %}}
{{% ipc/param %}}u32, Task ID size, including NULL terminator{{% / %}}
{{% ipc/param %}}u32, Task query size{{% / %}}
{{% ipc/mapbuffer r %}}Task ID buffer{{% / %}}
{{% ipc/mapbuffer r %}}Task query{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00360044" %}}
{{% ipc/result %}}
{{% ipc/mapbuffer r %}}Task ID buffer{{% / %}}
{{% ipc/mapbuffer r %}}Task query{{% / %}}
{{% / %}}

# Description

Sets a task query to the task for the program ID of the current session. The [task query](BOSS_Savegame#taskqueryconfig "wikilink") is a 0x60-byte structure, so the size is always 0x60.

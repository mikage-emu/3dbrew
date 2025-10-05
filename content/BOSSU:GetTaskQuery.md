+++
title = 'BOSSU:GetTaskQuery'
+++

# Request

{{% ipc/request header="0x00370084" %}}
{{% ipc/param %}}u32, Task ID size, including NULL terminator{{% / %}}
{{% ipc/param %}}u32, Task query size{{% / %}}
{{% ipc/mapbuffer r %}}Task ID buffer{{% / %}}
{{% ipc/mapbuffer w %}}Task query{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00370044" %}}
{{% ipc/result %}}
{{% ipc/mapbuffer r %}}Task ID buffer{{% / %}}
{{% ipc/mapbuffer w %}}Task query{{% / %}}
{{% / %}}

# Description

Gets the task query to the task for the program ID of the current session. The [task query](BOSS_Savegame#taskqueryconfig "wikilink") is a 0x60-byte structure, so the size is always 0x60.

+++
title = 'BOSSU:GetTaskState'
+++

# Request

{{% ipc/request header="0x00200082" %}}
{{% ipc/param %}}u32, Task ID size, including NULL terminator{{% / %}}
{{% ipc/param %}}bool, Unknown{{% / %}}
{{% ipc/mapbuffer r %}}Task ID buffer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00200102" %}}
{{% ipc/result %}}
{{% ipc/param %}}u8, [TaskStateCode](BOSS_Services#taskstatecode "wikilink"){{% / %}}
{{% ipc/param %}}u32, Count{{% / %}}
{{% ipc/param %}}u8, Current step ID{{% / %}}
{{% ipc/mapbuffer r %}}Task ID buffer{{% / %}}
{{% / %}}

# Description

Gets the state of the given task on the program ID of the current session.

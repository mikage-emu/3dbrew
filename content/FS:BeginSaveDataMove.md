+++
title = 'FS:BeginSaveDataMove'
+++

# Request

{{% ipc/request header="0x86D0080" %}}
{{% ipc/param span=2 %}}u64, Title ID{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x86D0080" %}}
{{% ipc/result %}}
{{% ipc/param %}}u32, Save data move "key"{{% / %}}
{{% / %}}

# Description

Used by the Save Data Transfer Tool. Initializes internal FS state by generating 20 random bytes of data, where the first 16 are used as the encryption IV for save data transfers. The remaining 4 bytes are returned as a "key". Save Data Transfer Tool uses the "key" to open the save data for the title it's processing (FS Title Access, access type "save data transfer").

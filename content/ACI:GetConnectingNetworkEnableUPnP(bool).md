+++
title = 'ACI:GetConnectingNetworkEnableUPnP(bool)'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04A10000\] |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 1          | Result code                   |
| 2          | 0 = Disabled, 1 = Enabled(?). |

# Description

If disabled UPnP return 0. If enabled UPnP return 1.(?)

# Example

Handle share_ac_handle;

u32\* cache_buffer = getThreadCommandBuffer();

srvGetServiceHandle(&share_ac_handle, "ac:i");

cache_buffer\[0\] = IPC_MakeHeader(0x4A1, 0, 0); // 0x04A20000

svcSendSyncRequest(share_ac_handle);

printf("Result : 0x%lx", cache_buffer\[1\]);

printf("MTU value : %ld", cache_buffer\[2\]);

svcCloseHandle(share_ac_handle);
+++
title = 'ACI:GetConnectingNetworkMtu'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04A20000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 1          | Result code |
| 2          | MTU value.  |

# Description

Return the current access point to MTU value. If the 3DS is connected to
the internet, return the current access point's MTU value. If the 3DS
isn't connected to the internet, return the last connected access
point's MTU value. (If the 3DS has never connected to any access point
return to 0)

# Example

Handle share_ac_handle;

u32\* cache_buffer = getThreadCommandBuffer();

srvGetServiceHandle(&share_ac_handle, "ac:i");

cache_buffer\[0\] = IPC_MakeHeader(0x4A2, 0, 0); // 0x04A20000

svcSendSyncRequest(share_ac_handle);

printf("Result : 0x%lx", cache_buffer\[1\]);

printf("MTU value : %ld", cache_buffer\[2\]);

svcCloseHandle(share_ac_handle);
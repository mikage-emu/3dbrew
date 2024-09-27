+++
title = 'MP:GetHandle'
+++

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This loads a handle from MP-sysmodule state.

- When the index is \<16, the handle is loaded from an array of event
  handles. When eventhandle\[nodeID\] is signaled, this indicates that
  data is available via [MP:RecvDataFrame](MP:RecvDataFrame "wikilink")
  with that same nodeID.
- When the index is 16, the handle is loaded from
  stateptrother+{someoffset}.
- When the index is \>16(accessed via 17 by the user-process normally),
  the handle is loaded from stateptrother+{someoffsetother}. This is
  0x3000-byte sharedmem, the user-process maps it with
  mypermissions=read-only and otherpermission=DONTCARE.
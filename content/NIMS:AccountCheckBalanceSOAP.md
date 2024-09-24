+++
title = 'NIMS:AccountCheckBalanceSOAP'
+++

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

This sends ECommerceSOAP network request AccountCheckBalance. "Account"
here seems to refer to the device account, not NNID.

Sample output data: all-zero except that \[0\]=0x30('0') and
\[8\]=0x445355("USD").
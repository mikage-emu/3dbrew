+++
title = 'NWMUDS:GetApplicationData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110040\] |
| 1          | Size                       |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description           |
|------------|-----------------------|
| 0          | (Size\<\<14) \| 2     |
| 1          | Pointer to output buf |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | Actual data size. |

# Description

This loads the appdata from the current beacon. This can only be used
while connected to the network(host/client).

If the input size is larger than 0x300, NWM-module uses size 0x300
instead. The actual appdata-copying code just verifies that appdata_size
is \<= input_size, on failure result-code 0x0 is returned with output
actual_size=0(since no data was copied).
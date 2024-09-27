+++
title = 'NIMU:DeleteDbgData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001D0000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001D0040\] |
| 1          | Result code                |

# Description

Deletes autodbg.dat and dbgtasks.dat from the NIM save data.
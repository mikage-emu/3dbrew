+++
title = 'NSS:CardUpdateInitialize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070042\] |
| 1          | Shared-mem size            |
| 2          | Value 0                    |
| 3          | Shared-mem handle          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This does initialization for the gamecard system update. Then this
checks whether this gamecard system-update needs to be installed, by
comparing the title-version of the CVer CIA stored in the system-update
CFA with the title-version of the CVer title already installed in NAND.
When the gamecard update doesn't need to be installed(NAND CVer
title-version \>= gamecard CVer title-version), this returns 0xc821180b.
Error 0xd8e1180c is returned when NS can't find the CVer titleID for the
current system region, in the gamecard-sysupdate CFA cup_list.
+++
title = 'NSS:CardUpdateShutdown'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This shuts down the gamecard system update interface: the shared memory
is unmapped, the CFA archive is closed, state is cleared, etc.

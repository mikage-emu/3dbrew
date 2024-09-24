+++
title = 'CfgI:VerifySigLocalFriendCodeSeed'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080E0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This verifies the RSA signature for the LocalFriendCodeSeed data already
stored in memory.
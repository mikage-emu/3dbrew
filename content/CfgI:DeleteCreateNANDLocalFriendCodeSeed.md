+++
title = 'CfgI:DeleteCreateNANDLocalFriendCodeSeed'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080D0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This deletes the NAND
[LocalFriendCodeSeed](Nandrw/sys/LocalFriendCodeSeed_B "wikilink") file,
then recreates it using the LocalFriendCodeSeed data stored in memory.

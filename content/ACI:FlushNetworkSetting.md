+++
title = 'ACI:FlushNetworkSetting'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04040000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Flush the network settings. To be called after
[ACI:UpdateNetworkSetting](ACI:UpdateNetworkSetting "wikilink") or
[ACI:RemoveNetworkSetting](ACI:RemoveNetworkSetting "wikilink").
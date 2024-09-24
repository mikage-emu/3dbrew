+++
title = 'ACI:InitializeNetworkSetting'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04060040\] |
| 1          | Unknown value, usually 0x1 |

# Description

Initializes a network setting for updating. Call this, then set all the
properties and finally call
[ACI:UpdateNetworkSetting](ACI:UpdateNetworkSetting "wikilink") and
[ACI:FlushNetworkSetting](ACI:FlushNetworkSetting "wikilink").

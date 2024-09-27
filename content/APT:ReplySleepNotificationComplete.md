+++
title = 'APT:ReplySleepNotificationComplete'
+++

# Request

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code \[0x003F0040\]                     |
| 1          | [AppID](NS_and_APT_Services#appids "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Signals APT that the given
[AppID](NS_and_APT_Services#appids "wikilink") has prepared and is ready
for the system to go into sleep mode.

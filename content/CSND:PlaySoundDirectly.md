+++
title = 'CSND:PlaySoundDirectly'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040080\] |
| 1          | Channel ID (Range \[0-3\]) |
| 2          | Priority (Range \[0-31\])  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This function plays a sound from the info stored in the CSND shared
memory (Offset3). The **Channel ID** argument decides which channel the
sound will play in (4 channels available). If the specified channel is
already playing, the **Priority** argument defines the priority of the
sound. If the priority is higher, the playing sound will stop and the
new one will start playing (smaller value means higher priority).
Passing an out of bounds value to the **Channel ID** argument makes the
CSND module become unstable or crash.

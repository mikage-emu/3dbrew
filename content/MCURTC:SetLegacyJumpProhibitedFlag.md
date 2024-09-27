+++
title = 'MCURTC:SetLegacyJumpProhibitedFlag'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00590040\] |
| 1          | bool                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes to the MCU system-state buffer and updates the
LegacyJumpProhibited bit.

This is set by LgyBg during title launch to deny the title of the rights
to launch other titles via TWL Launcher (TLNC) block.

This is read by NS when handling the TLNC block. If this flag is set, NS
ignores and memclears the TLNC block.
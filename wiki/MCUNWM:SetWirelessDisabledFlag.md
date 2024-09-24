# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00070040\]             |
| 1          | bool, true = disabled, false = enabled |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes to the MCU system-state buffer and updates the
WirelessDisabled bit.

This does nothing by itself, it merely records the user-specified
enable/disable state for future FIRMs. When this is updated, the running
FIRM would then \*actually\* enable/disable the hardware separately to
this.

The value is loaded at FIRM boot to correctly initialize the previous
wireless state that the user expects.

This is stored in (volatile) MCU memory and is reset (to enabled state)
at battery pull. This mostly exists \*here\* because LgyBg cannot save
any settings anywhere else (i.e. NAND).
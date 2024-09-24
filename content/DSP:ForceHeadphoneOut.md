# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00200040\]     |
| 1          | u8, 0 = don't force, 1 = force |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wrapper for cdc:DSP cmd 8.
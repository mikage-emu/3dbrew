+++
title = 'KClassToken'
categories = ["Kernel objects"]
+++

Size : 0x5 bytes

| Offset | Type          | Description                        |
|--------|---------------|------------------------------------|
| 0x0    | const char \* | Pointer to kernel type string      |
| 0x4    | u8            | Kernel object descriptive bitflags |

Each type of kernel object has a token that describes it. The token is
used to make sure that a kernel object of a certain type is able to
perform a function requested by the kernel.

# Bitflags

| Bit | Description      |
|-----|------------------|
| 0   | Can synchronize  |
| 1   | Is interruptible |
| 2   |                  |
| 3   |                  |
| 4   |                  |
| 5   |                  |
| 6   |                  |
| 7   |                  |

## Bitflags and their corresponding objects

| Bits |     |     |
|------|-----|-----|
| 7    | 6   | 5   |
| 0    | 0   | 0   |
| 0    | 0   | 0   |
| 0    | 0   | 0   |
| 0    | 0   | 1   |
| 0    | 0   | 1   |
| 0    | 0   | 1   |
| 0    | 1   | 0   |
| 0    | 1   | 0   |
| 0    | 1   | 0   |
| 0    | 1   | 1   |
| 0    | 1   | 1   |
| 0    | 1   | 1   |
| 1    | 0   | 0   |
| 1    | 0   | 0   |
| 1    | 0   | 0   |
| 1    | 0   | 1   |
| 1    | 0   | 1   |
| 1    | 0   | 1   |
| 1    | 1   | 0   |
| 1    | 1   | 0   |

[Category:Kernel objects](Category:Kernel_objects "wikilink")

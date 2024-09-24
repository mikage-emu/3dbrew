+++
title = 'SPMTP'
+++

# Packet Structure

## Handshake Packets

### Header

| Offset | Size | Description          |
|--------|------|----------------------|
| 0x0    | 0x2  | Magic value (0x6363) |
| 0x2    | 0x2  | Padding              |
| 0x4    | 0x4  | Type                 |
| 0x8    | 0x4  | Zero                 |
| 0xC    | 0x4  | Content size         |

### Packet Types

| Id                          | Description                                           |
|-----------------------------|-------------------------------------------------------|
| 0x41(CLIENT) / 0x42(MASTER) | Identity: original mac address, transferable id, etc. |
| 0x43                        | Accepted peer's identity                              |
| 0x11(CLIENT) / 0x12(MASTER) | Module Filter                                         |
| 0x21(CLIENT) / 0x22(MASTER) | Friend Code                                           |
| 0x23(CLIENT) / 0x24(MASTER) | Friend "flag" (whether peer is in your friend list)   |
| 0x31(CLIENT) / 0x32(MASTER) | Message Box Metadata List                             |
| 0x33(CLIENT) / 0x34(MASTER) | Message Box Metadata List parsed by peer              |
| 0x81                        | TMP Box Metadata List                                 |

### Identity Packet (0x41/0x42)

| Offset | Size | Description                                                                |
|--------|------|----------------------------------------------------------------------------|
| 0x0    | 0x8  | Transferable ID                                                            |
| 0x8    | 0x8  | Zero                                                                       |
| 0x10   | 0x4  | Session ID (randomly generated for each new session)                       |
| 0x14   | 0x6  | Original MAC address (the one used for continuous scan is half-randomized) |
| 0x1A   | 0x2  | Padding                                                                    |
| 0x1C   | 0xC  | Date & Time                                                                |

### Identity Accept Packet (0x43)

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x10 | Garbage     |

### Module Filter Packet (0x11/0x12)

| Offset | Size               | Description   |
|--------|--------------------|---------------|
| 0x0    | Module Filter size | Module Filter |

### Friend Code Packet (0x21/0x22)

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x8  | Friend Code |

### Friend Flag Packet (0x23/0x24)

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x4  | Friend flag |

### Message Box Metadata List Packet (0x31-0x34)

| Offset | Size          | Description          |
|--------|---------------|----------------------|
| 0x0    | 0x2           | Magic value (0x6565) |
| 0x2    | 0x2           | Padding              |
| 0x4    | 0x4           | Length of the list   |
| 0x8    | 0x4           | Count                |
| 0xC    | 0x20          | Unused/reserved      |
| 0x2C   | 0x20 \* count | Entries              |

#### Message Box Metadata Entry

| Offset | Size | Description                                                                                |
|--------|------|--------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Title ID                                                                                   |
| 0x4    | 0x1  | Send mode                                                                                  |
| 0x5    | 0x1  | Flag                                                                                       |
| 0x6    | 0x2  | Send state (field modified by peer when sent back in packets 0x33/0x34)                    |
| 0x8    | 0x4  | Send size (sum of the size of all the messages you intend to send for this specific title) |
| 0xC    | 0x4  | Message count (number of messages you intend to send for this specific title)              |
| 0x10   | 0x10 | Unused/reserved                                                                            |

### TMP Box Metadata List Packet (0x81)

| Offset | Size         | Description |
|--------|--------------|-------------|
| 0x0    | 0x4          | Count       |
| 0x4    | 0x4 \* count | Entries     |

#### TMP Box Metadata Entry

| Offset | Size | Description                                                    |
|--------|------|----------------------------------------------------------------|
| 0x0    | 0x4  | Title ID                                                       |
| 0x4    | 0x4  | Size of the TMP Box which will be sent for this specific title |

## TMP Box Packets

| Offset | Size          | Description                              |
|--------|---------------|------------------------------------------|
| 0x0    | 0x2           | Magic value (0x6161)                     |
| 0x2    | 0x2           | Padding                                  |
| 0x4    | 0x4           | Size                                     |
| 0x8    | 0x4           | Title ID                                 |
| 0xC    | 0x4           | Group ID (messages can be grouped by id) |
| 0x10   | 0x4           | Message count                            |
| 0x14   | 0x0 - 0x18FEC | Messages                                 |
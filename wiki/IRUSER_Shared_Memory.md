This is the shared-memory for ["ir:USER"](IR_Services "wikilink"), which
is provided by the application via
[InitializeIrnop](IRUSER:InitializeIrnop "wikilink") or
[InitializeIrnopShared](IRUSER:InitializeIrnopShared "wikilink"). The
size of the shared memory is determined by parameters of the Init
functions above.

# Overall Structure

The shared memory consists of 2 or 5 components, depending on which Init
function is called. For InitializeIrnopShared, ir service puts more
information to the shared memory and applications can read it directly;
for InitializeIrnop, ir service puts less information and store the rest
in its local storage. All these components are adjacent to each other,
without any padding, which means the data can be unaligned if the size
specified in Init is unaligned.

| Size                         | Description                                                           |
|------------------------------|-----------------------------------------------------------------------|
| 0x10                         | StatusInfo. Only presents when InitializeIrnopShared is called        |
| 0x10                         | ReceiveBufferInfo. Only presents when InitializeIrnopShared is called |
| (specified by Init paramter) | ReceiveBuffer                                                         |
| 0x10                         | SendBufferInfo. Only presents when InitializeIrnopShared is called    |
| (specified by Init paramter) | SendBuffer                                                            |

# StatusInfo

| Relative offset | Size | Description                                                                                                              |
|-----------------|------|--------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x4  | Latest receive error result. Read by [IRUSER:GetLatestReceiveErrorResult](IRUSER:GetLatestReceiveErrorResult "wikilink") |
| 0x4             | 0x4  | Latest Send error result. Read by [IRUSER:GetLatestSendErrorResult](IRUSER:GetLatestSendErrorResult "wikilink")          |
| 0x8             | 0x1  | Connection status. Read by [IRUSER:GetConnectionStatus](IRUSER:GetConnectionStatus "wikilink")                           |
| 0x9             | 0x1  | Trying to connect status. Read by [IRUSER:GetTryingToConnectStatus](IRUSER:GetTryingToConnectStatus "wikilink")          |
| 0xA             | 0x1  | Connection role. Read by [IRUSER:GetConnectionRole](IRUSER:GetConnectionRole "wikilink")                                 |
| 0xB             | 0x1  | Machine ID. Set by [IRUSER:SetOwnMachineId](IRUSER:SetOwnMachineId "wikilink")                                           |
| 0xC             | 0x1  | Unknown. Value 1 is observed after connection                                                                            |
| 0xD             | 0x1  | Network ID? Seems like a randomly distributed number after connection                                                    |
| 0xE             | 0x1  | Unknown. Value 1 is observed after initialization                                                                        |
| 0xF             | 0x1  | Unknown                                                                                                                  |

# ReceiveBufferInfo/SendBufferInfo

The BufferInfo sections store data validity information for the two
buffers

| Relative offset | Size | Description                  |
|-----------------|------|------------------------------|
| 0x0             | 0x4  | Start index of valid packets |
| 0x4             | 0x4  | End index of valid packets   |
| 0x8             | 0x4  | Number of valid packets      |
| 0xC             | 0x4  | Unknown/Unused?              |

# ReceiveBuffer/SendBuffer

| Relative offset     | Size                                              | Description                                            |
|---------------------|---------------------------------------------------|--------------------------------------------------------|
| 0x0                 | 0x8 \* packet_count (specified in Init parameter) | PacketInfo{u32 offset_to_data_buffer, u32 data_length} |
| 0x8 \* packet_count | buffer_size - 0x8 \* packet_count                 | Data buffer                                            |

The buffers are two circular buffers. A new packet is added to the end
of previous packet in the data buffer, with packet info added to
PacketInfo\[end_index++\]. Note that if an added packet exceeds the end
of the buffer, the exceeding data will be wrapped around to the
beginning of the data buffer.

## Packet structure

A packet in the data buffer consists of a header, payload and a crc8
checksum

| Relative offset            | Size           | Description                                                                                                                                                                         |
|----------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0                        | 0x1            | Fixed value 0xA5?                                                                                                                                                                   |
| 0x1                        | 0x1            | Destination network ID?                                                                                                                                                             |
| 0x2                        | 0x1            | The highest bit is unknown. When second highest bit is clear, the rest bit\[0:5\] of this byte is the payload length; otherwise bit\[0:5\] is the higher byte of the payload length |
| 0x3                        | 0x1            | When bit\[6\] of previous byte is set, this byte is the lower byte of the payload length; other wise this byte doesn't present                                                      |
| 0x3 or 0x4                 | payload length | payload                                                                                                                                                                             |
| 0x3 or 0x4 +payload_length | 0x1            | [CRC-8-CCITT](CRC-8-CCITT "wikilink") over data above (header + payload)                                                                                                            |
|                            |                |                                                                                                                                                                                     |
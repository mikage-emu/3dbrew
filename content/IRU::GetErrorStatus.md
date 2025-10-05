+++
title = 'IRU::GetErrorStatus'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | u8 output   |

# Output Values

| Value | Description                                                 |
|-------|-------------------------------------------------------------|
| 0     | No error                                                    |
| 1     | I2C error during receive transfer                           |
| 2     | I2C error during send transfer                              |
| 3     | IR module time-out                                          |
| 4     | Overrun error                                               |
| 5     | Framing error                                               |
| 6     | [GPIO bit 0x80](GPIO_Services#gpio_bits "wikilink") not set |
| 7     | Transfer was interrupted by sleep                           |
| 8     | Misc. line error                                            |

# Notes

If either of the I2C errors is triggered by one of the internal I2C operations failing, most subsequent calls to IR services will fail with error 0xF9610C02 until the system is rebooted.
The system entering sleep mode will cancel any running transfer, similar to calling [IRU:WaitSendTransfer](IRU:WaitSendTransfer "wikilink") or [IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink").
Upon waking up, the error is set to 7 and the send or receive event is signalled, depending on which transfer, if any, was running.

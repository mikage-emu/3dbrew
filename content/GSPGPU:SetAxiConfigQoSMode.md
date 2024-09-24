# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100040\] |
| 1          | Quality of service         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Quality of service

| Index Bit | Description                                                                                                                                                 |
|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 2-0       | [Tidemark](https://developer.arm.com/documentation/ddi0422/d/programmers-model/programmable-quality-of-service--progqos-/qos-tidemark-register)             |
| 15-8      | [Access control](https://developer.arm.com/documentation/ddi0422/d/programmers-model/programmable-quality-of-service--progqos-/qos-access-control-register) |

# Description

This is used to program the QoS (Quality of Service). Tidemark is the
maximum allowed number of transactions initiated but not completed with
FCRAM, after which next transactions will be limited to certain masters.
Access control sets which masters have this privilege. For more info,
see [CoreLink™ NIC-301
r1p2](https://developer.arm.com/documentation/ddi0422/d/introduction/about-the-high-performance-matrix).

Old systems have a total of 7 masters (guesses are ARM11, ARM9, GPU,
DSP, CDMA, CSND, AHB); new systems have 3 additional masters (likely
NewCDMA and L2 controller, and an unknown one).

GSP limits the maximum value of tidemark to 7; meanwhile, the maximum
value for access control is 2^N-1, 1 bit for each slave interface, where
N = number of slave interfaces.

New GSP forces SI7 to be always set.
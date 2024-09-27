# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00120000\] |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2-15       | Performance log info structure |

# Performance Log Info

| Index Word | Description     |
|------------|-----------------|
| 0          | PSC0 delta time |
| 1          | PSC0 sum time   |
| 2          | PSC1 delta time |
| 3          | PSC1 sum time   |
| 4          | PDC0 delta time |
| 5          | PDC0 sum time   |
| 6          | PDC1 delta time |
| 7          | PDC1 sum time   |
| 8          | PPF delta time  |
| 9          | PPF sum time    |
| 10         | P3D delta time  |
| 11         | P3D sum time    |
| 12         | DMA delta time  |
| 13         | DMA sum time    |

All times are in nanoseconds.

# Description

Get performance logs.
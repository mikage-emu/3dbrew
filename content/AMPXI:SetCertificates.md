+++
title = 'AMPXI:SetCertificates'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x003D0108\]             |
| 1          | First certificate size                 |
| 2          | Second certificate size                |
| 3          | Third certificate size                 |
| 4          | Fourth certificate size                |
| 5          | (FirstCertificateSize \<\< 8) \| 0x6   |
| 6          | First certificate pointer              |
| 7          | (SecondCertificateSize \<\< 8) \| 0x16 |
| 8          | Second certificate pointer             |
| 9          | (ThirdCertificateSize \<\< 8) \| 0x26  |
| 10         | Third certificate pointer              |
| 11         | (FourthCertificateSize \<\< 8) \| 0x36 |
| 12         | Fourth certificate pointer             |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003D0040\] |
| 1          | Result code                |

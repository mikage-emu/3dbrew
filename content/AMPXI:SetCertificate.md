+++
title = 'AMPXI:SetCertificate'
+++

# Request

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x003E0042\]      |
| 1          | Certificate size                |
| 2          | (CertificateSize \<\< 8) \| 0x6 |
| 3          | Certificate pointer             |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003E0040\] |
| 1          | Result code                |

# Description

This internally calls
[AMPXI:SetCertificates](AMPXI:SetCertificates "wikilink") with the
provided certificate as the first certificate and the remaining
parameters as 0s.
+++
title = 'NIMS:DownloadTickets'
+++

# Request

| Index Word | Description                                                                     |
|------------|---------------------------------------------------------------------------------|
| 0          | Header code \[0x002D0042\]                                                      |
| 1          | Total u64 little-endian [ticketIDs](Ticket "wikilink") contained in the buffer. |
| 8          | ((TotalTikIDs\*0x8)\<\<14) \| 2                                                 |
| 9          | TikIDs buffer ptr.                                                              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This sends a HTTP request for ECommerceSOAP AccountGetETickets. Then it
uses [AMNet:SetCertificates](AMNet:SetCertificates "wikilink"), followed
by ticket installation starting with
[AMNet:OpenTicket](AMNet:OpenTicket "wikilink").
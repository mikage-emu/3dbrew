+++
title = 'Cfg:GetCountryCodeString'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x00090040\]        |
| 1          | u16 Country-Code ID (table index) |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code                     |
| 1          | Result code                     |
| 2          | 2-character Country-Code string |

# Description

This returns the Country-Code string for the specified Country-Code
ID(table-index). The input index must be \< 0xBB. If the input index is
\>= 0xBB or is of an invalid country, the result code will be
0xD90103FA. You can find a list of country codes and indices at [Country
Code List](Country_Code_List "wikilink").

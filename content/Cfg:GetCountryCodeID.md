# Request

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x000A0040\]      |
| 1          | 2-character Country-Code string |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u16 Country-Code ID (table index) |

# Description

This goes through the Country-Code table, which contains 0xBB entries.
When an entry is found which contains a 2-character string, matching the
input string, the u16 Country-Code ID/table-index is written to the
output field. Otherwise, the output value is 0xFF. You can find a list
of country codes and indices at [Country Code
List](Country_Code_List "wikilink").
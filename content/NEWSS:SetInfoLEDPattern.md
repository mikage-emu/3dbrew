# Request

| Index Word | Description                                                                                                                                                          |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000E0040\]                                                                                                                                           |
| 1          | u32 array index, internally this is handled as an u8. When a certain state field is zero, news-module internally sets bit0 in this index, otherwise bit0 is cleared. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This uses the input array index value to load data from an array, the
loaded data is then used with
[PTMSYSM:SetInfoLEDPattern](PTMSYSM:SetInfoLEDPattern "wikilink").

The array index is not validated at all. Using out-of-bounds values
*should not be attempted at all*, since invalid data with
[PTMSYSM:SetInfoLEDPattern](PTMSYSM:SetInfoLEDPattern "wikilink") can
cause a [brick](MCU_Services "wikilink").
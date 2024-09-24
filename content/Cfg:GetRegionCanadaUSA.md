+++
title = 'Cfg:GetRegionCanadaUSA'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | u8 output value |

# Description

This first calls the code for
[Cfg:SecureInfoGetRegion](Cfg:SecureInfoGetRegion "wikilink"), if the
output for that is not value 1 (America) this immediately returns u8
output value 0. Otherwise, this then checks the country-code stored in
the [CountryInfo](Config_Savegame "wikilink"). If the Country-code is 18
(Canada) or 49 (USA), the output value is then set to 1, otherwise the
output value is set to zero.

Also known as **CFG:IsCoppacsSupported**, due to the (original) purpose
of this function being to determine whether to enable legally mandated
restrictions in the U.S. and Canadian markets.

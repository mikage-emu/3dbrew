+++
title = 'AM:UpdateFirmwareAuto'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x040F0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Same as [AM:UpdateFirmwareTo](AM:UpdateFirmwareTo "wikilink") except the
titleID used here is loaded by AM module with
[AMPXI:GetTitleList](AMPXI:GetTitleList "wikilink"), this titleID is
[NATIVE_FIRM](FIRM "wikilink"). The titleID used here is the first
titleID from the loaded title-list which is a CTR system
[title](Title_list "wikilink"), where uniqueID=0. After obtaining this
titleID, AM module then uses command
[AMPXI:GetTitleInfo](AMPXI:GetTitleInfo "wikilink"), the titleID-low and
title-version from this are then compared with data stored in
[Configuration Memory](Configuration_Memory "wikilink"). If these
title-info checks fail, AM module will return result-code 0xD8A083FA.
The [AMPXI:InstallFIRM](AMPXI:InstallFIRM "wikilink") command is only
used if these title-info checks pass.
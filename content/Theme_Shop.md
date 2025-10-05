+++
title = 'Theme Shop'
+++

The Theme Shop was added in [9.0.0-20](9.0.0-20 "wikilink"), which allows users to purchase [Home Menu Theme](Home_Menu/Themes "wikilink"). The shop file structure is based on the [BOSS](BOSS "wikilink") file. When the shop starts booting, it requests a top file from <https://npdl.cdn.nintendowifi.net/p01/nsa/dMtiFHzm5OOf0y2O/thmtop/><countrycode>/<language>/top. Because Nintendo has closed the Shop alongside [eShop](eShop "wikilink") on March 27, 2023, the Top file was edited to only have "New Themes" as an option.

## Available Themes Info

After the top file, when you click any Theme Category or All themes, the 3DS Downloads the available themes for the country on <https://npfl.c.app.nintendowifi.net/p01/filelist/dMtiFHzm5OOf0y2O/thmdtls?c=><countrycode>&l<language>=&a3=<indexCount>

After 2 unknown lines, there is info about a specific theme its in TSV Format

| Column No | Notes |
|----|----|
| 1 | Theme list ID used in this request <https://npdl.cdn.nintendowifi.net/p01/nsa/dMtiFHzm5OOf0y2O/thmdtls/><countryCode>/<language>/<ThemeID> |
| 2 | Price in the local currency (in free themes, this column is empty) |
| 3 | Same as column 1 |
| 4 | ? |
| 5 | Themes List Index Count |
| 6 | ? |
| 7 | Timestamp when the Theme was added |

## Theme List Format

<div style="border: 1px solid #f28500; background: #fff8dc; padding: 0.5em;">

The Table list is incomplete. Research is in progress.

</div>

The Theme List format, used to display available themes in the category chosen by the top section or the new themes section, is stored at <https://npdl.cdn.nintendowifi.net/p01/nsa/dMtiFHzm5OOf0y2O/thmlist/><CountryCode>/<Language>/<thmListId>.

Decrypting the Theme List BOSS file using [GodMode9](GodMode9 "wikilink") or [Decrypt9WIP](Decrypt9WIP "wikilink") contains the following data

| Offset | Description                              |
|--------|------------------------------------------|
| 0x0    | File magic (boss)                        |
| 0x9    | File size (in bytes)                     |
| 0x2D4  | Title of the theme category (UTF-16)     |
| 0x394  | Developer of the theme category (UTF-16) |

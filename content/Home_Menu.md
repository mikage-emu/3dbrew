+++
title = 'Home Menu'
categories = ["Nintendo Software"]
+++

The **Home Menu** is the heart of the Nintendo 3DS. From there one can
start games, applications, and access various processes including the
friends list. It is launched by [NS](NS "wikilink"), and is always
running in the background in 3DS-mode except when other programID-high
00040030 applications like Internet Browser, Friend-List, etc are
running. Home Menu is still running while [System
Settings](System_Settings "wikilink") is running, however the System
Settings application does not allow directly returning to home-menu. The
system will normally re-launch Home Menu when the Home Menu process
crashes/terminates. When this re-launch occurs while Home Menu is
active, Home Menu displays an error message which says to manually
reboot the system.

## System Versions

Nintendo devised a system, whereby updates would be delivered via two
channels:

- Card Updates (CUP) - The Nintendo 3DS is updated with data from an
  [update partition](System_Update_CFA "wikilink") on retail gamecard
  title.
- Network Updates (NUP) - The Nintendo 3DS is updated by downloading
  data from Nintendo's [CDN](Title_list "wikilink").

CUPs will only deliver updates to core features, such as the Home Menu,
[Download Play](Download_Play "wikilink") etc. CUPs will not deliver
updates to Network features, such as [System
Transfer](System_Transfer "wikilink"), [Internet
Browser](Internet_Browser "wikilink"), [StreetPass Mii
Plaza](StreetPass_Mii_Plaza "wikilink") or [eShop](EShop "wikilink").

NUPs can deliver updates to core features as well as (updated) Network
Features.

As a result of deciding to make a distinction between what content could
be updated and how, Nintendo split the system version displayed by
[System Settings](System_Settings "wikilink") into two parts:
[CVer](CVer "wikilink") (Console Version) and [NVer](NVer "wikilink")
(Network Update Version). Represented as:

<CVer Major>`.`<CVer Minor>`.`<CVer Micro>`-`<NUP Version><NUP Region>

The Console Version represents the version of the collectively installed
core features. And the NUP Version represents the version of the
collectively installed network features.

So if a 3DS' System Firmware read **2.1.0-2U**, it would indicate a
console version of **2.1.0** and a NUP version of **2U**.

NOTES:

- CUPs can only update core content, so [NVer](NVer "wikilink") is never
  updated with CUPs.
- NUPs will not update [NVer](NVer "wikilink") if network features are
  not updated. (Best seen with the USA vs JPN/EUR 6.0.0 NUP)

CUPs are implemented by adding a [System Update
CFA](System_Update_CFA "wikilink") to retail NCSD gamecard images.
Nintendo generally creates CUPs after NUPs are released.

When updating the system from 4.5.0-6 to 4.5.0-10, the following titles
are updated(in the order of title download+install): [Health and Safety
Information](Health_and_Safety_Information "wikilink"), [Nintendo 3DS
Camera](Nintendo_3DS_Camera "wikilink"), [eShop](eShop "wikilink"),
[System Transfer](System_Transfer "wikilink"), [Internet
Browser](Internet_Browser "wikilink"),
[0004009B00014102](Title_list "wikilink"),
[0004009B00014202](Title_list "wikilink"),
[0004009B00014302](Title_list "wikilink"), [NVer](NVer "wikilink"), and
[AGB_FIRM](FIRM "wikilink").

### System Versions List

| System version                              | Home Menu title version  | Release date       | Changelog                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | System security [flaws](3DS_System_Flaws "wikilink") fixed\* | Userland security [flaws](3DS_Userland_Flaws "wikilink") fixed\* | 3DS-mode homebrew affected\* | CUP Released  | CDN Availability | CDN Post Date      |
|---------------------------------------------|--------------------------|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|------------------------------------------------------------------|------------------------------|---------------|------------------|--------------------|
| [1.0.0-0](1.0.0-0 "wikilink")               | 0                        | February 26, 2011  | Shipped with 3DS on launch                                                                                                                                                                                                                                                                                                                                                                                                                                                        |                                                              |                                                                  |                              | Yes           | Available        | February 18, 2011  |
| [1.1.0-1](1.1.0-1 "wikilink")               | 0                        | February ?, 2011   | General bug fixes Added 3D Video title to menu. ("For a Limited Time Only")                                                                                                                                                                                                                                                                                                                                                                                                       |                                                              |                                                                  |                              | Yes           | Available        | March 1, 2011      |
| [2.0.0-2](2.0.0-2 "wikilink")               | 1029                     | June 6/7, 2011     | [eShop](eShop "wikilink") added, web browser available, [System Transfer](System_Transfer "wikilink") added. Full DSiWare data management available. [Automatic](Automatic_System_Update_Download "wikilink") downloading for system updates added. Video stubbed.                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | June 6, 2011       |
| [2.1.0-3](2.1.0-3 "wikilink")               | 2049                     | June 15, 2011      | Fixes the Ridge Racer freeze.                                                                                                                                                                                                                                                                                                                                                                                                                                                     |                                                              |                                                                  |                              | Yes           | Available        | June 15, 2011      |
| [2.1.0-4](2.1.0-4 "wikilink")               | Not updated              | July 25, 2011      | System stability improvements and other adjustments.                                                                                                                                                                                                                                                                                                                                                                                                                              |                                                              |                                                                  |                              | No            | Available        | July 25, 2011      |
| [2.2.0](2.2.0-X "wikilink")                 | ?                        | November 6, 2011   | CUP Only Release. Add "join game" feature to [Friend List](Friend_List "wikilink"). Update from some game cards such as Super Mario 3D Land.                                                                                                                                                                                                                                                                                                                                      |                                                              |                                                                  |                              | Yes           | Unavailable      | ?                  |
| [3.0.0-5](3.0.0-5 "wikilink")               | 4111                     | December 7, 2011   | Added 3D video recording to the camera title, updated Mii Streetpass Plaza, [System Transfer](System_Transfer "wikilink") between 3DS systems available, improved eShop, home menu QR code scanning with QR codes containing URLs. [Nintendo Zone](Nintendo_Zone "wikilink") is now always accessible, 3D video streaming support was added to NZone. This added support for running GBA VC titles via AGB_FIRM as well, support for GBA VC titles was also added to NATIVE_FIRM. |                                                              |                                                                  |                              | Yes           | Available        | December 7, 2011   |
| [3.0.0-6](3.0.0-6 "wikilink")               | Not updated              | December 21, 2011  | Only StreetPass Mii Plaza and the [NVer](NVer "wikilink") title were updated. From Nintendo's release notes: "System stability improvements and other adjustments".                                                                                                                                                                                                                                                                                                               |                                                              |                                                                  |                              | No            | Available        | December 21, 2011  |
| [3.1.0-6](3.1.0-6 "wikilink")               | Not updated              | Unknown            | Unknown. Sighted preinstalled on some early European 3DS XLs.                                                                                                                                                                                                                                                                                                                                                                                                                     |                                                              |                                                                  |                              | ?             | Unknown          | Unknown            |
| [4.0.0-7](4.0.0-7 "wikilink")               | 5131                     | April 24, 2012     | Add folders to Home Menu, game patching added, buy more expensive games than 1000 yen in JPN. System titles for CHN, TWN, and KOR became available.                                                                                                                                                                                                                                                                                                                               | Yes                                                          |                                                                  |                              | Yes           | Available        | April 24, 2012     |
| [4.1.0-8](4.1.0-8 "wikilink")               | Not updated              | May 14, 2012       | From changelog: "improvements to overall system stability and other minor adjustments". Once updated to [4.1.0-8](4.1.0-8 "wikilink"), the parental-controls PIN is no longer required for future system updates.                                                                                                                                                                                                                                                                 | Yes                                                          |                                                                  |                              | Yes           | Available        | May 14, 2012       |
| [4.2.0-9](4.2.0-9 "wikilink")               | 6146                     | June 26, 2012      | Improved eShop safety for entering credit-card info, and behind the scenes improvements. Stored CC info will be deleted by this updated eShop, and can be re-entered again.                                                                                                                                                                                                                                                                                                       |                                                              |                                                                  |                              | Yes           | Available        | June 26, 2012      |
| [4.3.0-10](4.3.0-10 "wikilink")             | Not updated              | July 24, 2012      | Updated eShop, bad word list and NZone hotspot list updated.                                                                                                                                                                                                                                                                                                                                                                                                                      |                                                              |                                                                  |                              | Yes           | Available        | July 24, 2012      |
| [4.4.0-10](4.4.0-10 "wikilink")             | Not updated              | September 19, 2012 | NZone hotspot list updated and TWL_FIRM updated for blocking flash cards.                                                                                                                                                                                                                                                                                                                                                                                                         |                                                              |                                                                  |                              | Yes           | Available        | September 19, 2012 |
| [4.4.0-10C](4.4.0-10 "wikilink")            | Not updated              | October 17, 2012   | China-only, the \*only\* updated title was [System Settings](System_Settings "wikilink"). This title was updated to a version already available in TWN/KOR.                                                                                                                                                                                                                                                                                                                       |                                                              |                                                                  |                              | ?             | Available        | October 17, 2012   |
| [4.5.0-10](4.5.0-10 "wikilink")             | Not updated              | December 4, 2012   | Flash-card block via updated TWL_FIRM and whitelist. NZone hotspot list updated as well.                                                                                                                                                                                                                                                                                                                                                                                          |                                                              |                                                                  |                              | Yes           | Available        | December 4, 2012   |
| [5.0.0-11](5.0.0-11 "wikilink")             | 7172                     | March 25, 2013     | Many system titles including NATIVE_FIRM were updated, multiple vulnerabilities were fixed as well.                                                                                                                                                                                                                                                                                                                                                                               | Yes                                                          |                                                                  | Yes                          | No            | Available        | March 25, 2013     |
| [5.1.0-11](5.1.0-11 "wikilink")             | Not updated              | April 4, 2013      | NATIVE_FIRM and NS were updated. According to the official change-log: "Resolves an issue that may prevent access to the System Settings or other features."                                                                                                                                                                                                                                                                                                                      | No                                                           |                                                                  | No                           | Yes           | Available        | April 4, 2013      |
| [6.0.0-12 (-11U)](6.0.0-11 "wikilink")      | 8198                     | June 17, 2013      | Official change-log: "Users can now back up save data for downloadable versions of Nintendo 3DS software and most Virtual Console games". For EUR/JPN, the [StreetPass Mii Plaza](StreetPass_Mii_Plaza "wikilink") application and the [Nintendo 3DS Camera](Nintendo_3DS_Camera "wikilink") application were updated. Other titles for all regions were updated as well.                                                                                                         | Yes                                                          |                                                                  |                              | No            | Available        | June 17, 2013      |
| [6.1.0-12 (-11U)](6.1.0-11 "wikilink")      | Not updated              | June 27, 2013      | Official change-log: "Further improvements to overall system stability and other minor adjustments have been made to enhance the user experience."                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | Yes           | Available        | June 27, 2013      |
| [6.1.0-12U](6.1.0-12U "wikilink")           | Not updated              | July 11, 2013      | This USA-only update added the updated network features applications which were first released in JPN/EUR with the [6.0.0-12 NUP](6.0.0-11 "wikilink") update.                                                                                                                                                                                                                                                                                                                    |                                                              |                                                                  |                              | No            | Available        | July 11, 2013      |
| [6.2.0-12](6.2.0-12 "wikilink")             | Not updated              | August 6, 2013     | This update added support for the StreetPass relay feature, updated TWL_FIRM, and updated the Nintendo Zone hotspots list.                                                                                                                                                                                                                                                                                                                                                        |                                                              |                                                                  |                              | Yes           | Available        | August 6, 2013     |
| [6.3.0-12](6.3.0-12 "wikilink")             | Not updated              | September 13, 2013 | See [this](6.3.0-12 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | No            | Available        | September 13, 2013 |
| [6.4.0-12](6.4.0-12 "wikilink")             | ?                        | November 11, 2013  | See [this](6.4.0-12 "wikilink")(Only for the KOR and TWN regions).                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | November 11, 2013  |
| [7.0.0-13](7.0.0-13 "wikilink")             | 9230                     | December 9, 2013   | See [this](7.0.0-13 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Yes                                                          | Yes                                                              |                              | No            | Available        | December 9, 2013   |
| [7.1.0-14](7.1.0-14 "wikilink")             | Not updated              | December 19, 2013  | See [this](7.1.0-14 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  |                              | Yes           | Available        | December 19, 2013  |
| [7.1.0-15](7.1.0-15 "wikilink")             | Not updated              | January 22, 2014   | See [this](7.1.0-15 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | No            | Available        | January 22, 2014   |
| [7.1.0-16](7.1.0-16 "wikilink")             | Not updated              | February 26, 2014  | See [this](7.1.0-16 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | No            | Available        | February 26, 2014  |
| [7.2.0-17](7.2.0-17 "wikilink")             | Not updated              | May 12, 2014       | See [this](7.2.0-17 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                              |                                                                  | No                           | Yes           | Available        | May 12, 2014       |
| [8.0.0-18](8.0.0-18 "wikilink")             | Not updated              | July 7, 2014       | See [this](8.0.0-18 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | Yes           | Available        | July 7, 2014       |
| [8.1.0-18](8.1.0-18 "wikilink")             | Not updated              | July 24, 2014      | See [this](8.1.0-18 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | Yes           | Available        | July 24, 2014      |
| [8.1.0-19](8.1.0-19 "wikilink")             | Not updated              | August 7, 2014     | See [this](8.1.0-19 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | No            | Available        | August 7, 2014     |
| [8.1.0-0 New3DS](8.1.0-0_New3DS "wikilink") | Not updated              | September 26, 2014 | See [this](8.1.0-0_New3DS "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                              |                                                                  | No                           | No            | Available        | September 26, 2014 |
| 8.1.0-19                                    | Not updated              | October 2, 2014    | Japan-only "update", see [here](http://yls8.mtheall.com/ninupdates/reports.php?date=10-02-14_02-05-03&sys=ctr). The only change was that a new title([New_3DS](New_3DS "wikilink")-only system application) was added, CVer/NVer titles were not even updated. The initial version of this [title](Title_list "wikilink") is a stub.                                                                                                                                              | No                                                           |                                                                  | No                           | No            | Available        | October 2, 2014    |
| [9.0.0-20](9.0.0-20 "wikilink")             | v11272                   | October 6, 2014    | See [this](9.0.0-20 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                              |                                                                  | No                           | Yes (K)       | Available        | October 6, 2014    |
| [9.1.0-20J](9.1.0-20J "wikilink")           | v14336(JPN-region title) | October 10, 2014   | Japan-only, see [this](9.1.0-20J "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                     | No                                                           |                                                                  | No                           | No            | Available        | October 10, 2014   |
| [9.2.0-20](9.2.0-20 "wikilink")             |                          | October 29, 2014   | See [this](9.2.0-20 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | Yes (U/E)     | Available        | October 29, 2014   |
| [9.3.0-21](9.3.0-21 "wikilink")             |                          | December 8, 2014   | See [this](9.3.0-21 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Yes                                                          |                                                                  | Yes                          | No            | Available        | December 8, 2014   |
| [9.4.0-21](9.4.0-21 "wikilink")             |                          | December 11, 2014  | See [this](9.4.0-21 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           |                                                                  | No                           | No            | Available        | December 11, 2014  |
| [9.5.0-22](9.5.0-22 "wikilink")             |                          | February 2, 2015   | See [this](9.5.0-22 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Yes                                                          |                                                                  |                              | Yes (J/U/E)   | Available        | February 2, 2015   |
| [9.5.0-23](9.5.0-23 "wikilink")             |                          | March 2, 2015      | See [this](9.5.0-23 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           | Yes                                                              |                              | As above      | Available        | March 2, 2015      |
| [9.6.0-24](9.6.0-24 "wikilink")             |                          | March 23, 2015     | See [this](9.6.0-24 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | See [here](9.6.0-24 "wikilink").                             |                                                                  |                              | Yes (J/U/E)   | Available        | March 23, 2015     |
| [9.7.0-25](9.7.0-25 "wikilink")             |                          | April 20, 2015     | See [this](9.7.0-25 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Probably none?                                               |                                                                  | No                           | Yes (J/U/E)   | Available        | April 20, 2015     |
| [9.8.0-25](9.8.0-25 "wikilink")             |                          | June 1, 2015       | See [this](9.8.0-25 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  | No                                                           | No                                                               | No                           | Yes (J/U/E)   | Available        | June 1, 2015       |
| [9.9.0-26](9.9.0-26 "wikilink")             |                          | July 13, 2015      | See [this](9.9.0-26 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                              |                                                                  |                              | Yes (J/U/E/K) | Available        | July 13, 2015      |
| [10.0.0-27](10.0.0-27 "wikilink")           |                          | September 8, 2015  | See [this](10.0.0-27 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Yes                                                          | No                                                               | No                           | No            | Available        | September 8, 2015  |
| [10.1.0-27](10.1.0-27 "wikilink")           |                          | September 14, 2015 | See [this](10.1.0-27 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | No                                                           | No                                                               | No                           | Yes (J/U/E/K) | Available        | September 14, 2015 |
| [10.2.0-28](10.2.0-28 "wikilink")           |                          | October 19, 2015   | See [this](10.2.0-28 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | Yes (J/U/E)   | Available        | October 19, 2015   |
| [10.3.0-28](10.3.0-28 "wikilink")           |                          | November 9, 2015   | See [this](10.3.0-28 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | Yes (J/U/E)   | Available        | November 9, 2015   |
| [10.4.0-29](10.4.0-29 "wikilink")           |                          | January 18, 2016   | See [this](10.4.0-29 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Yes                                                          | Launching old Ironfall was blocked.                              | Yes                          | No            | Available        | January 18, 2016   |
| [10.5.0-30](10.5.0-30 "wikilink")           |                          | January 25, 2016   | See [this](10.5.0-30 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | Yes (J/U/E)   | Available        | January 25, 2016   |
| [10.6.0-31](10.6.0-31 "wikilink")           |                          | February 22, 2016  | See [this](10.6.0-31 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Yes                                                          | Yes                                                              | Yes                          | Yes (J/U)     | Available        | February 22, 2016  |
| [10.7.0-32](10.7.0-32 "wikilink")           |                          | March 14, 2016     | See [this](10.7.0-32 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | No                                                           | Yes                                                              | Yes                          | Yes (J/U/E)   | Available        | March 14, 2016     |
| [11.0.0-33](11.0.0-33 "wikilink")           |                          | May 9, 2016        | See [this](11.0.0-33 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Yes                                                          | No                                                               | Yes                          | Yes (J/U/E)   | Available        | May 9, 2016        |
| [11.1.0-34](11.1.0-34 "wikilink")           |                          | September 13, 2016 | See [this](11.1.0-34 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | Yes (J/U/E)   | Available        | September 13, 2016 |
| [11.2.0-35](11.2.0-35 "wikilink")           |                          | October 24, 2016   | See [this](11.2.0-35 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | No            | Available        | October 24, 2016   |
| [11.3.0-36](11.3.0-36 "wikilink")           |                          | February 6, 2017   | See [this](11.3.0-36 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Yes                                                          | Yes                                                              | Yes                          | No            | Available        | February 6, 2017   |
| [11.4.0-37](11.4.0-37 "wikilink")           |                          | April 10, 2017     | See [this](11.4.0-37 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Yes                                                          | Yes                                                              | Yes                          | No            | Available        | April 10, 2017     |
| [11.5.0-38](11.5.0-38 "wikilink")           |                          | July 10, 2017      | See [this](11.5.0-38 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | No            | Available        | July 10, 2017      |
| [11.6.0-39](11.6.0-39 "wikilink")           |                          | September 18, 2017 | See [this](11.6.0-39 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | No            | Available        | September 18, 2017 |
| [11.7.0-40](11.7.0-40 "wikilink")           |                          | June 18, 2018      | See [this](11.7.0-40 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | No            | Available        | June 18, 2018      |
| [11.8.0-41](11.8.0-41 "wikilink")           |                          | July 30, 2018      | See [this](11.8.0-41 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | No            | Available        | July 30, 2018      |
| [11.9.0-42](11.9.0-42 "wikilink")           |                          | December 3, 2018   | See [this](11.9.0-42 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                              |                                                                  |                              | No            | Available        | December 3, 2018   |
| [11.10.0-43](11.10.0-43 "wikilink")         |                          | May 27, 2019       | See [this](11.10.0-43 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | May 27, 2019       |
| [11.11.0-43E](11.11.0-43E "wikilink")       |                          | August 26, 2019    | See [this](11.11.0-43E "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                               |                                                              |                                                                  |                              | No            | Available        | August 26, 2019    |
| [11.12.0-44](11.12.0-44 "wikilink")         |                          | November 4, 2019   | See [this](11.12.0-44 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | November 4, 2019   |
| [11.13.0-45](11.13.0-45 "wikilink")         |                          | December 2, 2019   | See [this](11.13.0-45 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | December 2, 2019   |
| [11.14.0-46](11.14.0-46 "wikilink")         |                          | November 17, 2020  | See [this](11.14.0-46 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | November 17, 2020  |
| [11.15.0-47](11.15.0-47 "wikilink")         |                          | July 27, 2021      | See [this](11.15.0-47 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | July 27, 2021      |
| [11.16.0-48](11.16.0-48 "wikilink")         |                          | August 30, 2022    | See [this](11.16.0-48 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | August 30, 2022    |
| [11.16.0-49](11.16.0-49 "wikilink")         |                          | September 13, 2022 | See [this](11.16.0-49 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | September 13, 2022 |
| [11.17.0-50](11.17.0-50 "wikilink")         |                          | May 23, 2023       | See [this](11.17.0-50 "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                              |                                                                  |                              | No            | Available        | May 23, 2023       |

"[System](3DS_System_Flaws "wikilink")/[Userland](3DS_Userland_Flaws "wikilink")
security flaws fixed\*": This includes known flaws, and any fixed flaws
discovered via code bin-diff.

"[System](3DS_System_Flaws "wikilink")/[Userland](3DS_Userland_Flaws "wikilink")
security flaws fixed\*" and "3DS-mode homebrew affected" only apply to
the changes done with that specific system-update("affected" does not
include hax codebases breaking \*just\* due to updated codebins).

## Auto-Boot Function

When the Home Menu is initially loaded by [NS](NS "wikilink"), it checks
the gamecard ExeFS:/[icon](SMDH "wikilink") for the auto-boot flag. If
the auto-boot flag is set, it will load the application on the cartridge
and the home menu will not remain running in the background, or at least
not in an operational state. Using software cues to return to the home
menu, or sleep menu while in this state, causes a shutdown.

Notable features of demo titles:

- Auto-boot demos generally disable the functionality of the home
  button.
- The *New Super Mario Bros 2* demo, retained the functionality of the
  home button, and had an timer which triggered the demo to quit after a
  period of inactivity.

Auto-boot cartridges, can bypass some of the functions of the Home Menu.
Auto Booted software:

- Doesn't show usage history in the [Activity
  Log](Activity_Log "wikilink")
- Bypasses Parental controls
- Bypasses Forced Game Card Updates
- Bypasses Initial 3DS Setup
- The console does not have a friends list presence.
- Is still subject to region lock(see below).

Region lock is still active, so the home menu will refuse to launch
demos with incorrect region lock will not load, displaying "An Error has
Occurred". However, game card update partition checks are not done,
which allows launching demos that have region free encoding, but have an
alternate(or even invalid) region update partition.

The following auto-boot paths can be used by Home Menu, checked in the
same order listed below(the above gamecard auto-boot is checked before
this):

| Key-combo / requirements for this path | Description                                                                              |
|----------------------------------------|------------------------------------------------------------------------------------------|
| R, L, and X                            | This launches [System Settings](System_Settings "wikilink") for touchscreen calibration. |
| R, L, and Y                            | This launches [System Settings](System_Settings "wikilink") for circlepad calibration.   |

The following is only checked when the low u16 from
[config](Config_Savegame "wikilink") block 0x00110000 is value
zero(normally this is non-zero). Thus, the below is only handled when a
system setup is required.

| Key-combo / requirements for this path                      | Description                                                                                                                                                            |
|-------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| R, X, Y, A, and B, a 3DS gamecard must be inserted as well. | This launches the gamecard application. Note that pressing the HOME button in the gamecard application launched this way will only result in the system shutting down. |
| This is used when the above path isn't used.                | This launches System Settings for the system setup.                                                                                                                    |

## Region Lockout

One of the Home Menu's functions, is to regulate region lockout. The
region lockout data for any given title is held in the [ICN
data](SMDH#BNR_Region "wikilink"). There are 6 regions of which have
their own region lockout, Japan, USA, Europe(including Nintendo
Australia), China, Taiwan and Korea. There is also a value which makes a
title exempt from region lockout, and consequently accessible from any
region of 3DS.

The region-field stored in the [ICN-data](SMDH "wikilink") is only
checked when Home Menu itself launches a title, not when other titles
use NS to have Home Menu launch titles. This isn't actually useful for
gamecard region-free however, due to the gamecard system-updates, see
below.

Also note that while some gamecard games are mostly region-free(main CXI
is identical for all regions of the gamecard), those gamecards can't
actually be launched with all 3DS regions due to the gamecard
system-update, see below. Note that the main CXI being identical for all
regions of a gamecard also means the savedata keyY is identical for all
regions of that gamecard too(except for old system-version \<v2.2 games,
in some cases, due to different cardIDs).

### Effects of Region Lockout

Every 3DS title regardless of location (NAND/SD Card/Game Card) is
subject to region lockout scrutiny by the Home Menu. And the home menu
treats 'out-of-region' titles by simply refusing to show them on the
home menu. No messages are shown on the home menu to notify the user,
the title is simply ignored. However out-of-region SD Card titles, will
appear and quickly disappear, while all the SD Titles are being
processed. In cases where access to the home menu GUI is not needed to
launch the title (like in the case of kiosk demos), the home menu states
an error has occurred, and launching of the title is stopped.

### Game Card Updates

Either intentionally a region lock mechanism or not, the function which
checks the game card update partition returns an error when it is
detected the update is for a region other than the 3DS's region (Most
likely triggered by the absence of the correct CVer title). And errors
returned from checking the update partition, will result in the home
menu displaying "This Game Card cannnot be used", when the user attempts
to launch the title.

## Home-menu [SpotPass](SpotPass "wikilink") usage

Home-menu originally used two domains with HTTPS for SpotPass. SpotPass
stores this content in Home-menu's NAND shared extdata.

- The system notifications are downloaded from:
  https://a248.e.akamai.net/f/248/103046/10m/npdl.c.app.nintendowifi.net/p01/nsa/\<regionID\>/\<filename\>/\<langcode\>/\<filename\>
  Where langcode is the two-character language codes from
  [config](Config_Savegame#Languages "wikilink"), and regionID is from
  the below table. <filename> is bashoX/sysmsgX where X is 0-3.
- <https://pls.c.shop.nintendowifi.net/pl/upload> This URL is used for
  uploading data from the home menu NAND shared extdata, it's unknown
  what this is used for. This data is uploaded every 24 hours.
- https://npul.c.app.nintendowifi.net/p01/recv/\<regionID\>/\<filename\>
  This is used for uploading unknown data from extdata. <filename> can
  be one of the following:
  - "phu"
  - "tiu" The POST data contains a list of
    [BOSS](BOSS_Services "wikilink") taskIDs etc. This seems to be only
    for Nintendo titles?(system+eShop apps)
  - "splu"
  - "sendmgn" For this it appears SpotPass does a HTTP POST with data
    originally from Launcher.dat?

| Region       | ID               |
|--------------|------------------|
| JPN          | gWr4JXxb2mKTG3lq |
| NA           | uuI82221UKkqmtbp |
| EUR / Others | UrXSeurnxhPrq7AS |

The SpotPass content payload for notifications begin with a header,
followed by an [icon](SMDH "wikilink") and the UTF-16 text, and various
metadata.

### VersionList

During startup, Home Menu loads "/versionList.dat" from NAND extdata
0xf000000e. This is downloaded via SpotPass, the file-data downloaded
via HTTPS here is raw (no SpotPass container):

- Retail: [1](https://tagaya-ctr.cdn.nintendo.net/tagaya/versionlist)
- Dev-unit:
  [2](https://tagaya-dev-ctr.cdn.nintendo.net/tagaya/versionlist) The
  titles listed in this are not available on the
  [normal](Title_list "wikilink") CDN.

This is a list of title-updates available on the eShop, for regular app
titles and update-titles. This is what Home Menu checks to determine
whether the currently selected application needs to be updated or not.
When an Internet connection is not available or wifi is disabled, Home
Menu will skip VersionList handling/messages when you launch
applications.

File structure:

| Offset | Size            | Description                                                   |
|--------|-----------------|---------------------------------------------------------------|
| 0x0    | 0x10            | The first u32 is normally 0x1, the rest is normally all-zero. |
| 0x10   | <Filesize-0x10> | Title entries, 0x10-bytes each.                               |

Title entry structure:

| Offset | Size | Description                |
|--------|------|----------------------------|
| 0x0    | 0x8  | u64 TitleID                |
| 0x8    | 0x4  | u32 titleversion           |
| 0xC    | 0x4  | Unknown u32, usually zero? |

### [BOSS](BOSS_Services "wikilink") usage notes

Home Menu uses 4 hard-coded NsDataIds: 0x1, 0x2, 0x3, and 0x4, under a
loop in the same function for writing to "bashotorya.dat".

## Automatic System Update Download

See [Automatic System Update
Download](Automatic_System_Update_Download "wikilink").

## Home Menu Error Messages

| Dialog Text                                                               | Description                                                                                                                                     |
|---------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| "An error has occured. Please save your data ... then restart the system" | This dialog is displayed when a system applet(including Home Menu) crashes/terminates. This dialog is also displayed for system errors as well. |

## Home Menu Themes

See [here](Home_Menu/Themes "wikilink").

As of [11.0.0-33](11.0.0-33 "wikilink") Home Menu themes are only
supported with USA, EUR, and JPN. CHN Home Menu was last updated with
v7.0, and TWN doesn't even have a Home Menu settings menu(just the old
screen brightness config menu + an [amiibo
Settings](amiibo_Settings "wikilink") icon on the right side of the
browser icon).

KOR Home Menu doesn't have the theme-settings menu button. While this
does have the theme handling code, it isn't actually usable since
extdataID 0x0 is used for theme-extdata for non-<JPN/USA/EUR>
regions(which is invalid).

## Home Menu [NAND](System_SaveData "wikilink") savedata

### Launcher.dat

| Offset | Size       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|--------|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1        | Launcher.dat format version.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 0x1    | 0x1        | Padding?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 0x2    | 0x2        | u16, cart launcher position on the home menu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 0x4    | 0x4        | Unknown, normally 0x0.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x8    | 0xB40      | 360 u64s, list of NAND titleIDs. For an unused entry, the u64 value is ~0(in that case, the corresponding entries at 0xD9A/0x106A for this titleID are not used either). This is used for the icons displayed on the main Home Menu screen.                                                                                                                                                                                                                                                                                     |
| 0xB51  | 0x1        | u8, numbers of rows on the home menu, minus 1 (range 0..5) (with the enlarge/reduce option)                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0xB5C  | 0x2        | u16, position of the cursor on the home menu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 0xB5E  | 0x2        | u16, horizontal scrolling level (divided by the number of rows to get the actual number of columns hidden) on the home menu                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0xD80  | 0x2 or 0x4 | u16 or u32, number the next created folder will have (starts at 1)                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0xD9A  | 0x2D0      | Array of 360 s16 fields, each one corresponds to the titleIDs at the array located at offset 0x8. This is used for icon position, 0x0 for the very first icon, 0x1 for the next one and so on. This is completely linear, no X/Y coordinates. Implemented with the format-version for [4.0.0-X](4.0.0-7 "wikilink").                                                                                                                                                                                                            |
| 0x106A | 0x168      | Array of 360 s8 fields, each one corresponds to the titleIDs at the array located at offset 0x8. This is used for icon position. When an s8 here is -1(which is the normal value), the icon is located with the first chunk of icons(outbuf+0), otherwise the base address is outbuf+0xB40+\<s8val\*0x1E0\>(which is equivalent to 60 icons \* s8val). Implemented with the format-version for [4.0.0-X](4.0.0-7 "wikilink"). Corresponds to the id of the folder the icon is in, range -1..59, with -1 meaning not in a folder |
| 0x11DC | 0x78       | Array of 60 s16 fields, corresponding to folders position (with -1 meaning the folder is deleted/not yet created)                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x1434 | 0x3C       | Array of 60 u8 fields, the number of rows in each corresponding folder (defaults to 2)                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 0x1470 | 0x78       | Array of 60 u16 fields, the position of the cursor in each corresponding folder (defaults to 0)                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 0x14E8 | 0x78       | Array of 60 u16 fields, the horizontal scroll level in each corresponding folder (divided by the number of rows to get the actual number of columns hidden) (defaults to 0)                                                                                                                                                                                                                                                                                                                                                     |
| 0x1560 | 0x7F8      | Array of 60 utf-16 strings of length 0x22 (in bytes, so only 0x11 utf-16 characters) (not NULL-terminated), the name of each corresponding folder                                                                                                                                                                                                                                                                                                                                                                               |
| 0x1D58 | 0xF0       | Array of 60 u32, the number of each corresponding folder                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

## SD ExtData

The SD ExtData [File System](Extdata#Filesystem "wikilink") for Home
Menu introduced with [2.0.0-X](2.0.0-2 "wikilink") is as follows:

```
root
├── icon
├── boss
└── user
    ├── SaveData.dat
    ├── Cache.dat
    └── CacheD.dat
```

| File         | Details                                                                      | Size                                                              | FW Introduced                 | Plaintext                                                                                        |
|--------------|------------------------------------------------------------------------------|-------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------|
| icon         | Stubbed. Always image 00000002.                                              | 0x4 Bytes                                                         | n/a                           |                                                                                                  |
| SaveData.dat | Always image 00000003.                                                       | 0x2cb0 Bytes (0x2da0 starting with [4.0.0-7](4.0.0-7 "wikilink")) | [2.0.0-2](2.0.0-2 "wikilink") | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/HomeMenuExtdata/SaveData.dat) |
| Cache.dat    | Indexes and records details for the cached icon data. Always image 00000004. | 0x1688 Bytes                                                      | [2.0.0-2](2.0.0-2 "wikilink") | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/HomeMenuExtdata/Cache.dat)    |
| CacheD.dat   | Cached icon data for Home Menu. Always image 00000005.                       | 0x4cfe00 Bytes                                                    | [2.0.0-2](2.0.0-2 "wikilink") | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/HomeMenuExtdata/CacheD.dat)   |

### Cache.dat & CacheD.dat

These two files work in tandem to allow the home menu to cache icon data
for applications which are presented on the Home Menu. The size of both
files suggests a maximum cache size of 360 icons. Cache.dat stores
details about the cache icon data, and CacheD.dat stores the icon data.
The icon cache stores icon data for \*all\* applications shown on the
Home Menu, this includes DSi NAND Titles, and DS(i) cartridges. The
format of cached DS(i) icon data is not understood, but they are the
same size as 3DS icon data (0x36c0).

In Cache.dat the first 8 bytes are a header where the first byte is the
format-version, then follows each icon slots's entry in the format:

| OFFSET | SIZE | DESCRIPTION               |
|--------|------|---------------------------|
| 0x0    | 8    | Title ID in Little Endian |
| 0x8    | 4    | Unknown                   |
| 0xc    | 4    | Unknown                   |

All unused entries have the Title IDs filled with "0xff".

In CacheD.dat, the icon data is concatenated together, with the first
icon at offset 0x0.

### SaveData.dat

| Offset | Size          | Description                                                                                                                                                                                     |
|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1           | SaveData.dat format version.                                                                                                                                                                    |
| 0x8    | 0xB40         | 360 u64s, list of titleIDs(used with icons). Equivalent to the same array in Launcher.dat, but for SD titles.                                                                                   |
| 0xB48  | 0x168         | s8 bool array with 360 entries. Some SD-only icon array. Probably an array for each icon present status? Each entry is only known to be set to 0x00 or 0x01, with the former being the default. |
| 0xCB0  | 0x2D0         | s16 array with 360 entries, used with icons. Equivalent to the same array in Launcher.dat. Implemented with format-version 2.                                                                   |
| 0xF80  | 0x168         | s8 array with 360 entries, used with icons. Equivalent to the same array in Launcher.dat. Implemented with format-version 2.                                                                    |
| 0x13b8 | 0x8           | Theme entry structure for the regular theme.                                                                                                                                                    |
| 0x13c0 | 0x8\*10(0x50) | Array of theme entry structures for theme [shuffling](9.3.0-21 "wikilink").                                                                                                                     |
| 0x141b | 0x1           | 0 = one regular theme, 1 = multiple themes for theme [shuffle](9.3.0-21 "wikilink").                                                                                                            |

The icon arrays above are handled exactly the same way as Launcher.dat.

When the theme cache is enabled via the above fields, Home Menu loads
the cache at startup(if the used theme structure is valid).

Theme entry structure:

| Offset | Size | Description                                                                                                                                                        |
|--------|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Theme index: for DLC this is the content-index, for built-in themes this is an index for an array selecting the built-in theme.                                    |
| 0x4    | 0x1  | Normally zero. This is the low 8-bits in the DLC titleID that this theme was originally loaded from.                                                               |
| 0x5    | 0x1  | Theme type, the valid range is 0..5. 0 = none, 1 = built-in theme from Home Menu RomFS, 2 = theme data loaded from SD cache / content archive. 3 = ?, 4 = ?, 5 = ? |
| 0x6    | 0x1  | Normally zero?                                                                                                                                                     |
| 0x7    | 0x1  | Normally zero?                                                                                                                                                     |

When the theme-type is value1 the themeindex must be \<9. When the
theme-type is value2 the themeindex has to be non-zero, and the u8 at
offset 0x4 must not be \>=10.

The theme-loader code (besides the AM
<is-current-themeindex-DLC-installed> code) handles all theme-types \>=2
the same way. However, it seems all DLC AM code involving checking the
currently-used theme DLC only gets executed when the theme-type is
value2. The code in the theme-loader for that also checks that a certain
Home Menu state flag is non-zero, before running the AM DLC code(it's
unknown where this flag value comes from).

#### SaveData.dat format versions

| Version value                                  | Filesize | Implemented with Home Menu system-version |
|------------------------------------------------|----------|-------------------------------------------|
| 0                                              | 0x2CB0   | [2.0.0-X](2.0.0-2 "wikilink")             |
| 2                                              | 0x2DA0   | [4.0.0-X](4.0.0-7 "wikilink")             |
| 3                                              | 0x2DA0   | [9.0.0-X](9.0.0-20 "wikilink")            |
| 4 (Latest version as of v10.6-v11.0 Home Menu) | 0x2DA0   | [9.3.0-X](9.3.0-21 "wikilink")            |

The Home Menu code for writing the updated SaveData.dat to FS is broken
when the filesize is smaller than expected due to being from an older
format-version originally. When writing to the file, Home Menu checks
the filesize then attempts to use
[FSFile:SetSize](FSFile:SetSize "wikilink") on mismatch, but
[FSFile:SetSize](FSFile:SetSize "wikilink") can't be used with
extdata(error from [FSFile:SetSize](FSFile:SetSize "wikilink") appears
to be ignored). When writing to SaveData.dat the write-size is the one
for the current format-version, but since extdata files are fixed-size
this will only result in the first {original filesize} bytes being
written(result-code = 0xE0E046C1).

Basically, unless the extdata is deleted from the SD card FS manually,
the SaveData.dat filesize will never be successfully updated from an old
filesize to the current-format filesize by Home Menu.

## Home Menu [Theme](Home_Menu/Themes "wikilink") SD [ExtData](Extdata "wikilink")

The filesystem for this extdata is as follows:

```
root
├── icon
├── boss
└── user
    ├── ThemeManage.bin
    ├── BodyCache.bin
    ├── BgmCache.bin
    └── nsalist
```

| File            | Details                                                                                                                                                                                 | Size     | Extdata image ID | FW Introduced                   | Plaintext |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------|---------------------------------|-----------|
| ThemeManage.bin | Theme management info. The filesize must match 0x800, otherwise the Home Menu code returns an error.                                                                                    | 0x800    | 00000003         | [9.0.0-20](9.0.0-20 "wikilink") |           |
| BodyCache.bin   | Contains cached data from the last loaded [theme](Home_Menu/Themes "wikilink") RomFS body_LZ.bin file. The filesize must match 0x150000, otherwise the Home Menu code returns an error. | 0x150000 | 00000004         | [9.0.0-20](9.0.0-20 "wikilink") |           |
| BgmCache.bin    | Contains cached data from the last loaded [theme](Home_Menu/Themes "wikilink") RomFS bgm.bcstm file. The filesize must match 0x337000, otherwise the Home Menu code returns an error.   | 0x337000 | 00000005         | [9.0.0-20](9.0.0-20 "wikilink") |           |
| nsalist         | Contains the list of DLC themes(IDs+prices), downloaded via [SpotPass](SpotPass "wikilink").                                                                                            |          | 00000007         | [9.0.0-20](9.0.0-20 "wikilink") |           |

BodyCache.bin and BgmCache.bin contain cached theme data for the
currently used DLC theme. ThemeManage.bin is loaded by Home Menu during
startup. The cached theme data is loaded at startup when a DLC theme is
selected. This also contains theme-shop [SpotPass](SpotPass "wikilink")
data.

BodyCache.bin and BgmCache.bin are all-zero when no theme is selected.

Starting with [9.3.0-X](9.3.0-21 "wikilink") Home Menu can use more
files in this extdata, for theme shuffling. "theme:/ThemeManage.bin"
"theme:/BgmCache_%02d.bin" "theme:/BodyCache_rd.bin"

### ThemeManage.bin

| Offset | Size | Description                                                                 |
|--------|------|-----------------------------------------------------------------------------|
| 0x0    | 0x4  | Unknown, normally value 0x1?                                                |
| 0x4    | 0x4  | Unknown, normally zero?                                                     |
| 0x8    | 0x4  | Actual size of the cached body_LZ.bin data.                                 |
| 0xC    | 0x4  | Actual size of the cached bgm.bcstm data.                                   |
| 0x10   | 0x4  | Unknown                                                                     |
| 0x14   | 0x4  | Unknown                                                                     |
| 0x18   | 0x4  | When a DLC theme is selected, this is the content-index of the DLC theme.   |
| 0x1C   | 0x4  | Unknown, usually value 0x200 when the data in theme-cache is actually used? |

The total filesize is 0x800-bytes, normally the data starting at offset
0x1C is all-zero.

When no theme is actually used, the only non-zero fields are the
following: the u32 stored at offset 0x0 in ThemeManage.bin is value 0x1,
with offset 0x10 u32 set to value 0x1.

## Home Menu badge SD [ExtData](Extdata "wikilink")

The filesystem for this extdata(when it actually exists) is as follows:

```
root
├── icon
├── boss
└── user
    ├── BadgeData.dat
    └── BadgeMngFile.dat
```

| File             | Details                                             | Size     | Extdata image ID | FW Introduced                   |
|------------------|-----------------------------------------------------|----------|------------------|---------------------------------|
| BadgeData.dat    | [See below.](Home_Menu#BadgeData.dat "wikilink")    | 0xF4DF80 |                  | [9.0.0-20](9.0.0-20 "wikilink") |
| BadgeMngFile.dat | [See below.](Home_Menu#BadgeMngFile.dat "wikilink") | 0xD4A8   |                  | [9.0.0-20](9.0.0-20 "wikilink") |

### BadgeData.dat

| Offset   | Size               | Description                                                                                   |
|----------|--------------------|-----------------------------------------------------------------------------------------------|
| 0x0      | 100 \* 16 \* 0x8A  | UTF-16 Badge Set Titles (16 per set for different languages)                                  |
| 0x35E80  | 1000 \* 16 \* 0x8A | UTF-16 Badge Titles (16 per set for different languages)                                      |
| 0x250F80 | 100 \* 0x2000      | [Tiled](http://en.wikipedia.org/wiki/Z-order_curve) RGB565 64x64 Badge Set Icons              |
| 0x318F80 | 1000 \* 0x2800     | [Tiled](http://en.wikipedia.org/wiki/Z-order_curve) RGB565 64x64 + Tiled A4 64x64 Badge Icons |
| 0xCDCF80 | 1000 \* 0xA00      | [Tiled](http://en.wikipedia.org/wiki/Z-order_curve) RGB565 32x32 + Tiled A4 32x32 Badge Icons |

### BadgeMngFile.dat

| Offset | Size         | Description                                                     |
|--------|--------------|-----------------------------------------------------------------|
| 0x0    | 0x4          | u32, Must Be Zero                                               |
| 0x4    | 0x4          | u32, Number of Badge Sets                                       |
| 0x8    | 0x4          | u32, Number of Unique Badges                                    |
| 0xC    | 0x4          | u32, Number of Placed Badges                                    |
| 0x10   | 0x4          | u32, Selected Badge Set in Home Menu (0xFFFFFFFF = All Badges)  |
| 0x14   | 0x4          | u32, Selected Badge Column in All Badges                        |
| 0x18   | 0x4          | u32, Number of Total Badges                                     |
| 0x1C   | 0x4          | u32, Nintendo Network ID Number                                 |
| 0x20   | 0x338        | Unknown (always zeros? unused?)                                 |
| 0x358  | 0x80         | Used Badge Slots (each bit = 1 slot)                            |
| 0x3D8  | 0x10         | Used Badge Set Slots (each bit = 1 slot)                        |
| 0x3E8  | 1000 \* 0x28 | [BadgeInfo](Home_Menu#BadgeInfo "wikilink") Entries             |
| 0xA028 | 100 \* 0x30  | [BadgeSetInfo](Home_Menu#BadgeSetInfo "wikilink") Entries       |
| 0xB2E8 | 360 \* 0x18  | [BadgeLayoutSlot](Home_Menu#BadgeLayoutSlot "wikilink") Entries |

#### BadgeIdentifier

<table>
<thead>
<tr class="header">
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x0</td>
<td>0x4</td>
<td>u32, Unknown</td>
</tr>
<tr class="even">
<td>0x4</td>
<td>0x4</td>
<td>u32, Badge ID</td>
</tr>
<tr class="odd">
<td>0x8</td>
<td>0x4</td>
<td>u32, Badge Set ID</td>
</tr>
<tr class="even">
<td>0xC</td>
<td>0x2</td>
<td>u16, Badge Index</td>
</tr>
<tr class="odd">
<td>0xE</td>
<td>0x2</td>
<td>u16, Badge Sub ID (used for multi-part badges)</p>
<table>
<thead>
<tr class="header">
<th>Value</th>
<th>Meaning</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x0</td>
<td>Badge is a standalone badge</td>
</tr>
<tr class="even">
<td>0x0100</td>
<td>Badge is the left piece of a horizontal 2x1 badge</td>
</tr>
<tr class="odd">
<td>0x0101</td>
<td>Badge is the right piece of a horizontal 2x1 badge</td>
</tr>
<tr class="even">
<td>0x1000</td>
<td>Badge is the top piece of a vertical 1x2 badge</td>
</tr>
<tr class="odd">
<td>0x1010</td>
<td>Badge is the bottom piece of a vertical 1x2 badge</td>
</tr>
<tr class="even">
<td>0x1100</td>
<td>Badge is the top left piece of a 2x2 badge</td>
</tr>
<tr class="odd">
<td>0x1101</td>
<td>Badge is the top right piece of a 2x2 badge</td>
</tr>
<tr class="even">
<td>0x1110</td>
<td>Badge is the bottom left piece of a 2x2 badge</td>
</tr>
<tr class="odd">
<td>0x1111</td>
<td>Badge is the bottom right piece of a 2x2 badge</td>
</tr>
</tbody>
</table></td>
</tr>
</tbody>
</table>

#### BadgeSetIdentifier

| Offset | Size | Description                       |
|--------|------|-----------------------------------|
| 0x0    | 0x4  | u32, Unknown (Usually 0xFFFFFFFF) |
| 0x4    | 0x4  | u32, Unknown (Usually 0xFFFFFFFF) |
| 0x8    | 0x4  | u32, Unknown (Usually 0x0)        |
| 0xC    | 0x4  | u32, Unknown (Usually 0x2710)     |
| 0x10   | 0x4  | u32, Badge Set ID                 |
| 0x14   | 0x4  | u32, Badge Set Index              |

#### BadgeInfo

| Offset | Size | Description                                             |
|--------|------|---------------------------------------------------------|
| 0x0    | 0x10 | [BadgeIdentifier](Home_Menu#BadgeIdentifier "wikilink") |
| 0x10   | 0x2  | u16, Number Placed                                      |
| 0x12   | 0x2  | u16, Quantity                                           |
| 0x14   | 0x4  | u32, Unknown (packed data?)                             |
| 0x18   | 0x10 | u64\[2\], Shortcut Title ID (twice, once per u64)       |

#### BadgeSetInfo

| Offset | Size | Description                                                   |
|--------|------|---------------------------------------------------------------|
| 0x0    | 0x18 | [BadgeSetIdentifier](Home_Menu#BadgeSetIdentifier "wikilink") |
| 0x18   | 0x4  | u32, Unknown (usually 0xFFFFFFFF)                             |
| 0x1C   | 0x4  | u32, Number of Unique Badges                                  |
| 0x20   | 0x4  | u32, Number of Total Badges                                   |
| 0x24   | 0x4  | u32, Start Badge Index                                        |
| 0x28   | 0x4  | u32, Unknown (usually 0x0)                                    |
| 0x2C   | 0x4  | u32, Unknown (usually 0x0)                                    |

#### BadgeLayoutSlot

| Offset | Size | Description                                                     |
|--------|------|-----------------------------------------------------------------|
| 0x0    | 0x10 | [BadgeIdentifier](Home_Menu#BadgeIdentifier "wikilink")         |
| 0x10   | 0x4  | u32, Position                                                   |
| 0x14   | 0x4  | u32, Folder (0xF0FF = Icon of a folder, 0xFFFFFFFF = No folder) |

The file size must match 0xD4A8, otherwise the Home Menu code returns an
error.

## Home Menu theme layout SD [ExtData](Extdata "wikilink")

The filesystem for this extdata(when it actually exists) is as follows:

```
root
├── icon
├── boss
└── user
    └── MngFile.dat
```

| File        | Details    | Size       | Extdata image ID | FW Introduced                   | Plaintext |
|-------------|------------|------------|------------------|---------------------------------|-----------|
| MngFile.dat | See below. | 0x004D1280 | 00000003         | [9.6.0-24](9.6.0-24 "wikilink") |           |

### MngFile.dat

| Offset   | Size                    | Description                                                                                                                                                                                           |
|----------|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0      | 0x4                     | u32, must be zero.                                                                                                                                                                                    |
| 0x4      | 0xC                     | array of 8 u8, 0 if the corresponding layout slot is not set, 1 if it is                                                                                                                              |
| 0xC      | 0x3000 \* 8             | Start of the layout entries.                                                                                                                                                                          |
| 0x1800C  | 0xC                     | Padding                                                                                                                                                                                               |
| 0x18010  | 0x2DA0 \* 8             | Start of the [SaveData.dat](Home_Menu#SaveData.dat "wikilink") entries.                                                                                                                               |
| 0x2ED10  | 0xD4A8 \* 8             | Start of the [BadgeMngFile.dat](Home_Menu#BadgeMngFile.dat "wikilink") entries.                                                                                                                       |
| 0x99250  | 0x30                    | Padding                                                                                                                                                                                               |
| 0x99280  | 256\*3\*8 \* 400/8 \* 8 | Start of the top screen (400x240) screenshots, in BGR8 tiled format, rotated 90 degrees and with 8 rows per "chunk", and actually 256 pixels wide instead of 240, with the last 16 being all black    |
| 0x2F1280 | 256\*3\*8 \* 320/8 \* 8 | Start of the bottom screen (320x240) screenshots, in BGR8 tiled format, rotated 90 degrees and with 8 rows per "chunk", and actually 256 pixels wide instead of 240, with the last 16 being all black |

Layout entries structure:

| Offset | Size   | Description                                                                                                                                                         |
|--------|--------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x2558 | Exact copy of the entire Home Menu [System_SaveData](System_SaveData "wikilink") [Launcher.dat](Home_Menu#Launcher.dat "wikilink"), this is the actual layout data. |
| 0x2558 | 0xAA8  | Padding                                                                                                                                                             |

The filesize must match 0x004D1280, otherwise the Home Menu code returns
an error. The saved Home Menu layouts are stored here.

When saving a layout, the total layout field is increased, then a new
layout entry is created with the contents of the current Home Menu
[System_SaveData](System_SaveData "wikilink")(NAND savedata)
Launcher.dat + a screenshot of the main Home Menu screen is written.
When loading a layout, Launcher.dat in savedata is written with the
current Launcher.dat data already stored in memory(unknown if any data
gets changed for it here), then data from the layout entry is copied
into the Home Menu [System_SaveData](System_SaveData "wikilink")
Launcher.dat.

Home Menu \*only\* accesses this file with the Home Menu layout-settings
menu / when entering that menu.

## Home Menu Jump Parameters

Parameters can be provided to
[<APT:JumpToHomeMenu>](APT:JumpToHomeMenu "wikilink") to perform certain
actions when jumping to the home menu.

### Command Header

| Offset | Size | Description        |
|--------|------|--------------------|
| 0x0    | 0x4  | Magic Value "ASHP" |
| 0x4    | 0x1  | Command ID         |

If the command requires extra arguments, this header will be padded and
the arguments will start at offset 0x8. Otherwise it is just 0x5 bytes
large as presented here.

### Command IDs

| ID  | Description                    | Extra Arguments                                                                                                                                                                                                                                                                                                                                                                                |
|-----|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0 | Does Nothing                   | None                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x1 | Open Instruction Manual        | None                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x2 | Download Theme from Theme Shop | 4-byte ID of the theme (total command size 0xC bytes). This is divided by 1000000 to determine the [title ID variation](Titles#Title_IDs "wikilink"), and the remainder corresponds to the theme's DLC content index. If the value is 0 the theme shop will not open correctly, and if the ID isn't valid the theme shop will just return to the home screen after initializing the DLC title. |
| 0x3 | Open Badge Picker              | None                                                                                                                                                                                                                                                                                                                                                                                           |

## Home Menu startup

The following is what Home Menu does at startup(converted from
cmd-logs), from [9.4.0-21](9.4.0-21 "wikilink"), in the same order Home
Menu does it.

Originally Home Menu mounted sdmc in main(), starting(?) with
[6.0.0-11](6.0.0-11 "wikilink") Home Menu only has sdmc mounted while
handling [SD_Savedata_Backups](SD_Savedata_Backups "wikilink").

<table>
<thead>
<tr class="header">
<th>Archive</th>
<th>Filename</th>
<th>Read size</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>srv_init(), then srv_GetServiceHandle is used to initialize the
service handles for the following services: <a
href="../NS_and_APT_Services" title="wikilink">ns:s</a>, <a
href="../PTM_Services" title="wikilink">ptm:sysm</a>, and <a
href="../Config_Services" title="wikilink">cfg:s</a>.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td><a href="../CfgS:SecureInfoGetByte101"
title="wikilink">CfgS:SecureInfoGetByte101</a> and <a
href="../CfgS:GetLocalFriendCodeSeed"
title="wikilink">CfgS:GetLocalFriendCodeSeed</a> are used, the output
data from these are not used. If either of these return an error, Home
Menu uses <a href="../ERR:Throw" title="wikilink">ERR:Throw</a>.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../Cfg:GetSystemModel"
title="wikilink">Cfg:GetSystemModel</a> is then used to initialize a
Home Menu state field.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu then loads the system language via <a
href="../CfgS:GetConfigInfoBlk2"
title="wikilink">CfgS:GetConfigInfoBlk2</a>, and uses <a
href="../Cfg:SecureInfoGetRegion"
title="wikilink">Cfg:SecureInfoGetRegion</a>, to initialize Home Menu
region/language state. Home Menu then uses <a
href="../Cfg:SecureInfoGetRegion"
title="wikilink">Cfg:SecureInfoGetRegion</a> again, then loads the <a
href="../Config_Savegame" title="wikilink">CountryInfo</a> via <a
href="../CfgS:GetConfigInfoBlk2"
title="wikilink">CfgS:GetConfigInfoBlk2</a>.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu initializes <a href="../Filesystem_services"
title="wikilink">fs:USER</a> here. Home Menu then mounts the Home Menu
CXI RomFS. Then Home Menu uses <a href="../Filesystem_services"
title="wikilink">FSUSER:GetPriority</a>.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu starts APT initialization / using APT service commands
here. Eventually Home Menu then <a href="../NSS:LaunchTitle"
title="wikilink">launches</a> various system-modules.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu attempts to open NAND shared-<a href="../extdata"
title="wikilink">extdata</a> 0xe0000000, which will normally fail since
it doesn't exist.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu uses <a href="../Application_Manager_Services"
title="wikilink">AM</a> command 0x00130040, with input u8 = value 0x0.
Home Menu continues using APT commands after this.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../HID_Services" title="wikilink">hid:SPVR</a> service
initialization is done here.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td><a href="../PTM_Services"
title="wikilink">PTMSYSM:GetShellStatus</a> is used here.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../Filesystem_services"
title="wikilink">FSUSER:GetCardType</a> is used here. AM commands are
then used to get the inserted gamecard programID, when successful the
gamecard ExeFS:/icon is then read to check the auto-boot flag(see the
auto-boot section on this page). The system-setup-required flag is then
read here if needed, as mentioned under the auto-boot section of this
page.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu then uses cfg commands to load system language, region,
and CountryInfo.</td>
</tr>
<tr class="odd">
<td>Home Menu CXI RomFS</td>
<td>"/message/<Region>_<Language>/menu_msbt_LZ.bin"</td>
<td>Presumably loaded from the filesize.</td>
<td></td>
</tr>
<tr class="even">
<td>Home Menu CXI RomFS</td>
<td>"/message/<Region>_<Language>/RI_mstl_LZ.bin"</td>
<td>Presumably loaded from the filesize.</td>
<td></td>
</tr>
<tr class="odd">
<td>Home Menu CXI RomFS</td>
<td>"/message_hud/<Region>_<Language>/hud_msbt_LZ.bin"</td>
<td>Presumably loaded from the filesize.</td>
<td></td>
</tr>
<tr class="even">
<td>Home Menu CXI RomFS</td>
<td>"/message_hud/<Region>_<Language>/RI_mstl_LZ.bin"</td>
<td>Presumably loaded from the filesize.</td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../NS_and_APT_Services"
title="wikilink"><span>APT:GetSharedFont</span></a> is used
here.</td>
</tr>
<tr class="even">
<td>Home Menu CXI RomFS</td>
<td>"/font/Hud_JP.bcfnt"</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu loads the <a href="../Config_Savegame"
title="wikilink">cfg</a> state for blkID 0x50005.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu loads the GPU shaders from RomFS.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu does DSP initialization then starts using DSP
commands etc + loads sound data from RomFS.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu does GSP initialization.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../APT:GetCaptureInfo"
title="wikilink"><span>APT:GetCaptureInfo</span></a> is used
here.</td>
</tr>
<tr class="even">
<td>Home Menu CXI RomFS</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Here Home Menu uses <a href="../PTM_Services"
title="wikilink">PTMSYSM:GetShellStatus</a>, <a
href="../PTMSYSM:GetSoftwareClosedFlag"
title="wikilink">PTMSYSM:GetSoftwareClosedFlag</a>, and <a
href="../PTMSYSM:ClearSoftwareClosedFlag"
title="wikilink">PTMSYSM:ClearSoftwareClosedFlag</a>. Home Menu then
uses <a href="../PTM_Services" title="wikilink">PTMSYSM:GetShellStatus</a>
3 times in a row. Starting from here, Home Menu uses <a
href="../PTM_Services" title="wikilink">PTMSYSM:GetShellStatus</a>
frequently(presumably from a separate thread).</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu opens the archive for the Home Menu <a
href="../System_SaveData" title="wikilink">System_SaveData</a> here. Then
Home Menu attempts to open "/Launcher.dat" for reading, when successful
Home Menu just closes the file.</td>
</tr>
<tr class="odd">
<td>Home Menu <a href="../System_SaveData"
title="wikilink">System_SaveData</a></td>
<td>"/Launcher.dat"</td>
<td>0x2490</td>
<td>Prior to doing the read, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>.</td>
</tr>
<tr class="even">
<td>System CFA, titleID for USA: 0004009B00013302</td>
<td>"/country.bin"</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td><a href="../NS_CFA" title="wikilink">NS CFA</a></td>
<td>"/ctr_backup_black_list"</td>
<td></td>
<td>Home Menu first reads 0x10-bytes from offset 0x0, then after that
it reads the rest of the file.</td>
</tr>
<tr class="even">
<td>Home Menu CXI RomFS</td>
<td></td>
<td></td>
<td>Home Menu reads various RomFS files here.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu <a href="../NSS:LaunchTitle" title="wikilink">launches</a>
the camera system-module here.</td>
</tr>
<tr class="even">
<td>Home Menu CXI RomFS</td>
<td></td>
<td></td>
<td>Home Menu reads various RomFS files here.</td>
</tr>
<tr class="odd">
<td>NGWord bad word list CFA</td>
<td>"/version.dat"</td>
<td>0x4</td>
<td>Home Menu mounts the ngword archive here, then reads version.dat.
Home Menu then loads the <a href="../Config_Savegame"
title="wikilink">cfg</a> data for blkID 0x000A0000.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu <a href="../NSS:LaunchTitle" title="wikilink">launches</a>
various system-modules here(from a separate thread?).</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu opens the following NAND shared extdata archives here:
0xf0000001, 0xf0000002, 0xf0000009, 0xf000000b, 0xf000000c, 0xf000000d,
and 0xf000000b again.</td>
</tr>
<tr class="even">
<td>NAND <a href="../extdata" title="wikilink">extdata</a>
0xf000000b</td>
<td>"/ubll.lst"</td>
<td>0x2ee0</td>
<td>Prior to doing the read, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu opens NAND shared extdata archive 0xf000000b
again.</td>
</tr>
<tr class="even">
<td>NAND extdata 0xf000000b</td>
<td>"/CFL_DB.dat"</td>
<td>0xe4c0</td>
<td>Home Menu only does one read with size 0xe4c0 for this, even
though the value it loads from <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a> is larger than that.</td>
</tr>
<tr class="odd">
<td>NAND extdata 0xf000000b</td>
<td>"/CFL_OldDB.dat"</td>
<td></td>
<td>Home Menu just closes this file immediately after opening it,
when opening it was successful at least.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu loads the <a href="../Config_Savegame"
title="wikilink">cfg</a> data for blkID 0x000C0000 here.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu opens NAND shared extdata archive 0xf000000b
again.</td>
</tr>
<tr class="even">
<td>NAND extdata 0xf000000b</td>
<td><a href="../Extdata" title="wikilink">"/gamecoin.dat"</a></td>
<td>0x14</td>
<td>Home Menu first tries to use <a href="../FS:CreateFile"
title="wikilink">FS:CreateFile</a> with this, which will fail when the
file already exists. This file is then opened with openflags=RW. After
reading this file, Home Menu then uses <a href="../PTM:GetTotalStepCount"
title="wikilink">PTM:GetTotalStepCount</a>, then uses <a
href="../FSFile:GetSize" title="wikilink">FSFile:GetSize</a>. Then the
service handle for <a href="../NDM_Services" title="wikilink">"ndm:u"</a>
is initialized with srv_GetServiceHandle(done from a separate thread
perhaps?). Then Home Menu writes to the already opened gamecoin.dat
file.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../Filesystem_services"
title="wikilink">FSUSER:CardSlotIsInserted</a> and <a
href="../Filesystem_services" title="wikilink">FSUSER:GetCardType</a> is
used here. AM commands are then used to get the inserted gamecard
programID, when successful the gamecard ExeFS:/icon is then
read.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td><a href="../BOSS_Services" title="wikilink">"boss:P"</a> service
handle initialization with srv_GetServiceHandle is done here. Then <a
href="../Services" title="wikilink">srv_Subscribe</a> is used with various
noticationIDs. Home Menu then uses <a href="../FS:IsSdmcDetected"
title="wikilink">FS:IsSdmcDetected</a> and <a href="../FS:IsSdmcWritable"
title="wikilink">FS:IsSdmcWritable</a>. Home Menu then loads the <a
href="../Config_Savegame" title="wikilink">cfg</a> data for blkID
0x000D0000. Home Menu uses boss:P command 0x4010082, then uses
srv_GetServiceHandle for initializing service handles with the following
services: <a href="../News_Services"
title="wikilink">"<span>news:s</span>"</a> and "cecd:s".</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>srv_GetServiceHandle is used to initialize the service handle for
service <a href="../Friend_Services" title="wikilink">"frd:a"</a>, then
various service commands are used for that.</td>
</tr>
<tr class="even">
<td>NAND <a href="../extdata" title="wikilink">extdata</a>
0xf000000c</td>
<td></td>
<td></td>
<td>Home Menu first attempts to use <a href="../FS:CreateFile"
title="wikilink">FS:CreateFile</a> with "/bashotorya.dat", which
normally fails since that file already exists. Home Menu then repeats
this with "/bashotorya2.dat".</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Here, Home Menu opens the following SD extdata archives: Home
Menu badge SD extdata, Home Menu SD extdata, and the theme-cache SD
extdata.</td>
</tr>
<tr class="even">
<td>Home Menu SD extdata</td>
<td>"/SaveData.dat"</td>
<td>0x2da0</td>
<td>Prior to doing the read, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>.</td>
</tr>
<tr class="odd">
<td>Home Menu SD extdata</td>
<td>"/Cache.dat"</td>
<td>0x1688</td>
<td>Prior to doing the read, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>.</td>
</tr>
<tr class="even">
<td>Home Menu SD extdata</td>
<td>"/CacheD.dat"</td>
<td>0x36c0</td>
<td>This is used to read the cached icon data for the currently
inserted gamecard, if any. Prior to doing the read, Home Menu uses <a
href="../FSFile:GetSize" title="wikilink">FSFile:GetSize</a>. After opening
the file and before <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a> is used, Home Menu uses AM commands
0x10070102(for theme DLC) and 0x30084(gamecard
"title-listing").</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu uses the following AM commands for theme DLC here:
0x10050084 and 0x10020104.</td>
</tr>
<tr class="even">
<td>Home Menu Theme SD extdata</td>
<td>"/BodyCache.bin"</td>
<td>0x150000</td>
<td>Before opening the file, Home Menu firsts opens this archive
under a new archive-handle again, then closes it. Prior to doing the
read, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>.</td>
</tr>
<tr class="odd">
<td>Home Menu Theme SD extdata</td>
<td>"/ThemeManage.bin"</td>
<td>0x8</td>
<td>Prior to doing the read, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>(the result is filesize
0x800).</td>
</tr>
<tr class="even">
<td>Home Menu Theme SD extdata</td>
<td>"/BgmCache.bin"</td>
<td></td>
<td>The data is read from here as needed. After opening the file,
Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>boss:P commands 0x00040000 and 0x04040080 are used here. Home
Menu opens NAND shared-extdata 0xf000000e, then closes it when the
archive was opened successfully. Then Home Menu uses boss:P command
0x04500102 with the theme extdata, with string "thmtop".</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>boss:P command 0x04040080 is used, with the input programID set
to the gamecard one. Then boss:P commands 0x000E0000 and 0x00160082 are
used.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../AMNet:GetTitleIDList"
title="wikilink">AM:GetTitleIDList</a> is used with mediatype=SD and
maxTIDs = 0x1c00.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>boss:P command 0x00160082 is used.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../PTM_Services" title="wikilink">PTM:GetStepHistory</a> is
used.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>srv_GetServiceHandle is used to initialize the service handle for
<a href="../AC_Services" title="wikilink">"ac:u"</a>, then <a
href="../AC_Services" title="wikilink">ACU:SetClientVersion</a> is used. <a
href="../Services" title="wikilink">srv_Subscribe</a> is used, then ACU
command 0x002F0004 is used.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../AMNet:GetTitleIDList"
title="wikilink">AM:GetTitleIDList</a> is used with mediatype=NAND and
maxTIDs = 0x1c00.</td>
</tr>
<tr class="even">
<td>NAND extdata 0xf000000b</td>
<td>"/gamecoin.dat"</td>
<td>0x14</td>
<td>Home Menu first tries to use FS:CreateFile with this, which will
fail when the file already exists. This file is then opened with
openflags=RW. After reading this file, Home Menu then uses <a
href="../PTM_Services" title="wikilink">PTM:GetTotalStepCount</a>, then
uses FSFile:GetSize. Then Home Menu writes to the already opened
gamecoin.dat file.</p>
<p>At the same time as doing the above, Home Menu also uses(probably
from a different thread) <a href="../AMNet:GetTitleIDList3"
title="wikilink">AM:GetTitleIDList3</a> with mediatype=NAND and
maxTIDs=0x2000. Then Home Menu uses <a href="../AMNet:ListTitles"
title="wikilink">AM:ListTitles</a> with the NAND promotional-video
titleID. Then Home Menu attempts to open the ExeFS:/icon in the NAND
promotional-video title.</td>
</tr>
<tr class="odd">
<td>Home Menu <a href="../System_SaveData"
title="wikilink">System_SaveData</a></td>
<td>"/Launcher.dat"</td>
<td></td>
<td>Prior to doing the write, Home Menu uses <a href="../FSFile:GetSize"
title="wikilink">FSFile:GetSize</a>. Home Menu writes 0x2490-bytes to
the file here. From a separate thread(?) at the same time, Home Menu
also uses <a href="../AM:ReloadDBS" title="wikilink">AM:ReloadDBS</a> and
AM command 0x00130040 with input=0x1.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu loads the u8 value from <a href="../Config_Savegame"
title="wikilink">cfg</a> blkID 0x000E0000 here.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../AM:ReloadDBS" title="wikilink">AM:ReloadDBS</a>, AM
command 0x10070102(for theme DLC), AM command 0x00130040, and AM command
0x10050084(for theme DLC) are used here. At the same time(from a
different thread?), the "act:u" service handle is initialized with
srv_GetServiceHandle. Then ACTU commands 0x00010084 and 0x000600C2 are
used.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>The <a href="../NIM_Services" title="wikilink">"nim:u"</a> service
handle is initialized with srv_GetServiceHandle. Then NIMU commands
0x000F0042, 0x00170042, 0x00150000, and 0x00050000 are used.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>AM command 0x10020104(theme DLC) is used here. Then Home Menu CXI
RomFS data is read.</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>Home Menu CXI RomFS data is read. <a href="../Filesystem_services"
title="wikilink">FS:GetSpecialContentIndex</a> for the gamecard is used,
then MICU initialization is done here(separate thread maybe?).</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td><a href="../ACU:GetWifiStatus"
title="wikilink">ACU:GetWifiStatus</a> is used, the NAND shared-extdata
0xf000000b archive is then opened here.</td>
</tr>
<tr class="even">
<td>NAND extdata 0xf000000b</td>
<td>"/idb.dat"</td>
<td>0x2008</td>
<td>This first opens the file for writing, then uses <a
href="../FSFile:GetSize" title="wikilink">FSFile:GetSize</a>(output
filesize is 0x6d4000). Then it writes to the file using size 0, then
closes the file. Then <a href="../PTM_Services"
title="wikilink">PTM:GetStepHistory</a> is used. Then Home Menu opens
"/idbt.dat", then reads 0x2008-bytes.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>Home Menu starts using <a href="../News_Services"
title="wikilink">"<span>news:s</span>"</a> commands here. While Home
Menu is doing this, it also uses(from another thread?) <a
href="../NS_and_APT_Services"
title="wikilink"><span>APT:PrepareToStartNewestHomeMenu</span></a>, <a
href="../NIM_Services" title="wikilink">NIMU:GetState</a>, and <a
href="../NDM_Services" title="wikilink">NDMU:OverrideDefaultDaemons</a>
with input value 0xF. Later with that news-command code still running,
Home Menu also uses the following commands: <a href="../ACU:GetWifiStatus"
title="wikilink">ACU:GetWifiStatus</a>, <a href="../NDM_Services"
title="wikilink">NDMU:QueryExclusiveMode</a>, and CECDS command
0x000E0000. Then <a href="../Config_Savegame" title="wikilink">cfg</a>
blkID 0x000D0000 is loaded.</td>
</tr>
<tr class="even">
<td>NAND extdata 0xf000000b</td>
<td>"/idbt.dat"</td>
<td></td>
<td>Home Menu writes 0x2008-bytes to this file.</td>
</tr>
<tr class="odd">
<td>NAND extdata 0xf000000e</td>
<td>"/versionList.dat"</td>
<td>Loaded from the filesize.</td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td>boss:P command 0x00200082 is used with string "mmVerDl".</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
<td>...</td>
</tr>
<tr class="even">
<td>Home Menu <a href="../System_SaveData"
title="wikilink">System_SaveData</a></td>
<td>"/Launcher.dat"</td>
<td></td>
<td>When Home Menu is terminating(?), Home Menu writes 0x2490-bytes
to the file here. After doing this, Home Menu opens, writes, and closes
the file again.</td>
</tr>
</tbody>
</table>

### Hardware reboot

During Home Menu start-up it uses
[<APT:PrepareToStartNewestHomeMenu>](APT:PrepareToStartNewestHomeMenu "wikilink").
If that doesn't return an error(normally NS returns 0xC8A0CFFC for
that), Home Menu starts a hardware reboot with
[<APT:StartNewestHomeMenu>](APT:StartNewestHomeMenu "wikilink") etc.

On retail this essentially means a hardware-reboot will automatically
trigger if [configmem](Configuration_Memory "wikilink") SYSCOREVER
doesn't match FIRM_SYSCOREVER, or when the current APPMEMTYPE doesn't
match the default APPMEMTYPE for this Old3DS/New3ds model. The latter
can happen with running New3DS NATIVE_FIRM with Old3DS system-titles,
for example.

## Returning to Home Menu from a crashed application

When returning to Home Menu from an application that didn't properly
shutdown(like with an exception), PTM module writes data to the PTM
system savedata. Then the system terminates Home Menu, and starts Home
Menu again.

## See Also

- <http://www.nintendo.com/consumer/systems/3ds/en_na/menu_update.jsp>
- <http://www.nintendo.co.jp/netinfo/3ds/JPN/ja.html>
- <https://yls8.mtheall.com/ninupdates/reports.php>

[Category:Nintendo Software](Category:Nintendo_Software "wikilink")

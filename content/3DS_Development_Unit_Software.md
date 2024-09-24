+++
title = '3DS Development Unit Software'
categories = ["3DS Development Unit Related Pages"]
+++

The following is a description of the functions what is possible with
the applications unique to 3DS Development Units.

For information on 3DS Development Hardware see
[1](http://gbatemp.net/topic/327858-3ds-development-hardware/)
<img src="../CTR_HMN_DEV.png" title="CTR_HMN_DEV.png" width="300"
alt="CTR_HMN_DEV.png" />

# System Updaters

<figure>
<img src="../CSUscrnshot.png" title="CSUscrnshot.png" width="300" />
<figcaption>CSUscrnshot.png</figcaption>
</figure>

There are two kinds of system updaters for dev (panda) units, CTR System
Updater (CSU) and SNAKE System Updater. As the names imply, the former
is for original 3DS and the latter is for New 3DS. They are used to
update the panda unit's 'firmware'/SDK Version. The romfs of the CSU
contains the contents that will be installed to NAND. They contain all
system titles as well as Devmenu and Config.

## Home Menu

<figure>
<img src="../CTR_HMN_DEV_CPU.png" title="CTR_HMN_DEV_CPU.png"
width="300" />
<figcaption>CTR_HMN_DEV_CPU.png</figcaption>
</figure>

The 3DS Dev Homemenu have some features that the retail one don't have.

- Debug informations (top screen left, can be shown by pressing X+Y):

:\*Banner region (have every regions and languages, can be changed by
pressing B+X),

:\*Build date,

:\*Homemenu rev,

:\*System mode (see config system mode for more infos),

:\*Screen capture (seems to be only for ctr debugger?),

:\*First red bar: Maximum level for the other bars (100%),

:\*Second bar: CPU processing,

:\*Third bar: GPU processing.

- Themes:


The Dev Homemenu can load themes in SD:/theme/(theme name)/(theme
files).

Note that retail themes and setting dev themes in random don't work.

- Icon database and icon cache:


You can delete them by holding X+Y button while booting homemenu.

## Dev Menu

<figure>
<img src="../Devmenuicon.png" />
</figure>

<img src="../Devmenscnsht.jpg" title="Devmenscnsht.jpg" width="250"
alt="Devmenscnsht.jpg" />
<img src="../Old_Dev_Menu.png" title="Old_Dev_Menu.png" width="200"
alt="Old_Dev_Menu.png" />

This NAND application (00040000-0ff40002) on the top screen displays the
firmware and revision of the Dev Menu, the free space available on the
[TWL(DSi) NAND partition](Flash_Filesystem#TWL_partition "wikilink") and
[SD card](SD_Filesystem "wikilink") if present. It also provides
information on the current file or device selected, as well as
navigation instructions for the bottom screen.The bottom screen has
three different windows, which are:

- Program - From this tab, applications can be loaded from the
  [NAND](Flash_Filesystem "wikilink"), the [SD
  card](SD_Filesystem "wikilink") and the slot 1 card (only a select
  scope of applications, see below for Dev Menu revisions and their
  corresponding scope of applications). Installed software can be
  uninstalled by pressing X on it.

<!-- -->

- Import - From this tab, the SD card can be browsed to select and
  install a .[CIA](CIA "wikilink") file. In later revisions this was
  renamed to *SDMC*. In addition to the marked controls, also pressing X
  while requesting the installation of one or more CIA will delete them
  after a successful installation.

<!-- -->

- HIO - "Host IO" A tab available in later revisions of the Dev Menu.
  Used for installing CIAs stored on the host PC, this is supported by
  hio services, and hio daemon on the host PC. Only usable on
  PARTNER-CTR (Capture+)Debugger, as HIO requires a direct USB
  connection with the console.

<!-- -->

- ExtData - From this tab, the 3DS's [Extdata](Extdata "wikilink")
  (except NAND shared extdata) can be deleted.

<!-- -->

- SExtData - "Shared Extdata", this feature was removed early on in the
  history of this app.

Titles are shown in the Program tab by [Unique ID](Titles "wikilink")
and by their [Product code](Product_code "wikilink") (CTR)/name in
header (TWL); some other non-executable special titles (applets or
CFAs), explicitly programmed in the specific version of DevMenu, are
displayed in red.

To perform a manual update with CIAs on a dev unit, pressing Start + Y
while highlighting the NATIVE_FIRM CIA will trigger an option to update
firmware, thus allowing a downgrade.

Pressing L + R + Left + B + Start will, after confirmation, bulk
uninstall all SDK tools. DevMenu itself will crash a few seconds later.

| SDK Version    | Titles Accessible                                                                                             |
|----------------|---------------------------------------------------------------------------------------------------------------|
| 0.9.2 - 0.13.2 | Applications(NAND), System Applications , TWL Titles                                                          |
| 0.14.0 - 1.1.0 | Dev NAND Applications, System Applications , TWL Titles                                                       |
| 1.2.0 - 2.0.0  | Dev NAND Applications, DSiWare                                                                                |
| 2.1.0 - 2.4.0  | Applications(SD), Dev NAND Applications, DSiWare                                                              |
| 3.0.0 - 3.1.0  | Applications(SD), Dev NAND Applications, Demos, DSiWare                                                       |
| 3.2.0          | Applications(SD), Dev NAND Applications, Demos, DSiWare, WebBrowser                                           |
| 3.3.0 - ?      | Applications(SD), Dev NAND Applications, Demos, DSiWare, WebBrowser, TwlNandFiler                             |
| 11.4 (0.24.67) | Applications(SD), Dev NAND Applications, Demos, DSiWare, WebBrowser, eShop, Miiverse, TwlNandFiler, dummy CFA |

## Config

<figure>
<img src="../Configicon.png" />
</figure>

<img src="../3DS_dev_configmenu.JPG" title="3DS_dev_configmenu.JPG"
width="250" alt="3DS_dev_configmenu.JPG" />
<img src="../Dev_config.jpg" title="Dev_config.jpg" width="250"
alt="Dev_config.jpg" />

This NAND application (00040000-0ff40102) is a text-mode advanced
configuration menu for the 3DS.

When open, similarly to the regular [System
Settings](System_Settings "wikilink"), the Home menu is not accessible,
and the console is forced to be rebooted on exit (accomplished by
pressing the Power button).

The functionality and menu layout of this app has changed a lot over its
continuous development; some features include:

- Menu - (Home Menu/Test Menu) This function edits the
  [configuration](Config_Savegame "wikilink") field containing the menu
  TID for dev units, allowing the user to choose between the [Home
  Menu](Home_Menu "wikilink") or the [Test
  Menu](3DS_Development_Unit_GUI#Test_Menu "wikilink"), as the menu
  loaded by the [NS](NS "wikilink") module.

<!-- -->

- Language - same options found in the Language section of [System
  Settings](System_Settings "wikilink") but also has an "invalid" option

<!-- -->

- System Mode - [Changes the memory
  mode](Memory_layout#FCRAM_memory-regions_layout "wikilink") for the
  Home/Test Menu. (Launching applications will be able to override this
  setting)

:\*Prod - 64MB Memory mode ([Home Menu](Home_Menu "wikilink") can
usually only run in this mode and *most* retail-looking units cannot
switch out of this mode)

:\*Dev1 - 96MB Memory mode (No browser/Miiverse)

:\*Dev2 - 80MB Memory mode

:\*Dev3 - 72MB Memory mode

:\*Dev4 - 32MB Memory mode

:\*snake Prod - 124MB for New-3DS

:\*snake dev1 - 178MB for New-3DS (No browser/Miiverse)

:\*snake dev2 - 124MB for New-3DS


All CTR Debuggers/Prototype units can change memory allowance. For
Developer Test Units, the ability to change Memory Allowance, appears to
be dependent on an option when buying the Test Unit (similar to having a
choice to purchase IS-Nitro's Wireless/USG options when buying an
IS-Nitro from Nintendo). If anything other than prod or dev2 is
selected, menu settings are automatically changed to test menu.

On some Test Units, it's possible to run the [Home
Menu](Home_Menu "wikilink") outside of Prod. However, software with
limited memory (such as the web browser) cannot be launched from the
home menu if the home menu is outside of Prod.

- Exception handler - Selects whether to enable or disable the
  application's handling of exceptions that arise in the non-debug
  environment.


If the application is not set to handle exceptions, the application
quits when an exception occurs. - enable/disable

- Break Stop - (enable/disable) - Selects whether to enable or disable
  stopping the application when a break is encountered in the non-debug
  environment. If the application is not made to stop, it quits on a
  break.

<!-- -->

- Debug Mode - (enable/disable) - Select enable or disable to enable and
  disable debugging functions.


Debugging is always disabled for retail products.

- Dlp Force Child Import/Dlp Debug - (enable/disable) - normally the 3ds
  caches downloaded "Download Play (Dlp)" applications on the nand and
  only re-downloads, overwriting the cached copy if the version
  application being requested to downloaded is higher than what is
  currently present on the nand. Enabling this option forces the 3ds to
  download and overwrite the cached copy on the nand, regardless of the
  version of the application being downloaded. This is of course for
  testing purposes.

<!-- -->

- Fangate Failure Emulation - Unknown, related to the [external Amiibo
  receiver](NFC_adapter "wikilink")?

<!-- -->

- Nup - Enable/disable online check for updates? Such a feature exists
  on WiiU

<!-- -->

- FS Latency Emulation - Filesystem Latency, in milliseconds
  (0ms-2550ms). Selection is in increments of 10. (ie
  0ms-\>10ms-\>20ms...)

<!-- -->

- User Name - Console owner's "profile" nickname, unrelated to the
  Personal Mii

<!-- -->

- NG Name Flag - declares whether the name is "not good", i.e. contains
  a banned word. Normally automatically set by System Settings after a
  warning; effect unknown.

<!-- -->

- CountryId - Changes 3DS between installed countries. It can also be
  set to an undefined ID (255).

<!-- -->

- RegionId - Selects the sub-location (region, state, county), if
  supported by the selected country. Unidentified is displayed when
  RegionId is set to 255.

<!-- -->

- Hid Setting - (human interface device) Calibrates touch screen and
  Analog stick.

<!-- -->

- FLICKER TOP - Bias voltage for top screen (the misattributed
  "contrast" or "scanline" control found as potentiometers in the
  battery compartment in previous color-display Nintendo portables)

<!-- -->

- FLICKER BOTTOM - Bias voltage for bottom screen

<!-- -->

- ABL ENABLE - "Power Save mode", adjusts backlight according to
  displayed image. Can also be enabled on 2DS, on which it is fully
  functional but the single backlight design may bring questionable
  results.

<!-- -->

- LUMINANCE LEVEL - Brightness. In older versions of Config, it could be
  set above 5, with no further increment and resulting in crashes of the
  Home Menu's quick settings.

<!-- -->

- BACKLIGHT DIMMING - Camera-controlled automatic backlight of New-3DS

<!-- -->

- RTC Setting - (real time clock) Sets system time, with equivalent
  results to System Settings.

<!-- -->

- Raw RTC Setting - Adjusts time directly on [the hardware
  RTC](MCU_Services "wikilink"). The resulting time is also displayed as
  a convenience. If the application being tested uses
  GetUserTimeOffset() to [detect if the user has changed the
  clock](Anti_Time-Travel "wikilink"), this can be used to change the
  clock without the application detecting it.

<!-- -->

- Eula Setting - Input the "Agree Version", a 2-byte number representing
  the latest accepted version (major and minor) of the online services
  agreement. 00.00 is used to mean "not accepted". This setting is
  commonly adjusted to its maximum value, ff.ff, to bypass issues with
  playing foreign region games online caused by mismatching latest
  agreement versions.

<!-- -->

- Sound Mode - mono/stereo/surround

<!-- -->

- Coppacs Setting - In the U.S., a law called the Children's Online
  Privacy Protection Act (COPPA) requires consent from the parent or
  guardian for collection and use of personal information from children
  under the age of 13. Canada has a nearly identical law. This setting
  is [only enabled for software for the Americas region, and when the
  country in System Settings is set to the US or
  Canada](Cfg:GetRegionCanadaUSA "wikilink").

<!-- -->

- Olv Access Key - Related to Olive/OLV/Miiverse. Always appears to be 0
  on retail units. WiiU titles have numbers also called OLV access keys
  in their metadata XMLs.

<!-- -->

- Test Setting - Verify operation and calibration of touchscreen and
  joystick.

<!-- -->

- Stereo Camera Cal for Check - Apparently writes incorrect calibration
  data for the camera.

<!-- -->

- Gyro / Accel Cal for Check - Apparently writes incorrect calibration
  data for the motion sensors.

<!-- -->

- Ctr Info Setting - Loads settings from a ctrsetting.txt present on the
  SD. Such a sample file is provided in the resources/configtool folder
  of the SDK.


The feature set of this option is only in most part the same as the
interactive UI's, for instance ctrsetting.txt can also configure the DS
Profile and [Parental Controls](Parental_Controls "wikilink").

- Reset Settings - Resets all settings to default. The initial
  configuration will be run again, but installed applications or their
  data will not be deleted unlike in a [System
  Format](System_Settings "wikilink").

# CTR-SDK

Descriptions Derived from SDK 2.3.4 except where notified otherwise.

## Downloadplay Client

<img src="../Dlpcliscnsht.jpg" title="Dlpcliscnsht.jpg" width="250"
alt="Dlpcliscnsht.jpg" /> ![](Dlpcliicon.png)

Even though a Developer 3DS has a "Download Play" application visually
identical to the retail 3DS [application](Download_Play "wikilink"), the
text-mode "Downloadplay Client" NAND application (00040000-0ff40402) can
be installed as an alternative to the regular Download Play application.

(A Developer 3DS cannot receive software from a Retail 3DS and viceversa
due to different encryption keys.)

This application is used for easy testing of 3DS-mode download play
'child' apps (DS Download Play is not implemented), without the hassle
of constantly re-navigating the normal Download Play interface

## Network Settings

<img src="../Netsetscnsht.jpg" title="Netsetscnsht.jpg" width="250"
alt="Netsetscnsht.jpg" /> ![](Netseticon.png)

This developer NAND application (00040000-0ff40702) allows the users to
directly modify the following from any of the three possible network
setting 'slots'

- Security Mode :(the wireless encryption the network is using) OPEN/WEP
  40bit/WEP 104bit/128bit/WPA TKIP/WPA2 TKIP/WPA AES/WPA2 AES

<!-- -->

- SSID :(self-explanitory) maximum 32 characters

<!-- -->

- KEY :(the key for the encrytion is here in plain text) the maximum
  length depends on encryption type

<!-- -->

- AutoDNS :(whether the 3DS obtains the DNS automatically or not)
  \|True-3DS obtains the DNS automatically\|False-3DS uses the DNS
  server address provided by the user(it is possible to edit this
  here)\|

At the bottom of the setting options there are two choices:

- Write Setting & Connect Test To AP - Applies the settings above and
  performs a connection test(note any settings made in system settings
  for this connection, which are not present in the above settings will
  be nullified, for example any proxy server settings)

<!-- -->

- Remove Setting - removes all settings for this 'slot'

The system must be rebooted to exit this app.

## SaveDataFiler

![](Saveflicon.png)
<img src="../Saveflscnsht.jpg" title="Saveflscnsht.jpg" width="250"
alt="Saveflscnsht.jpg" />

This 3DS developer NAND application (00040000-0ff40a02) allows save
files and extdata to be exported and imported from an SD Card. The
window has three tabs:

- User - This is where saves for 3DS-mode installed and cartridge
  applications can be exported to the SD Card. After the initial
  release, button combinations for deleting the entire save archive or
  resetting the [secure value system](Anti_Savegame_Restore "wikilink")
  for the selected title were added. The selected save archive can also
  be browsed by pressing A.

The entire save or individual files can be deliberately corrupted.

- ExtData - This is where application extdata can be deleted or exported
  to the SD Card for later use

<!-- -->

- SD - This is where backups created through the first two tebs can be
  re-imported (with the options of an automatic target selection, or
  explicitly choosing the SD or the Game Card). Exported data can also
  be deleted here.

Applications are listed only by Unique Id. TWL-mode software is ignored
by this application, while GBA-mode apps will always be shown as not
ever having saved ("broken" and highlighted in red).

User save data is exported to
sdmc:/filer/UserSaveData/YYYYMMDD(Hour)(Minute)(Second)

It creates a folder in that path and 3 files. The 2 files exported to
the above path are <uniqueID>.dat and <uniqueID>_.dat while a folder
named /<uniqueID>/ in that path contains <ExHeader Name>.dat

Pressing L+R+Start will, after confirmation, delete all [Shared
Extdata](Shared_Extdata "wikilink"). Home Menu will crash if returned to
before rebooting.

## CTR MenuSelector

<img src="../MenuSelector.png" title="MenuSelector.png" width="120"
alt="MenuSelector.png" /> ![](Menuselectoricon.jpg)

This system NAND application (00040010-0ff40b02) when loaded can change
the current 'Active Menu'(being used at the moment) by editing the menu
TID [configuration](Config_Savegame "wikilink") field, allowing the user
to choose between the [Home Menu](Home_Menu "wikilink") or the [Test
Menu](3DS_Development_Unit_GUI#Test_Menu "wikilink"), as the menu loaded
by the [NS](NS "wikilink") module.

It also features a basic [font](System_Font "wikilink") test.

With the release of SDK 1.1.0, this application was superseded by the
introduction of the "Menu" choice in the [Config
Menu](3DS_Development_Unit_Software#Config "wikilink") and consequently
removed as a standard application.

## CecBoxTool

<figure>
<img src="../devCECBoxTool.jpg" title="devCECBoxTool.jpg" />
<figcaption>devCECBoxTool.jpg</figcaption>
</figure>

Streetpass backup and restore tool, can also delete boxes (disable
[StreetPass](StreetPass "wikilink") for a given software), check the
number of contents of the inbox and outbox for any given box (or all of
them), or reset the MAC filter.

NAND application (00040000-0ff41602)

## CecLotCheckTool

<img src="../Ceclotscnsht.jpg" title="Ceclotscnsht.jpg" width="250"
alt="Ceclotscnsht.jpg" /> ![](Cecloticon.png)

This NAND application (00040000-0f800902) is used to manage CECs (Chance
Encounter Communications, AKA StreetPass) for any of the twelve possible
applications registered for StreetPass, if there are any.

The BOXes are individual applications which are permitted by the user to
use CECs, such as StreetPass Mii Plaza or Nintendo 3DS Sound. And as
such, the boxes in this application correspond to the applications in
'StreetPass Management', in 'System Settings' (StreetPass Management is
accessible from retail 3DSs). The functions of this application:

- <Y> BOX Options - this opens up a sub menu with the following
  options(when hovering over Nintendo 3DS Sounds BOX - the only one I
  can test the app with):

<!-- -->

- Box Info - Gives the Out-Box parameters
  <img src="../Boxinf.jpg" title="Boxinf.jpg" width="250" alt="Boxinf.jpg" />

<!-- -->

- Message Info (OUT-BOX) - Gives the Message Parameters For the current
  BOX
  <img src="../Mesinf.jpg" title="Mesinf.jpg" width="250" alt="Mesinf.jpg" />

<!-- -->

- Dummy Message Settings - Not quite sure what the options do here
  <img src="../Dummesinf.jpg" title="Dummesinf.jpg" width="250"
  alt="Dummesinf.jpg" />

<!-- -->

- <A> Create Dummy BOXes - Creates dummy BOXes to fill any unused slots.
  (does not overwrite any present slots)

<!-- -->

- <X> Delete BOXes - Deletes all of the BOXes from the slots.

<!-- -->

- <START> CEC Filter Reset - Resets 8-hour per source rate limit. The
  [StreetPass driver](CECD "wikilink") runs a
  [ENVINFO](Configuration_Memory#ENVINFO "wikilink") check to verify
  independently whether the console is not retail before applying this.

## BossLotCheckTool

<img src="../Bosslcscnsht.png" title="Bosslcscnsht.png" width="100"
alt="Bosslcscnsht.png" /> ![](Bosslcicon.png)

This application (00040000-0ff40e00) is used to manage BOSS (SpotPass)
tasks/data for 3DS titles which utilise BOSS communications. 'Pokedex'
is an application which utilizes BOSS comunications. This application
also displays the 3DS's friend code, although this code is not to be
confused with the 3DS's Friend Card code found in 'Friends List'. The
user can browse by unique ID the 3DS titles(excluding system titles)
registered to use BOSS. For each title you can view details about the
downloaded 'NsData' which accompanies BOSS downloads, view the BOSS task
lists (implies applications can perform more than one BOSS task). You
can also view various details about each BOSS task, including:

```
TaskStatus : DONE?
TaskExecCount : How many times the BOSS task has been executed
TaskExecInterval : Period of time (in seconds) in the task is to be executed, in intervals
TaskPriority : Is a number value 
URL : The URL to the BOSS content
AP Info : NONE?
TaskResultCode : Success or not
HTTP_StatusCode : Self explanatory 
DataSize : Size of Content (in bytes)
Last_Modified : Last time the BOSS content (on server) was modified
StartTime : when the BOSS task was registered
OptOut : Whether the user can/has opted out of BOSS communication for this task
```

```
It also possible to manually execute the BOSS task from here
```

## Stereo Camera Calibrator

<img src="../Stecamscnsht.png" title="Stecamscnsht.png" width="100"
alt="Stecamscnsht.png" /> ![](Stecamicon.png)

The Stereo Camera Calibrator (00040000-0ff40600), in a nutshell, allows
the user to adjust the configuration of the outer cameras in relation to
each other. It can be configured automatically by positioning the 3DS a
set distance away from a special chart. It can also be configured
manually, by setting the rotation of each camera image and the size of
the right eye camera. The 3D effect can be perceived by superimposing
the right eye camera image translucently with the left eye camera image
or by viewing the 3D image directly by use of the parallax barrier in
the 3DS Screen.

## SdCardDebugUtility

A multipurpose application (00040000-07fffa00) which can:

- Fill most free space on the SD card.
- Create some sample 2D or 3D pictures.
- Create empty [voice memos](Nintendo_3DS_Sound "wikilink").
- Launch the picker applets for the former media (neither canceling nor
  actually selecting a file have any effect).
- Create dummy SpotPass tasks.

## FragDisk

This SD application (00040000-0ff41800) creates many small files on the
SD card, then deletes one out of every two to fragment the free space.

## Friend Add Tool

<img src="../FriendAddTool.png" title="FriendAddTool.png" width="100"
alt="FriendAddTool.png" /> The purposes of this tool (00040000-0fe04000)
are deleting all friends and/or filling the Friend List with dummy FCs,
or with ones loaded from friend_code.txt on the root of the SD card.

This file must contain 1-100 friend codes, one per line. Digits may be
grouped at the user's discretion with spaces, dashes, or nothing.

## Friend Testing Partner

<img src="../Ftestpscnsht.png" title="Ftestpscnsht.png" width="250"
alt="Ftestpscnsht.png" /> ![](Ftestpicon.png)

The Friend Testing Partner application (00040000-0fe00c00) is used to
test/monitor the 3DS's Friend List function. It allows the user to test
various functions of the 3DS's out-going Friend Card, by giving the
following options:

- Master Control - (RUN/STOP) (STOP is the default setting) when ‘STOP’
  is selected the 3DS Friend Card uses the user’s settings/data. When
  ‘RUN’ is selected the 3DS Friend Card uses the dummy settings/data
  chosen to test from the settings bellow.

<!-- -->

- Login/Logout - (ON/OFF) (ON is the default setting) What effect this
  has on the Friend Card is not known

<!-- -->

- Playing Title - (ON/OFF) (ON is the default setting) When ‘ON’ is
  selected the currently used title is ignored and a dummy applications
  are cycled through as the ‘Playing Title’ approximately every ten
  seconds in its place. The dummy applications used are the applications
  found in Firmware version 1.0.0-0 of a retail 3DS including the
  ‘Nintendo Zone viewer’ app. When ‘OFF’ is selected the currently used
  title (which is the Friend Testing Partner app) is used as the
  ‘Playing Title’

<!-- -->

- Mode Description - (ON/OFF) (ON is the default setting) When ‘ON’ is
  selected the Software in Use(Playing Title) is accompanied by the Date
  and Time found on that user’s 3DS. The Mode Description is refreshed
  every ten or so seconds. When ‘OFF’ is selected the date and time on
  the user’s 3DS is not displayed.

<!-- -->

- Message - (ON/OFF) (ON is the default setting) When ‘ON’ is selected
  the message made by the user is replaced(not overwritten as it reverts
  back to the user’s choice when this is ‘OFF’) by the current date and
  time in the format “YYYYMMDD HHMMSS”, this is refreshed every ten or
  so seconds.

<!-- -->

- Mii - (ON/OFF) (ON is the default setting) When 'ON' the currently
  used Mii is replaced with one of 4 dummy Miis and cycles them through
  every ten seconds with a new dummy mii. This effect can only be seen
  from another 3DS not the host

<!-- -->

- Favorite Title (ON/OFF) (ON is the default setting) When 'ON' is
  selected, the user’s favorite title is replaced with a dummy, which is
  replaced every 10 or so seconds.

Also this application allows the user to monitor the whether the 3DS is
online or not and whether the 3DS’s Friend Presence is online or
offline. Every time a dummy setting is refreshed it is displayed on the
top screen with a time stamp.

## Game Coin Setter

![](Coinsticon.png)
<img src="../Coinstscnsht.png" title="Coinstscnsht.png" width="100"
alt="Coinstscnsht.png" />

This application (00040000-0ff40d00) is used to set the Play Coin count
on the 3DS. Obviously this was created so a developer can test parts of
their game in which the player can exchange earned play coins for
in-game content or similar. It has a very simple interface showing the
current play coin count and the adjustable option, the target coin
count. These are the controls with explanation of each:

- LEFT/RIGHT - using the D-pad only to adjust the 'Target Count' to a
  number between 0-300.

<!-- -->

- A - Sets the 'Current Count' (amount of play coins the system has) to
  the user selected 'Target Count' (the user specified amount of play
  coins)

<!-- -->

- L+R+X - "Preclude today's Increment" Sets byte 6 of [the play coin
  database](Extdata#Shared_Extdata_0xf000000b_gamecoin.dat "wikilink")
  so that no coins will be earned through walking for the current day
  anymore.

## PedometerHistoryChanger

A tool (00040000-0ff30300) to preview on-screen, or export to SD,
pedometer data.

The format of PedometerExport.csv is: year,month,day,hour,steps during
that hour.

Data can be read from an equally formatted PedometerImport.csv,
replacing the entire pre-existing history or only conflicting hours at
the user's discretion. History on internal storage can be cleared, too.

## IR Communication Checker

This application has title ID 00040000-0f804900 and cannot be closed
(apart from forcing a power cycle).

Counts data seen by the infrared port. It doesn't have to be valid, as
it happily measures a camera flash...

## EcDevTool

<img src="../EcDevTool_11.4.png" title="EcDevTool_11.4.png" width="200"
alt="EcDevTool_11.4.png" /> This multipurpose tool (00040000-0ff41b00)
provides several features propedeutical to simulating software sales:

- Add balance: self explanatory, not functional on the production eShop
  server
- Delete title right: Local and (apparently) server-side
  [ticket](ticket "wikilink") uninstaller
- Delete eshop account: self explanatory, sometimes functional on the
  production eShop server
- Change country - apply a country change without going through the
  multiple warnings present in the retail eShop app
- Change tax address - zipcode entry (USA and Canada only).

## Dummy Nintendo eShop

<img src="../INdummyshop.png" title="INdummyshop.png" width="200"
alt="INdummyshop.png" /> This region-specific application exists to
debug `API( JumpToEshop() )` on the 3DS. This was created so a developer
can test parts of their game in which the player can preview or purchase
titles within a game. It is mainly used in conjunction with Downloadable
content. It has a very simple interface showing the reason for its
existence and controls for exiting to the home menu or finalizing the
Dummy Shop. The Dummy Nintendo eShop also shares the same Title ID and
Unique ID as the Retail Nintendo E-Shop.

## FangateFwUpdater

00040000-0ff41f00 is a tool for updating or destroying (thus enabling
downgrade of) the external NFC reader/writer's firmware. This tool
cannot be used with SNAKE development devices or SNAKE development
tools. It operates only with CTR development devices and CTR development
tools.

## NoftWriter

(00040000-0f807f00) Browse the SD card for Amiibo images, and flash them
to non-locked tags. After programming, the tag may be left locked or not
at the user's discretion.

## NfpSdmcTool

(00040000-0ff42100) Can read, write, and modify NFP tag data.

## NfpManager

A multipurpose Amiibo tool, having the title ID of 00040000-0ff41e00.

The eventual connection to an external NFC adapter, to the Amiibo, and
to its contents can all be enabled or disabled separately.

Amiibo data (owner, save file, or both) can be deleted or replaced.

The local NAND backup of scanned Amiibos can be deleted too.

## NfpUtility

A simplified, bulk Amiibo checker (00040000-0ff42000) : just hold a
supported tag over the NFC reader to view a summary of its character
identity and owner info.

## UdsLocalIdChecker

A scanner for local, console-to-console networks. Its title ID is
00040000-0ff3ff00.

## TWL Development Tools

These are DSi/DS mode development tools repackaged into a
[CIA](CIA "wikilink"), for installing to the TWL NAND.

### NINTENDO DS - WMtest

<img src="../Wmtestscnsht.jpg" title="Wmtestscnsht.jpg" width="300"
alt="Wmtestscnsht.jpg" /> ![](Wmtesttool.png)

This application is a TWL(DSi) application compiled for use on the 3DS.
It is an wireless test tool with its uses explained below:

- Scan Test - Scans Wireless channels 1-13 (can be focused on one
  specific channel) for broadcasting stations. It can detect two types
  of broadcasting stations:


Wifi Access Points - Giving the Mac Address, Broadcasting Channel, 'c',
and the SSID

<!-- -->


DS Stations such as DS Download stations and Pokemon distributors -
Giving the Mac Address, Brodcasting Channel, TGID and GGID

- ScanEx Test - and has two Scan Types. Passive which lets you
  individually scan channels 1-13 (only one at at time) and the DS
  distribution channels (1,7,13 all at once). And Active which scans all
  13 channels at once. when it finds a channel it prints on the bottom
  screen next to 'Found' 'bssDescCount='

<!-- -->

- MeasureChannel Test - not quite sure what this does but it for a given
  channel it gives a ratio(in percentage form), which it finds in its
  allocated test time ranging from 10ms to 1000ms. And for every
  interval of time which is specified, it tests and gives a ratio.

<!-- -->

- Noise Mode - Seeks wireless channels in which to make wireless noise
  (This is not made very clear on the app). You can specify the:

Channel where the scanner will seek to make noise

Noise Rate, ranging from 0% to 100%

Frequency, ranging from 10ms to 50ms

Seek Mode, ranging from 1000ms to 1500ms

When the settings are chosen the top screen has two counters which
display 'Noise ON count' and 'Noise OFF count' the counters are affected
by the noise rate. Starting at 0% the 'Noise ON count' does not change
but as the Noise rate gets closer to 100% the count moves and gets
faster as Noise rate reaches 100%. For 'Noise OFF count' it is the exact
opposite to the ' Noise ON count' in regards to counting.

### TWLNandFiler

Browse, export, delete and import save archives from TWL Nand. Includes
a basic hex viewer.

# NW4C

NintendoWare for CTR is comprised of tools that deal with creating
effects, fonts, models, layouts, sound, and text. There are CTR versions
of some of the viewers.

## H3D Model Viewer

<img src="../H3Dscrnshot.png" title="H3Dscrnshot.png" width="180"
alt="H3Dscrnshot.png" /> ![](H3Dicon.png) ![](ModelViewericon.png)
<img src="../ModelViewer.png" title="ModelViewer.png" width="100"
alt="ModelViewer.png" />

Used for viewing Binary CTR Models (.bcmdl): the model can be viewed
from any angle or scale, the perspective is controlled by the circle pad
and directional buttons.

Models need to be loaded into memory through Host IO, so this
application is only usable for its intended purpose on a CTR-PARTNER
(Capture-)Debugger; on a CTR-PARTNER Capture or Test Units, the model is
restricted to three coloured lines depicting the 3 dimensions (x,y,z).

There is also a Windows port of this program, running in a specialized
proprietary emulator.

## Layout Viewer

<img src="../LYTscrnshot.png" title="LYTscrnshot.png" width="180"
alt="LYTscrnshot.png" /> ![](LYTicon.png)

Used for viewing Binary CTR Layouts (.bclyt). It is used with
CTR-PARTNER to load layouts into RAM.

## Effect Viewer

<img src="../EFTscrnshot.png" title="EFTscrnshot.png" width="180"
alt="EFTscrnshot.png" /> ![](EFTicon.png)

# Mobiclip suite

Along with (but separately from) the Mobiclip encoder, Nintendo offers
to developers:

## 3D Movie Player

A simple but polished gamecard or SD application (00040000-00036A00)
that, comparably to retail multi-video titles (such as "Shaun The
Sheep"), allows its user to select moflex files directly from the root
of the SD card, then watch them (complete with seek bar, FF/pause/REW
buttons, and an auto-dimming user interface!)

------------------------------------------------------------------------

[Category:3DS Development Unit Related
Pages](Category:3DS_Development_Unit_Related_Pages "wikilink")
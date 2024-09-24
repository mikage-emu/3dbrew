NS (**N**intendo User Interface **S**hell 任天堂用户界面Shell)
系统模块是[FIRM](FIRM "wikilink") 进程载入后，从 CTR-NAND
title载入的第一个模块。这个模块由PM进程载入， with the titleID loaded
from NS state(hard-coded TID initialized during applet TID-array
initialization).
NS首先载入[ErrDisp](ErrDisp "wikilink"),接下来是菜单.在零售机上，菜单TID从NS
state载入,而dev/debug机种的菜单 TID
从[config](Config_Savegame "wikilink")载入.如果dev机的[config](Config_Savegame "wikilink")没有了菜单TID块,
NS将启用备用菜单。这个载入菜单的TID会写入
[ACTIVEMENUTID](Configuration_Memory "wikilink"). NS
使用[pm:app](PMApp:LaunchTitle "wikilink")载入 title.

NS will not trigger the [fatal-error](ErrDisp "wikilink") screen when
launching the regular/alternate menu fails.

Like home menu NS is constantly running while the system is in 3DS-mode.
When attempting to return to home-menu when the home-menu process isn't
running(like when the process terminated/crashed), NS will trigger a
[fatal](ErrDisp "wikilink") error.

# Alternate menu

When launching the regular menu fails, NS will then attempt to launch
the alternate menu. This title could be used as a recovery process,
however it's normally not used after the factory. This title is used at
the factory for installing system titles, this title seems to be
installed from a factory gamecard. This installer title likely deletes
itself from NAND once it's finished installing titles.

On development Units, this is the [Test
Menu](3DS_Development_Unit_GUI#Test_Menu "wikilink"), and isn't deleted
after being setup at factory.

# Auto-boot

After [loading](PMApp:GetFIRMLaunchParams "wikilink")
[FIRM](FIRM "wikilink") params and prior to launching
[ErrDisp](ErrDisp "wikilink")/Home Menu, NS handles auto-booting titles.
The same code called by [<APT:Reboot>](APT:Reboot "wikilink") is used
for launching FIRM here. When the
[UPDATEFLAG](Configuration_Memory "wikilink") is set, NS will launch
SAFE_MODE_FIRM with the application titleID set to the [System
Updater](System_Settings#System_Updater "wikilink") titleID for this
region. When the UPDATEFLAG is not set, NS can auto-boot the following
titles as well if [0x1FF80016](Configuration_Memory "wikilink") bit0 is
set.

When bit1 and bit2 are value zero in
[0x1FF80016](Configuration_Memory "wikilink"), NS will
[launch](NSS:LaunchFIRM "wikilink") the title specified by the
[FIRM](FIRM "wikilink") parameters if the title-info is set. This FIRM
launch is done after launching [ErrDisp](ErrDisp "wikilink") and Home
Menu. Otherwise when [0x1FF80016](Configuration_Memory "wikilink") is
value 2 and the output u8 from [PTMSYSM](PTM "wikilink") command
0x08140000 is value 0, NS will boot the title specified from the TWL
TLNC block from FIRMparams+0x300. This is the same TLNC block which DSi
titles wrote to RAM+0x300 for launching other titles via the launcher
title. When handling the TLNC block, NS will boot the 3DS System
Settings title when the TLNC titleID is the DSi System Settings
titleID(the region field in the TLNC TID is not checked/used). When the
TLNC titleID is not System Settings, NS will convert the input DSi
titleID-high to the 3DS TWL titleID-high(tidhigh = (TLNCtidhigh &
0x7FFF) \| 0x48000), then launch TWL_FIRM to run the title. NS does not
support launching from gamecard via TLNC.

# NS Workaround

A "ns_workaround" was [added](5.1.0-11 "wikilink") in NS to workaround
the flaw added with [5.0.0-11](5.0.0-11 "wikilink"). When NS is loading
before launching any ARM11 processes and certain [Configuration
Memory](Configuration_Memory "wikilink") fields are set, NS will launch
[AM](Application_Manager_Services "wikilink") then use command
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink"). NS will then
execute the code called by
[<APT:StartNewestHomeMenu>](APT:StartNewestHomeMenu "wikilink"), the
code related to <APT:PrepareToStartNewestHomeMenu> is not executed here.

NS will only execute this code-path when
[0x1FF80016](Configuration_Memory "wikilink") is value zero, when
KERNEL_VERSIONMAJOR is value 2, and when KERNEL_VERSIONMINOR is less
than 35. Therefore, this code-path is only executed when the running
NATIVE_FIFM version is prior to [5.0.0-11](5.0.0-11 "wikilink").

# NS Service "ns:s"

| Command Header | Available since system version                                | Description                                                                                                                                                                                                                                                                                                                                                  |
|----------------|---------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0001....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [LaunchFIRM](NSS:LaunchFIRM "wikilink")                                                                                                                                                                                                                                                                                                                      |
| 0x000200C0     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [LaunchTitle](NSS:LaunchTitle "wikilink")                                                                                                                                                                                                                                                                                                                    |
| 0x0003....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Wrapper for [PMApp](Process_Manager_Services "wikilink") command 0x00030080.                                                                                                                                                                                                                                                                                 |
| 0x0004....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Wrapper for [PMApp](Process_Manager_Services "wikilink") command 0x000500C0.                                                                                                                                                                                                                                                                                 |
| 0x000500C0     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [LaunchApplicationFIRM](NSS:LaunchApplicationFIRM "wikilink")                                                                                                                                                                                                                                                                                                |
| 0x00060042     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [SetFIRMParams4A0](NSS:SetFIRMParams4A0 "wikilink")                                                                                                                                                                                                                                                                                                          |
| 0x00070042     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | This does initialization for the gamecard [system update](System_Update_CFA "wikilink"). Then this checks whether this gamecard system-update needs to be installed, by comparing the title-version of the [CVer](CVer "wikilink") [CIA](CIA "wikilink") stored in the system-update CFA with the title-version of the CVer title already installed in NAND. |
| 0x00080000     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | This shuts down the gamecard system update interface: the shared memory is unmapped, the CFA archive is closed, state is cleared, etc.                                                                                                                                                                                                                       |
| 0x0009....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                                                                                                                                                                                                                                                                                              |
| 0x000A....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                                                                                                                                                                                                                                                                                              |
| 0x000B....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                                                                                                                                                                                                                                                                                              |
| 0x000C....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Gamecard system update related.                                                                                                                                                                                                                                                                                                                              |
| 0x000D....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [SetFIRMParams4B0](NSS:SetFIRMParams4B0 "wikilink")                                                                                                                                                                                                                                                                                                          |
| 0x000E....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | Wrapper for "ptm:sysm" service command 0x040700C0.                                                                                                                                                                                                                                                                                                           |
| 0x000F....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | ?                                                                                                                                                                                                                                                                                                                                                            |
| 0x00100180     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [RebootSystem](NSS:RebootSystem "wikilink")                                                                                                                                                                                                                                                                                                                  |
| 0x0011....     | [1.0.0-0](1.0.0-0 "wikilink") - [2.0.0-2](2.0.0-2 "wikilink") | [TerminateProcessTID](NSS:TerminateProcessTID "wikilink")                                                                                                                                                                                                                                                                                                    |
| 0x0012....     | ?                                                             | ?                                                                                                                                                                                                                                                                                                                                                            |
| 0x0013....     | ?                                                             | ?                                                                                                                                                                                                                                                                                                                                                            |
| 0x0014....     | ?                                                             | ?                                                                                                                                                                                                                                                                                                                                                            |
| 0x0015....     | ?                                                             | ?                                                                                                                                                                                                                                                                                                                                                            |

The maximum sessions that can be used with this service is two,
therefore only two processes can use this service at the same time.

# APT Services

| Command Header | Available since system version  | Description                                                             |
|----------------|---------------------------------|-------------------------------------------------------------------------|
| 0x00010040     |                                 | GetLockHandle                                                           |
| 0x00020080     |                                 | [Initialize](APTU:Initialize "wikilink")                                |
| 0x00030040     |                                 | Enable                                                                  |
| 0x00040040     |                                 | Finalize                                                                |
| 0x00050040     |                                 | GetAppletManInfo                                                        |
| 0x00060040     |                                 | GetAppletInfo                                                           |
| 0x00070000     |                                 | GetLastSignaledAppletId                                                 |
| 0x00080000     |                                 | CountRegisteredApplet                                                   |
| 0x00090040     |                                 | [IsRegistered](APT:IsRegistered "wikilink")                             |
| 0x000A0040     |                                 | GetAttribute                                                            |
| 0x000B0040     |                                 | [InquireNotification](APTU:GetSignalType "wikilink")                    |
| 0x000C0104     |                                 | [SendParameter](APT:SendParameter "wikilink")                           |
| 0x000D0080     |                                 | [ReceiveParameter](APT:ReceiveParameter "wikilink")                     |
| 0x000E0080     |                                 | [GlanceParameter](APT:GlanceParameter "wikilink")                       |
| 0x000F0100     |                                 | [CancelParameter](APT:CancelParameter "wikilink")                       |
| 0x001000C2     |                                 | DebugFunc                                                               |
| 0x001100C0     |                                 | [MapProgramIdForDebug](APT:MapProgramIdForDebug "wikilink")             |
| 0x00120040     |                                 | SetHomeMenuAppletIdForDebug                                             |
| 0x00130000     |                                 | GetPreparationState                                                     |
| 0x00140040     |                                 | SetPreparationState                                                     |
| 0x00150140     |                                 | [PrepareToStartApplication](APT:PrepareToStartApplication "wikilink")   |
| 0x00160040     |                                 | PreloadLibraryApplet                                                    |
| 0x00170040     |                                 | FinishPreloadingLibraryApplet                                           |
| 0x00180040     |                                 | PrepareToStartLibraryApplet                                             |
| 0x00190040     |                                 | [PrepareToStartSystemApplet](APT:PrepareToStartSystemApplet "wikilink") |
| 0x001A0000     |                                 | PrepareToStartNewestHomeMenu                                            |
| 0x001B00C4     |                                 | [StartApplication](APT:StartApplication "wikilink")                     |
| 0x001C0000     |                                 | WakeupApplication                                                       |
| 0x001D0000     |                                 | CancelApplication                                                       |
| 0x001E0084     |                                 | StartLibraryApplet                                                      |
| 0x001F0084     |                                 | [StartSystemApplet](APT:StartSystemApplet "wikilink")                   |
| 0x00200044     |                                 | [StartNewestHomeMenu](APT:StartNewestHomeMenu "wikilink")               |
| 0x00210000     |                                 | OrderToCloseApplication                                                 |
| 0x00220040     |                                 | PrepareToCloseApplication                                               |
| 0x00230040     |                                 | PrepareToJumpToApplication                                              |
| 0x00240044     |                                 | JumpToApplication                                                       |
| 0x002500C0     |                                 | PrepareToCloseLibraryApplet                                             |
| 0x00260000     |                                 | PrepareToCloseSystemApplet                                              |
| 0x00270044     |                                 | CloseApplication                                                        |
| 0x00280044     |                                 | CloseLibraryApplet                                                      |
| 0x00290044     |                                 | CloseSystemApplet                                                       |
| 0x002A0000     |                                 | OrderToCloseSystemApplet                                                |
| 0x002B0000     |                                 | PrepareToJumpToHomeMenu                                                 |
| 0x002C0044     |                                 | JumpToHomeMenu                                                          |
| 0x002D0000     |                                 | PrepareToLeaveHomeMenu                                                  |
| 0x002E0044     |                                 | LeaveHomeMenu                                                           |
| 0x002F0040     |                                 | PrepareToLeaveResidentApplet                                            |
| 0x00300044     |                                 | LeaveResidentApplet                                                     |
| 0x00310100     |                                 | PrepareToDoApplicationJump                                              |
| 0x00320084     |                                 | DoApplicationJump                                                       |
| 0x00330000     |                                 | GetProgramIdOnApplicationJump                                           |
| 0x00340084     |                                 | SendDeliverArg                                                          |
| 0x00350080     |                                 | ReceiveDeliverArg                                                       |
| 0x00360040     |                                 | LoadSysMenuArg                                                          |
| 0x00370042     |                                 | StoreSysMenuArg                                                         |
| 0x00380040     |                                 | PreloadResidentApplet                                                   |
| 0x00390040     |                                 | PrepareToStartResidentApplet                                            |
| 0x003A0044     |                                 | StartResidentApplet                                                     |
| 0x003B0040     |                                 | CancelLibraryApplet                                                     |
| 0x003C0042     |                                 | SendDspSleep                                                            |
| 0x003D0042     |                                 | SendDspWakeUp                                                           |
| 0x003E0080     |                                 | ReplySleepQuery                                                         |
| 0x003F0040     |                                 | ReplySleepNotificationComplete                                          |
| 0x00400042     |                                 | [SendCaptureBufferInfo](APT:SendCaptureBufferInfo "wikilink")           |
| 0x00410040     |                                 | [ReceiveCaptureBufferInfo](APT:ReceiveCaptureBufferInfo "wikilink")     |
| 0x00420080     |                                 | SleepSystem                                                             |
| 0x00430040     |                                 | NotifyToWait                                                            |
| 0x00440000     |                                 | GetSharedFont                                                           |
| 0x00450040     |                                 | GetWirelessRebootInfo                                                   |
| 0x00460104     |                                 | [Wrap](APT:Wrap "wikilink")                                             |
| 0x00470104     |                                 | [Unwrap](APT:Unwrap "wikilink")                                         |
| 0x00480100     |                                 | [GetProgramInfo](APT:GetProgramInfo "wikilink")                         |
| 0x00490180     |                                 | [Reboot](APT:Reboot "wikilink")                                         |
| 0x004A0040     |                                 | [GetCaptureInfo](APT:GetCaptureInfo "wikilink")                         |
| 0x004B00C2     |                                 | [AppletUtility](APT:AppletUtility "wikilink")                           |
| 0x004C0000     |                                 | SetFatalErrDispMode                                                     |
| 0x004D0080     |                                 | [GetAppletProgramInfo](APT:GetAppletProgramInfo "wikilink")             |
| 0x004E0000     |                                 | HardwareResetAsync                                                      |
| 0x004F....     | ?                               | ?                                                                       |
| 0x0050....     | ?                               | ?                                                                       |
| 0x0051....     | ?                               | ?                                                                       |
| 0x0052....     | ?                               | ?                                                                       |
| 0x0053....     | ?                               | ?                                                                       |
| 0x00540040     | [5.0.0-11](5.0.0-11 "wikilink") | ?                                                                       |

These "<APT:U>" and "<APT:S>" applet services can handle launching
"applets", these services handle signaling for home/power button as
well. Only one session for either APT service can be open at a time,
normally processes close the service handle immediately once finished
using the service.

Applets returning to home-menu first use commands
<APT:PrepareToJumpToHomeMenu> and <APT:JumpToHomeMenu>, followed by
these commands to launch home-menu:
[<APT:PrepareToStartSystemApplet>](APT:PrepareToStartSystemApplet "wikilink")
and [<APT:StartSystemApplet>](APT:StartSystemApplet "wikilink").
[<APT:PrepareToStartSystemApplet>](APT:PrepareToStartSystemApplet "wikilink")
and [<APT:StartSystemApplet>](APT:StartSystemApplet "wikilink") are also
used for launching the [Internet Browser](Internet_Browser "wikilink"),
the camera applet, etc.

Processes launch applications via home-menu, not directly with
[<APT:PrepareToStartApplication>](APT:PrepareToStartApplication "wikilink")
and [<APT:StartApplication>](APT:StartApplication "wikilink"). Regular
applications can't directly launch applications since
[<APT:StartApplication>](APT:StartApplication "wikilink") launches the
process without terminating the currently running application.

<APT:PrepareToDoApplicationJump> and <APT:DoApplicationJump> are used
for launching applications(CTR/TWL applications, etc), for
non-NATIVE_FIRM titles this does a FIRM launch.

# AppIDs

| AppID | Description                                     |
|-------|-------------------------------------------------|
| 0x101 | Home Menu                                       |
| 0x110 | Camera applet                                   |
| 0x114 | [Internet Browser](Internet_Browser "wikilink") |
| 0x300 | Application                                     |

[Category:Services](Category:Services "wikilink")
[Category:服务](Category:服务 "wikilink")
[Category:中文翻译计划](Category:中文翻译计划 "wikilink")
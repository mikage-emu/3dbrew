Beginning with the [2.0.0-2](2.0.0-2 "wikilink") update, system updates
are automatically downloaded via the [NIM](NIM_Services "wikilink")
module. The system only downloads updates, Home Menu will only
[finalize](NIMU:FinishTitlesInstall "wikilink") update installation once
the user gives permission for that(via the "Install system update"
dialog). Each time the event handle from [NIMU](NIM_Services "wikilink")
command 0x00050000 is signaled, Home Menu uses
[NIMU:GetState](NIM_Services "wikilink") and
[NIMU:CheckSysupdateAvailable](NIMU:CheckSysupdateAvailable "wikilink")
to check whether a system update is available. When an update is
available Home Menu will then set some Home Menu state flags, which
likely indicate that the "Install system update" dialog should be shown.

The system checks for updates every 24 hours, then downloads all updated
titles if an update is available. This is the same as doing a system
update via [System Settings](System_Settings "wikilink"), except with
this the update installation will not be finalized until [Home
Menu](Home_Menu "wikilink") uses the
[NIMU:FinishTitlesInstall](NIMU:FinishTitlesInstall "wikilink") command.

It is possible to erase this update data by entering the [Recovery
Mode](Recovery_Mode "wikilink").
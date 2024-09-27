+++
title = 'Setting Up Development Environment'
+++

# Setup

Install [devkitARM](https://devkitpro.org/). If it's already installed,
update it using sudo (dkp-)pacman -Syu. On Windows, there's a [graphical
installer](https://github.com/devkitPro/installer/releases/latest). On
Unix-like platforms such as Linux/macOS, there's
[pacman](https://github.com/devkitPro/pacman/releases/latest)..

## Windows

- If you already use msys2 then you can follow the instructions at
  <https://github.com/devkitPro/pacman/releases/latest> to add the
  devkitPro repositories.

Otherwise

- [download the latest version of the graphical
  installer](https://github.com/devkitPro/installer/releases/latest)
  from github and run it, following the instructions as you go.
- An Internet connection is required.
- Ensure at least "3DS Development" is ticked - you can also leave the
  other options ticked if you wish.
- Once the installer has finished, launch MSYS from:
  - Windows 7 and earlier: Start -\> All Programs -\> devkitPro -\> MSYS
  - Windows 8 and 8.1: Right click on the Start screen and select 'All
    Apps'. You should find MSYS there.
  - Windows 10 (pre-Anniversary Update): Start -\> All Apps -\>
    devkitPro -\> MSYS
  - Windows 10 (post-Anniversary Update): Start -\> devkitPro -\> MSYS

Alternatively starting with Windows 10 Anniversary Update (Version
1607), the [Windows Subsystem for Linux
(WSL)](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)
may also be used to run the Linux version of devkitARM. Unless you have
some particular need for WSL it's recommended that you stick to a more
standard environment.

## Unix-like platforms

Currently devkitPro provides precompiled versions of devkitARM for the
following Unix-like platforms: Linux (x86_64), macOS (x86_64). Note that
Linux x86_64 binaries are usable under WSL.

- Follow the instructions to install pacman found at
  <https://github.com/devkitPro/pacman/releases/latest>
- run sudo (dkp-)pacman -S 3ds-dev to install the tools and libraries
  for 3ds development
- logout and login again to get the environment settings needed.

# Building the examples

3DS examples are still being created; however, there are a growing
number of examples available from the [devkitPro/3ds-examples GitHub
repository](https://github.com/devkitPro/3ds-examples). These are
downloaded by the installer and can be found in \$DEVKITPRO/examples/3ds

These can be built from the command line.

To start a new homebrew project from the `bash` shell, simply type the
following (replacing **`~/projects/my3dsproject`** with the place you
would like your project to be stored, with `~` meaning your HOME
directory):

`cp -r $DEVKITPRO/examples/3ds/templates/application `**`~/projects/my3dsproject`**
`cd `**`~/projects/my3dsproject`**

The standard Makefile will use the folder as the name of the 3dsx that
will be built. You can keep that behaviour or simply change the
`TARGET := $(notdir $(CURDIR))` line in the Makefile to explicitly name
your project.

To compile it, type `make` in the project directory.

## Running your code

To run it on your 3DS, start the Homebrew Launcher, press Y to open the
network loader, then on your PC type:
`$DEVKITPRO/tools/bin/3dslink `**`my3dsproject`**`.3dsx`, replacing
**my3dsproject** with the name of the 3dsx file you want to run.)

If all goes well, you'll soon see your application running on your 3DS.
If not, it could help to add `-a `**`ipaddress`**, replacing
**ipaddress** with the ip address of the console (visible on homebrew
launcher after pressing Y).

# Troubleshooting

**I get the "Please set DEVKITARM in your environment." error.**

Ensure you have the devkit-env package installed - (dkp-)pacman -Sl \|
grep devkit-env. Logout and login to get the enviroment settings.

For WSL users, you need to close the Bash shell, then reopen it for WSL
to reload all of the variables from a clean state.
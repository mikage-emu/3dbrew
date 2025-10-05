+++
title = 'StreetPass Mii Plaza'
+++

## Overview

This is [system title](Title_list#00040010---system-applications "wikilink") pre-installed on all 3DS units since launch. The application is centered around using [StreetPass](StreetPass "wikilink") to "meet" other 3DS owners, by walking near them and exchanging Mii/user data (this is done automatically through StreetPass). When a 3DS has "met" another 3DS, StreetPass Mii Plaza recreates the meeting using the owner's Miis. From here the user, can use these Miis in mini-games.

While a system app, a software that is centered around the concept of Streetpassing, and arguably the most popular StreetPass app, it is worth noting that it doesn't have intrinsic technical privileges: it can't record Streetpasses between people who don't have both enabled it for Mii Plaza, and the "Invitations" feature is equally available to any software.

## Major Updates

### Launch Version

- Users could decorate their Mii with a Hat, these are earned in StreetPass Quest.

Contained two mini-games:

- Puzzle Swap - The user completes various puzzles slates to complete interactive 3D Images. Pieces for the puzzles can be obtained from Miis met in StreetPass, or by purchasing them with play coins.
- StreetPass Quest(Find Mii) - A simplistic medieval themed RPG where the user's Mii is kidnapped, and the user must use Miis met in StreetPass, to rescue him/her. Additionally wanderers can be hired to fight, paid for with play coins of course.

### Late 2011

- "Achievements" were added, accessible from the main hub.
- Completed Puzzle Swap Slides were viewable in a slideshow, again accessible from the hub
- More Puzzle slates for Puzzle Swap could be added via [SpotPass](SpotPass "wikilink"). The new puzzle slates have puzzle pieces (pink) which cannot be bought with play coins.
- A sequel to StreetPass Quest was added. In the sequel, users could hire (using play coins) previously met Miis to fight. More hats can be earned.
- Music used in StreetPass Mii Plaza, can be played manually via the music player accessible from the main hub.

### 6.0.0-12 Update

- Final update for the Mii Plaza main application
- Now supports SD "Patch Updates", so StreetPass Mii Plaza can be updated without a system update; it also strongly encourages the user to check for updates, as Mii Plaza "v3" launched in this format at the same time.

### Mii Plaza 3.x

- Design Revamped: Instead of a simple popup window, the minigames are accessible from a fountain-shaped hub. [See video](https://www.youtube.com/watch?v=X11AJ4UYE4o).
- Each game, plus the main Plaza and the Entrance, are accessible from touch-screen buttons.
- One of six preset emotions can be selected for the Streetpass greeting.
- Also supports paid "DLC", [4 extra mini-games](https://www.youtube.com/watch?v=u1a05W1UJwQ) are available through micro-transactions made from within the app. The pack of four can be bought at a discount if all the games are purchased at once, and none has been bought yet.
- Songs and achievements are not numbered anymore, due to their availability depending on the selection of games owned.
- StreetPass Quest 1, now supports the ability to hire previously met Miis after completion. This was previously possible as a glitch by recruiting them in Find Mii 2, then selecting the first game.
- Many more hats and outfits can be bought from the "Exchange booth", which inventory changes daily. Tickets are only obtained in the premium games. A "Pixel Mario Hat" is available for free to anyone who installs the update.

### Mii Plaza 4.x

Released April 2015. A commemorative theme and Streetpass relay mixing event also happened in European Nintendo Zones to celebrate its launch.

- The greeting and emotion are now complemented by one of 64 speech bubble themes. Five of them are available for free, the others can be bought wit a ticket each.
- Vault feature to hide games from the fountain. They won't generate a "game still not played with current Miis" warning, and they are still playable or unarchivable from the Vault menu.
- Medals are optionally displayed over cleared games.
- Touch-screen shortcuts can be reordered, partially due to the new games pushing the number of icons over the maximum of 8. This also changes the order of games at the fountain.
- All animations that can be sped up by holding R can now also be sped up with L.
- Two more paid games added, which also form their own bundle.
- Paid "Premium Plaza" DLC adds a number of features:
  - VIP Plaza, to mark up to 100 Miis as favorites. They won't be auto-deleted when the population maxes out, and are easily accessible from the toolbar.
  - Birthday Calendar, which is marked with the birthdays of Miis met after purchase. Tickets are awarded for the completion of each month, and for collecting the 29th of February or your own birthday.
  - Skip Conversations, not to be confused with Skip Greetings, allows the player to streamline the dialogues with Streetpassed Miis. The display of birthdays, number of connections, last played game, eShop link if 3+ players in the last batch have played the same title, and profile (animal/dream/wish) can each be disabled.
  - An already unlocked main BGM can be selected to play as the main theme, regardless of the current population.

### Mii Plaza 5.x

Released september 2016. At the same time, Mii Plaza became the first, and to date the only, system application to have a Miiverse group (if the posting of Home screenshots through Badge Arcade is not considered).

- "Swift Plaza", a new UI which focuses on touchscreen controls and doesn't display old visitors, providing faster loading.
- More speech bubbles and clothing.
- Five new paid games, although one of the first two can be purchased for free. The remaining four are 3 dollars each or 9 for all.
- Only for Premium users:
  - Golden crown-shaped pin attached to the body
  - "Queue" which allows for archiving up to 100 new visitors (as long as there are some current visitors with unplayed minigames) and recalling them later, partially circumventing the need to play all minigames or lose the characters after every 10 or less Streetpasses.

## Save organization

The backup of applications which [save to NAND](System_SaveData "wikilink") has historically been a problem, with no easy way to access them.

Only as of March 2016 homebrews such as [JK's save manager](JK's_save_manager "wikilink") have been released with such access.

### System Save

meet.dat: Your shared Mii, Streetpassed Miis, Streetpass count, achievements, unlocked outfits and speech bubbles, list of obtained puzzle tiles, etc

[Documentation of some addresses of interest of meet.dat](https://www.reddit.com/r/3dshacks/comments/4c5rcp/streetpass_mii_plaza_puzzle_swap_unlock_all/)

### Extdata

Two mostly identical files, apparently containing progress for the paid games.

### Spotpass extdata

Actual images and 3D models for the Spotpass puzzles (all but the first 8 ones).

If this file is missing, the puzzles contained in it will be unavailable until it is redownloaded, at which point any accumulated progress will be remembered.

A backup of this archive is imperative to preserve limited distribution puzzles.

See [PNEL](PNEL "wikilink") for more information on the file structure

## StreetPass Message Format

See [StreetPass Mii Plaza/StreetPass Message Format](StreetPass_Mii_Plaza/StreetPass_Message_Format "wikilink")

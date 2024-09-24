# Summary

Anti Savegame Restore (internally referred to as *Save Data Rollback
Prevention*) is a feature originally implemented in
[FS](Filesystem_services "wikilink") module with
[4.0.0-7](4.0.0-7 "wikilink"), which prevents the user from restoring
previous versions of a savegame image. This feature is not used for
gamecard games. When an old version of the save is detected, the
application will display an error regarding old savegame version, then
delete+recreate the save(similar to when the savegame is corrupted).

# Implementation

When creating the SD savedata, the application generates a random u64
value, then stores it in an arbitary savefile in the savegame FS. The
application then uses the anti-savegame-restore
[FS](Filesystem_services "wikilink") commands to verify the stored
u64(with the u64 loaded by FS module), and to update the u64 used by FS
module. The u64 used by FS module is stored in the FS module
[System_SaveData](System_SaveData "wikilink").

Each time the application writes to the savegame, the u64 value stored
in the savefile should be updated(and the command for updating the NAND
u64 value should be used as well). Usually applications update this
value by incrementing it, however generating a new random-number or
other methods of updating it can be used as well.

# Remove the secure value

It is possible to remove the secure value easily by using
[ControlSecureSave](FS:ControlSecureSave "wikilink"), from the
[fs:USER](Filesystem_services#Filesystem_service_.22fs:USER.22 "wikilink")
service, with the
[SECURESAVE_ACTION_DELETE](FS:ControlSecureSave#Action "wikilink")
action.

# Applications using this feature

- Animal Crossing: New Leaf
- Pokemon X & Y
- Pokemon Omega Ruby & Alpha Sapphire
- Pokemon Omega Ruby & Alpha Sapphire Demo
- Pokemon Shuffle
- Super Smash Bros
- Pokemon Red,Blue and Yellow (GB(C) VC)
- Rusty's Real Deal Baseball
- Megami Meguri
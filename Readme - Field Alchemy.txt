Field Alchemy
Version 2.1.1b
Author: MrJack

--Description--
This mod is for the alchemists out there who would like to practice alchemy at any time during their travels.
Now you can create potions and poisons at any time as long as you have your trustworthy mortar and pestle with you.

This mod can be configured with the Mod Configuration Menu.

Those who don't want to be forced to use SKSE can use version 2.0.0.

--Requirements--
Skyrim (1.9.32.0.8 or later)
SKSE (1.6.16 or later)

--Optional--
SkyUI 4.1 or later for MCM configuration capability

--Compatibility--
Should be compatible with any mods.

--Change log--
2.1.1b:
- New approach to fix the issue with using the mortar and pestle while in the air
- Added a customizable hotkey to use the mortar and pestle on the fly
- Added recipe for crafting mortar and pestle at forges and anvils
- Added the ability to be warned about combat starting while in the crafting menu, which results in an attempt to close the menu
- Updated the mesh for the mortar and pestle to be the same one that is used in the alchemy workbench furniture
- Removed the need to manually exit the inventory screen
- Removed the message stating "This item cannot be equipped", which applies to all misc items
- Removed alembic and related penalty system
- Added French translation
- Added German translation

2.1.1a:
- Recompiled MCM menu script with SkyUI 3.0 SDK.

2.1.1:
- Updated and recompiled the MCM menu script with SkyUI 3.0 beta 3 SDK. If you changed any settings in previous versions, then make sure to check the menu as the settings may have been reset.
- Added translation support and a Spanish translation to the MCM menu. All other languages will use the English translation until I get more translations.
  Here is the link to the Google Docs spreadsheet for translations: https://docs.google.com/spreadsheet/ccc?key=0AmO68LGoHfp2dGFlMTdhOTVFbEo0MHB5S2ZFc0dpN0E
  If you contribute, then please leave your name in an empty cell in the appropriate language column, below the rows containing StringIDs.

2.1.0:
- Added animations

2.0.0:
- Rebuilt from scratch

1.0.0:
- Initial release

--Known issues--
If you use the mortar and pestle in the middle of a jump or fall, then you will fall down to the ground and then teleport back to the point where you used the mortar.
After you close the menu you will fall again.

I have included a fix that can be configured, if you don't like how sensitive it is or if you want to disable it.
The fix works by checking the player's Z position twice in succession. If the difference is too large, then the menu won't open.
Most people will probably not have to worry about this bug or the fix. The default tolerance should be appropriate for most.

--How to use--
i)Acquire a mortar and pestle by exploring Skyrim or buying one from a vendor specializing in alchemical ingredients and potions.
ii)Once you have a mortar and pestle, open your inventory.
iii)Go to the Misc category and click on the mortar and pestle.
iv)Exit the inventory and the crafting menu will appear.

(Pro tip: alembics can be useful tools.)

--How to install--
Copy the Field Alchemy.esp and Field Alchemy.bsa files into "\Skyrim\Data" and enable the ESP in the Skyrim launcher or your favorite mod manager.

--How to uninstall--
Remove the Field Alchemy.esp and Field Alchemy.bsa files from "\Skyrim\Data".

Uninstalling this mod in the middle of a playthrough is not supported due to the nature of the game engine and save files.
This policy is in line with Bethesda's stance on uninstalling official DLC during a playthrough as well as the modding community's best practices.

--Official thread--
http://forums.bethsoft.com/topic/1398315-wiprel-field-alchemy/

--Credits--
Asyrix - Spanish translation
Lorina - German translation
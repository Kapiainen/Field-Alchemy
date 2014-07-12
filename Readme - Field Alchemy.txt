Field Alchemy
Version 2.1.0
Author: MrJack

--Description--
This mod is for the alchemists out there who would like to practice alchemy at any time during their travels.
Now you can create potions and poisons at any time as long as you have your trustworthy mortar and pestle with you.

This mod can be configured with the Mod Configuration Menu.

Those who don't want to be forced to use SKSE can use version 2.0.0.

--Requirements--
Skyrim (1.8.151.07 or later)
SKSE (1.6.5 or later)

--Optional--
SkyUI (3.0 alpha 4 or later) for MCM configuration capability

SkyUI 3.0 alpha versions are only available at the official SkyUI thread(s) on the Bethesda forums. The alpha versions are for testing purposes, so keep that in mind.

--Compatibility--
Should be compatible with any mods.

--Change log--
2.1.0:
- added animations

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
i)Get rid of the following items:
Mortar And Pestle - xx000D66
Alembic - xx000D67

You can use the console command "player.removeitem xxyyyyyy z" (xx depends upon your load order, yyyyyy is unique to each form, z is the amount).

ii)Save your game in a new slot, preferrably in a cell that doesn't contain any of the items listed in the previous step

iii)Delete Field Alchemy.esp and Field Alchemy.bsa from "\Skyrim\Data".

iv)Load the new saved game, create a new saved game in a new slot.

--How to configure--
a)Mod Configuration Menu
i)Select "Field Alchemy" from the MCM menu.
ii)Select the "Options" submenu.
iii)Edit one or more of the available settings.
 Penalty:
 - Apply - Enable/disable penalties to the power of potions and poisons. (True/false, default: false)
 - Efficacy without alembic - Change the efficacy of potions and poisons when crafting without an alembic compared to crafting at a normal alchemy lab. (0-100%, default: 50)
 - Efficacy with alembic - Change the efficacy of potions and poisons when crafting without an alembic compared to crafting at a normal alchemy lab. (0-100%, default: 75)
 Fall fix:
 - Apply - Whether or not to apply the fall fix. (True/false, default: true)
 - Tolerance - The sensitivity of the the fall fix. (0-500, default: 20)
 - Debug - Shows the change in Z position if enabled. Useful for figuring out a suitable tolerance. (True/false, default: false)
iv)Exit MCM.

b)Console
i)Open the console.
ii)Use the "set <globalvariable> to <value>" command to change global variables, names are not case sensitive.
 - Apply penalty - Enable/disable penalties to the power of potions and poisons.
 Name: FiAl_GLOBVAR_Penalty
 Values: 0 or 1, default: 0
 - Efficacy without alembic - Change the efficacy of potions and poisons when crafting without an alembic compared to crafting at a normal alchemy lab. (0-100%)
 Name: FiAl_GLOBVAR_Mortar
 Values: 0-100, default: 50
 - Efficacy with alembic - Change the efficacy of potions and poisons when crafting without an alembic compared to crafting at a normal alchemy lab. (0-100%)
 Name: FiAl_GLOBVAR_Alembic
 Values: 0-100, default: 75
 - Apply fall fix - Enable/disable the fall fix.
 Name: FiAl_GLOBVAR_FallFix
 Values: 0 or 1, default: 1
 - Tolerance - The sensitivity of the the fall fix.
 Name: FiAl_GLOBVAR_FallMargin
 Values: 0-500
 - Debug - Shows the change in Z position if enabled. Useful for figuring out a suitable tolerance.
 Name: FiAl_GLOBVAR_FallDebug
 Values: 0 or 1, default: 0


 Examples:
 -Turn on penalties: set fial_globvar_penalty to 1
 - Change efficacy of crafting without an alembic to 33%: set fial_globvar_mortar to 33
 - Change efficacy of crafting with an alembic to 66%: set fial_globvar_alembic to 66
 - Turn off the fall fix: set fial_globvar_fallfix to 0
 - Change the tolerance of the fall fix to 25 units: set fial_globvar_fallmargin to 25
 - Turn on fall fix debug mode: set fial_globvar_falldebug to 1

 (Optional) Check the current values of global variables by typing "help fial_globvar".
iii)Close the console.

--Official thread--
http://forums.bethsoft.com/topic/1398315-wiprel-field-alchemy/

--Credits--
InsanitySorrow - mortar and pestle mesh and texture from "Insanity's Clutter Stuffs"
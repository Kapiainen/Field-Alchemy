Scriptname FiAl_SCRIPT_AlchemyWorkbench extends ObjectReference  

Actor Property PlayerRef Auto
Float Property DeleteDelay Auto
MiscObject Property Alembic Auto
MiscObject Property TolfdirsAlembic Auto
GlobalVariable Property GV_Penalty Auto
GlobalVariable Property GV_Mortar Auto
GlobalVariable Property GV_Alembic Auto
int AlembicCount = 0
int Penalty = 0

Event OnActivate(ObjectReference akActionRef)
	if(GV_Penalty.GetValue() as int == 1)
		AlembicCount = PlayerRef.GetItemCount(Alembic) + PlayerRef.GetItemCount(TolfdirsAlembic)
		if(AlembicCount > 0)
			Penalty = 100-GV_Alembic.GetValue() as int
		else
			Penalty = 100-GV_Mortar.GetValue() as int
		endif
		PlayerRef.ModAV("AlchemyPowerMod", -Penalty)
	endif
	RegisterForMenu("Crafting Menu")
EndEvent

Event OnMenuClose(String MenuName)
	if(MenuName == "Crafting Menu")
		Utility.Wait(DeleteDelay)
		Self.Delete()
		PlayerRef.ModAV("AlchemyPowerMod", Penalty)
		UnregisterForMenu("Crafting Menu")
	endif
EndEvent
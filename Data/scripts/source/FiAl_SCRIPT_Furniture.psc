Scriptname FiAl_SCRIPT_Furniture extends ObjectReference  

Actor Property PlayerRef Auto
GlobalVariable Property FiAl_GLOBVAR_Penalty Auto
GlobalVariable Property FiAl_GLOBVAR_PenaltyMag Auto
Float fDeleteDelay = 3.0

Event OnActivate(ObjectReference akActionRef)
	RegisterForMenu("Crafting menu")
EndEvent

Event OnMenuClose(String MenuName)
	if(MenuName == "Crafting Menu")
		If(FiAl_GLOBVAR_Penalty.GetValue() as Bool)
			PlayerRef.ModAV("AlchemyPowerMod", FiAl_GLOBVAR_PenaltyMag.GetValue() as Int)
		EndIf
		Utility.Wait(fDeleteDelay)
		UnregisterForMenu("Crafting Menu")
		Self.Delete()
	endif
EndEvent
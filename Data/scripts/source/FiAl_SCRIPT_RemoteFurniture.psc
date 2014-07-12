Scriptname FiAl_SCRIPT_RemoteFurniture extends ObjectReference  

Actor Property PlayerRef Auto
GlobalVariable Property FiAl_GLOBVAR_Penalty Auto
GlobalVariable Property FiAl_GLOBVAR_PenaltyMag Auto
Float fDeleteDelay = 3.0

Event OnActivate(ObjectReference akActionRef)
	RegisterForMenu("Crafting Menu")
EndEvent

Event OnMenuClose(String MenuName)
	;Debug.Notification("Crafting menu closed")
	If(MenuName == "Crafting Menu")
		If(FiAl_GLOBVAR_Penalty.GetValue() as Bool)
			PlayerRef.ModAV("AlchemyPowerMod", FiAl_GLOBVAR_PenaltyMag.GetValue() as Int)
		EndIf
		UnregisterForMenu("Crafting Menu")
	EndIf
EndEvent
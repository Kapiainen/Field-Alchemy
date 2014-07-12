Scriptname FiAl_SCRIPT_AlchemyWorkbench extends ObjectReference  

Actor Property PlayerRef Auto
Float DeleteDelay = 3.0

Event OnActivate(ObjectReference akActionRef)
	RegisterForMenu("Crafting Menu")
EndEvent

Event OnMenuOpen(String MenuName)
	If(MenuName == "Crafting Menu")

	EndIf
EndEvent

Event OnMenuClose(String MenuName)
	if(MenuName == "Crafting Menu")
		Utility.Wait(DeleteDelay)
		Self.Delete()
		UnregisterForMenu("Crafting Menu")
	endif
EndEvent
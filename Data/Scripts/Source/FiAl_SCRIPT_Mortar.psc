Scriptname FiAl_SCRIPT_Mortar extends ObjectReference  

Actor Property PlayerRef Auto
ObjectReference Property AlchemyWorkbench Auto
Float Property Delay Auto

Event OnEquipped(Actor akActor)
	Utility.Wait(Delay)
	AlchemyWorkbench.Activate(PlayerRef)
EndEvent
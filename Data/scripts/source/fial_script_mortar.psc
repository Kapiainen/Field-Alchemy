Scriptname FiAl_SCRIPT_Mortar extends ObjectReference  

Actor Property PlayerRef Auto
Float Property fDelay Auto
Furniture Property F_AlchemyLab Auto
ObjectReference OR_AlchemyLab

Event OnEquipped(Actor akActor)
	If(!PlayerRef.IsInCombat() && !PlayerRef.IsOnMount())
		Input.TapKey(1)
		While(IsMoving())
			Utility.Wait(0.25)
		EndWhile
		Utility.Wait(fDelay)
		OR_AlchemyLab = PlayerRef.PlaceAtMe(F_AlchemyLab)
		Utility.Wait(fDelay)
		OR_AlchemyLab.Activate(PlayerRef)
	EndIf
EndEvent

Bool Function IsMoving()
	Float fPreX = PlayerRef.GetPositionX()
	Float fPreY = PlayerRef.GetPositionY()
	Float fPreZ = PlayerRef.GetPositionZ()
	Utility.Wait(0.5)
	Float fPostX = PlayerRef.GetPositionX()
	Float fPostY = PlayerRef.GetPositionY()
	Float fPostZ = PlayerRef.GetPositionZ()
	If((fPostX - fPreX != 0.0) && (fPostY - fPreY != 0.0) && (fPostZ - fPreZ != 0.0))
		Return True
	Else
		Return False
	EndIf
EndFunction

Scriptname FiAl_SCRIPT_Mortar extends ObjectReference  

Actor Property PlayerRef Auto
Furniture Property F_AlchemyLab Auto
MiscObject Property TolfdirsAlembic Auto
MiscObject Property Alembic Auto
ObjectReference Property OR_RemoteAlchemyLab Auto
GlobalVariable Property FiAl_GLOBVAR_Penalty Auto
GlobalVariable Property FiAl_GLOBVAR_SansAlembic Auto
GlobalVariable Property FiAl_GLOBVAR_WithAlembic Auto
GlobalVariable Property FiAl_GLOBVAR_PenaltyMag Auto
GlobalVariable Property FiAl_GLOBVAR_PlayerInInn Auto

ObjectReference OR_AlchemyLab
Float fDelay = 0.2
Bool bHasAlembic
Float iPenalty

Event OnEquipped(Actor akActor)
	If(!PlayerRef.IsInCombat() && !PlayerRef.IsOnMount())
		;Input.TapKey(1) ;Old method, not very gamepad friendly
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		While(IsMoving())
			Utility.Wait(0.25)
		EndWhile
		If(FiAl_GLOBVAR_PlayerInInn.GetValueInt() == 1)
			OR_AlchemyLab = OR_RemoteAlchemyLab
		Else
			OR_AlchemyLab = PlayerRef.PlaceAtMe(F_AlchemyLab)
			Utility.Wait(fDelay)
		EndIf
		If(FiAl_GLOBVAR_Penalty.GetValue() as Bool)
			bHasAlembic = PlayerRef.GetItemCount(Alembic) + PlayerRef.GetItemCount(TolfdirsAlembic)
			If(bHasAlembic)
				iPenalty = 100-FiAl_GLOBVAR_WithAlembic.GetValue() as Int
			Else
				iPenalty = 100-FiAl_GLOBVAR_SansAlembic.GetValue() as Int
			EndIf
			PlayerRef.ModAV("AlchemyPowerMod", -iPenalty)
			FiAl_GLOBVAR_PenaltyMag.SetValue(iPenalty)
		EndIf
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

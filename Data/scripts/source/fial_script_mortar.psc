Scriptname FiAl_SCRIPT_Mortar extends ObjectReference  

Actor Property PlayerRef Auto
Float Property Delay Auto
Furniture Property F_AlchemyLab Auto
ObjectReference OR_AlchemyLab
GlobalVariable Property FallMargin Auto
GlobalVariable Property FallFix Auto
GlobalVariable Property FallDebug Auto

Event OnEquipped(Actor akActor)
	if((PlayerRef.IsInCombat() == false) && (PlayerRef.IsOnMount() == false) && (IsFalling() == false))
		Utility.Wait(Delay)
		OR_AlchemyLab = PlayerRef.PlaceAtMe(F_AlchemyLab)
		Utility.Wait(Delay)
		OR_AlchemyLab.Activate(PlayerRef)
	endif
EndEvent

bool Function IsFalling()
	float Before
	float After
	float Margin = FallMargin.GetValue() as float
	Before = PlayerRef.GetPositionZ()
	Utility.Wait(0.1)
	After = PlayerRef.GetPositionZ()
	if(FallDebug.GetValue() as int == 1)
		Debug.Notification("Delta: " +(After-Before))
	endif
	if(FallFix.GetValue() as int == 1)
		if((After > (Before+Margin)) || (After < (Before-Margin)))
			return true
		else
			return false
		endif
	else
		return false
	endif
EndFunction
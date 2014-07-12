Scriptname FiAl_SCRIPT_AlchemyWorkbench extends ObjectReference  

Actor Property PlayerRef Auto
Float Property Update Auto
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
		ModifyAlchemy(1)
		RegisterForSingleUpdate(Update)
	endif
EndEvent

Event OnUpdate()
	if(!Game.IsLookingControlsEnabled())
		RegisterForSingleUpdate(Update)
	else
		ModifyAlchemy(0)
	endif
EndEvent

Function ModifyAlchemy(int Mode)
	if(AlembicCount > 0)
		Penalty = 100-GV_Alembic.GetValue() as int
	else
		Penalty = 100-GV_Mortar.GetValue() as int
	endif
	if(Mode == 1)
		PlayerRef.ModAV("AlchemyPowerMod", -Penalty)
	elseif(Mode == 0)
		PlayerRef.ModAV("AlchemyPowerMod", Penalty)
	endif
EndFunction
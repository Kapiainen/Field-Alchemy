Scriptname FiAl_SCRIPT_Merchants extends Quest

LeveledItem Property Common75  Auto
MiscObject Property Mortar Auto
MiscObject Property Alembic Auto
GlobalVariable Property FiAl_GLOBVAR_Hearthfire Auto
ConstructibleObject Property FiAl_COBJ_Alembic Auto

Form kGlass

Event OnInit()
	Maintenance()
EndEvent

Function Maintenance()
	;Debug.Notification("Adding items to vendors")
	Common75.AddForm(Mortar, 1, 3)
	Common75.AddForm(Alembic, 1, 2)
	kGlass = Game.GetFormFromFile(0x01005A69, "HearthFires.esm")
	If(kGlass as Bool)
		FiAl_COBJ_Alembic.SetNthIngredient(kGlass, 0)
		FiAl_GLOBVAR_Hearthfire.SetValue(1)
	EndIf
EndFunction
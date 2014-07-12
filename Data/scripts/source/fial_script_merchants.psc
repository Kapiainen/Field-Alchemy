Scriptname FiAl_SCRIPT_Merchants extends Quest

LeveledItem Property Uncommon75  Auto  
LeveledItem Property Common75  Auto  
MiscObject Property Mortar Auto
MiscObject Property Alembic Auto

Event OnInit()
	Maintenance()
EndEvent

Function Maintenance()
	;Debug.Notification("Adding items to vendors")
	Common75.AddForm(Mortar, 1, 1)
	Common75.AddForm(Alembic, 1, 1)
EndFunction
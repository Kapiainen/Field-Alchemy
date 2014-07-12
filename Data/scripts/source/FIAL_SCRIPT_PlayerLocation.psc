Scriptname FIAL_SCRIPT_PlayerLocation extends ReferenceAlias  

Keyword Property LocTypeInn Auto
GlobalVariable Property FIAL_GlobVar_PlayerInInn Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If(akNewLoc.HasKeyword(LocTypeInn) && !akOldLoc.HasKeyword(LocTypeInn))
		;Debug.Notification("Player has entered an inn location")
		FIAL_GlobVar_PlayerInInn.SetValue(1)
	ElseIf(akOldLoc.HasKeyWord(LocTypeInn) && !akNewLoc.HasKeyword(LocTypeInn))
		;Debug.Notification("Player has exited an inn location")
		FIAL_GlobVar_PlayerInInn.SetValue(0)
	Else
		;Debug.Notification("Player has changed location")
	EndIf
EndEvent
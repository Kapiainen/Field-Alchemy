Scriptname FiAl_SCRIPT_MCM extends SKI_ConfigBase

GlobalVariable Property FiAl_GLOBVAR_Hotkey Auto

int Hotkey

Event OnPageReset(string Page)

	if(Page == "")
		LoadCustomContent("Field Alchemy/MCM/Logo.dds", 128.0, -32.0)
		return
	else
		UnloadCustomContent()
	endif

	if(Page == "Options")
		;Update states
		Hotkey = FiAl_GLOBVAR_Hotkey.GetValue() as int
		
		;Draw menu
		AddKeyMapOptionST("HotkeyST", "Hotkey", Hotkey)
	endif

EndEvent

State HotkeyST
	Event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		bool bContinue = True
		If(conflictControl != "")
			string sMSG
			If(conflictName != "")
				sMSG = "This key is already mapped to:\n" + conflictControl + "\n(" + conflictName + ")\n\nAre you sure you want to continue?"
			else
				sMSG = "This key is already mapped to:\n" + conflictControl + "\n\nAre you sure you want to continue?"
			endIf

			bContinue = ShowMessage(sMSG, true, "$Yes", "$No")
		EndIf

		If (bContinue)
				UnregisterForKey(Hotkey)
				Hotkey = newKeyCode
				SetKeyMapOptionValueST(Hotkey)
				FiAl_GLOBVAR_Hotkey.SetValue(Hotkey)
				RegisterForKey(Hotkey)
		EndIf
	EndEvent
	
	Event OnDefaultST()
		UnregisterForKey(Hotkey)
		Hotkey = 0
		SetKeyMapOptionValueST(Hotkey)
		FiAl_GLOBVAR_Hotkey.SetValue(Hotkey)
	EndEvent
EndState

string Function GetCustomControl(int keyCode)
	If(keyCode == Hotkey)
		Return "Equip mortar and pestle"
	Else
		Return ""
	EndIf
EndFunction

;######################################################################
;Hotkey section
;######################################################################
MiscObject Property kMortar Auto
Actor Property PlayerRef Auto
Furniture Property F_AlchemyLab Auto

ObjectReference OR_AlchemyLab
Float fDelay = 0.2

Event OnKeyDown(Int KeyCode)
	;Debug.Notification("Mortars: " +PlayerRef.GetItemCount(kMortar))
	If(KeyCode == Hotkey && PlayerRef.GetItemCount(kMortar) > 0 && !PlayerRef.IsInCombat() && !PlayerRef.IsOnMount())
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

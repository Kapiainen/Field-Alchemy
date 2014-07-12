Scriptname FiAl_SCRIPT_MCM extends SKI_ConfigBase

;--Properties--
GlobalVariable Property FiAl_GLOBVAR_Hotkey Auto
GlobalVariable Property FiAl_GLOBVAR_Penalty Auto
GlobalVariable Property FiAl_GLOBVAR_SansAlembic Auto
GlobalVariable Property FiAl_GLOBVAR_WithAlembic Auto

;--Local variables--
Int iHotkey
Bool bPenalty
Float fSansAlembic
Float fWithAlembic

Event OnPageReset(string Page)
	If(Page == "")
		LoadCustomContent("Field Alchemy/MCM/Logo.dds", 128.0, -32.0)
		Return
	Else
		UnloadCustomContent()
	EndIf

	If(Page == "Options")
		;Update local variables
		iHotkey = FiAl_GLOBVAR_Hotkey.GetValue() as Int
		bPenalty = FiAl_GLOBVAR_Penalty.GetValue() as Bool
		fSansAlembic = FiAl_GLOBVAR_SansAlembic.GetValue() as Float
		fWithAlembic = FiAl_GLOBVAR_WithAlembic.GetValue() as Float
		
		;Draw menu
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Hotkey")
		AddKeyMapOptionST("HotkeyST", "Hotkey", iHotkey)
		SetCursorPosition(1)
		AddHeaderOption("Efficacy")
		AddToggleOptionST("PenaltyST", "Apply", bPenalty)
		AddSliderOptionST("SansAlembicST", "Without an alembic", fSansAlembic, "{0}%")
		AddSliderOptionST("WithAlembicST", "With an alembic", fWithAlembic, "{0}%")
	EndIf
EndEvent

State HotkeyST
	Event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		Bool bContinue = True
		If(conflictControl != "")
			String sMSG
			If(conflictName != "")
				sMSG = "This key is already mapped to:\n" + conflictControl + "\n(" + conflictName + ")\n\nAre you sure you want to continue?"
			Else
				sMSG = "This key is already mapped to:\n" + conflictControl + "\n\nAre you sure you want to continue?"
			EndIf

			bContinue = ShowMessage(sMSG, true, "$Yes", "$No")
		EndIf

		If (bContinue)
				UnregisterForKey(iHotkey)
				iHotkey = newKeyCode
				SetKeyMapOptionValueST(iHotkey)
				FiAl_GLOBVAR_Hotkey.SetValue(iHotkey)
				RegisterForKey(iHotkey)
		EndIf
	EndEvent
	
	Event OnDefaultST()
		UnregisterForKey(iHotkey)
		iHotkey = 0
		SetKeyMapOptionValueST(iHotkey)
		FiAl_GLOBVAR_Hotkey.SetValue(iHotkey)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Select the hotkey that brings up the alchemy menu.\nDefault: None")
	EndEvent
EndState

State PenaltyST
	Event OnSelectST()
		bPenalty = !bPenalty
		SetToggleOptionValueST(bPenalty)
		FiAl_GLOBVAR_Penalty.SetValue(bPenalty as Int)
	EndEvent

	Event OnDefaultST()
		bPenalty = false
		SetToggleOptionValueST(bPenalty)
		FiAl_GLOBVAR_Penalty.SetValue(bPenalty as Int)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("Whether or not portable alchemy has a lower efficacy compared to crafting stations.\nDefault: False")
	EndEvent
EndState

State SansAlembicST
	Event OnSliderOpenST()
		SetSliderDialogStartValue(fSansAlembic)
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	EndEvent

	Event OnSliderAcceptST(float value)
		fSansAlembic = value
		SetSliderOptionValueST(fSansAlembic, "{0}%")
		FiAl_GLOBVAR_SansAlembic.SetValue(fSansAlembic)
	EndEvent

	Event OnDefaultST()
		fSansAlembic = 50
		SetSliderOptionValueST(fSansAlembic, "{0}%")
		FiAl_GLOBVAR_SansAlembic.SetValue(fSansAlembic)
	EndEvent

	Event OnHighlightST()
		SetInfoText("Select the efficacy of portable alchemy without an alembic.\nDefault: 50%")
	EndEvent
EndState

State WithAlembicST
	Event OnSliderOpenST()
		SetSliderDialogStartValue(fWithAlembic)
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	EndEvent

	Event OnSliderAcceptST(float value)
		fWithAlembic = value
		SetSliderOptionValueST(fWithAlembic, "{0}%")
		FiAl_GLOBVAR_WithAlembic.SetValue(fWithAlembic)
	EndEvent

	Event OnDefaultST()
		fWithAlembic = 75
		SetSliderOptionValueST(fWithAlembic, "{0}%")
		FiAl_GLOBVAR_WithAlembic.SetValue(fWithAlembic)
	EndEvent

	Event OnHighlightST()
		SetInfoText("Select the efficacy of portable alchemy with an alembic.\nDefault: 75%")
	EndEvent
EndState

String Function GetCustomControl(Int keyCode)
	If(keyCode == iHotkey)
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
MiscObject Property TolfdirsAlembic Auto
MiscObject Property Alembic Auto
GlobalVariable Property FiAl_GLOBVAR_PenaltyMag Auto

ObjectReference OR_AlchemyLab
Float fDelay = 0.2
Float fDeleteDelay = 3.0
Bool bHasAlembic
Float iPenalty

Event OnKeyDown(Int KeyCode)
	If(KeyCode == iHotkey && !UI.IsMenuOpen("Console") && !PlayerRef.IsInCombat() && !PlayerRef.IsOnMount() && PlayerRef.GetItemCount(kMortar) > 0)
		While(IsMoving())
			Utility.Wait(0.25)
		EndWhile
		OR_AlchemyLab = PlayerRef.PlaceAtMe(F_AlchemyLab)
		Utility.Wait(fDelay)
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

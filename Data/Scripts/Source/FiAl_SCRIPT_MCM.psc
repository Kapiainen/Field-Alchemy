Scriptname FiAl_SCRIPT_MCM extends SKI_ConfigBase

;--Global variables--
GlobalVariable Property GV_Penalty Auto	;Apply penalty
GlobalVariable Property GV_Mortar Auto	;Efficacy of mortar only crafting
GlobalVariable Property GV_Alembic Auto	;Efficacy of mortar with alembic crafting
GlobalVariable Property GV_FallFix Auto
GlobalVariable Property GV_FallMargin Auto
GlobalVariable Property GV_FallDebug Auto

;--OIDs--
int Penalty_T
int Mortar_S
int Alembic_S
int FallFix_T
int FallMargin_S
int FallDebug_T

;--States--
bool Penalty = false
float Mortar = 50.0
float Alembic = 75.0
bool FallFix = true
float FallMargin = 20.0
bool FallDebug = false

Event OnPageReset(string Page)

	if(Page == "")
		LoadCustomContent("Field Alchemy/MCM/Logo.dds", 128.0, -32.0)
		return
	else
		UnloadCustomContent()
	endif

	if(Page == "About")
		LoadCustomContent("Field Alchemy/MCM/About.dds", 128.0, -32.0)
		return
	else
		UnloadCustomContent()
	endif

	if(Page == "Options")
		;Update states
		Penalty = GV_Penalty.GetValue() as bool
		Mortar = GV_Mortar.GetValue() as float
		Alembic = GV_Alembic.GetValue() as float
		FallFix = GV_FallFix.GetValue() as bool
		FallMargin = GV_FallMargin.GetValue() as float

		;Draw menu
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Penalty")
		Penalty_T = AddToggleOption("Apply", Penalty)
		Mortar_S = AddSliderOption("Efficacy without alembic", Mortar)
		Alembic_S = AddSliderOption("Efficacy with alembic", Alembic)
		SetCursorPosition(1)
		AddHeaderOption("Fall fix")
		FallFix_T = AddToggleOption("Apply", FallFix)
		FallMargin_S = AddSliderOption("Tolerance", FallMargin)
		FallDebug_T = AddToggleOption("Debug", FallDebug)
	endif

EndEvent

Event OnOptionHighlight(int Option)

	if(Option == Penalty_T)
		SetInfoText("Whether or not a penalty is applied when practicing field alchemy.\nDefault: False")
	elseif(Option == Mortar_S) 
		SetInfoText("Efficacy of created potions and poisons when only using a mortar and pestle.\nDefault: 50%")
	elseif(Option == Alembic_S) 
		SetInfoText("Efficacy of created potions and poisons when using an alembic along with the mortar and pestle.\nDefault: 75%")
	elseif(Option == FallFix_T)
		SetInfoText("Whether or not to apply the fall fix.\nDefault: True")
	elseif(Option == FallMargin_S)
		SetInfoText("The tolerance for detecting whether or not the player is falling.\nDefault: 5")
	elseif(Option == FallDebug_T)
		SetInfoText("Shows the change in Z position.\nDefault: False")
	endif

EndEvent

Event OnOptionSelect(int Option)

	if(Option == Penalty_T)
		Penalty = !Penalty
		SetToggleOptionValue(Penalty_T, Penalty)
		GV_Penalty.SetValue(Penalty as int)
	elseif(Option == FallFix_T)
		FallFix = !FallFix
		SetToggleOptionValue(FallFix_T, FallFix)
		GV_FallFix.SetValue(FallFix as int)
	elseif(Option == FallDebug_T)
		FallDebug = !FallDebug
		SetToggleOptionValue(FallDebug_T, FallDebug)
		GV_FallDebug.SetValue(FallDebug as int)
	endif

EndEvent

Event OnOptionSliderOpen(int Option)

	if(Option == Mortar_S)
		SetSliderDialogStartValue(Mortar)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif(Option == Alembic_S)
		SetSliderDialogStartValue(Alembic)
		SetSliderDialogDefaultValue(75.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif(Option == FallMargin_S)
		SetSliderDialogStartValue(FallMargin)
		SetSliderDialogDefaultValue(20.0)
		SetSliderDialogRange(0.0, 500.0)
		SetSliderDialogInterval(5.0)
	endif

EndEvent

Event OnOptionSliderAccept(int Option, float Value)

	if(Option == Mortar_S)
		Mortar = Value
		SetSliderOptionValue(Mortar_S, Mortar)
		GV_Mortar.SetValue(Mortar)
	elseif(Option == Alembic_S)
		Alembic = Value
		SetSliderOptionValue(Alembic_S, Alembic)
		GV_Alembic.SetValue(Alembic)
	elseif(Option == FallMargin_S)
		FallMargin = Value
		SetSliderOptionValue(FallMargin_S, FallMargin)
		GV_FallMargin.SetValue(FallMargin)
	endif

EndEvent

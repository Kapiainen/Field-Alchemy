Scriptname FiAl_SCRIPT_MCM extends SKI_ConfigBase

;--Global variables--
GlobalVariable Property FiAl_GLOBVAR_Penalty Auto
GlobalVariable Property FiAl_GLOBVAR_Mortar Auto
GlobalVariable Property FiAl_GLOBVAR_Alembic Auto
GlobalVariable Property FiAl_GLOBVAR_FallFix Auto
GlobalVariable Property FiAl_GLOBVAR_FallMargin Auto
GlobalVariable Property FiAl_GLOBVAR_FallDebug Auto

;--OIDs--
int Penalty_T
int Mortar_S
int Alembic_S
int FallFix_T
int FallMargin_S
int FallDebug_T

;--States--
bool Penalty
float Mortar
float Alembic
bool FallFix
float FallMargin
bool FallDebug

Event OnPageReset(string Page)

	if(Page == "")
		LoadCustomContent("Field Alchemy/MCM/Logo.dds", 128.0, -32.0)
		return
	else
		UnloadCustomContent()
	endif

	if(Page == "$FiAl_About")
		LoadCustomContent("Field Alchemy/MCM/About.dds", 128.0, -32.0)
		return
	else
		UnloadCustomContent()
	endif

	if(Page == "$FiAl_Options")
		;Update states
		Penalty = FiAl_GLOBVAR_Penalty.GetValue() as bool
		Mortar = FiAl_GLOBVAR_Mortar.GetValue() as float
		Alembic = FiAl_GLOBVAR_Alembic.GetValue() as float
		FallFix = FiAl_GLOBVAR_FallFix.GetValue() as bool
		FallMargin = FiAl_GLOBVAR_FallMargin.GetValue() as float
		FallDebug = FiAl_GLOBVAR_FallDebug.GetValue() as bool

		;Draw menu
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$FiAl_Penalty")
		Penalty_T = AddToggleOption("$FiAl_Apply", Penalty)
		Mortar_S = AddSliderOption("$FiAl_Efficacy without alembic", Mortar, "{0}%")
		Alembic_S = AddSliderOption("$FiAl_Efficacy with alembic", Alembic, "{0}%")
		SetCursorPosition(1)
		AddHeaderOption("$FiAl_Fall fix")
		FallFix_T = AddToggleOption("$FiAl_Apply", FallFix)
		FallMargin_S = AddSliderOption("$FiAl_Tolerance", FallMargin)
		FallDebug_T = AddToggleOption("$FiAl_Debug", FallDebug)
	endif

EndEvent

Event OnOptionHighlight(int Option)

	if(Option == Penalty_T)
		SetInfoText("$FiAl_PenaltyInfo")
	elseif(Option == Mortar_S) 
		SetInfoText("$FiAl_MortarEfficacyInfo")
	elseif(Option == Alembic_S) 
		SetInfoText("$FiAl_MortarAlembicEfficacyInfo")
	elseif(Option == FallFix_T)
		SetInfoText("$FiAl_FallFixInfo")
	elseif(Option == FallMargin_S)
		SetInfoText("$FiAl_FallMarginInfo")
	elseif(Option == FallDebug_T)
		SetInfoText("$FiAl_FallDebugInfo")
	endif

EndEvent

Event OnOptionSelect(int Option)

	if(Option == Penalty_T)
		Penalty = !Penalty
		SetToggleOptionValue(Penalty_T, Penalty)
		FiAl_GLOBVAR_Penalty.SetValue(Penalty as int)
	elseif(Option == FallFix_T)
		FallFix = !FallFix
		SetToggleOptionValue(FallFix_T, FallFix)
		FiAl_GLOBVAR_FallFix.SetValue(FallFix as int)
	elseif(Option == FallDebug_T)
		FallDebug = !FallDebug
		SetToggleOptionValue(FallDebug_T, FallDebug)
		FiAl_GLOBVAR_FallDebug.SetValue(FallDebug as int)
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
		SetSliderOptionValue(Mortar_S, Mortar, "{0}%")
		FiAl_GLOBVAR_Mortar.SetValue(Mortar)
	elseif(Option == Alembic_S)
		Alembic = Value
		SetSliderOptionValue(Alembic_S, Alembic, "{0}%")
		FiAl_GLOBVAR_Alembic.SetValue(Alembic)
	elseif(Option == FallMargin_S)
		FallMargin = Value
		SetSliderOptionValue(FallMargin_S, FallMargin)
		FiAl_GLOBVAR_FallMargin.SetValue(FallMargin)
	endif

EndEvent

Scriptname FiAl_SCRIPT_MCM extends SKI_ConfigBase

;--Global variables--
GlobalVariable Property GV_Penalty Auto	;Apply penalty
GlobalVariable Property GV_Mortar Auto	;Efficacy of mortar only crafting
GlobalVariable Property GV_Alembic Auto	;Efficacy of mortar with alembic crafting

;--OIDs--
int Penalty_T
int Mortar_S
int Alembic_S

;--States--
bool Penalty = false
float Mortar = 49.0
float Alembic = 74.0

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

		;Draw menu
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		Penalty_T = AddToggleOption("Apply penalty", Penalty)
		Mortar_S = AddSliderOption("Efficacy without alembic", Mortar)
		Alembic_S = AddSliderOption("Efficacy with alembic", Alembic)		
	endif

EndEvent

Event OnOptionHighlight(int Option)

	if(Option == Penalty_T)
		SetInfoText("Whether or not a penalty is applied when practicing field alchemy.\nDefault: False")
	elseif(Option == Mortar_S) 
		SetInfoText("Efficacy of created potions and poisons when only using a mortar and pestle.\nDefault: 50%")
	elseif(Option == Alembic_S) 
		SetInfoText("Efficacy of created potions and poisons when using an alembic along with the mortar and pestle.\nDefault: 75%")
	endif

EndEvent

Event OnOptionSelect(int Option)

	if(Option == Penalty_T)
		Penalty = !Penalty
		SetToggleOptionValue(Penalty_T, Penalty)
		GV_Penalty.SetValue(Penalty as int)
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
	endif

EndEvent
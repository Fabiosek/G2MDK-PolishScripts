
instance DIA_ADDON_CRONOS_ADW_EXIT(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 999;
	condition = dia_addon_cronos_adw_exit_condition;
	information = dia_addon_cronos_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cronos_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_cronos_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRONOS_ADWHELLO(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 1;
	condition = dia_addon_cronos_adwhello_condition;
	information = dia_addon_cronos_adwhello_info;
	important = TRUE;
};


func int dia_addon_cronos_adwhello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adwhello_info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Ciesz� si�, �e ci� widz�. Obawiali�my si� najgorszego.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//Co si� dzieje?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//Te tereny s� bardzo niebezpieczne.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//S� tu zwierz�ta, kt�rych nikt z nas nigdy przedtem nie widzia�.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//W pobli�u jest ogromne bagno, kt�re mo�e istnie� ju� od setek lat.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Nie ma dnia, �eby�my nie zostali zaatakowani przez bestie z bagna.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//Radz� ci zachowa� ostro�no��, je�li zamierzasz rozejrze� si� po okolicy.
};


instance DIA_ADDON_CRONOS_WAECHTERADW(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 5;
	condition = dia_addon_cronos_waechteradw_condition;
	information = dia_addon_cronos_waechteradw_info;
	description = "Jakie� wie�ci na temat kamiennych stra�nik�w?";
};


func int dia_addon_cronos_waechteradw_condition()
{
	return TRUE;
};

func void dia_addon_cronos_waechteradw_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Jakie� wie�ci na temat kamiennych stra�nik�w?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//Uda�o nam si� kilku zniszczy�.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//Stoj�, jakby byli s�upami soli.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//Ale pozory myl�! Gdy tylko si� zbli�ysz, rusz� do ataku!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//Nie ma w�tpliwo�ci, �e �r�d�o ich mocy musi znajdowa� si� gdzie� w okolicy.
};


instance DIA_ADDON_CRONOS_ADW_TRADE(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 99;
	condition = dia_addon_cronos_adw_trade_condition;
	information = dia_addon_cronos_adw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Pohandlujmy.";
};


func int dia_addon_cronos_adw_trade_condition()
{
	return TRUE;
};


var int dia_addon_cronos_adw_trade_onetime;

func void dia_addon_cronos_adw_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_1");
};


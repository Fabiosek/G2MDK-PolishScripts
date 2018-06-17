
instance DIA_ADDON_BDT_10031_WACHE_EXIT(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 999;
	condition = dia_addon_10031_wache_exit_condition;
	information = dia_addon_10031_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10031_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10031_WACHE_SCATTY(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_scatty_condition;
	information = dia_addon_10031_wache_scatty_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10031_wache_scatty_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_scatty_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Hej, chcesz pokopa�? Nie zapomnij zabra� wyposa�enia od Scatty'ego.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//Co b�dzie mi potrzebne?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//Kilof na pewno. Odrobina �ywno�ci te� ci nie zaszkodzi.
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_03");	//A co z miksturami uzdrawiaj�cymi? W kopalni s� pe�zacze.
	AI_StopProcessInfos(self);
};


var int wache_joker;

instance DIA_ADDON_BDT_10031_WACHE_HI(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_hi_condition;
	information = dia_addon_10031_wache_hi_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_10031_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//Wszystko w porz�dku?
	if((SKLAVEN_FLUCHT == TRUE) && (WACHE_JOKER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Oj, ch�opcze, niewolnicy na pewno si� spiesz�.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//Gdy dowiedzieli si�, �e zostan� uwolnieni, kiedy tylko sko�cz�, zacz�li uwija� si� jak mr�wki!
		WACHE_JOKER = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Tak. Nie r�b problem�w, to wszystko b�dzie w porz�dku.
};


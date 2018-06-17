
instance DIA_ADDON_BDT_10025_WACHE_EXIT(C_INFO)
{
	npc = bdt_10025_addon_wache;
	nr = 999;
	condition = dia_addon_10025_wache_exit_condition;
	information = dia_addon_10025_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10025_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10025_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10025_WACHE_HI(C_INFO)
{
	npc = bdt_10025_addon_wache;
	nr = 2;
	condition = dia_addon_10025_wache_hi_condition;
	information = dia_addon_10025_wache_hi_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_addon_10025_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10025_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10025_Wache_Hi_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_BDT_10025_Wache_Hi_07_01");	//Gotuj� gulasz dla kopaczy i stra�nik�w.
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10025_Wache_Hi_07_02");	//Niewolnicy b�d� musieli obej�� si� smakiem. Jak b�d� mieli szcz�cie, dostan� czerstwy chleb i wod�.
		AI_Output(self,other,"DIA_Addon_BDT_10025_Wache_Hi_07_03");	//Tym mi�czakom z miasta to nie zaszkodzi.
	};
};


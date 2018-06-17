
instance DIA_ENGROM_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_exit_condition;
	information = dia_engrom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_engrom_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_HALLO(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 5;
	condition = dia_engrom_hallo_condition;
	information = dia_engrom_hallo_info;
	description = "Co s�ycha�?";
};


func int dia_engrom_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_engrom_hallo_info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Fatalnie!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Mmmh!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//Co jeszcze mog� powiedzie�. Ca�ymi dniami tylko w g�r� i w d� tej cholernej rzeki.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Orkowie po lewej, bandyci po prawej... I ci�gle tylko to mi�so topielc�w. Trudno to wytrzyma� na d�u�sz� met�.
};


instance DIA_ENGROM_WHATABOUTLEAVING(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_whataboutleaving_condition;
	information = dia_engrom_whataboutleaving_info;
	description = "Zastanawia�e� si� kiedy� nad opuszczeniem tego miejsca?";
};


func int dia_engrom_whataboutleaving_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_whataboutleaving_info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//Zastanawia�e� si� kiedy� nad opuszczeniem tego miejsca?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Tak, pewnie. Nie ma problemu.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Najpierw przedr� si� przez hordy ork�w, powiem 'dzie� dobry' potworom kr���cym po ca�ej okolicy, a potem spacerkiem przejd� sobie przez prze��cz!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//To by by�a niez�a sztuczka!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Ale ja jako� si� tu przedosta�em.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Czy chcesz mi powiedzie�, �e w�a�nie przekroczy�e� prze��cz?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Jak wida� - tak!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Mia�e� szcz�cie. Je�li o mnie chodzi, to dop�ki w okolicy troch� si� nie uspokoi, nie zamierzam si� w og�le st�d rusza�.
};


instance DIA_ENGROM_JAGD(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_jagd_condition;
	information = dia_engrom_jagd_info;
	permanent = TRUE;
	description = "Jak idzie polowanie?";
};


func int dia_engrom_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_jagd_info()
{
	b_wasmachtjagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Polowanie jest moj� jedyn� pociech�. Przyda�by si� od czasu do czasu jaki� inny cel ni� te przekl�te topielce.
};


instance DIA_ENGROM_KAP3_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap3_exit_condition;
	information = dia_engrom_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_engrom_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP4_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap4_exit_condition;
	information = dia_engrom_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_engrom_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_B_NPCOBSESSEDBYDMT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 32;
	condition = dia_engrom_b_npcobsessedbydmt_condition;
	information = dia_engrom_b_npcobsessedbydmt_info;
	description = "Wszystko w porz�dku?";
};


func int dia_engrom_b_npcobsessedbydmt_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_b_npcobsessedbydmt_info()
{
	MIS_TABIN_LOOKFORENGROM = LOG_SUCCESS;
	b_npcobsessedbydmt(self);
};


instance DIA_ENGROM_BESSEN(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 55;
	condition = dia_engrom_bessen_condition;
	information = dia_engrom_bessen_info;
	permanent = TRUE;
	description = "Op�ta�o ci� z�o.";
};


func int dia_engrom_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_bessen_info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Op�ta�o ci� z�o.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Pozw�l, �e ci pomog�.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//Nie dotykaj mnie!
	b_npcclearobsessionbydmt(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,zs_flee,0,"");
};


instance DIA_ENGROM_KAP5_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap5_exit_condition;
	information = dia_engrom_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_engrom_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP6_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap6_exit_condition;
	information = dia_engrom_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_engrom_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_PICKPOCKET(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 900;
	condition = dia_engrom_pickpocket_condition;
	information = dia_engrom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_engrom_pickpocket_condition()
{
	return c_beklauen(10,5);
};

func void dia_engrom_pickpocket_info()
{
	Info_ClearChoices(dia_engrom_pickpocket);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_BACK,dia_engrom_pickpocket_back);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_PICKPOCKET,dia_engrom_pickpocket_doit);
};

func void dia_engrom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_engrom_pickpocket);
};

func void dia_engrom_pickpocket_back()
{
	Info_ClearChoices(dia_engrom_pickpocket);
};


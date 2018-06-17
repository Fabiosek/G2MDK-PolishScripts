
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
	description = "Co s³ychaæ?";
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
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//Co jeszcze mogê powiedzieæ. Ca³ymi dniami tylko w górê i w dó³ tej cholernej rzeki.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Orkowie po lewej, bandyci po prawej... I ci¹gle tylko to miêso topielców. Trudno to wytrzymaæ na d³u¿sz¹ metê.
};


instance DIA_ENGROM_WHATABOUTLEAVING(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_whataboutleaving_condition;
	information = dia_engrom_whataboutleaving_info;
	description = "Zastanawia³eœ siê kiedyœ nad opuszczeniem tego miejsca?";
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
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//Zastanawia³eœ siê kiedyœ nad opuszczeniem tego miejsca?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Tak, pewnie. Nie ma problemu.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Najpierw przedrê siê przez hordy orków, powiem 'dzieñ dobry' potworom kr¹¿¹cym po ca³ej okolicy, a potem spacerkiem przejdê sobie przez prze³êcz!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//To by by³a niez³a sztuczka!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Ale ja jakoœ siê tu przedosta³em.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Czy chcesz mi powiedzieæ, ¿e w³aœnie przekroczy³eœ prze³êcz?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Jak widaæ - tak!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Mia³eœ szczêœcie. Jeœli o mnie chodzi, to dopóki w okolicy trochê siê nie uspokoi, nie zamierzam siê w ogóle st¹d ruszaæ.
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
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Polowanie jest moj¹ jedyn¹ pociech¹. Przyda³by siê od czasu do czasu jakiœ inny cel ni¿ te przeklête topielce.
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
	description = "Wszystko w porz¹dku?";
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
	description = "Opêta³o ciê z³o.";
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
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Opêta³o ciê z³o.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Pozwól, ¿e ci pomogê.
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


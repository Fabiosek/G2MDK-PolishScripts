
instance DIA_ADDON_TAL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_1_exit_condition;
	information = dia_addon_tal_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_1_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_1_hi_condition;
	information = dia_addon_tal_bdt_1_hi_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_addon_tal_bdt_1_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Poczekam, a¿ poprosz¹ o nowego, a wtedy bêdzie moja kolej.
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Z tych wszystkich ludzi na zewn¹trz tylko Franko wchodzi do œrodka.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Teraz, gdy Franko nie ¿yje, powinienem mieæ wiêksze szanse.
	};
};


instance DIA_ADDON_TAL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_1_lager_condition;
	information = dia_addon_tal_bdt_1_lager_info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o obozowisku?";
};


func int dia_addon_tal_bdt_1_lager_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mo¿esz mi powiedzieæ o obozowisku?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Uwa¿aj, z kim zadzierasz! Je¿eli zaczniesz bójkê bez powodu, wszyscy zwróc¹ siê przeciwko tobie!
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Wiêkszoœæ z nich nie chce straciæ swojego z³ota - dlatego chroni¹ siê nawzajem.
};


instance DIA_ADDON_TAL_BDT_1_RAVEN(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_1_raven_condition;
	information = dia_addon_tal_bdt_1_raven_info;
	permanent = TRUE;
	description = "Co wiesz o Kruku?";
};


func int dia_addon_tal_bdt_1_raven_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_raven_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co wiesz o Kruku?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//To goœæ, który jako pierwszy przyby³ tu ze swoimi ch³opcami.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//To przywódca obozu. Lepiej z nim nie zadzieraj.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Kiedyœ przyjêli piêciu nowych, bo wy³adowa³ gniew na swoich ludziach.
};

func void b_assignambientinfos_addon_tal_bdt_1(var C_NPC slf)
{
	dia_addon_tal_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_raven.npc = Hlp_GetInstanceID(slf);
};


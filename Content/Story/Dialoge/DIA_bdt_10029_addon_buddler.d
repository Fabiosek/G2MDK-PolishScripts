
instance DIA_ADDON_BDT_10029_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10029_addon_buddler;
	nr = 999;
	condition = dia_addon_10029_buddler_exit_condition;
	information = dia_addon_10029_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10029_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10029_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10029_BUDDLER_HI(C_INFO)
{
	npc = bdt_10029_addon_buddler;
	nr = 2;
	condition = dia_addon_10029_buddler_hi_condition;
	information = dia_addon_10029_buddler_hi_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_addon_10029_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10029_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10029_Buddler_Hi_15_00");	//Co s³ychaæ?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10029_Buddler_Hi_06_01");	//Niewolnicy odwalaj¹ ca³¹ robotê, wiêc nic nie robiê.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10029_Buddler_Hi_06_02");	//Bêdê musia³ trochê pokopaæ, zanim siê do tego znowu przyzwyczajê.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_10029_BUDDLER_HACKEN(C_INFO)
{
	npc = bdt_10029_addon_buddler;
	nr = 3;
	condition = dia_addon_10029_buddler_hacken_condition;
	information = dia_addon_10029_buddler_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_10029_buddler_hacken_condition()
{
	return TRUE;
};

func void dia_addon_10029_buddler_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10029_Buddler_Hacken_06_00");	//Tajemnica tkwi w pracy nóg.
	AI_Output(self,other,"DIA_Addon_10029_Buddler_Hacken_06_01");	//Si³a zamachu pochodzi z nóg.
	b_upgrade_hero_hackchance(5);
};



instance DIA_ADDON_BDT_10028_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10028_addon_buddler;
	nr = 999;
	condition = dia_addon_10028_buddler_exit_condition;
	information = dia_addon_10028_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10028_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10028_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10028_BUDDLER_HI(C_INFO)
{
	npc = bdt_10028_addon_buddler;
	nr = 2;
	condition = dia_addon_10028_buddler_hi_condition;
	information = dia_addon_10028_buddler_hi_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_addon_10028_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10028_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10028_Buddler_Hi_15_00");	//Co s³ychaæ?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_01");	//Nie zamierzam tu kopaæ. Od tego mamy niewolników.
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_02");	//Zdobywanie z³ota jeszcze nigdy nie by³o tak ³atwe!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10028_Buddler_Hi_12_03");	//Hmmf. Co za idiota uwolni³ niewolników?
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_10028_BUDDLER_HACKEN(C_INFO)
{
	npc = bdt_10028_addon_buddler;
	nr = 3;
	condition = dia_addon_10028_buddler_hacken_condition;
	information = dia_addon_10028_buddler_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_10028_buddler_hacken_condition()
{
	return TRUE;
};

func void dia_addon_10028_buddler_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10028_Buddler_Hacken_12_00");	//Musisz kopaæ od do³u do góry.
	AI_Output(self,other,"DIA_Addon_10028_Buddler_Hacken_12_01");	//To trochê trudne, ale tym sposobem wydobêdziesz ze ska³y wiêcej z³ota.
	b_upgrade_hero_hackchance(5);
};


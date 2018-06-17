
instance DIA_ADDON_BDT_10027_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 999;
	condition = dia_addon_10027_buddler_exit_condition;
	information = dia_addon_10027_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10027_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10027_BUDDLER_HI(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 2;
	condition = dia_addon_10027_buddler_hi_condition;
	information = dia_addon_10027_buddler_hi_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_addon_10027_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//Co s�ycha�?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//Do�� ju� harowa�em dla baron�w rudy. Dobrze, �e teraz inni kopi�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Do diab�a, wygl�da na to, �e znowu musimy sami kopa�, co?
	};
};


instance DIA_ADDON_10027_BUDDLER_HACKEN(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 3;
	condition = dia_addon_10027_buddler_hacken_condition;
	information = dia_addon_10027_buddler_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_10027_buddler_hacken_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_00");	//Praca umys�owa. Ch�opcze, kopanie z�ota to praca czysto umys�owa. Nie pr�buj pokona� ska�y - jest twardsza ni� ty.
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_01");	//Uwolnij sw�j umys� - musisz si� sta� jedno�ci� ze z�otem. Wtedy kopanie stanie si� modlitw�, medytacj�.
	b_upgrade_hero_hackchance(10);
};


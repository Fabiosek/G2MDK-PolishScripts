
instance DIA_ADDON_BDT_10030_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10030_addon_buddler;
	nr = 999;
	condition = dia_addon_10030_buddler_exit_condition;
	information = dia_addon_10030_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10030_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10030_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10030_BUDDLER_HI(C_INFO)
{
	npc = bdt_10030_addon_buddler;
	nr = 2;
	condition = dia_addon_10030_buddler_hi_condition;
	information = dia_addon_10030_buddler_hi_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_addon_10030_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10030_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10030_Buddler_Hi_15_00");	//Wszystko w porz¹dku?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10030_Buddler_Hi_08_01");	//Niewolnicy zajmuj¹ siê du¿ymi ska³ami.
		AI_Output(self,other,"DIA_Addon_BDT_10030_Buddler_Hi_08_02");	//A nam pozostaje pozbieraæ potem z³oto.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10030_Buddler_Hi_08_03");	//Teraz zbieramy lœni¹ce z³otko.
		AI_StopProcessInfos(self);
	};
};



instance DIA_ADDON_TAL_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_13_exit_condition;
	information = dia_addon_tal_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_13_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_13_hi_condition;
	information = dia_addon_tal_bdt_13_hi_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_addon_tal_bdt_13_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Po�re ci� jaka� bestia albo sko�czysz w brzuchu jakiego� bydl�cia.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//To bagno b�dzie naszym grobem...
};


instance DIA_ADDON_TAL_BDT_13_TAL(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_13_tal_condition;
	information = dia_addon_tal_bdt_13_tal_info;
	permanent = TRUE;
	description = "Co wiesz o tej dolinie?";
};


func int dia_addon_tal_bdt_13_tal_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_tal_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co wiesz o tej dolinie?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Pe�no w niej starych rzeczy. Kruk kaza� nam wszystko zbiera�.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Nie mam poj�cia, po co mu to, ale nikt przy zdrowych zmys�ach nie b�dzie nadstawia� karku za par� kamyk�w...
};


instance DIA_ADDON_TAL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_13_news_condition;
	information = dia_addon_tal_bdt_13_news_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_addon_tal_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co nowego?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//Poprztykali�my si� z piratami.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Dostarczali nam wi�ni�w, ale nie dostali za to z�amanego miedziaka. Nic dziwnego, �e s� w�ciekli.
	if(BDT_13_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Ale co mog� zrobi�? Zaatakowa� ob�z?
		BDT_13_EINMAL = TRUE;
	};
};

func void b_assignambientinfos_addon_tal_bdt_13(var C_NPC slf)
{
	dia_addon_tal_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_tal.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_news.npc = Hlp_GetInstanceID(slf);
};


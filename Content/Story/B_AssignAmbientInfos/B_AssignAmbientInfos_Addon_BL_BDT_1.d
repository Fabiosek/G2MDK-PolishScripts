
instance DIA_ADDON_BL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_1_exit_condition;
	information = dia_addon_bl_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_1_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_1_chef_condition;
	information = dia_addon_bl_bdt_1_chef_info;
	permanent = TRUE;
	description = "Kto tu jest szefem?";
};


func int dia_addon_bl_bdt_1_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//Kto tu jest szefem?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//Przyw�dcy przychodz� i odchodz�... Trudno ich zliczy�.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//Chyba naszym nowym szefem jest Thorus.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Naszym nowym przyw�dc� jest Kruk. On nas tu doprowadzi� i za�o�y� nasz ob�z.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//Sprawuje kontrol� nad kopalni�, bo inaczej te psy dawno pozabija�yby si� o z�oto.
	};
};


instance DIA_ADDON_BL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager_condition;
	information = dia_addon_bl_bdt_1_lager_info;
	permanent = FALSE;
	description = "Co wiesz o obozie?";
};


func int dia_addon_bl_bdt_1_lager_condition()
{
	if((SKLAVEN_FLUCHT == FALSE) || !Npc_IsDead(raven))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//Co wiesz o obozie?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//Gdy sta�o si� jasne, �e jest tu kopalnia z�ota, te szczury wyrzyna�y si� a� mi�o.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Wtedy Kruk zabi� najgorszych z nich, a reszt� wyrzuci� z kopalni.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Od tamtej pory nikomu nie wolno wchodzi� na g�rny obszar. A wi�ni�w zap�dzi� do pracy w kopalni.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BL_BDT_1_LAGER2(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager2_condition;
	information = dia_addon_bl_bdt_1_lager2_info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o obozowisku?";
};


func int dia_addon_bl_bdt_1_lager2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager2_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//Co wiesz o obozie?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//Je�eli kogo� zaatakujesz, WSZYSCY b�d� ci� �ciga�.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//No chyba �e masz dobry pow�d, �eby si� do kogo� dobra�. Wtedy nikt nie b�dzie si� wtr�ca�.
};


instance DIA_ADDON_BL_BDT_1_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_1_news_condition;
	information = dia_addon_bl_bdt_1_news_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_addon_bl_bdt_1_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//Co nowego?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Kruk nie �yje. Co my teraz zrobimy?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//Piraci nie chc� ju� wozi� nas na sta�y l�d, bo nie dostali wynagrodzenia za ostatnie wycieczki.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//Powinni�my wbi� jednego czy dw�ch na pal, wtedy reszta na pewno zmieni zdanie.
};


instance DIA_ADDON_BL_BDT_1_SKLAVEN(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_1_sklaven_condition;
	information = dia_addon_bl_bdt_1_sklaven_info;
	permanent = TRUE;
	description = "Co wiesz o wi�niach?";
};


func int dia_addon_bl_bdt_1_sklaven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager) && ((SKLAVEN_FLUCHT == FALSE) || (RAVENISDEAD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_sklaven_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//Co wiesz o wi�niach?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Kruk chce, �eby co� wykopali. Najpierw zmusi� do tego bandyt�w, ale zbyt wielu z nich oszala�o.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//Dlatego zaprz�g� wi�ni�w - nawet gdy zgin�, nie ma to znaczenia.
	if(BDT_1_AUSBUDDELN == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//Co Kruk chce wykopa�?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//Nie mam poj�cia, ale wygl�da na to, �e to co� wi�cej ni� z�oto.
		BDT_1_AUSBUDDELN = TRUE;
	};
};

func void b_assignambientinfos_addon_bl_bdt_1(var C_NPC slf)
{
	dia_addon_bl_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_sklaven.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager2.npc = Hlp_GetInstanceID(slf);
};


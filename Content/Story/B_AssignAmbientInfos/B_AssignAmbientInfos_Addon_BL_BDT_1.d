
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
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//Przywódcy przychodz¹ i odchodz¹... Trudno ich zliczyæ.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//Chyba naszym nowym szefem jest Thorus.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Naszym nowym przywódc¹ jest Kruk. On nas tu doprowadzi³ i za³o¿y³ nasz obóz.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//Sprawuje kontrolê nad kopalni¹, bo inaczej te psy dawno pozabija³yby siê o z³oto.
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
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//Gdy sta³o siê jasne, ¿e jest tu kopalnia z³ota, te szczury wyrzyna³y siê a¿ mi³o.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Wtedy Kruk zabi³ najgorszych z nich, a resztê wyrzuci³ z kopalni.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Od tamtej pory nikomu nie wolno wchodziæ na górny obszar. A wiêŸniów zapêdzi³ do pracy w kopalni.
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
	description = "Co mo¿esz mi powiedzieæ o obozowisku?";
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
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//Je¿eli kogoœ zaatakujesz, WSZYSCY bêd¹ ciê œcigaæ.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//No chyba ¿e masz dobry powód, ¿eby siê do kogoœ dobraæ. Wtedy nikt nie bêdzie siê wtr¹caæ.
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
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Kruk nie ¿yje. Co my teraz zrobimy?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//Piraci nie chc¹ ju¿ woziæ nas na sta³y l¹d, bo nie dostali wynagrodzenia za ostatnie wycieczki.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//Powinniœmy wbiæ jednego czy dwóch na pal, wtedy reszta na pewno zmieni zdanie.
};


instance DIA_ADDON_BL_BDT_1_SKLAVEN(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_1_sklaven_condition;
	information = dia_addon_bl_bdt_1_sklaven_info;
	permanent = TRUE;
	description = "Co wiesz o wiêŸniach?";
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
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//Co wiesz o wiêŸniach?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Kruk chce, ¿eby coœ wykopali. Najpierw zmusi³ do tego bandytów, ale zbyt wielu z nich oszala³o.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//Dlatego zaprz¹g³ wiêŸniów - nawet gdy zgin¹, nie ma to znaczenia.
	if(BDT_1_AUSBUDDELN == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//Co Kruk chce wykopaæ?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//Nie mam pojêcia, ale wygl¹da na to, ¿e to coœ wiêcej ni¿ z³oto.
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


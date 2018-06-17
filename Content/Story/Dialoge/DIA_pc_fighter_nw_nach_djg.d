
instance DIA_GORNNW_NACH_DJG_KAP5_EXIT(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 999;
	condition = dia_gornnw_nach_djg_kap5_exit_condition;
	information = dia_gornnw_nach_djg_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_nach_djg_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_nach_djg_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_NACH_DJG_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 59;
	condition = dia_gornnw_nach_djg_alldragonsdead_condition;
	information = dia_gornnw_nach_djg_alldragonsdead_info;
	permanent = TRUE;
	description = "Odpr�y�e� si� wreszcie?";
};


func int dia_gornnw_nach_djg_alldragonsdead_condition()
{
	if(GORN_ISONBOARD != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Odpr�y�e� si� wreszcie?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Jasne! Przecie� smoki gryz� ziemi�, nie?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Sprawa jest troch� bardziej skomplikowana...
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//Jak zwykle. Daj zna�, gdyby m�j top�r m�g� ci si� na co� przyda�.
};


instance DIA_GORNNW_NACH_DJG_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_knowwhereenemy_condition;
	information = dia_gornnw_nach_djg_knowwhereenemy_info;
	permanent = TRUE;
	description = "Potrzebuj� twojej pomocy.";
};


func int dia_gornnw_nach_djg_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (GORN_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Potrzebuj� twojej pomocy.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Nie dziwi mnie to! Co mog� dla ciebie zrobi�?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Pop�yniesz ze mn� na pewn� wysp�, �eby skopa� par� ty�k�w?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//Zawsze wiedzia�e�, jak mnie zach�ci�! Co mam robi�?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Gorn bardzo si� zapali�, kiedy powiedzia�em mu o wyspie. Je�li b�d� potrzebowa� jego pomocy, ch�tnie ze mn� pop�ynie.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Mam ju� zebran� za�og�, ale zastanawiam si�, czy mimo to nie wzi�� ci� ze sob�.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Gdyby� musia� kogo� wyrzuci�, �eby zrobi� miejsce dla mnie, pozb�d� si� najs�abszego.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//Podczas takiej wyprawy przydadz� si� zaprawieni w boju wojownicy.
	}
	else
	{
		Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Dam ci zna�, gdy przyjdzie pora.",dia_gornnw_nach_djg_knowwhereenemy_no);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Chc�, �eby� ze mn� pop�yn��. Czekaj na mnie na przystani.",dia_gornnw_nach_djg_knowwhereenemy_yes);
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Chc�, �eby� ze mn� pop�yn��. Czekaj na mnie na przystani.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Masz statek? Ho, ho! Jedno ci powiem - z tob� nie mo�na si� nudzi�!
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};

func void dia_gornnw_nach_djg_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Dam ci zna�, gdy przyjdzie pora.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//W porz�dku.
	GORN_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};


instance DIA_GORNNW_NACH_DJG_LEAVEMYSHIP(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_leavemyship_condition;
	information = dia_gornnw_nach_djg_leavemyship_info;
	permanent = TRUE;
	description = "Mo�e jednak lepiej b�dzie, je�li tu zostaniesz.";
};


func int dia_gornnw_nach_djg_leavemyship_condition()
{
	if((GORN_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_leavemyship_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Mo�e jednak lepiej b�dzie, je�li tu zostaniesz.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Mam ci� pu�ci� samego? Hmmm. Nie jestem zachwycony, ale przecie� to twoja wojna. Gdyby� zmieni� zdanie, wiesz, gdzie mnie szuka�.
	GORN_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNNW_NACH_DJG_STILLNEEDYOU(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_stillneedyou_condition;
	information = dia_gornnw_nach_djg_stillneedyou_info;
	permanent = TRUE;
	description = "Jednak b�dziesz mi potrzebny.";
};


func int dia_gornnw_nach_djg_stillneedyou_condition()
{
	if(((GORN_ISONBOARD == LOG_OBSOLETE) || (GORN_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_stillneedyou_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Jednak b�dziesz mi potrzebny.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//No prosz�. A ju� my�la�em, �e zdechn� tu z nud�w, podczas gdy ty b�dziesz si� dobrze bawi�. Do zobaczenia.
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_FIGHTER_NACH_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 900;
	condition = dia_fighter_nach_djg_pickpocket_condition;
	information = dia_fighter_nach_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_nach_djg_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_fighter_nach_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_BACK,dia_fighter_nach_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_nach_djg_pickpocket_doit);
};

func void dia_fighter_nach_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

func void dia_fighter_nach_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};


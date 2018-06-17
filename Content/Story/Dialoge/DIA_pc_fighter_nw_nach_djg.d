
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
	description = "Odprê¿y³eœ siê wreszcie?";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Odprê¿y³eœ siê wreszcie?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Jasne! Przecie¿ smoki gryz¹ ziemiê, nie?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Sprawa jest trochê bardziej skomplikowana...
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//Jak zwykle. Daj znaæ, gdyby mój topór móg³ ci siê na coœ przydaæ.
};


instance DIA_GORNNW_NACH_DJG_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_knowwhereenemy_condition;
	information = dia_gornnw_nach_djg_knowwhereenemy_info;
	permanent = TRUE;
	description = "Potrzebujê twojej pomocy.";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Potrzebujê twojej pomocy.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Nie dziwi mnie to! Co mogê dla ciebie zrobiæ?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Pop³yniesz ze mn¹ na pewn¹ wyspê, ¿eby skopaæ parê ty³ków?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//Zawsze wiedzia³eœ, jak mnie zachêciæ! Co mam robiæ?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Gorn bardzo siê zapali³, kiedy powiedzia³em mu o wyspie. Jeœli bêdê potrzebowa³ jego pomocy, chêtnie ze mn¹ pop³ynie.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Mam ju¿ zebran¹ za³ogê, ale zastanawiam siê, czy mimo to nie wzi¹æ ciê ze sob¹.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Gdybyœ musia³ kogoœ wyrzuciæ, ¿eby zrobiæ miejsce dla mnie, pozb¹dŸ siê najs³abszego.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//Podczas takiej wyprawy przydadz¹ siê zaprawieni w boju wojownicy.
	}
	else
	{
		Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Dam ci znaæ, gdy przyjdzie pora.",dia_gornnw_nach_djg_knowwhereenemy_no);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Chcê, ¿ebyœ ze mn¹ pop³yn¹³. Czekaj na mnie na przystani.",dia_gornnw_nach_djg_knowwhereenemy_yes);
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Chcê, ¿ebyœ ze mn¹ pop³yn¹³. Czekaj na mnie na przystani.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Masz statek? Ho, ho! Jedno ci powiem - z tob¹ nie mo¿na siê nudziæ!
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Dam ci znaæ, gdy przyjdzie pora.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//W porz¹dku.
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
	description = "Mo¿e jednak lepiej bêdzie, jeœli tu zostaniesz.";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Mo¿e jednak lepiej bêdzie, jeœli tu zostaniesz.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Mam ciê puœciæ samego? Hmmm. Nie jestem zachwycony, ale przecie¿ to twoja wojna. Gdybyœ zmieni³ zdanie, wiesz, gdzie mnie szukaæ.
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
	description = "Jednak bêdziesz mi potrzebny.";
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
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Jednak bêdziesz mi potrzebny.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//No proszê. A ju¿ myœla³em, ¿e zdechnê tu z nudów, podczas gdy ty bêdziesz siê dobrze bawi³. Do zobaczenia.
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


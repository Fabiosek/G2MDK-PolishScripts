
instance DIA_ANGAR_NW_KAP5_EXIT(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 999;
	condition = dia_angar_nw_kap5_exit_condition;
	information = dia_angar_nw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angar_nw_kap5_exit_condition()
{
	return TRUE;
};

func void dia_angar_nw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 59;
	condition = dia_angar_nw_alldragonsdead_condition;
	information = dia_angar_nw_alldragonsdead_info;
	description = "Co s³ychaæ?";
};


func int dia_angar_nw_alldragonsdead_condition()
{
	return TRUE;
};

func void dia_angar_nw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Nie najgorzej, chocia¿ ci¹gle mam ten przeklêty ból g³owy. Odk¹d opuœci³em Górnicz¹ Dolinê, czujê siê jednak du¿o lepiej.
	if(ANGAR_ISONBOARD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Zostanê tutaj. Gdybyœ mnie potrzebowa³, bêdziesz wiedzia³, gdzie mnie szukaæ.
	};
};


instance DIA_ANGAR_NW_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_knowwhereenemy_condition;
	information = dia_angar_nw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Zamierzam opuœciæ Khorinis. Nie chcesz siê do mnie przy³¹czyæ?";
};


func int dia_angar_nw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (ANGAR_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_angar_nw_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_angar_nw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Zamierzam opuœciæ Khorinis. Nie chcesz siê do mnie przy³¹czyæ?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//Hmmm. Im dalej od Górniczej Doliny, tym lepiej. Kiedy ruszamy?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Angar jest wdziêczny za pomoc w wydostaniu siê z Górniczej Doliny. Zaproponowa³, ¿e przy³¹czy siê do mnie.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//Chwilowo mam ju¿ wystarczaj¹co liczn¹ za³ogê. Mo¿e odezwê siê do ciebie póŸniej.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Jak chcesz. Wiesz, gdzie mnie szukaæ.
	}
	else
	{
		Info_ClearChoices(dia_angar_nw_knowwhereenemy);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"Dam ci znaæ, kiedy przyjdzie pora.",dia_angar_nw_knowwhereenemy_no);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"IdŸ na przystañ. Tam siê spotkamy.",dia_angar_nw_knowwhereenemy_yes);
	};
};

func void dia_angar_nw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//IdŸ na przystañ. Tam siê spotkamy.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//W porz¹dku. Ruszam.
	self.flags = NPC_FLAG_IMMORTAL;
	ANGAR_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_angar_nw_knowwhereenemy);
};

func void dia_angar_nw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//Dam ci znaæ, kiedy przyjdzie pora.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//W porz¹dku.
	ANGAR_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_angar_nw_knowwhereenemy);
};


instance DIA_ANGAR_NW_LEAVEMYSHIP(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_leavemyship_condition;
	information = dia_angar_nw_leavemyship_info;
	permanent = TRUE;
	description = "Zostañ tutaj, póki nie odzyskasz si³.";
};


func int dia_angar_nw_leavemyship_condition()
{
	if((ANGAR_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_leavemyship_info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Zostañ tutaj, póki nie odzyskasz si³.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//W porz¹dku. Mo¿e tak bêdzie lepiej.
	ANGAR_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ANGAR_NW_STILLNEEDYOU(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_stillneedyou_condition;
	information = dia_angar_nw_stillneedyou_info;
	permanent = TRUE;
	description = "Wracaj na pok³ad.";
};


func int dia_angar_nw_stillneedyou_condition()
{
	if(((ANGAR_ISONBOARD == LOG_OBSOLETE) || (ANGAR_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_angar_nw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Wracaj na pok³ad.
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Jesteœ jeszcze gorszy ni¿ ja. Mo¿e byœ siê wreszcie zdecydowa³? Bywaj.
	self.flags = NPC_FLAG_IMMORTAL;
	ANGAR_ISONBOARD = LOG_SUCCESS;
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


instance DIA_ANGAR_NW_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 900;
	condition = dia_angar_nw_pickpocket_condition;
	information = dia_angar_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_nw_pickpocket_condition()
{
	return c_beklauen(47,34);
};

func void dia_angar_nw_pickpocket_info()
{
	Info_ClearChoices(dia_angar_nw_pickpocket);
	Info_AddChoice(dia_angar_nw_pickpocket,DIALOG_BACK,dia_angar_nw_pickpocket_back);
	Info_AddChoice(dia_angar_nw_pickpocket,DIALOG_PICKPOCKET,dia_angar_nw_pickpocket_doit);
};

func void dia_angar_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_nw_pickpocket);
};

func void dia_angar_nw_pickpocket_back()
{
	Info_ClearChoices(dia_angar_nw_pickpocket);
};


instance DIA_ANGAR_NW_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 7;
	condition = dia_angar_nw_foundamulett_condition;
	information = dia_angar_nw_foundamulett_info;
	description = "Znalaz³em twój amulet.";
};


func int dia_angar_nw_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_foundamulett_info()
{
	b_angarsamulettabgeben();
};


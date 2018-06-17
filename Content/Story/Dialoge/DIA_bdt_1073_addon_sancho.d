
instance DIA_ADDON_SANCHO_EXIT(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 999;
	condition = dia_addon_sancho_exit_condition;
	information = dia_addon_sancho_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_sancho_exit_condition()
{
	return TRUE;
};

func void dia_addon_sancho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SANCHO_PICKPOCKET(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 900;
	condition = dia_addon_sancho_pickpocket_condition;
	information = dia_addon_sancho_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_sancho_pickpocket_condition()
{
	return c_beklauen(50,40);
};

func void dia_addon_sancho_pickpocket_info()
{
	Info_ClearChoices(dia_addon_sancho_pickpocket);
	Info_AddChoice(dia_addon_sancho_pickpocket,DIALOG_BACK,dia_addon_sancho_pickpocket_back);
	Info_AddChoice(dia_addon_sancho_pickpocket,DIALOG_PICKPOCKET,dia_addon_sancho_pickpocket_doit);
};

func void dia_addon_sancho_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_sancho_pickpocket);
};

func void dia_addon_sancho_pickpocket_back()
{
	Info_ClearChoices(dia_addon_sancho_pickpocket);
};


instance DIA_ADDON_SANCHO_HI(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 2;
	condition = dia_addon_sancho_hi_condition;
	information = dia_addon_sancho_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_sancho_hi_condition()
{
	return TRUE;
};

func void dia_addon_sancho_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Cholera, znowu ktoœ nowy. Te¿ chcesz z³ota, co?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Z³ota?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//Nie próbuj siê ze mn¹ przekomarzaæ!
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//Wszyscy nowi chc¹ wejœæ do kopalni.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Nie oczekuj jednak, ¿e bêdzie to ³atwe!
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_SANCHO_LAGER(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 2;
	condition = dia_addon_sancho_lager_condition;
	information = dia_addon_sancho_lager_info;
	permanent = FALSE;
	description = "Jak mogê siê dostaæ do obozu?";
};


func int dia_addon_sancho_lager_condition()
{
	return TRUE;
};

func void dia_addon_sancho_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Jak mogê siê dostaæ do obozu?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//IdŸ po prostu mostem!
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Jeœli jednak chcesz siê dostaæ do kopalni, bêdziesz musia³ przejœæ ko³o Franka.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//On oczekuje od nowych, ¿e przez jakiœ czas bêd¹ pracowaæ poza obozem.
	};
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"Wszyscy nowoprzybyli musz¹ pracowaæ na bagnie, zanim dostan¹ pozwolenie wejœcia do kopalni.");
};


instance DIA_ADDON_SANCHO_MINE(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 3;
	condition = dia_addon_sancho_mine_condition;
	information = dia_addon_sancho_mine_info;
	permanent = FALSE;
	description = "Powiedz mi coœ wiêcej o kopalni.";
};


func int dia_addon_sancho_mine_condition()
{
	if(!Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Powiedz mi coœ wiêcej o kopalni.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Chcesz dostaæ siê do œrodka? Spróbuj zaprzyjaŸniæ siê z Frankiem. On jest tu szefem.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//To on decyduje, kto wejdzie do obozu.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//Jak bêdziesz siedzia³ na ty³ku, to nie masz ¿adnych szans na wejœcie.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Porozmawiaj z nim, niech ci wyznaczy jak¹œ robotê.
	b_logentry(TOPIC_ADDON_FRANCO,"FRANKO decyduje o tym, kto mo¿e wejœæ do obozu. Rozdziela tak¿e pracê.");
};


instance DIA_ADDON_SANCHO_FRANCO(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 4;
	condition = dia_addon_sancho_franco_condition;
	information = dia_addon_sancho_franco_info;
	permanent = FALSE;
	description = "Gdzie znajdê tego Franka?";
};


func int dia_addon_sancho_franco_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_mine) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_franco_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Gdzie znajdê tego Franka?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Zwykle krêci siê przed wejœciem do obozu.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//No i zachowuj siê, bo inaczej dostaniesz tak¹ gównian¹ robotê, jak ja.
	b_logentry(TOPIC_ADDON_FRANCO,"Franko krêci siê przy wejœciu do obozu.");
};


instance DIA_ADDON_SANCHO_SPITZEL(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 5;
	condition = dia_addon_sancho_spitzel_condition;
	information = dia_addon_sancho_spitzel_info;
	permanent = FALSE;
	description = "Musisz tu siedzieæ przez ca³y czas?";
};


func int dia_addon_sancho_spitzel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_franco) || Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_spitzel_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Musisz tu siedzieæ przez ca³y czas?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Mam sprawdzaæ, czy wœród nowych ludzi nie ma szpiegów.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Jakby ktoœ zna³ to zapomniane miejsce. To koniec œwiata - œrodek bagna.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Nikt nie mo¿e nas tu znaleŸæ i nie znajdzie. Po co ktoœ mia³by przysy³aæ do nas szpiegów?
};


instance DIA_ADDON_SANCHO_PERM(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 99;
	condition = dia_addon_sancho_perm_condition;
	information = dia_addon_sancho_perm_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_addon_sancho_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_spitzel))
	{
		return TRUE;
	};
};


var int comment_franco;
var int comment_esteban;

func void dia_addon_sancho_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//Co nowego?
	if(Npc_IsDead(franco) && (COMMENT_FRANCO == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//S³ysza³em, ¿e wys³a³eœ Franka do piek³a. Dobra robota...
		if(!Npc_IsDead(carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//...ale teraz szarogêsi siê tutaj Carlos. A z nim nie ma ¿artów...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//Carlosa te¿ wys³a³eœ na cmentarz? Ch³opie, lepiej trzymaj siê ode mnie z daleka.
		};
		COMMENT_FRANCO = TRUE;
	}
	else if(Npc_IsDead(esteban) && (COMMENT_ESTEBAN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//S³ysza³em, ¿e ukatrupi³eœ Estebana. Ch³opie, do czego ty zmierzasz, co?
		COMMENT_ESTEBAN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Nie, w tej chwili nic nowego.
	};
};


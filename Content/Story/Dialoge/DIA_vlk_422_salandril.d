
instance DIA_SALANDRIL_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_exit_condition;
	information = dia_salandril_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_salandril_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_PICKPOCKET(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 900;
	condition = dia_salandril_pickpocket_condition;
	information = dia_salandril_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};


var int dia_salandril_pickpocket_perm;

func int dia_salandril_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (DIA_SALANDRIL_PICKPOCKET_PERM == FALSE) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_salandril_pickpocket_info()
{
	Info_ClearChoices(dia_salandril_pickpocket);
	Info_AddChoice(dia_salandril_pickpocket,DIALOG_BACK,dia_salandril_pickpocket_back);
	Info_AddChoice(dia_salandril_pickpocket,DIALOG_PICKPOCKET,dia_salandril_pickpocket_doit);
};

func void dia_salandril_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItems(self,itke_salandril,1);
		b_giveinvitems(self,other,itke_salandril,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		DIA_SALANDRIL_PICKPOCKET_PERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_salandril_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_salandril_pickpocket_back()
{
	Info_ClearChoices(dia_salandril_pickpocket);
};


instance DIA_SALANDRIL_HALLO(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_hallo_condition;
	information = dia_salandril_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salandril_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_salandril_hallo_info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//Witaj, w�drowcze. Szukasz doskona�ej mikstury?
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//Mam �wietny wyb�r po rozs�dnych cenach. A moje mikstury s� o wiele lepsze od tych, kt�re stara si� sprzedawa� Zuris.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Salandril sprzedaje mikstury. Jego sklep znajduje si� w g�rnym mie�cie.");
};


instance DIA_SALANDRIL_TRANK(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_trank_condition;
	information = dia_salandril_trank_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salandril_trank_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_OLDWORLD == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_salandril_kloster) == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_trank_info()
{
	AI_Output(self,other,"DIA_Salandril_Trank_13_00");	//S�ysza�em, �e by�e� z paladynami w G�rniczej Dolinie. Jestem pod wra�eniem.
	AI_Output(self,other,"DIA_Salandril_Trank_13_01");	//Nie �piesz si� i spokojnie obejrzyj m�j towar. Dobrze si� sk�ada, bo akurat mam co� wyj�tkowego na sprzeda�.
	CreateInvItems(self,itpo_perm_dex,1);
};


instance DIA_SALANDRIL_TRADE(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 9;
	condition = dia_salandril_trade_condition;
	information = dia_salandril_trade_info;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
	trade = TRUE;
};


func int dia_salandril_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_salandril_kloster) == FALSE)
	{
		return TRUE;
	};
};

func void dia_salandril_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//Poka� mi swoje towary.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//Z przyjemno�ci�, czcigodny Bracie.
		if(MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING)
		{
			SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//Z przyjemno�ci�, szlachetny Panie.
	};
};


instance DIA_SALANDRIL_KAP3_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap3_exit_condition;
	information = dia_salandril_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_salandril_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KLOSTER(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_kloster_condition;
	information = dia_salandril_kloster_info;
	description = "Masz uda� si� do klasztoru, w kt�rym zostaniesz os�dzony!";
};


func int dia_salandril_kloster_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) || (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_salandril_kloster_info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//Masz uda� si� do klasztoru, w kt�rym zostaniesz os�dzony!
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//Co? Nie ma mowy! Ci n�dzni magowie nie maj� nawet cienia dowodu przeciwko mnie!
	if((hero.guild == GIL_KDF) && (SC_KNOWSPROSPEKTORSALANDRIL == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//A co z tymi fa�szywymi udzia�ami w kopalni, kt�re mo�na wsz�dzie kupi�? Widnieje na nich tw�j podpis. Jeste� winny!
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//Mam rozkazy do wykonania i albo ze mn� p�jdziesz, albo ci� do tego zmusz�.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//CO? Przeci�gn� ci� przez ca�e miasto i poka��, jak nale�y si� do mnie zwraca�!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SALANDRIL_GEHINSKLOSTER(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_gehinskloster_condition;
	information = dia_salandril_gehinskloster_info;
	description = "No, to teraz p�jdziesz do klasztoru, czy b�dziemy si� dalej bawi�?";
};


func int dia_salandril_gehinskloster_condition()
{
	if(((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) || (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && Npc_KnowsInfo(other,dia_salandril_kloster))
	{
		return TRUE;
	};
};

func void dia_salandril_gehinskloster_info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//No, to teraz p�jdziesz do klasztoru, czy b�dziemy si� dalej bawi�?
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//B�dziesz tego �a�owa�! Cholera! P�jd� do tego twojego klasztoru, ale nie my�l, �e ujdzie ci to na sucho.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_SUCCESS;
};


instance DIA_SALANDRIL_VERSCHWINDE(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_verschwinde_condition;
	information = dia_salandril_verschwinde_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_salandril_verschwinde_condition()
{
	if((MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_salandril_verschwinde_info()
{
	b_verschwinde_stimme13();
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP4_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap4_exit_condition;
	information = dia_salandril_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_salandril_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP5_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap5_exit_condition;
	information = dia_salandril_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_salandril_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP6_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap6_exit_condition;
	information = dia_salandril_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_salandril_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


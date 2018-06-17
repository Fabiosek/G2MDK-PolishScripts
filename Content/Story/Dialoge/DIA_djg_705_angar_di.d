
instance DIA_ANGAR_DI_EXIT(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 999;
	condition = dia_angar_di_exit_condition;
	information = dia_angar_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angar_di_exit_condition()
{
	return TRUE;
};

func void dia_angar_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_DI_HALLO(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 10;
	condition = dia_angar_di_hallo_condition;
	information = dia_angar_di_hallo_info;
	permanent = TRUE;
	description = "Jak siê masz?";
};


func int dia_angar_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_angar_di_hallo_info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//Jak siê czujesz?
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_01");	//Odk¹d wyl¹dowaliœmy na tej wyspie, moje bóle g³owy sta³y siê nie do zniesienia.
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_02");	//Cholera. To siê musi wreszcie skoñczyæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_03");	//O mnie siê nie martw. Wynoœmy siê st¹d!
	};
};


instance DIA_ANGAR_DI_ORKS(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_orks_condition;
	information = dia_angar_di_orks_info;
	important = TRUE;
};


func int dia_angar_di_orks_condition()
{
	if((ORKSTURMDI == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_di_orks_info()
{
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_00");	//Pospiesz siê, do diaska! Nastêpnego ataku orków mo¿emy nie prze¿yæ.
	AI_Output(other,self,"DIA_Angar_DI_ORKS_15_01");	//Robiê, co mogê.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_02");	//To trochê za ma³o!
	Info_ClearChoices(dia_angar_di_orks);
	Info_AddChoice(dia_angar_di_orks,"Spokojnie.",dia_angar_di_orks_no);
	Info_AddChoice(dia_angar_di_orks,"Pomó¿ mi...",dia_angar_di_orks_follow);
};

func void dia_angar_di_orks_follow()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_follow_15_00");	//Zamiast narzekaæ, móg³byœ mi pomóc.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_follow_04_01");	//Tak zrobiê. No dalej, ruszaj przodem!
	AI_StopProcessInfos(self);
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FollowDI");
	ANGAR_DI_PARTY = LOG_RUNNING;
};

func void dia_angar_di_orks_no()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_no_15_00");	//Uspokój siê trochê.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_no_04_01");	//£atwo ci powiedzieæ, ale ja tu odchodzê od zmys³ów.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_DI_FOLLOW(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_follow_condition;
	information = dia_angar_di_follow_info;
	permanent = TRUE;
	description = "Chcê, ¿ebyœ tu zosta³.";
};


func int dia_angar_di_follow_condition()
{
	if(ANGAR_DI_PARTY == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_angar_di_follow_info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_00");	//Chcê, ¿ebyœ tu zosta³.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_01");	//Dalej poradzê sobie sam.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//Powodzenia.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		ANGAR_DI_PARTY = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//Jasne.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"Start");
		}
		else if(Npc_IsDead(firedragonisland))
		{
			Npc_ExchangeRoutine(self,"FireDragonIsland");
		}
		else if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		else if(Npc_IsDead(troll_di))
		{
			Npc_ExchangeRoutine(self,"Troll_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	ANGAR_DI_PARTY = LOG_OBSOLETE;
};


instance DIA_ANGAR_DI_FOLLOWAGAIN(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_followagain_condition;
	information = dia_angar_di_followagain_info;
	permanent = TRUE;
	description = "ChodŸmy!";
};


func int dia_angar_di_followagain_condition()
{
	if(ANGAR_DI_PARTY == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_angar_di_followagain_info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOWAGAIN_15_00");	//ChodŸmy!
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWAGAIN_04_01");	//Ty przodem.
	ANGAR_DI_PARTY = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowDI");
};


instance DIA_ANGAR_DI_FOLLOWSTOP(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_followstop_condition;
	information = dia_angar_di_followstop_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_angar_di_followstop_condition()
{
	if((ANGAR_DI_PARTY == LOG_RUNNING) && (((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON") < 3000) && (Npc_IsDead(firedragonisland) == FALSE)) || (Npc_GetDistToWP(self,"SKELETTE") < 3000)))
	{
		return TRUE;
	};
};

func void dia_angar_di_followstop_info()
{
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWSTOP_04_00");	//Aaargh! Moja g³owa! Zaraz oszalejê!
};


instance DIA_ANGAR_DI_UNDEADDRGDEAD(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 2;
	condition = dia_angar_di_undeaddrgdead_condition;
	information = dia_angar_di_undeaddrgdead_info;
	description = "(z uœmiechem) Uda³o ci siê prze¿yæ.";
};


func int dia_angar_di_undeaddrgdead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_angar_di_undeaddrgdead_info()
{
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_00");	//Uda³o ci siê prze¿yæ.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_01");	//Mo¿emy siê st¹d wreszcie wynieœæ?
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_02");	//Czemu nie... Wróg zosta³ pokonany.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_03");	//No to nie traæmy czasu. IdŸ do kapitana i ka¿ mu podnosiæ kotwicê.
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_04");	//Mam tylko nadziejê, ¿e nie natkniemy siê ju¿ na twoich dawnych kompanów.
		AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_05");	//Wszystko jest mo¿liwe. Przeœladowcy byli niezwykle skuteczni. Ma³o brakowa³o, a ja te¿ uleg³bym ich mocy. Kto wie?
	};
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_06");	//Co zamierzasz teraz robiæ?
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_07");	//Mo¿e osi¹dê gdzieœ na wsi i zostanê rolnikiem? Doœæ ju¿ mam wojaczki.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ANGAR_DI_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 900;
	condition = dia_angar_di_pickpocket_condition;
	information = dia_angar_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_di_pickpocket_condition()
{
	return c_beklauen(47,45);
};

func void dia_angar_di_pickpocket_info()
{
	Info_ClearChoices(dia_angar_di_pickpocket);
	Info_AddChoice(dia_angar_di_pickpocket,DIALOG_BACK,dia_angar_di_pickpocket_back);
	Info_AddChoice(dia_angar_di_pickpocket,DIALOG_PICKPOCKET,dia_angar_di_pickpocket_doit);
};

func void dia_angar_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_di_pickpocket);
};

func void dia_angar_di_pickpocket_back()
{
	Info_ClearChoices(dia_angar_di_pickpocket);
};


instance DIA_ANGAR_DI_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 7;
	condition = dia_angar_di_foundamulett_condition;
	information = dia_angar_di_foundamulett_info;
	description = "Znalaz³em twój amulet.";
};


func int dia_angar_di_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_di_foundamulett_info()
{
	b_angarsamulettabgeben();
};


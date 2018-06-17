
instance DIA_ADDON_OWEN_EXIT(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 999;
	condition = dia_addon_owen_exit_condition;
	information = dia_addon_owen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_owen_exit_condition()
{
	return TRUE;
};

func void dia_addon_owen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_OWEN_PICKPOCKET(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 900;
	condition = dia_addon_owen_pickpocket_condition;
	information = dia_addon_owen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_owen_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_owen_pickpocket_info()
{
	Info_ClearChoices(dia_addon_owen_pickpocket);
	Info_AddChoice(dia_addon_owen_pickpocket,DIALOG_BACK,dia_addon_owen_pickpocket_back);
	Info_AddChoice(dia_addon_owen_pickpocket,DIALOG_PICKPOCKET,dia_addon_owen_pickpocket_doit);
};

func void dia_addon_owen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_owen_pickpocket);
};

func void dia_addon_owen_pickpocket_back()
{
	Info_ClearChoices(dia_addon_owen_pickpocket);
};


instance DIA_ADDON_OWEN_HELLO(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 1;
	condition = dia_addon_owen_hello_condition;
	information = dia_addon_owen_hello_info;
	important = TRUE;
};


func int dia_addon_owen_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_owen_hello_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//Kim jesteœ? Nale¿ysz do bandytów?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//A wygl¹dam na takiego?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_pir_m_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_l_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_h_addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Nosisz nasze barwy, ale nie znam ciê.
	}
	else if((Hlp_IsItem(itm,itar_bdt_m) == TRUE) || (Hlp_IsItem(itm,itar_bdt_h) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Prawdê mówi¹c, to tak.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Nie. S¹dz¹c po wygl¹dzie, jestem sk³onny uwierzyæ, ¿e przybywasz z daleka.
	};
};


instance DIA_ADDON_OWEN_WASMACHEN(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_wasmachen_condition;
	information = dia_addon_owen_wasmachen_info;
	description = "Co tu robisz?";
};


func int dia_addon_owen_wasmachen_condition()
{
	if(MALCOM_ACCIDENT == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_owen_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Jestem drwalem. R¹biê drzewa, które inni zaci¹gaj¹ do obozu.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//A tak naprawdê zaharowujê siê tu na œmieræ, podczas gdy pozostali bycz¹ siê na s³oñcu.
};


instance DIA_ADDON_OWEN_PERM(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 99;
	condition = dia_addon_owen_perm_condition;
	information = dia_addon_owen_perm_info;
	permanent = TRUE;
	description = "Coœ jeszcze?";
};


func int dia_addon_owen_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_wasmachen) || Npc_KnowsInfo(other,dia_addon_owen_malcomstunt))
	{
		return TRUE;
	};
};

func void dia_addon_owen_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//Coœ jeszcze?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Gdybym wiedzia³, ¿e tak to bêdzie wygl¹daæ, nigdy nie zosta³bym piratem.
};


instance DIA_ADDON_OWEN_HENRY(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_henry_condition;
	information = dia_addon_owen_henry_info;
	permanent = TRUE;
	description = "Henry czeka na dostawê drewna do budowy palisady.";
};


func int dia_addon_owen_henry_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_RUNNING) && (OWEN_COMESTOHENRY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_owen_henry_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry czeka na dostawê drewna do budowy palisady.
	if(MIS_OWEN_FINDMALCOM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//Najpierw muszê siê dowiedzieæ, co siê sta³o z moim kumplem Malcolmem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Dobrze, dobrze, zadbam o to jego drewno.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//IdŸ i powiedz mu to.
		b_logentry(TOPIC_ADDON_HOLOWEN,"Mam powiedzieæ Henry'emu, ¿e Owen dostarczy drewno.");
		AI_StopProcessInfos(self);
		OWEN_COMESTOHENRY = TRUE;
	};
};


instance DIA_ADDON_OWEN_MALCOMSTUNT(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 1;
	condition = dia_addon_owen_malcomstunt_condition;
	information = dia_addon_owen_malcomstunt_info;
	description = "Co siê dzieje?";
};


func int dia_addon_owen_malcomstunt_condition()
{
	if(MALCOM_ACCIDENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_owen_malcomstunt_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Co siê dzieje?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//Mój kompan, Malcolm, gdzieœ znikn¹³.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//Zostaliœmy zaatakowani przez topielce.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Trochê ich by³o, wiêc zwialiœmy do jaskini.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Niestety, jedna z tych bestii przylaz³a za nami.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcolm rzuci³ siê, ¿eby j¹ odpêdziæ. I wpad³ razem z ni¹ do jakiejœ jamy.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Wyl¹dowali w wodzie, bo s³ysza³em chlupniêcie.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Przez chwilê s³ysza³em odg³osy walki, a potem zapad³a cisza.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Nie wiem nawet, czy Malcolm ¿yje.
	Log_CreateTopic(TOPIC_ADDON_MALCOMSSTUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MALCOMSSTUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Owen chce wiedzieæ, czy jego przyjaciel Malcom ¿yje. Spad³ z urwiska obok obozu razem z topielcem.");
	Log_AddEntry(TOPIC_ADDON_MALCOMSSTUNT,"Owen powiedzia³, ¿e na dole jest woda i przez jakiœ czas Malcom ¿y³. Ale wkrótce przesta³ dawaæ znaki ¿ycia.");
	MIS_OWEN_FINDMALCOM = LOG_RUNNING;
};


instance DIA_ADDON_OWEN_RUNTER(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_runter_condition;
	information = dia_addon_owen_runter_info;
	description = "Jak mogê zejœæ do tej rozpadliny?";
};


func int dia_addon_owen_runter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_malcomstunt) && (MIS_OWEN_FINDMALCOM == LOG_RUNNING) && (Npc_HasItems(malcom,itwr_twohstoneplate3_addon) > 0))
	{
		return TRUE;
	};
};

func void dia_addon_owen_runter_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Jak mogê zejœæ do tej rozpadliny?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Trzeba albo zejœæ po œcianie, albo zeskoczyæ.
};


instance DIA_ADDON_OWEN_MALCOMDEAD(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_malcomdead_condition;
	information = dia_addon_owen_malcomdead_info;
	description = "Niestety, Malcolm nie ¿yje.";
};


func int dia_addon_owen_malcomdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_malcomstunt) && (MIS_OWEN_FINDMALCOM == LOG_RUNNING) && (Npc_HasItems(malcom,itwr_twohstoneplate3_addon) == 0))
	{
		return TRUE;
	};
};

func void dia_addon_owen_malcomdead_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Niestety, Malcolm nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//No tego siê obawia³em. A teraz bêdê sobie wyrzuca³, ¿e mu nie pomog³em.
	if(SC_MADESTUNT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//Jesteœ naprawdê odwa¿ny, wiesz?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Ja nigdy bym siê na to nie zdoby³.
	};
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Powiedzia³em Owenowi, ¿e Malcolm nie ¿yje. Nie przej¹³ siê tym za bardzo.");
	MIS_OWEN_FINDMALCOM = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_OWEN_MALCOMDEAD);
};


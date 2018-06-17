
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
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//Kim jeste�? Nale�ysz do bandyt�w?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//A wygl�dam na takiego?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_pir_m_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_l_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_h_addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//Nosisz nasze barwy, ale nie znam ci�.
	}
	else if((Hlp_IsItem(itm,itar_bdt_m) == TRUE) || (Hlp_IsItem(itm,itar_bdt_h) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//Prawd� m�wi�c, to tak.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//Nie. S�dz�c po wygl�dzie, jestem sk�onny uwierzy�, �e przybywasz z daleka.
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
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//Jestem drwalem. R�bi� drzewa, kt�re inni zaci�gaj� do obozu.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//A tak naprawd� zaharowuj� si� tu na �mier�, podczas gdy pozostali bycz� si� na s�o�cu.
};


instance DIA_ADDON_OWEN_PERM(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 99;
	condition = dia_addon_owen_perm_condition;
	information = dia_addon_owen_perm_info;
	permanent = TRUE;
	description = "Co� jeszcze?";
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
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//Co� jeszcze?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//Gdybym wiedzia�, �e tak to b�dzie wygl�da�, nigdy nie zosta�bym piratem.
};


instance DIA_ADDON_OWEN_HENRY(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_henry_condition;
	information = dia_addon_owen_henry_info;
	permanent = TRUE;
	description = "Henry czeka na dostaw� drewna do budowy palisady.";
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
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry czeka na dostaw� drewna do budowy palisady.
	if(MIS_OWEN_FINDMALCOM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//Najpierw musz� si� dowiedzie�, co si� sta�o z moim kumplem Malcolmem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Dobrze, dobrze, zadbam o to jego drewno.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Id� i powiedz mu to.
		b_logentry(TOPIC_ADDON_HOLOWEN,"Mam powiedzie� Henry'emu, �e Owen dostarczy drewno.");
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
	description = "Co si� dzieje?";
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
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//Co si� dzieje?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//M�j kompan, Malcolm, gdzie� znikn��.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//Zostali�my zaatakowani przez topielce.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//Troch� ich by�o, wi�c zwiali�my do jaskini.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//Niestety, jedna z tych bestii przylaz�a za nami.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcolm rzuci� si�, �eby j� odp�dzi�. I wpad� razem z ni� do jakiej� jamy.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Wyl�dowali w wodzie, bo s�ysza�em chlupni�cie.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//Przez chwil� s�ysza�em odg�osy walki, a potem zapad�a cisza.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//Nie wiem nawet, czy Malcolm �yje.
	Log_CreateTopic(TOPIC_ADDON_MALCOMSSTUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MALCOMSSTUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Owen chce wiedzie�, czy jego przyjaciel Malcom �yje. Spad� z urwiska obok obozu razem z topielcem.");
	Log_AddEntry(TOPIC_ADDON_MALCOMSSTUNT,"Owen powiedzia�, �e na dole jest woda i przez jaki� czas Malcom �y�. Ale wkr�tce przesta� dawa� znaki �ycia.");
	MIS_OWEN_FINDMALCOM = LOG_RUNNING;
};


instance DIA_ADDON_OWEN_RUNTER(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_runter_condition;
	information = dia_addon_owen_runter_info;
	description = "Jak mog� zej�� do tej rozpadliny?";
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
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//Jak mog� zej�� do tej rozpadliny?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Trzeba albo zej�� po �cianie, albo zeskoczy�.
};


instance DIA_ADDON_OWEN_MALCOMDEAD(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_malcomdead_condition;
	information = dia_addon_owen_malcomdead_info;
	description = "Niestety, Malcolm nie �yje.";
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
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Niestety, Malcolm nie �yje.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//No tego si� obawia�em. A teraz b�d� sobie wyrzuca�, �e mu nie pomog�em.
	if(SC_MADESTUNT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//Jeste� naprawd� odwa�ny, wiesz?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//Ja nigdy bym si� na to nie zdoby�.
	};
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Powiedzia�em Owenowi, �e Malcolm nie �yje. Nie przej�� si� tym za bardzo.");
	MIS_OWEN_FINDMALCOM = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_OWEN_MALCOMDEAD);
};


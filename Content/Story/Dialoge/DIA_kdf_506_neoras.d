
instance DIA_NEORAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap1_exit_condition;
	information = dia_neoras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_neoras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_HALLO(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 2;
	condition = dia_neoras_hallo_condition;
	information = dia_neoras_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_neoras_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_neoras_hallo_info()
{
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Co... co si� sta�o? Nie widzisz, �e w�a�nie przeprowadzam niezwykle skomplikowany eksperyment?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Nie chc� przeszkadza�.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Ju� przeszkodzi�e�... C�, m�w, czego chcesz?
};


instance DIA_NEORAS_ARBEIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 5;
	condition = dia_neoras_arbeit_condition;
	information = dia_neoras_arbeit_info;
	permanent = FALSE;
	description = "Czy masz dla mnie jak�� prac�?";
};


func int dia_neoras_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_arbeit_info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//Czy masz dla mnie jak�� prac�?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Tak, potrzebuj� pewnych ro�lin do moich eksperyment�w, a dok�adnie - musz� mie� ogniste pokrzywy.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Wystarczy siedem kwiat�w. Przynie� mi je, prosz�. Ach, i jeszcze jedno, zapodzia�em gdzie� receptur� magicznych mikstur.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Je�li j� znajdziesz, b�d� dozgonnie wdzi�czny.
	MIS_NEORASPFLANZEN = LOG_RUNNING;
	MIS_NEORASREZEPT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NEORASPFLANZEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASPFLANZEN,LOG_RUNNING);
	b_logentry(TOPIC_NEORASPFLANZEN,"Mam przynie�� Mistrzowi Neorasowi siedem ognistych pokrzyw.");
	Log_CreateTopic(TOPIC_NEORASREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_NEORASREZEPT,"Mistrz Neoras nie mo�e znale�� receptury na mikstur� many.");
	if(Npc_KnowsInfo(other,dia_opolos_beibringen))
	{
		b_logentry(TOPIC_NEORASREZEPT,"To musi by� receptura, kt�r� chcia� pozna� Opolos.");
	};
};


instance DIA_NEORAS_REZEPT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 6;
	condition = dia_neoras_rezept_condition;
	information = dia_neoras_rezept_info;
	permanent = TRUE;
	description = "Co do twojej receptury...";
};


func int dia_neoras_rezept_condition()
{
	if(MIS_NEORASREZEPT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_rezept_info()
{
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Co do twojej receptury...
	if(b_giveinvitems(other,self,itwr_manarezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Uda�o mi si� j� odnale��.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Doskonale, obawia�em si�, �e przepad�a na dobre.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Przyjmij, prosz�, t� mikstur� w dow�d mojej wdzi�czno�ci.
		MIS_NEORASREZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASREZEPT);
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Jeszcze jej nie znalaz�em.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//C�, mam nadziej�, �e pr�dzej czy p�niej ci si� uda.
	};
};


instance DIA_NEORAS_FLIEDER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 7;
	condition = dia_neoras_flieder_condition;
	information = dia_neoras_flieder_info;
	permanent = TRUE;
	description = "Mam dla ciebie ogniste pokrzywy.";
};


func int dia_neoras_flieder_condition()
{
	if(MIS_NEORASPFLANZEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_flieder_info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Mam dla ciebie ogniste pokrzywy.
	if(b_giveinvitems(other,self,itpl_mana_herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Doskonale, przydadz� mi si� w badaniach. W zamian we� ten zw�j 'Pi�� wichru', na pewno oka�e si� pomocny.
		MIS_NEORASPFLANZEN = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASPFLANZEN);
		b_giveinvitems(self,other,itsc_windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Naprawd�? Och, masz ich za ma�o. Potrzebuj� SIEDMIU ro�lin.
	};
};


instance DIA_NEORAS_TEACH(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 10;
	condition = dia_neoras_teach_condition;
	information = dia_neoras_teach_info;
	permanent = TRUE;
	description = "Czy m�g�bym si� u ciebie uczy�?";
};


func int dia_neoras_teach_condition()
{
	return TRUE;
};

func void dia_neoras_teach_info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Czy m�g�bym si� u ciebie uczy�?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Zdradz� ci arkana sztuk alchemicznych.
		Info_ClearChoices(dia_neoras_teach);
		Info_AddChoice(dia_neoras_teach,DIALOG_BACK,dia_neoras_teach_back);
		if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_neoras_teach_health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Ekstrakt leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_neoras_teach_health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Eliksir leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_neoras_teach_health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Eliksir �ycia",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_neoras_teach_perm_health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_neoras_teach_mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Ekstrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_neoras_teach_mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Eliksir many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_neoras_teach_mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Eliksir ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_neoras_teach_perm_mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Nie ucz� nowicjuszy. Je�li, pewnego dnia, zostaniesz przyj�ty do Kr�gu Ognia...
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//wtedy poka�� ci, jak tworzy� pot�ne mikstury.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Swoj� wiedz� przekazuj� jedynie cz�onkom naszego ko�cio�a.
	};
};

func void dia_neoras_teach_back()
{
	Info_ClearChoices(dia_neoras_teach);
};

func void dia_neoras_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_neoras_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_neoras_teach_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_neoras_teach_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_neoras_teach_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_neoras_teach_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_neoras_teach_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_neoras_teach_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};


instance DIA_NEORAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap2_exit_condition;
	information = dia_neoras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_neoras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap3_exit_condition;
	information = dia_neoras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_neoras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_BREWPOTION(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 39;
	condition = dia_neoras_brewpotion_condition;
	information = dia_neoras_brewpotion_info;
	permanent = TRUE;
	description = "Czy m�g�by� przyrz�dzi� dla mnie jak�� mikstur�?";
};


func int dia_neoras_brewpotion_condition()
{
	if(NEORASBREWSFORYOU == FALSE)
	{
		return TRUE;
	};
};

func void dia_neoras_brewpotion_info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Czy m�g�by� przyrz�dzi� dla mnie jak�� mikstur�?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Jak na nowicjusza, jeste� strasznie impertynencki. Wracaj lepiej do swoich obowi�zk�w.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Wszystko, czego potrzebujesz, mo�esz kupi� u Goraxa.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Czy�by� w�tpi� w moje umiej�tno�ci? Potrafi� przygotowa� ka�d� mikstur�.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Doskonale.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Nie tak szybko. Wpierw musisz mi dostarczy� odpowiednie sk�adniki, no i zap�aci� za odczynniki i robocizn�.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Ile ��dasz?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//Za samo sporz�dzenie mikstury - 10 sztuk z�ota.
		NEORASBREWSFORYOU = TRUE;
	};
};


instance DIA_NEORAS_BREWFORME(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 39;
	condition = dia_neoras_brewforme_condition;
	information = dia_neoras_brewforme_info;
	permanent = TRUE;
	description = "Uwarz dla mnie...";
};


func int dia_neoras_brewforme_condition()
{
	if(NEORASBREWSFORYOU == TRUE)
	{
		return TRUE;
	};
};

func void dia_neoras_brewforme_info()
{
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"mikstur� szybko�ci.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"ekstrakt many.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"ekstrakt leczniczy.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_back()
{
	Info_ClearChoices(dia_neoras_brewforme);
};

func void dia_neoras_brewforme_speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Czy mo�esz przyrz�dzi� dla mnie mikstur� szybko�ci?
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Oczywi�cie, a masz potrzebne sk�adniki i z�oto?
	if((Npc_HasItems(other,itpl_speed_herb_01) >= 1) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Oto one.
		b_giveinvitems(other,self,itpl_speed_herb_01,1);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//�wietnie, dzi�kuj�. Zaraz dam ci mikstur�, nie b�dziesz musia� d�ugo czeka�.
		b_giveinvitems(self,other,itpo_speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//Nie masz odpowiednich sk�adnik�w. Wr��, kiedy je zgromadzisz.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Uwarz dla mnie mikstur� wielkiej szybko�ci.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie mikstur� many?",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Czy mo�esz przyrz�dzi� dla mnie mikstur� many?
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Oczywi�cie, a masz potrzebne sk�adniki i z�oto?
	if((Npc_HasItems(other,itpl_mana_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Tak, oto one.
		b_giveinvitems(other,self,itpl_mana_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//�wietnie. Zaraz dam ci mikstur�, nie b�dziesz musia� d�ugo czeka�.
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//Nie masz odpowiednich sk�adnik�w. Wr��, kiedy je zgromadzisz.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie mikstur� szybko�ci?",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie mikstur� many?",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Oczywi�cie, a masz potrzebne sk�adniki i z�oto?
	if((Npc_HasItems(other,itpl_health_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Tak, oto one.
		b_giveinvitems(other,self,itpl_health_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//�wietnie. Zaraz dam ci eliksir, nie b�dziesz musia� d�ugo czeka�.
		b_giveinvitems(self,other,itpo_health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//Nie masz odpowiednich sk�adnik�w. Wr��, kiedy je zgromadzisz.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie mikstur� szybko�ci?",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie mikstur� many?",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Czy mo�esz przyrz�dzi� dla mnie eliksir leczniczy?",dia_neoras_brewforme_health);
};


instance DIA_NEORAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap4_exit_condition;
	information = dia_neoras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_neoras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_DRACHENEIER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 40;
	condition = dia_neoras_dracheneier_condition;
	information = dia_neoras_dracheneier_info;
	permanent = TRUE;
	description = "Wygl�dasz na zm�czonego.";
};


func int dia_neoras_dracheneier_condition()
{
	if((KAPITEL >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_NEORAS_DRAGONEGG == 0))
	{
		return TRUE;
	};
};

func void dia_neoras_dracheneier_info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Wygl�dasz na zm�czonego.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//To prawda, jestem kompletnie wycie�czony. Od tygodni m�cz� si� nad pewn� przekl�t� mieszank�. I nic, nie dzia�a.
	Info_ClearChoices(dia_neoras_dracheneier);
	Info_AddChoice(dia_neoras_dracheneier,"To nie m�j problem.",dia_neoras_dracheneier_no);
	Info_AddChoice(dia_neoras_dracheneier,"Co to ma niby by� za mikstura?",dia_neoras_dracheneier_trank);
	Info_AddChoice(dia_neoras_dracheneier,"Jaki� problem?",dia_neoras_dracheneier_ei);
};

func void dia_neoras_dracheneier_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//W czym problem?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//Receptura m�wi co� o smoczym jaju. Niestety, nie mam tego sk�adnika.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Pr�buj� zast�pi� go innym, jednak, jak na razie, z mizernym skutkiem.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Je�li uda�oby ci si� na nie natkn��, pomy�l o mnie.
	Info_AddChoice(dia_neoras_dracheneier,"Czego u�ywasz zamiast smoczych jaj?",dia_neoras_dracheneier_ei_statt);
	Info_AddChoice(dia_neoras_dracheneier,"Zobacz�, co da si� zrobi�.",dia_neoras_dracheneier_ei_jep);
};

func void dia_neoras_dracheneier_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Zobacz�, co si� da zrobi�.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Spokojnie, tylko �artowa�em. W�tpi�, by uda�o ci si� znale�� jajo smoka.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Sk�d ta pewno��?
	Info_ClearChoices(dia_neoras_dracheneier);
	Log_CreateTopic(TOPIC_DRACHENEIERNEORAS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNEORAS,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENEIERNEORAS,"Neoras potrzebuje smoczego jaja do swoich eksperyment�w. Niewykluczone, �e uda mi si� je znale�� w jakiej� jaskini.");
	MIS_NEORAS_DRAGONEGG = LOG_RUNNING;
};

func void dia_neoras_dracheneier_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//Czego u�ywasz zamiast smoczych jaj?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Wierz mi, nie chcesz wiedzie�.
};

func void dia_neoras_dracheneier_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//O jakiej miksturze w�a�ciwie m�wisz?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Receptur� kupi�em od obwo�nego kupca. Jej tre�� jest wielce dziwaczna, a zarazem ciekawa.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Nie mam pewno�ci co do efektu dzia�ania mikstury, jednak ciekawo�� nie pozwala mi przerwa� bada�.
};

func void dia_neoras_dracheneier_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//To nie moja sprawa.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//W takim razie nie zawracaj mi g�owy.
	Info_ClearChoices(dia_neoras_dracheneier);
};


instance DIA_NEORAS_FOUNDDRAGONEGG(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_founddragonegg_condition;
	information = dia_neoras_founddragonegg_info;
	description = "Prosz�, mam dla ciebie jajo smoka.";
};


func int dia_neoras_founddragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis) && (MIS_NEORAS_DRAGONEGG == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int neoras_dragoneggdrink_day;

func void dia_neoras_founddragonegg_info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Prosz�, mam dla ciebie jajo smoka.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Raczysz sobie �artowa�.
	b_giveinvitems(other,self,itat_dragonegg_mis,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Jest prawdziwe! Sk�d je masz?! Jak je znalaz�e�?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Wola�bym zachowa� to dla siebie.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Jak uwa�asz. Co za nie chcesz?
	MIS_NEORAS_DRAGONEGG = LOG_SUCCESS;
	b_giveplayerxp(XP_NEORAS_DRAGONEGG);
	Info_ClearChoices(dia_neoras_founddragonegg);
	Info_AddChoice(dia_neoras_founddragonegg,"Zaskocz mnie.",dia_neoras_founddragonegg_irgendwas);
	Info_AddChoice(dia_neoras_founddragonegg,"Mo�e mikstury lecznicze?",dia_neoras_founddragonegg_heil);
	Info_AddChoice(dia_neoras_founddragonegg,"Daj mi troch� mikstury, kiedy b�dzie gotowa.",dia_neoras_founddragonegg_trank);
};


var int neoras_scwantsdragoneggdrink;

func void dia_neoras_founddragonegg_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Daj mi troch� mikstury, kiedy b�dzie gotowa.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//W porz�dku. Ale pami�taj, co ci powiedzia�em, nie wiem, jaki b�dzie rezultat tego eksperymentu.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Przyjd� p�niej, kiedy sko�cz�.
	NEORAS_DRAGONEGGDRINK_DAY = Wld_GetDay();
	NEORAS_SCWANTSDRAGONEGGDRINK = TRUE;
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Mo�e mikstury lecznicze?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Doskona�y wyb�r. Prosz�, oto one. Na pewno ci si� przydadz�.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Zaskocz mnie.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Mmm. W porz�dku. We� ten magiczny pier�cie�. Na pewno przyda si� w starciach z wrogami.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//B�dzie ci� chroni� przed atakami magicznych istot.
	CreateInvItems(self,itri_prot_mage_02,1);
	b_giveinvitems(self,other,itri_prot_mage_02,1);
	Info_ClearChoices(dia_neoras_founddragonegg);
};


instance DIA_NEORAS_DRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_dragoneggdrink_condition;
	information = dia_neoras_dragoneggdrink_info;
	description = "Przychodz� po straszliw� mikstur� ze smoczego jaja.";
};


func int dia_neoras_dragoneggdrink_condition()
{
	if((NEORAS_DRAGONEGGDRINK_DAY <= (Wld_GetDay() - 2)) && (NEORAS_SCWANTSDRAGONEGGDRINK == TRUE))
	{
		return TRUE;
	};
};

func void dia_neoras_dragoneggdrink_info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Przychodz� po straszliw� mikstur� ze smoczego jaja.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Ach tak, w�a�nie j� przygotowa�em. Nie mia�em jednak czasu jej przetestowa� i nie wezm� odpowiedzialno�ci za niepo��dane efekty.
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Oddaj mi j� natychmiast.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Dobrze ju�, dobrze. Mam tylko nadziej�, �e nie eksploduje ci od niej g�owa.
	CreateInvItems(self,itpo_dragoneggdrinkneoras_mis,1);
	b_giveinvitems(self,other,itpo_dragoneggdrinkneoras_mis,1);
};


instance DIA_NEORAS_USEDDRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_useddragoneggdrink_condition;
	information = dia_neoras_useddragoneggdrink_info;
	description = "Wypr�bowa�em mikstur� ze smoczych jaj. �wietna sprawa!";
};


func int dia_neoras_useddragoneggdrink_condition()
{
	if(NEORAS_SCUSEDDRAGONEGGDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_neoras_useddragoneggdrink_info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Wypr�bowa�em mikstur� ze smoczych jaj. �wietna sprawa!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Mmm. Zaiste ciekawe. Musz� si� zaraz wzi�� do dalszych bada�, absolutnie!
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Czy mo�esz zrobi� jej dla mnie wi�cej?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Poczekajmy kilka tygodni, nim znowu j� wypr�bujemy. No, chyba �e chcesz, by wyros�y ci rogi.
};


instance DIA_NEORAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap5_exit_condition;
	information = dia_neoras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_neoras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_PICKPOCKET(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 900;
	condition = dia_neoras_pickpocket_condition;
	information = dia_neoras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_neoras_pickpocket_condition()
{
	return c_beklauen(72,140);
};

func void dia_neoras_pickpocket_info()
{
	Info_ClearChoices(dia_neoras_pickpocket);
	Info_AddChoice(dia_neoras_pickpocket,DIALOG_BACK,dia_neoras_pickpocket_back);
	Info_AddChoice(dia_neoras_pickpocket,DIALOG_PICKPOCKET,dia_neoras_pickpocket_doit);
};

func void dia_neoras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_neoras_pickpocket);
};

func void dia_neoras_pickpocket_back()
{
	Info_ClearChoices(dia_neoras_pickpocket);
};


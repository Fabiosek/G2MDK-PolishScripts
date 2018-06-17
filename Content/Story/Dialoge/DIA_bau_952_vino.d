
instance DIA_VINO_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_exit_condition;
	information = dia_vino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_vino_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_HALLO(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_hallo_condition;
	information = dia_vino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_hallo_info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//Jak idzie praca?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//Jak zwykle, roboty coraz wi�cej, pieni�dzy coraz mniej. Jak �le p�jdzie, to jutro napadn� nas orkowie i spal� nasz� farm�.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//Kr�lewscy paladyni zaj�li niemal ca�e miasto. Ale jako� w�tpi�, �eby chcia�o im si� ruszy� ty�ki i ochroni� nas przed orkami.
	};
};


instance DIA_VINO_SEEKWORK(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_seekwork_condition;
	information = dia_vino_seekwork_info;
	permanent = FALSE;
	description = "Mog� ci jako� pom�c? Szukam pracy.";
};


func int dia_vino_seekwork_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_worknow) || Npc_KnowsInfo(other,dia_lobart_kleidung)) && !Npc_IsDead(lobart) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_seekwork_info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//Mog� ci jako� pom�c? Szukam pracy.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//Znasz si� na pracy w polu?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//A na czym tu si� zna�?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//Ach! W takim razie ju� ci chyba podzi�kuj�.
		if(!Npc_IsDead(lobart))
		{
			AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//Je�li chcesz si� zatrudni� u Lobarta jako zwyk�y robotnik, to ostrzegam. Ludziom takim jak ty p�aci naprawd� marnie.
			if(((Mob_HasItems("CHEST_LOBART",itar_bau_l) == TRUE) || (Npc_HasItems(lobart,itar_bau_l) > 0)) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (Npc_KnowsInfo(other,dia_lobart_kleidung) || Npc_KnowsInfo(other,dia_lobart_worknow)))
			{
				AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//Obieca�, �e sprzeda mi tanio czyste ubranie, je�li pomog� na farmie.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//Hmmm. Nie mam dla ciebie pracy, ale mo�esz przynie�� mnie i ch�opakom co� do picia.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//Przynie� no flaszk� wina, a powiem Lobartowi, �e� si� �wietnie spisa�.
				MIS_VINO_WEIN = LOG_RUNNING;
				Log_CreateTopic(TOPIC_VINO,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_VINO,LOG_RUNNING);
				b_logentry(TOPIC_VINO,"Je�li Vino dostanie ode mnie butelk� wina, powie Lobartowi, �e mu pomog�em.");
			}
			else
			{
				AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//Ale nie bierzesz jej dla mnie, zrozumiano?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//Nie s�dz�! Kto� taki jak ty nie chcia�by si� chyba m�czy� z prac�, kt�r� mam do zaoferowania.
	};
};


instance DIA_VINO_BRINGWINE(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_bringwine_condition;
	information = dia_vino_bringwine_info;
	permanent = FALSE;
	description = "Oto twoje wino.";
};


func int dia_vino_bringwine_condition()
{
	if((MIS_VINO_WEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_bringwine_info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//Oto twoje wino.
	b_giveinvitems(other,self,itfo_wine,1);
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//Wol� nie pyta�, jak je zdoby�e�. A kog� to obchodzi?
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//Tak czy inaczej, dzi�ki.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//Postaram si�, by Lobart us�ysza� o tobie same dobre rzeczy.
		};
	};
	MIS_VINO_WEIN = LOG_SUCCESS;
	b_giveplayerxp(XP_VINOWEIN);
};


instance DIA_VINO_TOTHECITY(C_INFO)
{
	npc = bau_952_vino;
	nr = 3;
	condition = dia_vino_tothecity_condition;
	information = dia_vino_tothecity_info;
	permanent = FALSE;
	description = "Ruszam w stron� miasta.";
};


func int dia_vino_tothecity_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_vino_tothecity_info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//Ruszam w stron� miasta.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//I?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//Czy mo�esz mi powiedzie� co� ciekawego na temat miasta?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//Nie. Ale Maleth zagl�da tam od czasu do czasu - mo�e on co� wie, to znaczy co�, co by ci� zainteresowa�o.
};


var int vino_gossip_orks;
var int vino_gossip_bugs;

instance DIA_VINO_PERM(C_INFO)
{
	npc = bau_952_vino;
	nr = 10;
	condition = dia_vino_perm_condition;
	information = dia_vino_perm_info;
	permanent = TRUE;
	description = "Jakie� ciekawe nowiny?";
};


func int dia_vino_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vino_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_perm_info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//Jakie� ciekawe nowiny?
	if(VINO_GOSSIP_ORKS == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//Przysi�g�bym, �em dwa dni temu widzia� orka, na skraju lasu.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//Od tego czasu podczas snu staram si� mie� cho� jedno oko otwarte.
		VINO_GOSSIP_ORKS = TRUE;
		KNOWS_ORK = TRUE;
	}
	else if((VINO_GOSSIP_BUGS == FALSE) && (MIS_ANDREHELPLOBART == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//Ta wielka plaga �uk�w doprowadza nas do szale�stwa. S� wsz�dzie. �r� wszystko, co napotkaj� na swej drodze.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//Jako� w zesz�ym tygodniu le�a�em sobie na ��ce i ju� prawie zasypia�em, kiedy poczu�em, �e jedna z tych bestii zaczyna si� dobiera� do mojego buta!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//Trza by�o widzie�, jakem ucieka�. Od tamtego czasu nie mog� spokojnie spa�.
		VINO_GOSSIP_BUGS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//Opr�cz tego, co ci powiedzia�em, nic.
	};
};


instance DIA_VINO_KAP3_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap3_exit_condition;
	information = dia_vino_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_vino_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_DMTAMSTART(C_INFO)
{
	npc = bau_952_vino;
	nr = 31;
	condition = dia_vino_dmtamstart_condition;
	information = dia_vino_dmtamstart_info;
	permanent = TRUE;
	description = "Jak ci si� wiedzie?";
};


func int dia_vino_dmtamstart_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_vino_dmtamstart_onetime;

func void dia_vino_dmtamstart_info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//Jak ci si� wiedzie?
	if((FOUNDVINOSKELLEREI == TRUE) && (DIA_VINO_DMTAMSTART_ONETIME == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//Og�lnie do dupy. Stra� znalaz�a moj� ukryt� gorzelni�.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//Mam nadziej�, �e nie zorientuj� si�, kto jest jej w�a�cicielem.
		b_giveplayerxp(XP_AMBIENTKAP3);
		DIA_VINO_DMTAMSTART_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//I jeszcze te psubraty w czarnych kapturach. Kto� powinien poodcina� im te kapturzyska razem z zawarto�ci�.
	};
};


instance DIA_VINO_OBESESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 32;
	condition = dia_vino_obesessed_condition;
	information = dia_vino_obesessed_info;
	permanent = TRUE;
	description = "Co� nie tak?";
};


func int dia_vino_obesessed_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == FALSE) && (KAPITEL >= 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_vino_obesessed_info()
{
	if(Npc_IsDead(dmt_vino1) && Npc_IsDead(dmt_vino2) && Npc_IsDead(dmt_vino3) && Npc_IsDead(dmt_vino4))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//Co ci si� sta�o?
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//Do cholery, wyno� si�. Inaczej mnie zabij�.
		AI_StopProcessInfos(self);
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_VINO_HEILUNG(C_INFO)
{
	npc = bau_952_vino;
	nr = 55;
	condition = dia_vino_heilung_condition;
	information = dia_vino_heilung_info;
	permanent = TRUE;
	description = "Nie jeste� sob�.";
};


func int dia_vino_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vino_heilung_onetime;

func void dia_vino_heilung_info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//Nie jeste� sob�.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//Moja g�owa... D�u�ej tego nie wytrzymam.
	if(DIA_VINO_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//Powiniene� uda� si� do klasztoru. Pyrokar, najwy�szy Mag Ognia, m�g�by ci pom�c.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//Tak uwa�asz? W porz�dku, spr�buj�.
		b_npcclearobsessionbydmt(self);
		b_startotherroutine(vino,"Kloster");
		b_logentry(TOPIC_DEMENTOREN,"Vino jest op�tany. Wys�a�em go do klasztoru, aby tam poprosi� o uzdrowienie. Mam nadziej�, �e wszystko b�dzie dobrze.");
		b_giveplayerxp(XP_VINOFREEFROMDMT);
		DIA_VINO_HEILUNG_ONETIME = TRUE;
	};
};


instance DIA_VINO_KAP4_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap4_exit_condition;
	information = dia_vino_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_vino_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PERM4OBSESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 41;
	condition = dia_vino_perm4obsessed_condition;
	information = dia_vino_perm4obsessed_info;
	permanent = TRUE;
	description = "Jak si� masz?";
};


func int dia_vino_perm4obsessed_condition()
{
	if((hero.guild == GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int dia_vino_perm4obsessed_xp_onetime;

func void dia_vino_perm4obsessed_info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//Jak si� czujesz?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//Wszystko w porz�dku. Ch�opaki mi pomog�. Wci�� jednak cholernie kr�ci mi si� w g�owie.
	if(DIA_VINO_PERM4OBSESSED_XP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//Musz� przyzna�, �e to najlepsze wino, jakie pi�em.
		b_giveplayerxp(XP_AMBIENT);
		DIA_VINO_PERM4OBSESSED_XP_ONETIME = TRUE;
	};
};


instance DIA_VINO_PERM45UND6(C_INFO)
{
	npc = bau_952_vino;
	nr = 42;
	condition = dia_vino_perm45und6_condition;
	information = dia_vino_perm45und6_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_vino_perm45und6_condition()
{
	if((KAPITEL >= 4) && (hero.guild != GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vino_perm45und6_info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//Jakie� wie�ci?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//Ostatnio drastycznie wzros�a liczba ork�w w okolicy.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//Chyba wy, paladyni, pozb�dziecie si� ich, prawda?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//Obawiam si�, �e wkr�tce przyjdzie nam porzuci� farm�, i przy��czy� si� do najemnik�w Onara.
	};
	if((FOUNDVINOSKELLEREI == TRUE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//Niestety, stra�e znalaz�y moj� ma�� gorzelni�. Mam nadziej�, �e mnie nie dopadn�.
	};
};


instance DIA_VINO_KAP5_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap5_exit_condition;
	information = dia_vino_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vino_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_KAP6_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap6_exit_condition;
	information = dia_vino_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_vino_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PICKPOCKET(C_INFO)
{
	npc = bau_952_vino;
	nr = 900;
	condition = dia_vino_pickpocket_condition;
	information = dia_vino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_vino_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_vino_pickpocket_info()
{
	Info_ClearChoices(dia_vino_pickpocket);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_BACK,dia_vino_pickpocket_back);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_PICKPOCKET,dia_vino_pickpocket_doit);
};

func void dia_vino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vino_pickpocket);
};

func void dia_vino_pickpocket_back()
{
	Info_ClearChoices(dia_vino_pickpocket);
};


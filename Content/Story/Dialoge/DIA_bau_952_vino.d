
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
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//Jak zwykle, roboty coraz wiêcej, pieniêdzy coraz mniej. Jak Ÿle pójdzie, to jutro napadn¹ nas orkowie i spal¹ nasz¹ farmê.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//Królewscy paladyni zajêli niemal ca³e miasto. Ale jakoœ w¹tpiê, ¿eby chcia³o im siê ruszyæ ty³ki i ochroniæ nas przed orkami.
	};
};


instance DIA_VINO_SEEKWORK(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_seekwork_condition;
	information = dia_vino_seekwork_info;
	permanent = FALSE;
	description = "Mogê ci jakoœ pomóc? Szukam pracy.";
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
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//Mogê ci jakoœ pomóc? Szukam pracy.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//Znasz siê na pracy w polu?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//A na czym tu siê znaæ?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//Ach! W takim razie ju¿ ci chyba podziêkujê.
		if(!Npc_IsDead(lobart))
		{
			AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//Jeœli chcesz siê zatrudniæ u Lobarta jako zwyk³y robotnik, to ostrzegam. Ludziom takim jak ty p³aci naprawdê marnie.
			if(((Mob_HasItems("CHEST_LOBART",itar_bau_l) == TRUE) || (Npc_HasItems(lobart,itar_bau_l) > 0)) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (Npc_KnowsInfo(other,dia_lobart_kleidung) || Npc_KnowsInfo(other,dia_lobart_worknow)))
			{
				AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//Obieca³, ¿e sprzeda mi tanio czyste ubranie, jeœli pomogê na farmie.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//Hmmm. Nie mam dla ciebie pracy, ale mo¿esz przynieœæ mnie i ch³opakom coœ do picia.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//Przynieœ no flaszkê wina, a powiem Lobartowi, ¿eœ siê œwietnie spisa³.
				MIS_VINO_WEIN = LOG_RUNNING;
				Log_CreateTopic(TOPIC_VINO,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_VINO,LOG_RUNNING);
				b_logentry(TOPIC_VINO,"Jeœli Vino dostanie ode mnie butelkê wina, powie Lobartowi, ¿e mu pomog³em.");
			}
			else
			{
				AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//Ale nie bierzesz jej dla mnie, zrozumiano?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//Nie s¹dzê! Ktoœ taki jak ty nie chcia³by siê chyba mêczyæ z prac¹, któr¹ mam do zaoferowania.
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
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//Wolê nie pytaæ, jak je zdoby³eœ. A kogó¿ to obchodzi?
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//Tak czy inaczej, dziêki.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//Postaram siê, by Lobart us³ysza³ o tobie same dobre rzeczy.
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
	description = "Ruszam w stronê miasta.";
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
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//Ruszam w stronê miasta.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//I?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//Czy mo¿esz mi powiedzieæ coœ ciekawego na temat miasta?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//Nie. Ale Maleth zagl¹da tam od czasu do czasu - mo¿e on coœ wie, to znaczy coœ, co by ciê zainteresowa³o.
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
	description = "Jakieœ ciekawe nowiny?";
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
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//Jakieœ ciekawe nowiny?
	if(VINO_GOSSIP_ORKS == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//Przysi¹g³bym, ¿em dwa dni temu widzia³ orka, na skraju lasu.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//Od tego czasu podczas snu staram siê mieæ choæ jedno oko otwarte.
		VINO_GOSSIP_ORKS = TRUE;
		KNOWS_ORK = TRUE;
	}
	else if((VINO_GOSSIP_BUGS == FALSE) && (MIS_ANDREHELPLOBART == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//Ta wielka plaga ¿uków doprowadza nas do szaleñstwa. S¹ wszêdzie. ¯r¹ wszystko, co napotkaj¹ na swej drodze.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//Jakoœ w zesz³ym tygodniu le¿a³em sobie na ³¹ce i ju¿ prawie zasypia³em, kiedy poczu³em, ¿e jedna z tych bestii zaczyna siê dobieraæ do mojego buta!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//Trza by³o widzieæ, jakem ucieka³. Od tamtego czasu nie mogê spokojnie spaæ.
		VINO_GOSSIP_BUGS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//Oprócz tego, co ci powiedzia³em, nic.
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
	description = "Jak ci siê wiedzie?";
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
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//Jak ci siê wiedzie?
	if((FOUNDVINOSKELLEREI == TRUE) && (DIA_VINO_DMTAMSTART_ONETIME == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//Ogólnie do dupy. Stra¿ znalaz³a moj¹ ukryt¹ gorzelniê.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//Mam nadziejê, ¿e nie zorientuj¹ siê, kto jest jej w³aœcicielem.
		b_giveplayerxp(XP_AMBIENTKAP3);
		DIA_VINO_DMTAMSTART_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//I jeszcze te psubraty w czarnych kapturach. Ktoœ powinien poodcinaæ im te kapturzyska razem z zawartoœci¹.
	};
};


instance DIA_VINO_OBESESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 32;
	condition = dia_vino_obesessed_condition;
	information = dia_vino_obesessed_info;
	permanent = TRUE;
	description = "Coœ nie tak?";
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
		AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//Co ci siê sta³o?
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//Do cholery, wynoœ siê. Inaczej mnie zabij¹.
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
	description = "Nie jesteœ sob¹.";
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
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//Nie jesteœ sob¹.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//Moja g³owa... D³u¿ej tego nie wytrzymam.
	if(DIA_VINO_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//Powinieneœ udaæ siê do klasztoru. Pyrokar, najwy¿szy Mag Ognia, móg³by ci pomóc.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//Tak uwa¿asz? W porz¹dku, spróbujê.
		b_npcclearobsessionbydmt(self);
		b_startotherroutine(vino,"Kloster");
		b_logentry(TOPIC_DEMENTOREN,"Vino jest opêtany. Wys³a³em go do klasztoru, aby tam poprosi³ o uzdrowienie. Mam nadziejê, ¿e wszystko bêdzie dobrze.");
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
	description = "Jak siê masz?";
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
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//Jak siê czujesz?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//Wszystko w porz¹dku. Ch³opaki mi pomog¹. Wci¹¿ jednak cholernie krêci mi siê w g³owie.
	if(DIA_VINO_PERM4OBSESSED_XP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//Muszê przyznaæ, ¿e to najlepsze wino, jakie pi³em.
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
	description = "Jakieœ wieœci?";
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
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//Jakieœ wieœci?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//Ostatnio drastycznie wzros³a liczba orków w okolicy.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//Chyba wy, paladyni, pozbêdziecie siê ich, prawda?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//Obawiam siê, ¿e wkrótce przyjdzie nam porzuciæ farmê, i przy³¹czyæ siê do najemników Onara.
	};
	if((FOUNDVINOSKELLEREI == TRUE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//Niestety, stra¿e znalaz³y moj¹ ma³¹ gorzelniê. Mam nadziejê, ¿e mnie nie dopadn¹.
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


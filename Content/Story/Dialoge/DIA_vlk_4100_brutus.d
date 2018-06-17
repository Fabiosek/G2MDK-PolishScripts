
instance DIA_BRUTUS_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_exit_condition;
	information = dia_brutus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brutus_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_AFTER_FIGHT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 1;
	condition = dia_brutus_after_fight_condition;
	information = dia_brutus_after_fight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_brutus_after_fight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && Npc_IsInState(self,zs_talk) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_after_fight_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//Co tam, dalej masz wszystkie z�by?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Ale z ciebie twardziel! Nie chcia�bym zmierzy� si� z tob� w bitwie.
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//Chyba po�ama�e� mi wszystkie �ebra.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//A przecie� nie uderzy�em ci� zbyt mocno. Zreszt� niewa�ne, lubi� kolesi, kt�rzy potrafi� przyj�� kilka cios�w.
		if(BRUTUS_EINMALIG == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//Ta mikstura pomo�e ci stan�� z powrotem na nogi. A poza tym �wietnie dzia�a na �o��dek!
			CreateInvItems(self,itpo_health_01,1);
			b_giveinvitems(self,hero,itpo_health_01,1);
			BRUTUS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//Nie mam nic przeciwko dobrej walce. Ale kiedy jak�� zaczynam, to tak�e j� ko�cz�.
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_BRUTUS_PRISONER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_prisoner_condition;
	information = dia_brutus_prisoner_info;
	description = "Czym si� tu zajmujesz?";
};


func int dia_brutus_prisoner_condition()
{
	if((KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_prisoner_info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//Czym si� tu zajmujesz?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//Szkol� ch�opak�w. Ucz� ich, jak wyrobi� sobie stalowe mi�nie.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//Zajmuj� si� tak�e wi�niami. Jestem dla tych bydlak�w jak cholerny ojciec.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//Ale przede wszystkim potrafi� zmusi� ich do m�wienia. Wierz mi - wiem, jak KA�DEGO sk�oni� do m�wienia.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//Brzmi strasznie przyjemnie...
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//Ale te zawszone t�paki, kt�rych tu teraz mamy, nie maj� zbyt wiele do powiedzenia.
	if(MIS_RESCUEGORN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//I nie pozwalaj� mi zaj�� si� tym Gornem.
		KNOWSABOUTGORN = TRUE;
	};
};


instance DIA_BRUTUS_PERM(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 90;
	condition = dia_brutus_perm_condition;
	information = dia_brutus_perm_info;
	permanent = TRUE;
	description = "Co� nowego?";
};


func int dia_brutus_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm_info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//Co� nowego?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//Wszystko jest takie ciche. Nie ma nowych wi�ni�w - nikogo, kto potrzebuje pomocy w znalezieniu w�a�ciwych s��w - szkoda.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KASSE(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_kasse_condition;
	information = dia_brutus_kasse_info;
	permanent = FALSE;
	description = "Mo�esz mnie przeszkoli�?";
};


func int dia_brutus_kasse_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_kasse_info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Mo�esz mnie przeszkoli�?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Pewnie, pomog� ci sta� si� silniejszym, ale nic za darmo.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//Ile chcesz?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Hmmm... wychodzisz poza zamek, prawda? Oto moja propozycja.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//M�j czeladnik, Den, uciek� podczas ostatniego ataku. Zawsze strasznie �atwo ulega� panice.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//Ale nie zwia� z pustymi r�kami. Zabra� ze sob� zawarto�� naszej skarbony.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//Jakiej skarbony?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//Mamy skrzyni�, w kt�rej przechowujemy eee... zgromadzone rzeczy.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//To by�a okr�g�a sumka. W skrzyni znajdowa�o si� 200 sztuk z�ota i troch� cennej bi�uterii.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//Je�eli przyniesiesz mi z�oto, b�dziesz m�g� zatrzyma� bi�uteri�, a ja ci� przeszkol�.
	Log_CreateTopic(TOPICBRUTUSKASSE,LOG_MISSION);
	Log_SetTopicStatus(TOPICBRUTUSKASSE,LOG_RUNNING);
	b_logentry(TOPICBRUTUSKASSE,"Czeladnik Brutusa, Den, uciek�, zabieraj�c ze sob� 200 sztuk z�ota i troch� bi�uterii. Je�li przynios� Brutusowi jego 200 sztuk z�ota, uczyni mnie silniejszym.");
};


instance DIA_BRUTUS_DEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_den_condition;
	information = dia_brutus_den_info;
	permanent = FALSE;
	description = "Wiesz, gdzie skierowa� si� Den?";
};


func int dia_brutus_den_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_den_info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Wiesz, gdzie skierowa� si� Den?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//Jak najdalej st�d. My�l�, �e m�g� uda� si� w stron� prze��czy.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//Dzi�kuj�, to bardzo pomocne.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//C� mog� powiedzie�? Nie mam poj�cia, dok�d poszed�.
	b_logentry(TOPICBRUTUSKASSE,"Den chcia� spr�bowa� przekroczy� prze��cz.");
};


instance DIA_BRUTUS_GOLD(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_gold_condition;
	information = dia_brutus_gold_info;
	permanent = TRUE;
	description = "Mam co� dla ciebie (oddaj 200 sztuk z�ota)";
};


func int dia_brutus_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (BRUTUS_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_gold_info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//Mam co� dla ciebie.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//Znakomicie. Je�li chcesz, mog� ci� szkoli�.
		BRUTUS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"Brutus mo�e mi pokaza�, jak sta� si� silniejszym.");
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//S�uchaj, po prostu przynie� mi 200 sztuk z�ota. Nie obchodzi mnie, sk�d je we�miesz - wa�ne, �eby to by�o z�oto.
	};
};


instance DIA_BRUTUS_TEACH(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 7;
	condition = dia_brutus_teach_condition;
	information = dia_brutus_teach_info;
	permanent = TRUE;
	description = "Chc� by� silniejszy.";
};


func int dia_brutus_teach_condition()
{
	if((BRUTUS_TEACHSTR == TRUE) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_teach_info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//Chc� by� silniejszy.
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_back()
{
	Info_ClearChoices(dia_brutus_teach);
};

func void dia_brutus_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};


instance DIA_BRUTUS_KAP3_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap3_exit_condition;
	information = dia_brutus_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brutus_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_DUSCHONWIEDER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 30;
	condition = dia_brutus_duschonwieder_condition;
	information = dia_brutus_duschonwieder_info;
	permanent = TRUE;
	description = "Torturowa�e� dzisiaj ju� kogo�?";
};


func int dia_brutus_duschonwieder_condition()
{
	if((KAPITEL == 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_duschonwieder_info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Torturowa�e� dzisiaj ju� kogo�?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Nie widzisz, �e jestem zaj�ty? Wr�� p�niej.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KAP4_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap4_exit_condition;
	information = dia_brutus_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brutus_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_WARUMNICHTARBBEIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 40;
	condition = dia_brutus_warumnichtarbbeit_condition;
	information = dia_brutus_warumnichtarbbeit_info;
	description = "Czemu nie pracujesz?";
};


func int dia_brutus_warumnichtarbbeit_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_warumnichtarbbeit_info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Czemu nie pracujesz?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//Ale to odra�aj�ce!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Zagl�da�e� do mojej komnaty? Te paskudne chrz�szcze s� wsz�dzie.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//Nie mam poj�cia, kto mieszka� tam przede mn�, ale ja z pewno�ci� nie wr�c� do tego chlewa.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//Nienawidz� tych bestii. Przesta� si� krety�sko u�miecha�.
	Log_CreateTopic(TOPIC_BRUTUSMEATBUGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRUTUSMEATBUGS,LOG_RUNNING);
	b_logentry(TOPIC_BRUTUSMEATBUGS,"Brutus, oprawca z zamku, boi si� zupe�nie nieszkodliwych chrz�szczy. Prawdziwy z niego twardziel.");
};


instance DIA_BRUTUS_MEATBUGSWEG(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 31;
	condition = dia_brutus_meatbugsweg_condition;
	information = dia_brutus_meatbugsweg_info;
	description = "Chrz�szczy ju� nie ma.";
};


func int dia_brutus_meatbugsweg_condition()
{
	if(Npc_KnowsInfo(other,dia_brutus_warumnichtarbbeit) && Npc_IsDead(meatbug_brutus1) && Npc_IsDead(meatbug_brutus2) && Npc_IsDead(meatbug_brutus3) && Npc_IsDead(meatbug_brutus4) && (KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_meatbugsweg_info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//Chrz�szczy ju� nie ma. Mo�esz wr�ci� do polerowania swoich imade�, czy co tam robi�e�.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//Jeste� pewien, �e nie prze�y� �aden z tych potwor�w?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Na pewno.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//Dobrze wi�c. Przyjmij to z�oto jako dow�d mojej wdzi�czno�ci.
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//Au, zaraz si� rozp�acz�.
	TOPIC_END_BRUTUSMEATBUGS = TRUE;
	b_giveplayerxp(XP_BRUTUSMEATBUGS);
	b_npcclearobsessionbydmt(self);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRUTUS_PERM4(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 32;
	condition = dia_brutus_perm4_condition;
	information = dia_brutus_perm4_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_brutus_perm4_condition()
{
	if((Npc_KnowsInfo(other,dia_brutus_meatbugsweg) || (MIS_OCGATEOPEN == TRUE)) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm4_info()
{
	if((MIS_OCGATEOPEN == TRUE) || ((hero.guild == GIL_KDF) && (KAPITEL >= 5)))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Wszystko w porz�dku?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//Jeste� pewien, �e nie ma ju� tych chrz�szczy?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ehem... Patrz, jeden jest za tob�.
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//Co?
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_BESSEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 55;
	condition = dia_brutus_bessen_condition;
	information = dia_brutus_bessen_info;
	permanent = TRUE;
	description = "Jeste� op�tany!";
};


func int dia_brutus_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_BRUTUS == TRUE) && (NPCOBSESSEDBYDMT == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_bessen_info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//Jeste� op�tany!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//Id� do klasztoru, niech ci� ulecz�.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//Nie mo�na mi pom�c. Odejd�!
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//Kto� musi usun�� z twojej g�owy te demony.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//NIE!
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_KAP5_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap5_exit_condition;
	information = dia_brutus_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap5_exit_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_brutus_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_PICKPOCKET(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 900;
	condition = dia_brutus_pickpocket_condition;
	information = dia_brutus_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brutus_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_brutus_pickpocket_info()
{
	Info_ClearChoices(dia_brutus_pickpocket);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_BACK,dia_brutus_pickpocket_back);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_PICKPOCKET,dia_brutus_pickpocket_doit);
};

func void dia_brutus_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brutus_pickpocket);
};

func void dia_brutus_pickpocket_back()
{
	Info_ClearChoices(dia_brutus_pickpocket);
};


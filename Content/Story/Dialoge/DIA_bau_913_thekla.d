
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Co robisz w mojej kuchni?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "Coœ tutaj wspaniale pachnie!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Coœ tutaj wspaniale pachnie!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//Och tak! Ju¿ ja znam takich jak ty! Myszkujecie po ca³ym domu.
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Najpierw siê przymilacie, a kiedy cz³owiek chce was o coœ poprosiæ - nikogo nigdy nie ma!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "Jestem g³odny!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//Jestem g³odny!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Nie karmiê w³óczêgów. Jedzenie jest dla tych, którzy pracuj¹.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//I dla tego najemnego mot³ochu, oczywiœcie.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Hej, twoje ¿arcie.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Nie obs³ugujemy tu stra¿ników.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Jak mog³abym odmówiæ proœbie przedstawiciela Innosa?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Szukam pracy...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Chcesz pracowaæ na farmie?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//Jedynie Onar mo¿e o tym decydowaæ. Farma, jak i ca³a dolina, nale¿¹ do niego.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "W³aœciwie to chcia³em siê przy³¹czyæ do najemników...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//W³aœciwie to chcia³em siê przy³¹czyæ do najemników...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Jesteœ wiêc jednym z tych przestêpców z kolonii karnej?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//Mog³am siê domyœliæ! Zostaw mnie w spokoju! Jest was tu woko³o ju¿ dostatecznie wielu!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "Szukam miejsca na nocleg.";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Szukam miejsca na nocleg.
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Wybij sobie z g³owy spanie w mojej kuchni. Poszukaj sobie miejsca w stodole.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "Dlaczego tak nie lubisz najemników?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Dlaczego tak nie lubisz najemników?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ci durnie strasznie graj¹ mi na nerwach! Szczególnie Sylvio i jego t³usty kumpel, Bullko.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Przesiaduj¹ tu ca³ymi dniami i uprzykrzaj¹ mi ¿ycie.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//Zupa za gor¹ca, miêso za twarde... I tak dalej, i tak dalej.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//Dlaczego wiêc nic z tym nie zrobisz?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//A co ja mogê, Panie M¹dralo? Pogroziæ im wa³kiem? Na wieœniaków to mo¿e dzia³a, ale na tych œmierdz¹cych drani nie.
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "Mo¿e ja nauczy³bym tych dwóch dobrych manier?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Mo¿e ja nauczy³bym tych dwóch dobrych manier?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Lepiej uwa¿aj, kochaniutki. Z tego co wiem, Sylvio nosi magiczn¹ zbrojê, trudno go pokonaæ.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//A Bullko?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Ten facet jest silny jak wó³. Jak dot¹d za³atwi³ wszystkich, którzy sprzeciwiali siê jemu b¹dŸ Sylviowi.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//Pokaza³eœ Bullkowi, gdzie jego miejsce, kochaniutki.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//Pokonanie tej opas³ej œwini musia³o byæ strasznie mêcz¹ce.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//NieŸle ci siê oberwa³o.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//A nie mówi³am? Teraz ju¿ wiesz, co mia³am na myœli.
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Widzê, ¿e œwietnie siê bawisz.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//No ju¿, nie rób takiej miny. Nie ty pierwszy oberwa³eœ od tego œmiecia.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Masz, zjedz coœ - to powinno dodaæ ci si³.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "Mam tu przesy³kê od Sagitty.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Mam tu przesy³kê od Sagitty.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Wielkie dziêki. Jednak na coœ siê przyda³eœ.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "Dostanê jeszcze trochê gulaszu?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Dostanê jeszcze trochê gulaszu?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//Ju¿ nie ma.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Nawet ma³ej miseczki?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Nawet miseczki.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//Mogê wylizaæ garnek?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Daj spokój!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Skoro tak ci smakuje mój gulasz, bêdziesz musia³ coœ zrobiæ, by go dostaæ.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Co takiego?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Udaj siê do Sagitty, wiedŸmy mieszkaj¹cej za farm¹ Sekoba, i przynieœ mi od niej paczkê zió³.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Jeœli przyniesiesz zio³a, ugotujê gulasz.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		CreateInvItems(sagitta,itmi_theklaspaket,1);
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"Jeœli przyniosê Thekli zio³a od uzdrawiaczki Sagitty, mogê liczyæ na kolejny posi³ek. Sagitta mieszka za farm¹ Sekoba.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//W porz¹dku. Znaj moje dobre serce. Proszê, nie chcê, ¿ebyœ siê biedaczku zag³odzi³.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Hej, hej, hej! Nie tak ³apczywie! Dam ci znaæ, jeœli bêdê mia³a dla ciebie jakieœ zadanie.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//Wtedy dostaniesz wiêcej gulaszu, zrozumiano?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//S³ysza³am, ¿e pomog³eœ Bennetowi. Dobra robota, ch³opcze.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Te psubraty ze stra¿y uwiêzi³y Benneta!
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Zrób coœ dla mnie i wyci¹gnij tego nieszczêœnika. W miêdzyczasie ugotujê trochê smakowitego gulaszu.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//Nic ju¿ nie zosta³o. PrzyjdŸ póŸniej.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Nigdy nie przestajesz byæ g³odny? Czym ty siê w³aœciwie zajmujesz?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//W³aœnie posieka³em kilka smoków.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Och! W takim razie zas³u¿y³eœ chyba na porz¹dn¹ michê gulaszu.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//To wszystko, nie ma ju¿ wiêcej.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//Nie ma zió³, nie ma gulaszu - jasne?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};


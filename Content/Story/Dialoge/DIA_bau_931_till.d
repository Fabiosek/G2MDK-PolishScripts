
instance DIA_TILL_EXIT(C_INFO)
{
	npc = bau_931_till;
	nr = 999;
	condition = dia_till_exit_condition;
	information = dia_till_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_till_exit_condition()
{
	return TRUE;
};

func void dia_till_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TILL_HALLO(C_INFO)
{
	npc = bau_931_till;
	nr = 3;
	condition = dia_till_hallo_condition;
	information = dia_till_hallo_info;
	description = "Hej, m³ody, wszystko gra?";
};


func int dia_till_hallo_condition()
{
	if(KAPITEL < 5)
	{
		return TRUE;
	};
};

func void dia_till_hallo_info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Hej, m³ody, wszystko gra?
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Ile razy mam wam powtarzaæ, ¿e pomocnicy powinni siê do mnie zwracaæ z szacunkiem?!
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"Nie jestem pomocnikiem.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"Ty tu jesteœ szefem?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ty tu jesteœ szefem?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//Ech. Nie, jestem tylko synem Sekoba. Ale kiedy tylko staruszek wyci¹gnie kopyta, to wszystko bêdzie nale¿a³o do mnie.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Zadziwiaj¹ce!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Nie jestem pomocnikiem.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//To po co tu przyszed³eœ? Nic nam ju¿ nie zosta³o, nie masz tu czego szukaæ.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "Zawsze w ten sposób traktujesz swoich pracowników?";
};


func int dia_till_feldarbeiter_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_feldarbeiter_info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Zawsze w ten sposób traktujesz swoich pracowników?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Oczywiœcie - i dobrze im to robi. Musz¹ znaæ swoje miejsce.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "Muszê porozmawiaæ z twoim ojcem.";
};


func int dia_till_sekob_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && (Npc_KnowsInfo(other,dia_sekob_hallo) == FALSE) && (KAPITEL < 3) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_till_sekob_info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Muszê porozmawiaæ z twoim ojcem.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//Ojciec nie ma czasu. Ja mogê ciê wys³uchaæ w jego imieniu. Jak mogê ci pomóc?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//Przedstaw mnie swojemu ojcu.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Twardziel z ciebie, i pewnie niez³y wojownik, co?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Najlepszy.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Mo¿e w takim razie zawo³am ojca.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Nie k³opocz siê ch³opcze. Sam go znajdê.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Jak chcesz.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "Co mo¿esz zrobiæ?";
};


func int dia_till_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//Co porabiasz, kiedy znudzi ci siê odgrywanie pana i w³adcy na farmie?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Stojê na stra¿y.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Ci zafajdani stra¿nicy z miasta coraz czêœciej pojawiaj¹ siê na farmie i kradn¹, co tylko wpadnie im w ³apska.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Tylko w ci¹gu ostatniego tygodnia te dranie zabra³y nam kilka owiec.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Gdybym dorwa³ któregoœ z nich, dopiero bym mu pokaza³!
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Z pewnoœci¹!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "Dlaczego najemnicy nie pomagaj¹ w walce ze stra¿nikami?";
};


func int dia_till_warumnichtsld_condition()
{
	if(Npc_KnowsInfo(other,dia_till_wasmachstdu) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_warumnichtsld_info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//Dlaczego najemnicy nie pomagaj¹ w walce ze stra¿nikami?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Zanim siê rozgrzej¹, ja ju¿ wszystkich przepêdzam.
};


instance DIA_TILL_BRONKO(C_INFO)
{
	npc = bau_931_till;
	nr = 5;
	condition = dia_till_bronko_condition;
	information = dia_till_bronko_info;
	description = "(Zapytaj o Bronka)";
};


func int dia_till_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && Npc_KnowsInfo(other,dia_bronko_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronko_info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Jest tu pewien cz³owiek, który pobiera myto od podró¿nych, twierdzi, ¿e to ON jest farmerem.
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//Ech. Tak, wiem. To Bronko. Robi, co chce.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Tyle razy mu powtarza³em, ¿e powinien wzi¹æ siê do roboty.
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Ale?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Po prostu mnie nie s³ucha.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//Ojciec denerwuje siê na mnie, ¿e nie zdo³a³em zmusiæ tego obiboka do roboty.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "Chyba bêdê móg³ ci pomóc.";
};


var int dia_till_bronkozurarbeit_noperm;

func int dia_till_bronkozurarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_till_bronko) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == FALSE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkozurarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Mo¿e ja móg³bym pomóc?
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Mówisz powa¿nie? W porz¹dku, pos³uchaj, zagoñ Bronka do pracy, a zap³acê ci 10 sztuk z³ota. Co ty na to?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"Nie ma sprawy. Ale bêdziesz musia³ zap³aciæ wiêcej.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"W porz¹dku, zobaczê, co da siê zrobiæ.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"Muszê siê zastanowiæ.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Pomyœlê o tym.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Jak chcesz.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//W porz¹dku, zobaczê, co da siê zrobiæ.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Poœpiesz siê.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"Till nie mo¿e zagoniæ Bronka do roboty, wiêc prosi mnie o pomoc w tej sprawie.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Chcê wiêcej.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//Nie ma sprawy. Ale bêdziesz musia³ zap³aciæ wiêcej.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//W porz¹dku. 20 sztuk z³ota.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chcê wiêcej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz¹dku, zobaczê, co da siê zrobiæ.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chcê wiêcej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz¹dku, zobaczê, co da siê zrobiæ.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Mo¿e... 50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chcê wiêcej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz¹dku, zobaczê, co da siê zrobiæ.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Dobrze. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chcê wiêcej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz¹dku, zobaczê, co da siê zrobiæ.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Dobra ju¿, dobra. Niech bêdzie 100 sztuk z³ota. To wszystko, co mam.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz¹dku, zobaczê, co da siê zrobiæ.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "Bronko wróci³ do pracy.";
};


func int dia_till_bronkowiederanarbeit_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == TRUE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkowiederanarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Bronko wróci³ do pracy.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Naprawdê? To wspaniale.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Tak. A teraz mi zap³aæ.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//Mmh. Có¿, umowa to umowa, nie mam racji?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//Niestety, nie mam tyle pieniêdzy. Jestem ci jednak bardzo wdziêczny.
		TILL_HATSEINGELDBEHALTEN = TRUE;
	};
	b_giveplayerxp(XP_BRONKOGEHTANDIEARBEIT);
	AI_StopProcessInfos(self);
};


instance DIA_TILL_PERMKAP1(C_INFO)
{
	npc = bau_931_till;
	nr = 99;
	condition = dia_till_permkap1_condition;
	information = dia_till_permkap1_info;
	permanent = TRUE;
	description = "(Zdenerwuj Tilla)";
};


func int dia_till_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) || (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_till_permkap1_info()
{
	if(KAPITEL == 5)
	{
		if((MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//Daleko od domu, co? Tutaj tatuœ ci nie pomo¿e.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Któregoœ dnia ciê dorwê i porozmawiamy inaczej.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ciesz siê, ¿e wyszed³eœ ca³o z tego spotkania.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//W takim razie, zostaw mnie w spokoju.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Mo¿e powinieneœ wiêcej jeœæ, wtedy wyroœniesz na du¿ego, silnego mê¿czyznê.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Któregoœ dnia ci poka¿ê.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ty parszywy, ma³y...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Wynoœ siê.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Wyciera³ ci ju¿ ktoœ dzisiaj nosek?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Zostaw mnie w spokoju, idioto.
	};
};


instance DIA_TILL_PICKPOCKET(C_INFO)
{
	npc = bau_931_till;
	nr = 900;
	condition = dia_till_pickpocket_condition;
	information = dia_till_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_till_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_till_pickpocket_info()
{
	Info_ClearChoices(dia_till_pickpocket);
	Info_AddChoice(dia_till_pickpocket,DIALOG_BACK,dia_till_pickpocket_back);
	Info_AddChoice(dia_till_pickpocket,DIALOG_PICKPOCKET,dia_till_pickpocket_doit);
};

func void dia_till_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_till_pickpocket);
};

func void dia_till_pickpocket_back()
{
	Info_ClearChoices(dia_till_pickpocket);
};


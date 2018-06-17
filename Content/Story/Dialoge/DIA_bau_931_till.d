
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
	description = "Hej, m�ody, wszystko gra?";
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
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Hej, m�ody, wszystko gra?
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Ile razy mam wam powtarza�, �e pomocnicy powinni si� do mnie zwraca� z szacunkiem?!
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"Nie jestem pomocnikiem.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"Ty tu jeste� szefem?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ty tu jeste� szefem?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//Ech. Nie, jestem tylko synem Sekoba. Ale kiedy tylko staruszek wyci�gnie kopyta, to wszystko b�dzie nale�a�o do mnie.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Zadziwiaj�ce!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Nie jestem pomocnikiem.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//To po co tu przyszed�e�? Nic nam ju� nie zosta�o, nie masz tu czego szuka�.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "Zawsze w ten spos�b traktujesz swoich pracownik�w?";
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
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Zawsze w ten spos�b traktujesz swoich pracownik�w?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Oczywi�cie - i dobrze im to robi. Musz� zna� swoje miejsce.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "Musz� porozmawia� z twoim ojcem.";
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
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Musz� porozmawia� z twoim ojcem.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//Ojciec nie ma czasu. Ja mog� ci� wys�ucha� w jego imieniu. Jak mog� ci pom�c?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//Przedstaw mnie swojemu ojcu.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Twardziel z ciebie, i pewnie niez�y wojownik, co?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Najlepszy.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Mo�e w takim razie zawo�am ojca.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Nie k�opocz si� ch�opcze. Sam go znajd�.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Jak chcesz.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "Co mo�esz zrobi�?";
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
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//Co porabiasz, kiedy znudzi ci si� odgrywanie pana i w�adcy na farmie?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Stoj� na stra�y.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Ci zafajdani stra�nicy z miasta coraz cz�ciej pojawiaj� si� na farmie i kradn�, co tylko wpadnie im w �apska.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Tylko w ci�gu ostatniego tygodnia te dranie zabra�y nam kilka owiec.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Gdybym dorwa� kt�rego� z nich, dopiero bym mu pokaza�!
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Z pewno�ci�!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "Dlaczego najemnicy nie pomagaj� w walce ze stra�nikami?";
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
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//Dlaczego najemnicy nie pomagaj� w walce ze stra�nikami?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Zanim si� rozgrzej�, ja ju� wszystkich przep�dzam.
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
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Jest tu pewien cz�owiek, kt�ry pobiera myto od podr�nych, twierdzi, �e to ON jest farmerem.
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//Ech. Tak, wiem. To Bronko. Robi, co chce.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Tyle razy mu powtarza�em, �e powinien wzi�� si� do roboty.
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Ale?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Po prostu mnie nie s�ucha.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//Ojciec denerwuje si� na mnie, �e nie zdo�a�em zmusi� tego obiboka do roboty.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "Chyba b�d� m�g� ci pom�c.";
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
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Mo�e ja m�g�bym pom�c?
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//M�wisz powa�nie? W porz�dku, pos�uchaj, zago� Bronka do pracy, a zap�ac� ci 10 sztuk z�ota. Co ty na to?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"Nie ma sprawy. Ale b�dziesz musia� zap�aci� wi�cej.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"W porz�dku, zobacz�, co da si� zrobi�.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"Musz� si� zastanowi�.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Pomy�l� o tym.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Jak chcesz.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//W porz�dku, zobacz�, co da si� zrobi�.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Po�piesz si�.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"Till nie mo�e zagoni� Bronka do roboty, wi�c prosi mnie o pomoc w tej sprawie.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Chc� wi�cej.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//Nie ma sprawy. Ale b�dziesz musia� zap�aci� wi�cej.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//W porz�dku. 20 sztuk z�ota.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chc� wi�cej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz�dku, zobacz�, co da si� zrobi�.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chc� wi�cej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz�dku, zobacz�, co da si� zrobi�.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Mo�e... 50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chc� wi�cej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz�dku, zobacz�, co da si� zrobi�.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Dobrze. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Chc� wi�cej.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz�dku, zobacz�, co da si� zrobi�.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Dobra ju�, dobra. Niech b�dzie 100 sztuk z�ota. To wszystko, co mam.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"W porz�dku, zobacz�, co da si� zrobi�.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "Bronko wr�ci� do pracy.";
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
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Bronko wr�ci� do pracy.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Naprawd�? To wspaniale.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Tak. A teraz mi zap�a�.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//Mmh. C�, umowa to umowa, nie mam racji?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//Niestety, nie mam tyle pieni�dzy. Jestem ci jednak bardzo wdzi�czny.
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
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//Daleko od domu, co? Tutaj tatu� ci nie pomo�e.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Kt�rego� dnia ci� dorw� i porozmawiamy inaczej.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ciesz si�, �e wyszed�e� ca�o z tego spotkania.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//W takim razie, zostaw mnie w spokoju.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Mo�e powiniene� wi�cej je��, wtedy wyro�niesz na du�ego, silnego m�czyzn�.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Kt�rego� dnia ci poka��.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ty parszywy, ma�y...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Wyno� si�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Wyciera� ci ju� kto� dzisiaj nosek?
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


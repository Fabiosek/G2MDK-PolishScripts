
instance DIA_MELDOR_EXIT(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 999;
	condition = dia_meldor_exit_condition;
	information = dia_meldor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_meldor_exit_condition()
{
	return TRUE;
};

func void dia_meldor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELDOR_HALLO(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_hallo_condition;
	information = dia_meldor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_hallo_info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//Czego chcesz?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//Chcia³em siê tutaj rozejrzeæ...
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//A dok¹d dok³adnie siê udajesz?
};


instance DIA_MELDOR_INTERESSANTES(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_interessantes_condition;
	information = dia_meldor_interessantes_info;
	permanent = FALSE;
	description = "Czy s¹ tutaj jakieœ interesuj¹ce rzeczy?";
};


func int dia_meldor_interessantes_condition()
{
	return TRUE;
};

func void dia_meldor_interessantes_info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//Czy s¹ tutaj jakieœ interesuj¹ce rzeczy?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//Jest burdel i knajpa. W³aœciciel nazywa siê Kardif. Jeœli potrzebne ci s¹ jakieœ informacje, powinieneœ udaæ siê do niego.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//Tak przy okazji, potrzebujesz gotówki?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, w³aœciciel knajpy, sprzedaje informacje.");
};


instance DIA_MELDOR_LEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 3;
	condition = dia_meldor_lehmar_condition;
	information = dia_meldor_lehmar_info;
	permanent = FALSE;
	description = "A co, rozdajesz pieni¹dze?";
};


func int dia_meldor_lehmar_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_interessantes))
	{
		return TRUE;
	};
};

func void dia_meldor_lehmar_info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//A co, rozdajesz pieni¹dze?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//Nie. Ale po drugiej stronie ulicy mieszka Lehmar. Po¿ycza pieni¹dze na procent.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//Jestem pewien, ¿e po¿yczy ci parê sztuk z³ota.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MELDOR_ARBEITEST(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 4;
	condition = dia_meldor_arbeitest_condition;
	information = dia_meldor_arbeitest_info;
	permanent = FALSE;
	description = "Pracujesz dla Lehmara?";
};


func int dia_meldor_arbeitest_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_lehmar))
	{
		return TRUE;
	};
};

func void dia_meldor_arbeitest_info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//Pracujesz dla Lehmara?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//Hmm... Zgad³eœ, geniuszu.
};


instance DIA_MELDOR_INSOV(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_insov_condition;
	information = dia_meldor_insov_info;
	permanent = FALSE;
	description = "W³aœciwie to idê do górnego miasta.";
};


func int dia_meldor_insov_condition()
{
	return TRUE;
};

func void dia_meldor_insov_info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//W³aœciwie to idê do górnego miasta.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//Tak, oczywiœcie. A ja w³aœnie mia³em wsi¹œæ na statek, który zawiezie mnie prosto na audiencjê u Króla.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//Od kiedy pojawili siê paladyni, takich jak ty czy ja nie wpuszcza siê do górnego miasta.
};


instance DIA_MELDOR_CITIZEN(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 6;
	condition = dia_meldor_citizen_condition;
	information = dia_meldor_citizen_info;
	permanent = FALSE;
	description = "Czy jesteœ obywatelem tego miasta?";
};


func int dia_meldor_citizen_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_insov))
	{
		return TRUE;
	};
};

func void dia_meldor_citizen_info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//Czy jesteœ obywatelem tego miasta?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//Jeœli chodzi ci o to, czy tu mieszkam, to odpowiedŸ brzmi - tak. Co nie znaczy, ¿e mogê wchodziæ do górnego miasta.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//Tylko arystokracja ma tam wstêp, no i oczywiœcie handlarze, i rzemieœlnicy z dolnej czêœci miasta.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//W dzielnicy portowej raczej nie znajdziesz nikogo spoœród œmietanki Khorinis. Tu nie ma nawet regularnych patroli stra¿y miejskiej.
};


instance DIA_MELDOR_SMOKE(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_smoke_condition;
	information = dia_meldor_smoke_info;
	permanent = FALSE;
	description = "Wiesz mo¿e, gdzie mogê kupiæ trochê ziela?";
};


func int dia_meldor_smoke_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_meldor_smoke_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//Wiesz mo¿e, gdzie mogê kupiæ trochê ziela?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//Nie, nie mam pojêcia.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//Na twoim miejscu spróbowa³bym szczêœcia w Czerwonej Latarni.
	};
};


var int meldor_dgnews;

instance DIA_MELDOR_PERM(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 7;
	condition = dia_meldor_perm_condition;
	information = dia_meldor_perm_info;
	permanent = TRUE;
	description = "Czy ostatnio wydarzy³o siê tu coœ niezwyk³ego?";
};


func int dia_meldor_perm_condition()
{
	return TRUE;
};

func void dia_meldor_perm_info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//Czy ostatnio wydarzy³o siê tutaj coœ ciekawego?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//Nie tak dawno temu stra¿ miejska wywróci³a ca³¹ dzielnicê portow¹ do góry nogami.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//Szukali skradzionych kosztownoœci. Ostatnio zdarzy³o siê tu sporo kradzie¿y. Szczególnie w lepszych dzielnicach.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//NajwyraŸniej próbuj¹ zwaliæ winê na biedotê z portu.
	}
	else if((ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE) && (MELDOR_DGNEWS == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//Podobno znaleŸli w kana³ach z³odziejsk¹ kryjówkê. Wszyscy przestêpcy zostali zabici.
		MELDOR_DGNEWS = TRUE;
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//Podobno w Górniczej Dolinie s¹ smoki. Ciekaw jestem, kiedy nasi paladyni zostan¹ wys³ani do walki.
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//Podobno wszystkie smoki s¹ martwe.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//Nie.
	};
};


instance DIA_MELDOR_VONLEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_vonlehmar_condition;
	information = dia_meldor_vonlehmar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_vonlehmar_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_vonlehmar_info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//Hej, zaczekaj...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//Mam dla ciebie wiadomoœæ od Lehmara.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_MELDOR_PICKPOCKET(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 900;
	condition = dia_meldor_pickpocket_condition;
	information = dia_meldor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_meldor_pickpocket_condition()
{
	return c_beklauen(34,55);
};

func void dia_meldor_pickpocket_info()
{
	Info_ClearChoices(dia_meldor_pickpocket);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_BACK,dia_meldor_pickpocket_back);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_PICKPOCKET,dia_meldor_pickpocket_doit);
};

func void dia_meldor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_meldor_pickpocket);
};

func void dia_meldor_pickpocket_back()
{
	Info_ClearChoices(dia_meldor_pickpocket);
};


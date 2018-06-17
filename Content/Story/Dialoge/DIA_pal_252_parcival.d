
instance DIA_PARCIVAL_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_exit_condition;
	information = dia_parcival_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_SCHURFER(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_schurfer_condition;
	information = dia_parcival_schurfer_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� na temat kret�w?";
};


func int dia_parcival_schurfer_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_schurfer_info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Co mo�esz mi powiedzie� na temat kret�w?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Zebra�em trzy grupy.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Marcos, Fajeth i Silvestro to paladyni nimi dowodz�cy.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Grupa Marcosa skierowa�a si� do starej kopalni, prowadzona przez starego kopacza - Grimesa.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Dwie pozosta�e grupy wyruszy�y razem.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Jergan, jeden ze zwiadowc�w, doni�s� mi, �e rozbili ob�z niedaleko wielkiej wie�y.
	b_logentry(TOPIC_SCOUTMINE,"Ekipami g�rnik�w dowodz� trzej paladyni: Marcos, Fajeth i Silvestro.");
	b_logentry(TOPIC_SCOUTMINE,"Grupa Marcosa uda�a si� w stron� starej kopalni. Ich zwiadowc� jest kopacz Grimes.");
	b_logentry(TOPIC_SCOUTMINE,"Pozosta�e dwie grupy wyruszy�y razem. Podobno za�o�y�y ob�z w pobli�u wielkiej wie�y.");
};


instance DIA_PARCIVAL_DIEGO(C_INFO)
{
	npc = pal_252_parcival;
	nr = 9;
	condition = dia_parcival_diego_condition;
	information = dia_parcival_diego_info;
	permanent = FALSE;
	description = "Z kt�r� grup� kret�w poszed� Diego?";
};


func int dia_parcival_diego_condition()
{
	if((SEARCHFORDIEGO == LOG_RUNNING) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_diego_info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//Z kt�r� grup� kret�w poszed� Diego?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Diego - ten skazaniec? Jest w grupie paladyna Silvestra.
	b_logentry(TOPIC_SCOUTMINE,"Diego wyruszy� z ekip� prowadzon� przez paladyna Silvestra.");
};


instance DIA_PARCIVAL_WEG(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_weg_condition;
	information = dia_parcival_weg_info;
	permanent = FALSE;
	description = "Czy wiesz, jak mog� si� dosta� na teren wydobycia?";
};


func int dia_parcival_weg_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_weg_info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Wiesz, jak mog� dosta� si� na teren wydobycia?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Nie ma �adnej bezpiecznej �cie�ki prowadz�cej do doliny. Droga g��wnym szlakiem wydaje si� jednak ma�o rozs�dna.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Trzymaj si� z dala od las�w i unikaj ork�w. Niech Innos ci� prowadzi.
	b_logentry(TOPIC_SCOUTMINE,"Chyba lepiej b�dzie, je�li wybior� inn� drog� ni� ekipy g�rnicze. W lasach a� roi si� od ork�w.");
};


instance DIA_PARCIVAL_DRAGON(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragon_condition;
	information = dia_parcival_dragon_info;
	description = "Jak wygl�da sytuacja?";
};


func int dia_parcival_dragon_condition()
{
	return TRUE;
};

func void dia_parcival_dragon_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Jak wygl�da sytuacja?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//Ob�z jest otoczony przez ork�w. Nie�le si� okopali.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Bardziej alarmuj�ce s� jednak ataki smok�w. Zniszczy�y ju� ca�y zewn�trzny pier�cie�.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Kolejny atak smok�w przyniesie ze sob� jeszcze dotkliwsze straty.
};


instance DIA_PARCIVAL_DRAGONS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragons_condition;
	information = dia_parcival_dragons_info;
	description = "Ile jest tych smok�w?";
};


func int dia_parcival_dragons_condition()
{
	if(Npc_KnowsInfo(hero,dia_parcival_dragon) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_dragons_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Ile jest tych smok�w?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Nie wiemy dok�adnie, ale pewne jest, �e wi�cej ni� jeden.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//To jednak nie wszystko. Ca�a G�rnicza Dolina jest pe�na bestii, wspomagaj�cych smoki.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Nie oszukujmy si� - bez posi�k�w z zewn�trz, nasze szanse na prze�ycie s� nik�e.
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_BRAVE(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_brave_condition;
	information = dia_parcival_brave_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_brave_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_parcival_dragons) && (KAPITEL < 3) && (PARCIVAL_BRAVE_LABERCOUNT <= 6))
	{
		return TRUE;
	};
};


var int parcival_brave_labercount;

func void dia_parcival_brave_info()
{
	var int randy;
	if(PARCIVAL_BRAVE_LABERCOUNT < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Na razie panuje wzgl�dny spok�j. Ale ta sytuacja mo�e si� bardzo szybko zmieni�.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//B�dziemy stawia� op�r tak d�ugo, jak starczy nam si�.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Innos nas poprowadzi. Jego �wiat�o�� ogrzewa nasze serca.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Hej, nie masz nic lepszego do roboty, ni� zawracanie mi g�owy? Wyno� si�!
		b_giveplayerxp(XP_AMBIENT);
	};
	PARCIVAL_BRAVE_LABERCOUNT = PARCIVAL_BRAVE_LABERCOUNT + 1;
};


instance DIA_PARCIVAL_KAP3_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap3_exit_condition;
	information = dia_parcival_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parcival_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ALLESKLAR(C_INFO)
{
	npc = pal_252_parcival;
	nr = 31;
	condition = dia_parcival_allesklar_condition;
	information = dia_parcival_allesklar_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
};


func int dia_parcival_allesklar_condition()
{
	if((KAPITEL == 3) && (DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER < 3) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};


var int dia_parcival_allesklar_nervcounter;

func void dia_parcival_allesklar_info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Wszystko w porz�dku?
	if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Jak na razie tak!
	}
	else if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Do diab�a, tak.
	}
	else if(PARCIVAL_BRAVE_LABERCOUNT > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//Ach. Rozumiem, co masz na my�li. Nie, przyjacielu, nie tym razem.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Nie przeszkadzaj mi.
	};
	DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER = DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER + 1;
};


instance DIA_PARCIVAL_KAP4_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap4_exit_condition;
	information = dia_parcival_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parcival_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ANYNEWS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_anynews_condition;
	information = dia_parcival_anynews_info;
	description = "Czy sta�o si� co� wa�nego?";
};


func int dia_parcival_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_anynews_info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Czy sta�o si� co� wa�nego?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Nale�ysz do tych szumowin, kt�re nazywaj� si� �owcami smok�w?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Naprawd�, spodziewa�em si� po tobie troszk� wi�cej godno�ci, ty za� przy��czasz si� do takich ludzi.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//Jestem zmartwiony, bardzo zmartwiony.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Ostatnio pojawili si� tu ci ludzie. Chc�, �eby ich nazywa� �owcami smok�w.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//Je�li o mnie chodzi, to s� to tylko przest�pcy i obiboki.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Gdyby to zale�a�o ode mnie, wywali�bym ich z zamku. Niech orkowie dobior� im si� do sk�ry.
	Info_ClearChoices(dia_parcival_anynews);
	Info_AddChoice(dia_parcival_anynews,"Ale oni, w przeciwie�stwie do Lorda Hagena, s� tutaj.",dia_parcival_anynews_lordhagen);
	Info_AddChoice(dia_parcival_anynews,"Powiniene� da� im szans�.",dia_parcival_anynews_chance);
	Info_AddChoice(dia_parcival_anynews,"Nie s�dzisz, �e troch� przesadzasz?",dia_parcival_anynews_overact);
};

func void dia_parcival_anynews_lordhagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Ale oni, w przeciwie�stwie do Lorda Hagena, s� tutaj.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//Tak, mamy tylko ich.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Innos poddaje nas straszliwej pr�bie.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Powiniene� da� im szans�.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//Dostali j�. Niestety.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Garond jest przekonany, �e b�d� mogli nam pom�c.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Ja jednak nie spuszczam z nich oka. Mamy dostateczne du�o k�opot�w z orkami. Nie potrzebujemy dodatkowych zmartwie�.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Nie s�dzisz, �e troch� przesadzasz?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//Zdecydowanie nie. Brakuje nam ludzi, kt�rzy mogliby stanowi� inspiruj�cy przyk�ad.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Wojownik�w, kt�rzy rozpaliliby ogie� Innosa w sercach walcz�cych.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//Tymczasem, mamy tylko grupk� szumowin, os�abiaj�c� morale �o�nierzy.
};


instance DIA_PARCIVAL_JAN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_jan_condition;
	information = dia_parcival_jan_info;
	permanent = FALSE;
	description = "Musz� porozmawia� z tob� o Janie.";
};


func int dia_parcival_jan_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_jan_info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Musz� porozmawia� z tob� o Janie.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Jan. Kto to taki?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//�owca smok�w. Jest kowalem.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//Ach tak, pami�tam. O co chodzi?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Chcia�by pracowa� w ku�ni.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//To wykluczone. Nie jest jednym z nas, nie ufam mu.
};


instance DIA_PARCIVAL_THINKAGAIN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_thinkagain_condition;
	information = dia_parcival_thinkagain_info;
	permanent = TRUE;
	description = "Prosz�, rozwa� jeszcze spraw� Jana.";
};


func int dia_parcival_thinkagain_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_parcival_thinkagain_info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Prosz�, rozwa� jeszcze spraw� Jana.
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Moja decyzja jest ostateczna.
};


instance DIA_PARCIVAL_TALKEDGAROND(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_talkedgarond_condition;
	information = dia_parcival_talkedgarond_info;
	description = "Garond chce, by Jan przej�� ku�ni�.";
};


func int dia_parcival_talkedgarond_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_talkedgarond_info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Garond chce, by Jan przej�� ku�ni�.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Hmmm. Skoro tak, to niech j� sobie bierze.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//Mimo to uwa�am, �e ufanie Janowi to wielki b��d.
};


instance DIA_PARCIVAL_PERMKAP4(C_INFO)
{
	npc = pal_252_parcival;
	nr = 43;
	condition = dia_parcival_permkap4_condition;
	information = dia_parcival_permkap4_info;
	permanent = TRUE;
	description = "Co� jeszcze?";
};


func int dia_parcival_permkap4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_anynews))
	{
		return TRUE;
	};
};

func void dia_parcival_permkap4_info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//Co� jeszcze?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ach, zostaw mnie w spokoju.
};


instance DIA_PARCIVAL_KAP5_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap5_exit_condition;
	information = dia_parcival_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parcival_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_VERRAETER(C_INFO)
{
	npc = pal_252_parcival;
	condition = dia_parcival_verraeter_condition;
	information = dia_parcival_verraeter_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_verraeter_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_parcival_verraeter_info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Zdrajca! Wiem dobrze, �e to TY otworzy�e� bram�.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Zap�acisz mi za to.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_PICKPOCKET(C_INFO)
{
	npc = pal_252_parcival;
	nr = 900;
	condition = dia_parcival_pickpocket_condition;
	information = dia_parcival_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_parcival_pickpocket_condition()
{
	return c_beklauen(84,460);
};

func void dia_parcival_pickpocket_info()
{
	Info_ClearChoices(dia_parcival_pickpocket);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_BACK,dia_parcival_pickpocket_back);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_PICKPOCKET,dia_parcival_pickpocket_doit);
};

func void dia_parcival_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parcival_pickpocket);
};

func void dia_parcival_pickpocket_back()
{
	Info_ClearChoices(dia_parcival_pickpocket);
};


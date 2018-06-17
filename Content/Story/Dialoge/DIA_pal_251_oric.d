
instance DIA_ORIC_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_exit_condition;
	information = dia_oric_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_oric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_HALLO(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_hallo_condition;
	information = dia_oric_hallo_info;
	permanent = FALSE;
	description = "Na czym polega twoje zadanie?";
};


func int dia_oric_hallo_condition()
{
	return TRUE;
};

func void dia_oric_hallo_info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//Na czym polega twoje zadanie?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//Jestem oficerem strategicznym Kr�la, aktualnie podlegam wielmo�nemu kapitanowi Garondowi.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//Jeste�my ostatnimi paladynami na zamku. Pozostali albo uciekli, albo polegli.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//Naszym zadaniem jest doprowadzi� t� ekspedycj� do szcz�liwego ko�ca i tak te� uczynimy. Na Innosa, tak uczynimy.
};


instance DIA_ORIC_BRUDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_bruder_condition;
	information = dia_oric_bruder_info;
	permanent = FALSE;
	description = "Mam dla ciebie wiadomo��.";
};


func int dia_oric_bruder_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_bruder_info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//Mam dla ciebie wiadomo��.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//O co chodzi?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//Tw�j brat nie �yje.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//...m�j brat...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//Innos wystawia mnie na ci�k� pr�b�. M�j brat zgin�� jako jego oddany s�uga.
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//Ta wiadomo�� przeszy�a me serce jak strza�a. Jedynie w modlitwie odnajd� si��.
	ORICBRUDER = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORIC_SCOUTMINE(C_INFO)
{
	npc = pal_251_oric;
	nr = 1;
	condition = dia_oric_scoutmine_condition;
	information = dia_oric_scoutmine_info;
	permanent = FALSE;
	description = "Wybieram si� w okolice kopalni.";
};


func int dia_oric_scoutmine_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL < 3) && Npc_KnowsInfo(other,dia_oric_hallo) && (FAJETH_ORE == FALSE) && (MARCOS_ORE == FALSE) && (SILVESTRO_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_scoutmine_info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//Wybieram si� w okolice kopalni.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//Uwa�aj, to nie przelewki. Przede wszystkim, postaraj si� odnale�� paladyn�w. Dowodz� trzema grupami.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//Je�li chcesz si� dowiedzie� wi�cej na ten temat, porozmawiaj z Parcivalem.
};


instance DIA_ORIC_PERM(C_INFO)
{
	npc = pal_251_oric;
	nr = 99;
	condition = dia_oric_perm_condition;
	information = dia_oric_perm_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_oric_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_oric_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_oric_perm_info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//Jak wygl�da sytuacja?
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//Musisz odnale�� krety i rud�. Potem zastanowimy si� nad drog� odwrotu.
	}
	else if(MIS_SCOUTMINE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//Ekspedycja ponios�a kl�sk�. Ale nie poddamy si�, Innos jest z nami. On bezpiecznie wyprowadzi nas z doliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//To, �e si� pojawi�e�, daje nam nadziej�.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//Potrzebujemy ci�. Id� porozmawia� z Garondem, on wszystko ci wyja�ni.
	};
};


instance DIA_ORIC_KAP3_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap3_exit_condition;
	information = dia_oric_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_oric_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP4_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap4_exit_condition;
	information = dia_oric_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_oric_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_IAMBACK(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_iamback_condition;
	information = dia_oric_iamback_info;
	description = "Wr�ci�em.";
};


func int dia_oric_iamback_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_iamback_info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//Wr�ci�em.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//Nie przypuszcza�em, �e jeszcze ci� tu zobacz�, szczeg�lnie po tym, co si� sta�o podczas twojej poprzedniej wizyty.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//W imieniu naszego zakonu, b�d� pozdrowiony.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//Widz�, �e zosta�e� magiem. Przyjmij wyrazy szacunku.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//By� mo�e twoje pojawienie si� tutaj to dobry znak.
};


instance DIA_ORIC_CANHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_canhelp_condition;
	information = dia_oric_canhelp_info;
	description = "Czy mog� jako� pom�c?";
};


func int dia_oric_canhelp_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_canhelp_info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//Czy mog� jako� pom�c?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//Wydaje mi si�, �e uczynili�my ju� wszystko, co by�o mo�na.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//Jest jednak pewna sprawa. M�g�by� si� nam przyda� poza murami zamku.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//Planujemy urwa� �eb hydrze.
	Info_ClearChoices(dia_oric_canhelp);
	Info_AddChoice(dia_oric_canhelp,"Poszukaj lepiej kogo� innego.",dia_oric_canhelp_notyourman);
	Info_AddChoice(dia_oric_canhelp,"Co przez to rozumiesz?",dia_oric_canhelp_whatyoumean);
};

func void dia_oric_canhelp_notyourman()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//Chyba b�dziecie musieli poszuka� kogo� innego.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//Nie mog� sobie pozwoli� na stracenie chocia� jednego obro�cy, jeste� nasz� jedyn� nadziej�.
};

func void dia_oric_canhelp_whatyoumean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//Co masz na my�li?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//Znamy jednego z ich przyw�dc�w. Nazywa si� Hosh-Pak.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//To najbardziej wp�ywowy szaman w�r�d ork�w.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//A czego oczekujecie ode mnie?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Musisz go zabi�.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//To chyba jaki� �art?!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//Jeste� jedyn� osob�, kt�rej mo�emy powierzy� t� misj�. Wszyscy inni rycerze s� nam potrzebni na miejscu.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//Panie, nie jest mi �atwo o to prosi�. Jednak tylko ty mo�esz sprosta� temu zadaniu.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//Chcesz nam pom�c, prawda? Wi�c masz okazj�...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//Namiot Hosh-Paka znajduje si� poza liniami obl�enia, na klifie na po�udnie st�d.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//Niemal wida� go z naszych okien.
	Info_ClearChoices(dia_oric_canhelp);
	ORIKTOLDMISSIONCHAPTER4 = TRUE;
};


instance DIA_ORIC_NEEDSTUFF(C_INFO)
{
	npc = pal_251_oric;
	nr = 6;
	condition = dia_oric_needstuff_condition;
	information = dia_oric_needstuff_info;
	description = "Potrzebuj� wyposa�enia.";
};


func int dia_oric_needstuff_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_needstuff_info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//Potrzebuj� wyposa�enia.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//Niewiele mo�emy ci zaoferowa�.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//Mam tylko to.
	Info_ClearChoices(dia_oric_needstuff);
	Info_AddChoice(dia_oric_needstuff,"lub 1 eliksir zr�czno�ci",dia_oric_needstuff_dexterity);
	Info_AddChoice(dia_oric_needstuff,"lub 1 eliksir si�y",dia_oric_needstuff_strength);
	Info_AddChoice(dia_oric_needstuff,"lub 3 eliksiry many",dia_oric_needstuff_mana);
	Info_AddChoice(dia_oric_needstuff,"3 eliksiry lecznicze",dia_oric_needstuff_health);
};

func void dia_oric_needstuff_health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//Wezm� mikstury lecznicze.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//Doskona�y wyb�r. Mam nadziej�, �e ci si� przydadz�.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//Wezm� mikstury many.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//Mam nadziej�, �e dobrze je wykorzystasz. Niech Innos ci� prowadzi.
	CreateInvItems(self,itpo_mana_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//Wezm� eliksir si�y.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//Prosz�, na pewno si� przyda. �ycz� ci szcz�cia.
	CreateInvItems(self,itpo_perm_str,1);
	b_giveinvitems(self,other,itpo_perm_str,1);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//Wezm� eliksir zr�czno�ci.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//Niech twe strza�y nigdy nie chybiaj� celu. Prosz�.
	CreateInvItems(self,itpo_perm_dex,1);
	b_giveinvitems(self,other,itpo_perm_dex,1);
	Info_ClearChoices(dia_oric_needstuff);
};


instance DIA_ORIC_NOMURDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 7;
	condition = dia_oric_nomurder_condition;
	information = dia_oric_nomurder_info;
	description = "Nie zamorduj� Hosh-Paka jak ostatni tch�rz.";
};


func int dia_oric_nomurder_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_nomurder_info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//Nie zamorduj� Hosh-Paka jak ostatni tch�rz.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//Czy zdajesz sobie spraw� w jak trudnej sytuacji si� znajdujemy?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//Obl�enie trwa, armia ork�w jest nieugi�ta. Nasze zapasy s� na wyczerpaniu.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//Je�li nie uda nam si� przetransportowa� rudy na statek, orkowie zetr� w py� ca�e kr�lestwo.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//Wszystko, czego bronili�my, zostanie zapomniane.
};


instance DIA_ORIC_WILLHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 5;
	condition = dia_oric_willhelp_condition;
	information = dia_oric_willhelp_info;
	permanent = FALSE;
	description = "Dobrze. Zg�adz� Hosh-Paka.";
};


func int dia_oric_willhelp_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_willhelp_info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//Dobrze. Zg�adz� Hosh-Paka.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//Mi�o mi to s�ysze�.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//Namiot Hosh-Paka stoi na niewielkim klifie. Na pewno ju� go widzia�e�.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//To niedaleko �cie�ki prowadz�cej do kopalni. W cieniu wielkiej g�ry.
	Log_CreateTopic(TOPIC_KILLHOSHPAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLHOSHPAK,LOG_RUNNING);
	b_logentry(TOPIC_KILLHOSHPAK,"Orik chce rozprawi� si� z orkowym szamanem Hosh-Pakiem. Jego namiot znajduje si� na niewielkim klifie niedaleko zamku.");
	MIS_KILLHOSHPAK = LOG_RUNNING;
};


instance DIA_ORIC_HOSHDEAD(C_INFO)
{
	npc = pal_251_oric;
	nr = 8;
	condition = dia_oric_hoshdead_condition;
	information = dia_oric_hoshdead_info;
	permanent = FALSE;
	description = "Hosh-Pak nie �yje.";
};


func int dia_oric_hoshdead_condition()
{
	if(Npc_IsDead(hosh_pak) && (MIS_KILLHOSHPAK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_oric_hoshdead_info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//Hosh-Pak nie �yje.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//Wspaniale, to powinno zasia� zam�t w�r�d ork�w. Mo�e, mimo wszystko, jest jeszcze dla nas nadzieja.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//Mam nadziej�, �e to wydarzenie pozwoli nam nadrobi� straty ostatniego tygodnia.
	MIS_KILLHOSHPAK = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLHOSH_PAK);
};


instance DIA_ORIC_ANYNEWS(C_INFO)
{
	npc = pal_251_oric;
	nr = 9;
	condition = dia_oric_anynews_condition;
	information = dia_oric_anynews_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_oric_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback))
	{
		return TRUE;
	};
};

func void dia_oric_anynews_info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//Jakie� wie�ci?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//Poza tym, �e najechali na nas orkowie?
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//Tak. Jeste� tu bohaterem. Pozbycie si� smok�w to niew�tpliwie nie�atwe zadanie.
	}
	else if(MIS_KILLHOSHPAK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//Po �mierci Hosh-Paka w orkowych szeregach zapanowa� chaos.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//Ork�w jest coraz wi�cej, to z�y znak.
	};
};


instance DIA_ORIC_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_251_oric;
	nr = 3;
	condition = dia_oric_dragonplettbericht_condition;
	information = dia_oric_dragonplettbericht_info;
	permanent = TRUE;
	description = "Potrzebuj� wi�cej informacji o smokach.";
};


func int dia_oric_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		return TRUE;
	};
};


var int oric_swampdragoninfo_onetime;
var int oric_rockdragoninfo_onetime;
var int oric_firedragoninfo_onetime;
var int oric_icedragoninfo_onetime;
var int oric_dragoncounter;
var int oric_firstquestion;

func void dia_oric_dragonplettbericht_info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//Potrzebuj� wi�cej informacji o smokach.
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//Jednego uda�o mi si� zg�adzi�. Czy mo�esz mi powiedzie�, gdzie szuka� nast�pnych?
	}
	else if(MIS_KILLEDDRAGONS != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//Wydaje mi si�, �e nie dotar�em jeszcze do wszystkich smok�w. Mo�e co� usz�o mojej uwadze?
	};
	if(((ORIC_DRAGONCOUNTER < MIS_KILLEDDRAGONS) || (ORIC_FIRSTQUESTION == FALSE)) && ((ORIC_SWAMPDRAGONINFO_ONETIME == FALSE) || (ORIC_ROCKDRAGONINFO_ONETIME == FALSE) || (ORIC_FIREDRAGONINFO_ONETIME == FALSE) || (ORIC_ICEDRAGONINFO_ONETIME == FALSE)))
	{
		if((Npc_IsDead(swampdragon) == FALSE) && (ORIC_SWAMPDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//W ci�gu kilku ostatnich dni na zach�d od zamku pojawi�o si� wielkie bagno. Jest w tym co� podejrzanego, nie s�dzisz?
			b_logentry(TOPIC_DRACHENJAGD,"Orik da� mi wskaz�wk�: kilka dni temu na zach�d od zamku pojawi�o si� wielkie bagno. Ca�a ta sprawa jest do�� podejrzana.");
			ORIC_SWAMPDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(rockdragon) == FALSE) && (ORIC_ROCKDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//Na po�udnie st�d, daleko za wulkanem, wznosi si� kamienna forteca.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//Nasi szpiedzy donie�li, �e jest silnie strze�ona. By� mo�e tam ukrywa si� jeden ze smok�w?
			b_logentry(TOPIC_DRACHENJAGD,"Zwiadowcy donie�li Orikowi, �e skalna forteca za wulkanem na po�udniu jest dobrze chroniona. Orik podejrzewa, �e mo�e tam przebywa� smok.");
			ORIC_ROCKDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(firedragon) == FALSE) && (ORIC_FIREDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//Po ostatnim ataku dosz�y mnie wie�ci, jakoby jeden ze smok�w znikn�� gdzie� na po�udniu, za wulkanem. Wydaje mi si�, �e tam powiniene� skierowa� swe kroki.
			b_logentry(TOPIC_DRACHENJAGD,"Podobno smok, kt�ry zaatakowa� zamek w G�rniczej Dolinie, pojawi� si� p�niej w okolicach wulkanu.");
			ORIC_FIREDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(icedragon) == FALSE) && (ORIC_ICEDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//Na zach�d st�d rozci�ga si� wielka po�a� pokrytych lodem pustkowi. Nie zdziwi�oby mnie, gdyby jeden ze smok�w ukry� si� w�a�nie tam.
			b_logentry(TOPIC_DRACHENJAGD,"Orik twierdzi, �e lodowe pustkowie na zachodzie mo�e by� siedzib� smoka.");
			ORIC_ICEDRAGONINFO_ONETIME = TRUE;
		};
		ORIC_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		ORIC_FIRSTQUESTION = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//W tej chwili nie mam dla ciebie �adnych informacji.
	};
};


instance DIA_ORIC_KAP5_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap5_exit_condition;
	information = dia_oric_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_oric_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP6_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap6_exit_condition;
	information = dia_oric_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_oric_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_PICKPOCKET(C_INFO)
{
	npc = pal_251_oric;
	nr = 900;
	condition = dia_oric_pickpocket_condition;
	information = dia_oric_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego zwoju b�dzie bardzo trudna)";
};


func int dia_oric_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (85 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_oric_pickpocket_info()
{
	Info_ClearChoices(dia_oric_pickpocket);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_BACK,dia_oric_pickpocket_back);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_PICKPOCKET,dia_oric_pickpocket_doit);
};

func void dia_oric_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 85)
	{
		b_giveinvitems(self,other,itsc_palrepelevil,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_oric_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_oric_pickpocket_back()
{
	Info_ClearChoices(dia_oric_pickpocket);
};


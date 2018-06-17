
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
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//Jestem oficerem strategicznym Króla, aktualnie podlegam wielmo¿nemu kapitanowi Garondowi.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//Jesteœmy ostatnimi paladynami na zamku. Pozostali albo uciekli, albo polegli.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//Naszym zadaniem jest doprowadziæ tê ekspedycjê do szczêœliwego koñca i tak te¿ uczynimy. Na Innosa, tak uczynimy.
};


instance DIA_ORIC_BRUDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_bruder_condition;
	information = dia_oric_bruder_info;
	permanent = FALSE;
	description = "Mam dla ciebie wiadomoœæ.";
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
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//Mam dla ciebie wiadomoœæ.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//O co chodzi?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//Twój brat nie ¿yje.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//...mój brat...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//Innos wystawia mnie na ciê¿k¹ próbê. Mój brat zgin¹³ jako jego oddany s³uga.
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//Ta wiadomoœæ przeszy³a me serce jak strza³a. Jedynie w modlitwie odnajdê si³ê.
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
	description = "Wybieram siê w okolice kopalni.";
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
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//Wybieram siê w okolice kopalni.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//Uwa¿aj, to nie przelewki. Przede wszystkim, postaraj siê odnaleŸæ paladynów. Dowodz¹ trzema grupami.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//Jeœli chcesz siê dowiedzieæ wiêcej na ten temat, porozmawiaj z Parcivalem.
};


instance DIA_ORIC_PERM(C_INFO)
{
	npc = pal_251_oric;
	nr = 99;
	condition = dia_oric_perm_condition;
	information = dia_oric_perm_info;
	permanent = TRUE;
	description = "Jak wygl¹da sytuacja?";
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
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//Jak wygl¹da sytuacja?
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//Musisz odnaleŸæ krety i rudê. Potem zastanowimy siê nad drog¹ odwrotu.
	}
	else if(MIS_SCOUTMINE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//Ekspedycja ponios³a klêskê. Ale nie poddamy siê, Innos jest z nami. On bezpiecznie wyprowadzi nas z doliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//To, ¿e siê pojawi³eœ, daje nam nadziejê.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//Potrzebujemy ciê. IdŸ porozmawiaæ z Garondem, on wszystko ci wyjaœni.
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
	description = "Wróci³em.";
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
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//Wróci³em.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//Nie przypuszcza³em, ¿e jeszcze ciê tu zobaczê, szczególnie po tym, co siê sta³o podczas twojej poprzedniej wizyty.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//W imieniu naszego zakonu, b¹dŸ pozdrowiony.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//Widzê, ¿e zosta³eœ magiem. Przyjmij wyrazy szacunku.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//Byæ mo¿e twoje pojawienie siê tutaj to dobry znak.
};


instance DIA_ORIC_CANHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_canhelp_condition;
	information = dia_oric_canhelp_info;
	description = "Czy mogê jakoœ pomóc?";
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
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//Czy mogê jakoœ pomóc?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//Wydaje mi siê, ¿e uczyniliœmy ju¿ wszystko, co by³o mo¿na.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//Jest jednak pewna sprawa. Móg³byœ siê nam przydaæ poza murami zamku.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//Planujemy urwaæ ³eb hydrze.
	Info_ClearChoices(dia_oric_canhelp);
	Info_AddChoice(dia_oric_canhelp,"Poszukaj lepiej kogoœ innego.",dia_oric_canhelp_notyourman);
	Info_AddChoice(dia_oric_canhelp,"Co przez to rozumiesz?",dia_oric_canhelp_whatyoumean);
};

func void dia_oric_canhelp_notyourman()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//Chyba bêdziecie musieli poszukaæ kogoœ innego.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//Nie mogê sobie pozwoliæ na stracenie chocia¿ jednego obroñcy, jesteœ nasz¹ jedyn¹ nadziej¹.
};

func void dia_oric_canhelp_whatyoumean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//Co masz na myœli?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//Znamy jednego z ich przywódców. Nazywa siê Hosh-Pak.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//To najbardziej wp³ywowy szaman wœród orków.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//A czego oczekujecie ode mnie?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Musisz go zabiæ.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//To chyba jakiœ ¿art?!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//Jesteœ jedyn¹ osob¹, której mo¿emy powierzyæ tê misjê. Wszyscy inni rycerze s¹ nam potrzebni na miejscu.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//Panie, nie jest mi ³atwo o to prosiæ. Jednak tylko ty mo¿esz sprostaæ temu zadaniu.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//Chcesz nam pomóc, prawda? Wiêc masz okazjê...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//Namiot Hosh-Paka znajduje siê poza liniami oblê¿enia, na klifie na po³udnie st¹d.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//Niemal widaæ go z naszych okien.
	Info_ClearChoices(dia_oric_canhelp);
	ORIKTOLDMISSIONCHAPTER4 = TRUE;
};


instance DIA_ORIC_NEEDSTUFF(C_INFO)
{
	npc = pal_251_oric;
	nr = 6;
	condition = dia_oric_needstuff_condition;
	information = dia_oric_needstuff_info;
	description = "Potrzebujê wyposa¿enia.";
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
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//Potrzebujê wyposa¿enia.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//Niewiele mo¿emy ci zaoferowaæ.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//Mam tylko to.
	Info_ClearChoices(dia_oric_needstuff);
	Info_AddChoice(dia_oric_needstuff,"lub 1 eliksir zrêcznoœci",dia_oric_needstuff_dexterity);
	Info_AddChoice(dia_oric_needstuff,"lub 1 eliksir si³y",dia_oric_needstuff_strength);
	Info_AddChoice(dia_oric_needstuff,"lub 3 eliksiry many",dia_oric_needstuff_mana);
	Info_AddChoice(dia_oric_needstuff,"3 eliksiry lecznicze",dia_oric_needstuff_health);
};

func void dia_oric_needstuff_health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//Wezmê mikstury lecznicze.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//Doskona³y wybór. Mam nadziejê, ¿e ci siê przydadz¹.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//Wezmê mikstury many.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//Mam nadziejê, ¿e dobrze je wykorzystasz. Niech Innos ciê prowadzi.
	CreateInvItems(self,itpo_mana_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//Wezmê eliksir si³y.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//Proszê, na pewno siê przyda. ¯yczê ci szczêœcia.
	CreateInvItems(self,itpo_perm_str,1);
	b_giveinvitems(self,other,itpo_perm_str,1);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//Wezmê eliksir zrêcznoœci.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//Niech twe strza³y nigdy nie chybiaj¹ celu. Proszê.
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
	description = "Nie zamordujê Hosh-Paka jak ostatni tchórz.";
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
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//Nie zamordujê Hosh-Paka jak ostatni tchórz.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//Czy zdajesz sobie sprawê w jak trudnej sytuacji siê znajdujemy?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//Oblê¿enie trwa, armia orków jest nieugiêta. Nasze zapasy s¹ na wyczerpaniu.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//Jeœli nie uda nam siê przetransportowaæ rudy na statek, orkowie zetr¹ w py³ ca³e królestwo.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//Wszystko, czego broniliœmy, zostanie zapomniane.
};


instance DIA_ORIC_WILLHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 5;
	condition = dia_oric_willhelp_condition;
	information = dia_oric_willhelp_info;
	permanent = FALSE;
	description = "Dobrze. Zg³adzê Hosh-Paka.";
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
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//Dobrze. Zg³adzê Hosh-Paka.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//Mi³o mi to s³yszeæ.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//Namiot Hosh-Paka stoi na niewielkim klifie. Na pewno ju¿ go widzia³eœ.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//To niedaleko œcie¿ki prowadz¹cej do kopalni. W cieniu wielkiej góry.
	Log_CreateTopic(TOPIC_KILLHOSHPAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLHOSHPAK,LOG_RUNNING);
	b_logentry(TOPIC_KILLHOSHPAK,"Orik chce rozprawiæ siê z orkowym szamanem Hosh-Pakiem. Jego namiot znajduje siê na niewielkim klifie niedaleko zamku.");
	MIS_KILLHOSHPAK = LOG_RUNNING;
};


instance DIA_ORIC_HOSHDEAD(C_INFO)
{
	npc = pal_251_oric;
	nr = 8;
	condition = dia_oric_hoshdead_condition;
	information = dia_oric_hoshdead_info;
	permanent = FALSE;
	description = "Hosh-Pak nie ¿yje.";
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
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//Hosh-Pak nie ¿yje.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//Wspaniale, to powinno zasiaæ zamêt wœród orków. Mo¿e, mimo wszystko, jest jeszcze dla nas nadzieja.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//Mam nadziejê, ¿e to wydarzenie pozwoli nam nadrobiæ straty ostatniego tygodnia.
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
	description = "Jakieœ wieœci?";
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
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//Jakieœ wieœci?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//Poza tym, ¿e najechali na nas orkowie?
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//Tak. Jesteœ tu bohaterem. Pozbycie siê smoków to niew¹tpliwie nie³atwe zadanie.
	}
	else if(MIS_KILLHOSHPAK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//Po œmierci Hosh-Paka w orkowych szeregach zapanowa³ chaos.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//Orków jest coraz wiêcej, to z³y znak.
	};
};


instance DIA_ORIC_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_251_oric;
	nr = 3;
	condition = dia_oric_dragonplettbericht_condition;
	information = dia_oric_dragonplettbericht_info;
	permanent = TRUE;
	description = "Potrzebujê wiêcej informacji o smokach.";
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
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//Potrzebujê wiêcej informacji o smokach.
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//Jednego uda³o mi siê zg³adziæ. Czy mo¿esz mi powiedzieæ, gdzie szukaæ nastêpnych?
	}
	else if(MIS_KILLEDDRAGONS != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//Wydaje mi siê, ¿e nie dotar³em jeszcze do wszystkich smoków. Mo¿e coœ usz³o mojej uwadze?
	};
	if(((ORIC_DRAGONCOUNTER < MIS_KILLEDDRAGONS) || (ORIC_FIRSTQUESTION == FALSE)) && ((ORIC_SWAMPDRAGONINFO_ONETIME == FALSE) || (ORIC_ROCKDRAGONINFO_ONETIME == FALSE) || (ORIC_FIREDRAGONINFO_ONETIME == FALSE) || (ORIC_ICEDRAGONINFO_ONETIME == FALSE)))
	{
		if((Npc_IsDead(swampdragon) == FALSE) && (ORIC_SWAMPDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//W ci¹gu kilku ostatnich dni na zachód od zamku pojawi³o siê wielkie bagno. Jest w tym coœ podejrzanego, nie s¹dzisz?
			b_logentry(TOPIC_DRACHENJAGD,"Orik da³ mi wskazówkê: kilka dni temu na zachód od zamku pojawi³o siê wielkie bagno. Ca³a ta sprawa jest doœæ podejrzana.");
			ORIC_SWAMPDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(rockdragon) == FALSE) && (ORIC_ROCKDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//Na po³udnie st¹d, daleko za wulkanem, wznosi siê kamienna forteca.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//Nasi szpiedzy donieœli, ¿e jest silnie strze¿ona. Byæ mo¿e tam ukrywa siê jeden ze smoków?
			b_logentry(TOPIC_DRACHENJAGD,"Zwiadowcy donieœli Orikowi, ¿e skalna forteca za wulkanem na po³udniu jest dobrze chroniona. Orik podejrzewa, ¿e mo¿e tam przebywaæ smok.");
			ORIC_ROCKDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(firedragon) == FALSE) && (ORIC_FIREDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//Po ostatnim ataku dosz³y mnie wieœci, jakoby jeden ze smoków znikn¹³ gdzieœ na po³udniu, za wulkanem. Wydaje mi siê, ¿e tam powinieneœ skierowaæ swe kroki.
			b_logentry(TOPIC_DRACHENJAGD,"Podobno smok, który zaatakowa³ zamek w Górniczej Dolinie, pojawi³ siê póŸniej w okolicach wulkanu.");
			ORIC_FIREDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(icedragon) == FALSE) && (ORIC_ICEDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//Na zachód st¹d rozci¹ga siê wielka po³aæ pokrytych lodem pustkowi. Nie zdziwi³oby mnie, gdyby jeden ze smoków ukry³ siê w³aœnie tam.
			b_logentry(TOPIC_DRACHENJAGD,"Orik twierdzi, ¿e lodowe pustkowie na zachodzie mo¿e byæ siedzib¹ smoka.");
			ORIC_ICEDRAGONINFO_ONETIME = TRUE;
		};
		ORIC_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		ORIC_FIRSTQUESTION = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//W tej chwili nie mam dla ciebie ¿adnych informacji.
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
	description = "(Kradzie¿ tego zwoju bêdzie bardzo trudna)";
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


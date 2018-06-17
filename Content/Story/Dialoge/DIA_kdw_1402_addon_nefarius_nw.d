
instance DIA_ADDON_NEFARIUS_EXIT(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 999;
	condition = dia_addon_nefarius_exit_condition;
	information = dia_addon_nefarius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_nefarius_exit_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_NEFARIUS_HALLO(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_hallo_condition;
	information = dia_addon_nefarius_hallo_info;
	description = "Co s�ycha�?";
};


func int dia_addon_nefarius_hallo_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tu robisz? Co za niespodzianka.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//My�la�em, �e ci� zabili.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Prawie.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Jest straszne zamieszanie z twojego powodu, wiesz? Ledwo rozpozna�em Saturasa � taki by� z�y.
};


instance DIA_ADDON_NEFARIUS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_keineahnung_condition;
	information = dia_addon_nefarius_keineahnung_info;
	description = "A co z portalem?";
};


func int dia_addon_nefarius_keineahnung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_keineahnung_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//A co z portalem?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//S�dzimy, �e prowadzi do zaginionej doliny, w kt�rej staro�ytna cywilizacja wznios�a swoje miasto.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Ale ska�a za portalem to ogromny, lity kamie�.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Nie ma �adnych znak�w zakl�� teleportacyjnych. Tajemnicza sprawa...
};


instance DIA_ADDON_NEFARIUS_WIEMECHANIK(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_wiemechanik_condition;
	information = dia_addon_nefarius_wiemechanik_info;
	description = "Wiesz, jak go uaktywni�?";
};


func int dia_addon_nefarius_wiemechanik_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_keineahnung))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_wiemechanik_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//Wiesz, jak go uaktywni�?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z zaginionych ornament�w wydaje si� swego rodzaju KLUCZEM.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//B�dziemy go potrzebowa�, je�li chcemy dokona� jakich� post�p�w.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Musi pasowa� do wg��bienia w kszta�cie pier�cienia obok portalu.
};


instance DIA_ADDON_NEFARIUS_SCBRINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_scbringornaments_condition;
	information = dia_addon_nefarius_scbringornaments_info;
	description = "Przynios�em ze sob� fragment ornamentu.";
};


func int dia_addon_nefarius_scbringornaments_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_scbringornaments_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//Przynios�em ze sob� fragment ornamentu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//Naprawd�? To wspaniale!
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//Wiesz, gdzie mog� by� pozosta�e cz�ci?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Wed�ug inskrypcji ornament podzielono na cztery kawa�ki.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//Wygl�da na to, �e wci�� mog� by� gdzie� na wyspie.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//Z pomoc� Merdariona przet�umaczy�em niekt�re inskrypcje.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Zawieraj� wskaz�wki co do miejsca ukrycia fragment�w.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Masz. Zaznaczy�em niekt�re miejsca na tej mapie.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon,1);
	b_giveinvitems(self,other,itwr_map_newworld_ornaments_addon,1);
	MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"Magowie Wody znale�li portal, kt�ry podobno prowadzi do niezbadanego rejonu Khorinis.");
	b_logentry(TOPIC_ADDON_ORNAMENT,"Nefarius planuje uaktywni� mechanizm portalu za pomoc� ozdobnego pier�cienia. Wci�� potrzebuje trzech fragment�w ornamentu, aby mie� ca�y pier�cie�. Wr�czy� mi map� z zaznaczonymi miejscami, w kt�rych, jak s�dzi, znajduj� si� te elementy.");
	b_startotherroutine(bau_4300_addon_cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Rozejrzyj si� po okolicy.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//Zwracaj uwag� na stare budowle. Mo�liwe, �e ju� ca�kiem si� rozsypa�y i trudno b�dzie je rozpozna�.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//Mog� wygl�da� rozmaicie � jak wielki, nieregularny g�az, kamienny kr�g, mauzoleum, albo co� w tym stylu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale po co ci to w og�le m�wi�! Na pewno je znajdziesz. Powodzenia.
};


instance DIA_ADDON_NEFARIUS_WHYPORTALCLOSED(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_whyportalclosed_condition;
	information = dia_addon_nefarius_whyportalclosed_info;
	description = "Dlaczego ornament zosta� zniszczony?";
};


func int dia_addon_nefarius_whyportalclosed_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_scbringornaments))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_whyportalclosed_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Dlaczego ornament zosta� zniszczony?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Ten, kto to zrobi�, chcia� zapobiec ponownej aktywacji portalu.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//Im d�u�ej wpatruj� si� w inskrypcje, tym bardziej jestem pewien, �e kap�ani tej prastarej kultury nie byli wcale g�upcami.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Mieli powody, �eby odci�� dost�p do obszaru po drugiej stronie.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Nie wiemy, co tam nas czeka. Ale z pewno�ci� nie jest to nic dobrego...
};


instance DIA_ADDON_NEFARIUS_MISSINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_missingornaments_condition;
	information = dia_addon_nefarius_missingornaments_info;
	permanent = TRUE;
	description = "Je�li chodzi o zaginione ornamenty....";
};


func int dia_addon_nefarius_missingornaments_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int missingornamentscounter;
const int ADDON_NEFARIUSSMISSINGORNAMENTSOFFER = 100;

func void dia_addon_nefarius_missingornaments_info()
{
	var int missingornamentscount;
	var int xp_addon_bringmissingornaments;
	var int missingornamentsgeld;
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Je�li chodzi o zaginione ornamenty....
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//Tak?
	if(Npc_HasItems(other,itmi_ornament_addon) >= 1)
	{
		missingornamentscount = Npc_HasItems(other,itmi_ornament_addon);
		if(missingornamentscount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Prosz�. Znalaz�em kolejny.
			b_giveplayerxp(XP_ADDON_BRINGMISSINGORNAMENT);
			Npc_RemoveInvItems(other,itmi_ornament_addon,1);
			AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Znalaz�em je.
			Npc_RemoveInvItems(other,itmi_ornament_addon,missingornamentscount);
			concattext = ConcatStrings(IntToString(missingornamentscount),PRINT_ITEMSGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			xp_addon_bringmissingornaments = missingornamentscount * XP_ADDON_BRINGMISSINGORNAMENT;
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + missingornamentscount;
			b_giveplayerxp(xp_addon_bringmissingornaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//To naprawd� wspaniale.
		if(MISSINGORNAMENTSCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Brakuje nam wci�� dw�ch fragment�w. Mo�e uda ci si� je znale��.
		}
		else if(MISSINGORNAMENTSCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Brakuje tylko jednego do kompletu.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Teraz mamy je wszystkie. Pozostaje je tylko po��czy�.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Musimy zjednoczy� nasze si�y, by ponownie po��czy� ornamenty w pier�cieniu.
			MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Prosz�. To troch� z�ota w podzi�ce za tw� prac�.
		missingornamentsgeld = missingornamentscount * ADDON_NEFARIUSSMISSINGORNAMENTSOFFER;
		CreateInvItems(self,itmi_gold,missingornamentsgeld);
		b_giveinvitems(self,other,itmi_gold,missingornamentsgeld);
		if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Za mn�!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			b_startotherroutine(kdw_1400_addon_saturas_nw,"PreRingritual");
			b_startotherroutine(kdw_1401_addon_cronos_nw,"PreRingritual");
			b_startotherroutine(kdw_1403_addon_myxir_nw,"PreRingritual");
			b_startotherroutine(kdw_1404_addon_riordian_nw,"PreRingritual");
			b_startotherroutine(kdw_1405_addon_merdarion_nw,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//Ile ich by�o?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//W sumie cztery...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Pozosta�e powiniene� znale�� tutaj, w miejscach, kt�re zaznaczy�em na mapie.
	};
};


instance DIA_ADDON_NEFARIUS_RINGRITUAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_ringritual_condition;
	information = dia_addon_nefarius_ringritual_info;
	important = TRUE;
};


func int dia_addon_nefarius_ringritual_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_ringritual_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//A teraz odejd�.
	Npc_SetRefuseTalk(self,60);
	RITUALRINGRUNS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Przynios�em Nefariusowi wszystkie fragmenty ozdobnego pier�cienia. Magowie Wody chc� je teraz po��czy�.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Ringritual");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Ringritual");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Ringritual");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Ringritual");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Ringritual");
};


instance DIA_ADDON_NEFARIUS_RINGRITUALENDS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_ringritualends_condition;
	information = dia_addon_nefarius_ringritualends_info;
	important = TRUE;
};


func int dia_addon_nefarius_ringritualends_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RITUALRINGRUNS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_ringritualends_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//Ornament zosta� z�o�ony.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Poniewa� przynios�e� nam wszystkie fragmenty, powiniene� umie�ci� je w portalu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//Id� do Saturasa po z�o�ony pier�cie�.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Wtedy, miejmy nadziej�, portal si� otworzy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Start");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Start");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Start");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Start");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Start");
	RITUALRINGRUNS = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Ozdobny pier�cie� jest gotowy. Mam go wzi�� od Saturasa.");
};


instance DIA_ADDON_NEFARIUS_OPENEDPORTAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_openedportal_condition;
	information = dia_addon_nefarius_openedportal_info;
	description = "Co dalej?";
};


func int dia_addon_nefarius_openedportal_condition()
{
	if(RITUALRINGRUNS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_openedportal_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//Co dalej?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//Na co czekasz? Ruszaj i oczy�� drog�.
};


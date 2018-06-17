
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
	description = "Co s³ychaæ?";
};


func int dia_addon_nefarius_hallo_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tu robisz? Co za niespodzianka.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Myœla³em, ¿e ciê zabili.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Prawie.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Jest straszne zamieszanie z twojego powodu, wiesz? Ledwo rozpozna³em Saturasa – taki by³ z³y.
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
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//S¹dzimy, ¿e prowadzi do zaginionej doliny, w której staro¿ytna cywilizacja wznios³a swoje miasto.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Ale ska³a za portalem to ogromny, lity kamieñ.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Nie ma ¿adnych znaków zaklêæ teleportacyjnych. Tajemnicza sprawa...
};


instance DIA_ADDON_NEFARIUS_WIEMECHANIK(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_wiemechanik_condition;
	information = dia_addon_nefarius_wiemechanik_info;
	description = "Wiesz, jak go uaktywniæ?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//Wiesz, jak go uaktywniæ?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z zaginionych ornamentów wydaje siê swego rodzaju KLUCZEM.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Bêdziemy go potrzebowaæ, jeœli chcemy dokonaæ jakichœ postêpów.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Musi pasowaæ do wg³êbienia w kszta³cie pierœcienia obok portalu.
};


instance DIA_ADDON_NEFARIUS_SCBRINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_scbringornaments_condition;
	information = dia_addon_nefarius_scbringornaments_info;
	description = "Przynios³em ze sob¹ fragment ornamentu.";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//Przynios³em ze sob¹ fragment ornamentu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//Naprawdê? To wspaniale!
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//Wiesz, gdzie mog¹ byæ pozosta³e czêœci?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Wed³ug inskrypcji ornament podzielono na cztery kawa³ki.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//Wygl¹da na to, ¿e wci¹¿ mog¹ byæ gdzieœ na wyspie.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//Z pomoc¹ Merdariona przet³umaczy³em niektóre inskrypcje.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Zawieraj¹ wskazówki co do miejsca ukrycia fragmentów.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Masz. Zaznaczy³em niektóre miejsca na tej mapie.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon,1);
	b_giveinvitems(self,other,itwr_map_newworld_ornaments_addon,1);
	MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"Magowie Wody znaleŸli portal, który podobno prowadzi do niezbadanego rejonu Khorinis.");
	b_logentry(TOPIC_ADDON_ORNAMENT,"Nefarius planuje uaktywniæ mechanizm portalu za pomoc¹ ozdobnego pierœcienia. Wci¹¿ potrzebuje trzech fragmentów ornamentu, aby mieæ ca³y pierœcieñ. Wrêczy³ mi mapê z zaznaczonymi miejscami, w których, jak s¹dzi, znajduj¹ siê te elementy.");
	b_startotherroutine(bau_4300_addon_cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Rozejrzyj siê po okolicy.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//Zwracaj uwagê na stare budowle. Mo¿liwe, ¿e ju¿ ca³kiem siê rozsypa³y i trudno bêdzie je rozpoznaæ.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//Mog¹ wygl¹daæ rozmaicie – jak wielki, nieregularny g³az, kamienny kr¹g, mauzoleum, albo coœ w tym stylu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale po co ci to w ogóle mówiê! Na pewno je znajdziesz. Powodzenia.
};


instance DIA_ADDON_NEFARIUS_WHYPORTALCLOSED(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_whyportalclosed_condition;
	information = dia_addon_nefarius_whyportalclosed_info;
	description = "Dlaczego ornament zosta³ zniszczony?";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Dlaczego ornament zosta³ zniszczony?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Ten, kto to zrobi³, chcia³ zapobiec ponownej aktywacji portalu.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//Im d³u¿ej wpatrujê siê w inskrypcje, tym bardziej jestem pewien, ¿e kap³ani tej prastarej kultury nie byli wcale g³upcami.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Mieli powody, ¿eby odci¹æ dostêp do obszaru po drugiej stronie.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Nie wiemy, co tam nas czeka. Ale z pewnoœci¹ nie jest to nic dobrego...
};


instance DIA_ADDON_NEFARIUS_MISSINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_missingornaments_condition;
	information = dia_addon_nefarius_missingornaments_info;
	permanent = TRUE;
	description = "Jeœli chodzi o zaginione ornamenty....";
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
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Jeœli chodzi o zaginione ornamenty....
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//Tak?
	if(Npc_HasItems(other,itmi_ornament_addon) >= 1)
	{
		missingornamentscount = Npc_HasItems(other,itmi_ornament_addon);
		if(missingornamentscount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Proszê. Znalaz³em kolejny.
			b_giveplayerxp(XP_ADDON_BRINGMISSINGORNAMENT);
			Npc_RemoveInvItems(other,itmi_ornament_addon,1);
			AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Znalaz³em je.
			Npc_RemoveInvItems(other,itmi_ornament_addon,missingornamentscount);
			concattext = ConcatStrings(IntToString(missingornamentscount),PRINT_ITEMSGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			xp_addon_bringmissingornaments = missingornamentscount * XP_ADDON_BRINGMISSINGORNAMENT;
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + missingornamentscount;
			b_giveplayerxp(xp_addon_bringmissingornaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//To naprawdê wspaniale.
		if(MISSINGORNAMENTSCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Brakuje nam wci¹¿ dwóch fragmentów. Mo¿e uda ci siê je znaleŸæ.
		}
		else if(MISSINGORNAMENTSCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Brakuje tylko jednego do kompletu.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Teraz mamy je wszystkie. Pozostaje je tylko po³¹czyæ.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Musimy zjednoczyæ nasze si³y, by ponownie po³¹czyæ ornamenty w pierœcieniu.
			MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Proszê. To trochê z³ota w podziêce za tw¹ pracê.
		missingornamentsgeld = missingornamentscount * ADDON_NEFARIUSSMISSINGORNAMENTSOFFER;
		CreateInvItems(self,itmi_gold,missingornamentsgeld);
		b_giveinvitems(self,other,itmi_gold,missingornamentsgeld);
		if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Za mn¹!
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
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//Ile ich by³o?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//W sumie cztery...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Pozosta³e powinieneœ znaleŸæ tutaj, w miejscach, które zaznaczy³em na mapie.
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
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//A teraz odejdŸ.
	Npc_SetRefuseTalk(self,60);
	RITUALRINGRUNS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Przynios³em Nefariusowi wszystkie fragmenty ozdobnego pierœcienia. Magowie Wody chc¹ je teraz po³¹czyæ.");
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
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//Ornament zosta³ z³o¿ony.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Poniewa¿ przynios³eœ nam wszystkie fragmenty, powinieneœ umieœciæ je w portalu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//IdŸ do Saturasa po z³o¿ony pierœcieñ.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Wtedy, miejmy nadziejê, portal siê otworzy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Start");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Start");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Start");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Start");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Start");
	RITUALRINGRUNS = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ORNAMENT,"Ozdobny pierœcieñ jest gotowy. Mam go wzi¹æ od Saturasa.");
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
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//Na co czekasz? Ruszaj i oczyœæ drogê.
};



instance DIA_ADDON_RIORDIAN_ADW_EXIT(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 999;
	condition = dia_addon_riordian_adw_exit_condition;
	information = dia_addon_riordian_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HELLOADW(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_helloadw_condition;
	information = dia_addon_riordian_helloadw_info;
	description = "Spodziewa³eœ siê TEGO?";
};


func int dia_addon_riordian_helloadw_condition()
{
	return TRUE;
};

func void dia_addon_riordian_helloadw_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Spodziewa³eœ siê TEGO?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//W ¿adnym wypadku. Jestem zdumiony wielkoœci¹ tego miasta.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Wiêkszoœæ budynków jest przysypana zwa³ami ziemi i kamieni, ale w ca³ej krainie mo¿na znaleŸæ ruiny, które przetrwa³y do naszych czasów.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//Mieszka³y tu tysi¹ce ludzi.
};


instance DIA_ADDON_RIORDIAN_WHATTOFIND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_whattofind_condition;
	information = dia_addon_riordian_whattofind_info;
	description = "Co mogê tutaj znaleŸæ?";
};


func int dia_addon_riordian_whattofind_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_helloadw))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_whattofind_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//Co mogê tutaj znaleŸæ?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na wschodzie, przy wielkim bagnie, znajduje siê ogromna forteca.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Z tego, co wiemy, jest tam teraz siedziba bandytów.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Nie szed³bym tam na twoim miejscu. Maj¹ wiele posterunków i stra¿ników.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Lepiej unikaj bagna, a¿ zdobêdziesz wiêcej doœwiadczenia, albo znajdziesz sposób na unikniêcie bandytów.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Na zachodzie znaleŸliœmy paru piratów.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nie jestem do koñca pewien, ale wydaje mi siê, ¿e nas zauwa¿yli.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Chyba nie przejmuj¹ siê nasz¹ obecnoœci¹.
};


instance DIA_ADDON_RIORDIAN_GEGEND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_gegend_condition;
	information = dia_addon_riordian_gegend_info;
	permanent = TRUE;
	description = "Opowiedz mi wiêcej o tej okolicy.";
};


func int dia_addon_riordian_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_whattofind) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};


var int dia_addon_riordian_gegend_info_onetime;

func void dia_addon_riordian_gegend_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Opowiedz mi wiêcej o tej okolicy.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co chcesz wiedzieæ?
	Info_ClearChoices(dia_addon_riordian_gegend);
	Info_AddChoice(dia_addon_riordian_gegend,DIALOG_BACK,dia_addon_riordian_gegend_back);
	if((dia_addon_riordian_gegend_info_onetime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld) == FALSE))
	{
		Info_AddChoice(dia_addon_riordian_gegend,"Czy istnieje mapa tego regionu?",dia_addon_riordian_gegend_map);
		dia_addon_riordian_gegend_info_onetime = TRUE;
	};
	Info_AddChoice(dia_addon_riordian_gegend,"Gdzie widzia³eœ piratów?",dia_addon_riordian_gegend_piraten);
	Info_AddChoice(dia_addon_riordian_gegend,"Gdzie przebywaj¹ bandyci?",dia_addon_riordian_gegend_bandits);
	Info_AddChoice(dia_addon_riordian_gegend,"By³eœ ju¿ na zachodzie?",dia_addon_riordian_gegend_west);
	Info_AddChoice(dia_addon_riordian_gegend,"Co znajduje siê na wschodzie?",dia_addon_riordian_gegend_ost);
	Info_AddChoice(dia_addon_riordian_gegend,"Gdzie dojdê, id¹c na po³udnie?",dia_addon_riordian_gegend_sued);
	Info_AddChoice(dia_addon_riordian_gegend,"Co znajduje siê na pó³nocy?",dia_addon_riordian_gegend_nord);
};

func void dia_addon_riordian_gegend_back()
{
	Info_ClearChoices(dia_addon_riordian_gegend);
};

func void dia_addon_riordian_gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Czy istnieje mapa tego regionu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Tak, narysowa³ j¹ Cronos. Z pewnoœci¹ ci j¹ przeka¿e.
};

func void dia_addon_riordian_gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Gdzie przebywaj¹ bandyci?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Maj¹ na wschodzie tak¹ niby fortecê i mnóstwo posterunków.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby siê tam dostaæ, musisz przejœæ przez wielkie grzêzawisko.
};

func void dia_addon_riordian_gegend_piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Gdzie widzia³eœ piratów?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Wa³êsaj¹ siê na zachodzie.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Wydaje mi siê, ¿e na coœ polowali.
};

func void dia_addon_riordian_gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co znajduje siê na pó³nocy?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Jeœli mogê ufaæ zapiskom budowniczych, znajdziesz tam wielk¹ dolinê otoczon¹ wysokimi ska³ami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Jest to sucha i pustynna okolica.
};

func void dia_addon_riordian_gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Gdzie dojdê, id¹c na po³udnie?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Tereny na po³udniu s¹ bardzo skaliste.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Znajdziesz tam wij¹ce siê drogi, wodospady i kamienne ruiny.
};

func void dia_addon_riordian_gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co znajduje siê na wschodzie?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Wielkie bagno. Ten obszar jest bardzo niebezpieczny.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Czaj¹ siê tam nie tylko bandyci, ale te¿ wyj¹tkowo groŸne zwierzêta.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Zachowaj ostro¿noœæ.
};


var int dia_addon_riordian_gegend_west_onetime;

func void dia_addon_riordian_gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//By³eœ ju¿ na zachodzie?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Nie, ale tam na pewno jest wybrze¿e.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Podejrzewam, ¿e piraci maj¹ tam swój obóz.
	if((dia_addon_riordian_gegend_west_onetime == FALSE) && Npc_HasItems(vlk_4304_addon_william,itwr_addon_william_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Na wschodzie, niedaleko st¹d, znaleŸliœmy zw³oki rybaka.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Powinieneœ siê temu przyjrzeæ.
		b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
		dia_addon_riordian_gegend_west_onetime = TRUE;
	};
};


instance DIA_ADDON_RIORDIAN_HOUSESOFRULERS(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_housesofrulers_condition;
	information = dia_addon_riordian_housesofrulers_info;
	description = "Przysy³a mnie Saturas. ";
};


func int dia_addon_riordian_housesofrulers_condition()
{
	if(MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_housesofrulers_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Przysy³a mnie Saturas. Mam poszukaæ piêciu posiad³oœci w Jarkendarze.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Potrzebowa³em du¿o czasu, aby ustaliæ po³o¿enie posiad³oœci na podstawie zapisków budowniczych.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale teraz mogê ci je dok³adnie opisaæ.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_RUNNING;
};


instance DIA_ADDON_RIORDIAN_WHEREAREHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_wherearehouses_condition;
	information = dia_addon_riordian_wherearehouses_info;
	description = "Gdzie mogê znaleŸæ te piêæ budowli?";
};


func int dia_addon_riordian_wherearehouses_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && (SATURAS_SCBROUGHTALLTOKEN == FALSE))
	{
		return TRUE;
	};
};


var int b_whrearehousesofrulersonetime;

func void b_whrearehousesofrulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Dom uczonych to wielka biblioteka. Musi byæ gdzieœ daleko na pó³nocy.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Dom wojowników to forteca otoczona przez ska³y. Le¿y na wschodzie.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Domy kap³anów i stra¿ników umar³ych znajdowa³y siê blisko siebie. Powinieneœ je znaleŸæ na po³udniowym zachodzie.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//Uzdrowiciele mieli swój dom leczniczy na po³udniowym wschodzie.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Jeœli te budowle wci¹¿ stoj¹, rozpoznasz je po architekturze.
		b_whrearehousesofrulersonetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//S¹ umieszczone na podwy¿szeniu. Strome schody prowadz¹ do wejœcia otoczonego wysokimi kolumnami.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Mam nadziejê, ¿e ci to pomo¿e.
	};
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Dom Uczonych to du¿a biblioteka. Na pewno znajduje siê gdzieœ na pó³nocy.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Dom Wojowników by³ fortec¹ na wschodzie, otoczon¹ klifami.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Kap³ani i Stra¿nicy Umar³ych mieszkali blisko siebie. Powinienem ich znaleŸæ na po³udniowym zachodzie.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Dom Uzdrowicieli znajdowa³ siê na po³udniowym wschodzie.");
};

func void dia_addon_riordian_wherearehouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Gdzie mogê znaleŸæ te piêæ budowli?
	b_whrearehousesofrulers();
};


instance DIA_ADDON_RIORDIAN_FOUNDHOUSE(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundhouse_condition;
	information = dia_addon_riordian_foundhouse_info;
	permanent = TRUE;
	description = "Eee, jeœli chodzi o te budynki...";
};


func int dia_addon_riordian_foundhouse_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_riordian_wherearehouses) && (RIORDIANHOUSESFOUNDCOUNT < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int LIBRARY = 1;
const int HEILER = 2;
const int WARRIOR = 3;
const int PRIEST = 4;
const int TOTENW = 5;
var int riordianhouseneuigkeit;
var int riordianhousesfoundcount;

func void dia_addon_riordian_foundhouse_info()
{
	var int riordianhousexps;
	RIORDIANHOUSENEUIGKEIT = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Eee, jeœli chodzi o te budynki...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Tak?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_ONETIME == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Wygl¹da na to, ¿e orkowie zainteresowali siê bibliotek¹ uczonych.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Myœlisz, ¿e mog¹ odczytaæ ten prastary jêzyk?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nie s¹dzê, ale kto wie...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Mo¿e lepiej upewnij siê, ¿e nie sprawi¹ k³opotów.
		FOUNDHOUSEINFO[1] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
		Log_CreateTopic(TOPIC_ADDON_CANYONORCS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_CANYONORCS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_CANYONORCS,"Mag Wody, Riordian, wola³by, ¿eby orkowie zniknêli z kanionu.");
	};
	if((Npc_IsDead(stoneguardian_heiler) || Npc_HasItems(other,itmi_addon_stone_04) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Siedziba uzdrowicieli znajduje siê na œrodku bagna i jest broniona przez wielu kamiennych stra¿ników.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Ci¹gle stoi?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Tak, pytanie tylko – jak d³ugo....
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Smuci mnie, gdy widzê œwiadków przesz³oœci w takim stanie.
		FOUNDHOUSEINFO[2] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//Kruk wykorzysta³ posiad³oœæ wojowników jako swoj¹ kryjówkê.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//M¹dry wybór.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//To podobno najbezpieczniejsza forteca, jak¹ mo¿na znaleŸæ na tym terenie.
		FOUNDHOUSEINFO[3] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(minecrawler_priest) || Npc_HasItems(other,itmi_addon_stone_03) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//W domu kap³anów jest mnóstwo pe³zaczy...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Czy to nie dziwne, ¿e te stworzenia pojawi³y siê w tym regionie?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//W rzeczy samej.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//O, Adanosie! Dziej¹ siê tu dziwne rzeczy.
		FOUNDHOUSEINFO[4] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(mayazombie04_totenw) || Npc_HasItems(other,itmi_addon_stone_02) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Siedziba stra¿ników umar³ych by³a opanowana przez moce z³a.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Chyba nigdy jeszcze nie widzia³em w jednym miejscu tylu zombie.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//To bardzo niedobrze. Stra¿nicy umar³ych stali siê ofiarami w³asnych zdolnoœci.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Ich powi¹zanie ze œwiatem umar³ych okaza³o siê bardzo szkodliwe. Mam nadziejê, ¿e uwolnisz ich z tej udrêki.
		FOUNDHOUSEINFO[5] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if(RIORDIANHOUSENEUIGKEIT > 0)
	{
		riordianhousexps = XP_ADDON_RIORDIAN_FOUNDHOUSE * RIORDIANHOUSENEUIGKEIT;
		b_giveplayerxp(riordianhousexps);
		RIORDIANHOUSESFOUNDCOUNT = RIORDIANHOUSESFOUNDCOUNT + RIORDIANHOUSENEUIGKEIT;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Przypomnij mi znowu, gdzie siê znajduj¹ budynki.
		b_whrearehousesofrulers();
	};
};


instance DIA_ADDON_RIORDIAN_ORKSWEG(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_orksweg_condition;
	information = dia_addon_riordian_orksweg_info;
	description = "Orkowie wkrótce przestan¹ siê interesowaæ tym regionem.";
};


func int dia_addon_riordian_orksweg_condition()
{
	if(Npc_IsDead(orcshaman_sit_canyonlibrarykey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_orksweg_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Orkowie wkrótce przestan¹ siê interesowaæ tym regionem.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Czemu tak uwa¿asz?
	if(orcshaman_sit_canyonlibrarykey.aivar[AIV_KILLEDBYPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabi³em ich przywódcê.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Ich przywódca nie ¿yje.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Miejmy nadziejê, ¿e to prawda.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Naprawdê nie mo¿emy sobie teraz pozwoliæ na tego rodzaju k³opoty.
	TOPIC_END_CANYONORCS = TRUE;
	b_giveplayerxp(XP_ADDON_RIORDIAN_ORKSWEG);
};


instance DIA_ADDON_RIORDIAN_FOUNDALLHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundallhouses_condition;
	information = dia_addon_riordian_foundallhouses_info;
	description = "Znalaz³em wszystkie posiad³oœci.";
};


func int dia_addon_riordian_foundallhouses_condition()
{
	if((RIORDIANHOUSESFOUNDCOUNT >= 5) && (MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_foundallhouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Znalaz³em wszystkie posiad³oœci.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Wszystkie by³y tam, gdzie wskaza³em?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Tak, mniej wiêcej.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Bardzo dobrze. Wiêc moja praca siê op³aci³a.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Dziêkujê.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FOUNDALLHOUSES);
};


instance DIA_ADDON_RIORDIAN_ADW_PRETEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_adw_preteach_condition;
	information = dia_addon_riordian_adw_preteach_info;
	description = "Mo¿esz mnie nauczyæ swych umiejêtnoœci?";
};


func int dia_addon_riordian_adw_preteach_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Mo¿esz mnie nauczyæ swych umiejêtnoœci?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Mogê ciê podszkoliæ w sztuce alchemii.
	if(Npc_HasItems(other,itam_addon_wispdetector) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//Mogê ci tak¿e pokazaæ, jak nauczyæ twojego ognika szukania przedmiotów.
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		Log_AddEntry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
	};
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACHALCHEMY);
	RIORDIAN_ADW_ADDON_TEACHWISP = TRUE;
	RIORDIAN_ADW_ADDON_TEACHALCHEMY = TRUE;
};


instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 90;
	condition = dia_addon_riordian_adw_teach_condition;
	information = dia_addon_riordian_adw_teach_info;
	permanent = TRUE;
	description = "Poka¿ mi, jak wyszkoliæ mojego ognika.";
};


var int dia_addon_riordian_adw_teach_noperm;

func int dia_addon_riordian_adw_teach_condition()
{
	if((DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && (RIORDIAN_ADW_ADDON_TEACHWISP == TRUE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_adw_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_adw_teach);
		Info_AddChoice(dia_addon_riordian_adw_teach,DIALOG_BACK,dia_addon_riordian_adw_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_adw_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_adw_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_adw_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_adw_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_adw_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_adw_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_adw_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_adw_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};


instance DIA_RIORDIAN_ADW_TEACHALCHEMY(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 2;
	condition = dia_riordian_adw_teachalchemy_condition;
	information = dia_riordian_adw_teachalchemy_info;
	permanent = TRUE;
	description = "Naucz mnie warzenia mikstur.";
};


var int dia_riordian_adw_teachalchemy_permanent;

func int dia_riordian_adw_teachalchemy_condition()
{
	if((DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT == FALSE) && (RIORDIAN_ADW_ADDON_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Naucz mnie warzenia mikstur.
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE))
	{
		Info_ClearChoices(dia_riordian_adw_teachalchemy);
		Info_AddChoice(dia_riordian_adw_teachalchemy,DIALOG_BACK,dia_riordian_adw_teachalchemy_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_riordian_adw_teachalchemy_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Ekstrakt leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_riordian_adw_teachalchemy_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_riordian_adw_teachalchemy_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Ekstrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_riordian_adw_teachalchemy_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Eliksir many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_riordian_adw_teachalchemy_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Eliksir ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_riordian_adw_teachalchemy_perm_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Eliksir zwinnoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_riordian_adw_teachalchemy_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Mo¿esz przygotowywaæ mikstury na stole alchemicznym. Znajdziesz go na piêtrze w naszym domu.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Ale potrzebna ci bêdzie pusta butelka, niezbêdne sk³adniki oraz umiejêtnoœæ przyrz¹dzania mikstury.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Mo¿esz siê ode mnie nauczyæ, jak to robiæ. Pozosta³ych rzeczy musisz poszukaæ sam.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chcesz przyrz¹dziæ?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nie mogê ciê nauczyæ niczego nowego.
		DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT = TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_back()
{
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};


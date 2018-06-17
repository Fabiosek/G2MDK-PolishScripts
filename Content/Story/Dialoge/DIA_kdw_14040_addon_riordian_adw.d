
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
	description = "Spodziewa�e� si� TEGO?";
};


func int dia_addon_riordian_helloadw_condition()
{
	return TRUE;
};

func void dia_addon_riordian_helloadw_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Spodziewa�e� si� TEGO?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//W �adnym wypadku. Jestem zdumiony wielko�ci� tego miasta.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Wi�kszo�� budynk�w jest przysypana zwa�ami ziemi i kamieni, ale w ca�ej krainie mo�na znale�� ruiny, kt�re przetrwa�y do naszych czas�w.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//Mieszka�y tu tysi�ce ludzi.
};


instance DIA_ADDON_RIORDIAN_WHATTOFIND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_whattofind_condition;
	information = dia_addon_riordian_whattofind_info;
	description = "Co mog� tutaj znale��?";
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
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//Co mog� tutaj znale��?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//Na wschodzie, przy wielkim bagnie, znajduje si� ogromna forteca.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Z tego, co wiemy, jest tam teraz siedziba bandyt�w.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//Nie szed�bym tam na twoim miejscu. Maj� wiele posterunk�w i stra�nik�w.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Lepiej unikaj bagna, a� zdob�dziesz wi�cej do�wiadczenia, albo znajdziesz spos�b na unikni�cie bandyt�w.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//Na zachodzie znale�li�my paru pirat�w.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Nie jestem do ko�ca pewien, ale wydaje mi si�, �e nas zauwa�yli.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Chyba nie przejmuj� si� nasz� obecno�ci�.
};


instance DIA_ADDON_RIORDIAN_GEGEND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_gegend_condition;
	information = dia_addon_riordian_gegend_info;
	permanent = TRUE;
	description = "Opowiedz mi wi�cej o tej okolicy.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Opowiedz mi wi�cej o tej okolicy.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Co chcesz wiedzie�?
	Info_ClearChoices(dia_addon_riordian_gegend);
	Info_AddChoice(dia_addon_riordian_gegend,DIALOG_BACK,dia_addon_riordian_gegend_back);
	if((dia_addon_riordian_gegend_info_onetime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld) == FALSE))
	{
		Info_AddChoice(dia_addon_riordian_gegend,"Czy istnieje mapa tego regionu?",dia_addon_riordian_gegend_map);
		dia_addon_riordian_gegend_info_onetime = TRUE;
	};
	Info_AddChoice(dia_addon_riordian_gegend,"Gdzie widzia�e� pirat�w?",dia_addon_riordian_gegend_piraten);
	Info_AddChoice(dia_addon_riordian_gegend,"Gdzie przebywaj� bandyci?",dia_addon_riordian_gegend_bandits);
	Info_AddChoice(dia_addon_riordian_gegend,"By�e� ju� na zachodzie?",dia_addon_riordian_gegend_west);
	Info_AddChoice(dia_addon_riordian_gegend,"Co znajduje si� na wschodzie?",dia_addon_riordian_gegend_ost);
	Info_AddChoice(dia_addon_riordian_gegend,"Gdzie dojd�, id�c na po�udnie?",dia_addon_riordian_gegend_sued);
	Info_AddChoice(dia_addon_riordian_gegend,"Co znajduje si� na p�nocy?",dia_addon_riordian_gegend_nord);
};

func void dia_addon_riordian_gegend_back()
{
	Info_ClearChoices(dia_addon_riordian_gegend);
};

func void dia_addon_riordian_gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Czy istnieje mapa tego regionu?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Tak, narysowa� j� Cronos. Z pewno�ci� ci j� przeka�e.
};

func void dia_addon_riordian_gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Gdzie przebywaj� bandyci?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Maj� na wschodzie tak� niby fortec� i mn�stwo posterunk�w.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Aby si� tam dosta�, musisz przej�� przez wielkie grz�zawisko.
};

func void dia_addon_riordian_gegend_piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Gdzie widzia�e� pirat�w?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//Wa��saj� si� na zachodzie.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Wydaje mi si�, �e na co� polowali.
};

func void dia_addon_riordian_gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Co znajduje si� na p�nocy?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Je�li mog� ufa� zapiskom budowniczych, znajdziesz tam wielk� dolin� otoczon� wysokimi ska�ami.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Jest to sucha i pustynna okolica.
};

func void dia_addon_riordian_gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Gdzie dojd�, id�c na po�udnie?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Tereny na po�udniu s� bardzo skaliste.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Znajdziesz tam wij�ce si� drogi, wodospady i kamienne ruiny.
};

func void dia_addon_riordian_gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Co znajduje si� na wschodzie?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Wielkie bagno. Ten obszar jest bardzo niebezpieczny.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Czaj� si� tam nie tylko bandyci, ale te� wyj�tkowo gro�ne zwierz�ta.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Zachowaj ostro�no��.
};


var int dia_addon_riordian_gegend_west_onetime;

func void dia_addon_riordian_gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//By�e� ju� na zachodzie?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Nie, ale tam na pewno jest wybrze�e.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Podejrzewam, �e piraci maj� tam sw�j ob�z.
	if((dia_addon_riordian_gegend_west_onetime == FALSE) && Npc_HasItems(vlk_4304_addon_william,itwr_addon_william_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//Na wschodzie, niedaleko st�d, znale�li�my zw�oki rybaka.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Powiniene� si� temu przyjrze�.
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
	description = "Przysy�a mnie Saturas. ";
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
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Przysy�a mnie Saturas. Mam poszuka� pi�ciu posiad�o�ci w Jarkendarze.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//Potrzebowa�em du�o czasu, aby ustali� po�o�enie posiad�o�ci na podstawie zapisk�w budowniczych.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Ale teraz mog� ci je dok�adnie opisa�.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_RUNNING;
};


instance DIA_ADDON_RIORDIAN_WHEREAREHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_wherearehouses_condition;
	information = dia_addon_riordian_wherearehouses_info;
	description = "Gdzie mog� znale�� te pi�� budowli?";
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
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Dom uczonych to wielka biblioteka. Musi by� gdzie� daleko na p�nocy.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Dom wojownik�w to forteca otoczona przez ska�y. Le�y na wschodzie.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Domy kap�an�w i stra�nik�w umar�ych znajdowa�y si� blisko siebie. Powiniene� je znale�� na po�udniowym zachodzie.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//Uzdrowiciele mieli sw�j dom leczniczy na po�udniowym wschodzie.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Je�li te budowle wci�� stoj�, rozpoznasz je po architekturze.
		b_whrearehousesofrulersonetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//S� umieszczone na podwy�szeniu. Strome schody prowadz� do wej�cia otoczonego wysokimi kolumnami.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Mam nadziej�, �e ci to pomo�e.
	};
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Dom Uczonych to du�a biblioteka. Na pewno znajduje si� gdzie� na p�nocy.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Dom Wojownik�w by� fortec� na wschodzie, otoczon� klifami.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Kap�ani i Stra�nicy Umar�ych mieszkali blisko siebie. Powinienem ich znale�� na po�udniowym zachodzie.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"Dom Uzdrowicieli znajdowa� si� na po�udniowym wschodzie.");
};

func void dia_addon_riordian_wherearehouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Gdzie mog� znale�� te pi�� budowli?
	b_whrearehousesofrulers();
};


instance DIA_ADDON_RIORDIAN_FOUNDHOUSE(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundhouse_condition;
	information = dia_addon_riordian_foundhouse_info;
	permanent = TRUE;
	description = "Eee, je�li chodzi o te budynki...";
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
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Eee, je�li chodzi o te budynki...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Tak?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_ONETIME == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Wygl�da na to, �e orkowie zainteresowali si� bibliotek� uczonych.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//My�lisz, �e mog� odczyta� ten prastary j�zyk?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Nie s�dz�, ale kto wie...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Mo�e lepiej upewnij si�, �e nie sprawi� k�opot�w.
		FOUNDHOUSEINFO[1] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
		Log_CreateTopic(TOPIC_ADDON_CANYONORCS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_CANYONORCS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_CANYONORCS,"Mag Wody, Riordian, wola�by, �eby orkowie znikn�li z kanionu.");
	};
	if((Npc_IsDead(stoneguardian_heiler) || Npc_HasItems(other,itmi_addon_stone_04) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Siedziba uzdrowicieli znajduje si� na �rodku bagna i jest broniona przez wielu kamiennych stra�nik�w.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Ci�gle stoi?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Tak, pytanie tylko � jak d�ugo....
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Smuci mnie, gdy widz� �wiadk�w przesz�o�ci w takim stanie.
		FOUNDHOUSEINFO[2] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//Kruk wykorzysta� posiad�o�� wojownik�w jako swoj� kryj�wk�.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//M�dry wyb�r.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//To podobno najbezpieczniejsza forteca, jak� mo�na znale�� na tym terenie.
		FOUNDHOUSEINFO[3] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(minecrawler_priest) || Npc_HasItems(other,itmi_addon_stone_03) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//W domu kap�an�w jest mn�stwo pe�zaczy...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Czy to nie dziwne, �e te stworzenia pojawi�y si� w tym regionie?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//W rzeczy samej.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//O, Adanosie! Dziej� si� tu dziwne rzeczy.
		FOUNDHOUSEINFO[4] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(mayazombie04_totenw) || Npc_HasItems(other,itmi_addon_stone_02) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Siedziba stra�nik�w umar�ych by�a opanowana przez moce z�a.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Chyba nigdy jeszcze nie widzia�em w jednym miejscu tylu zombie.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//To bardzo niedobrze. Stra�nicy umar�ych stali si� ofiarami w�asnych zdolno�ci.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Ich powi�zanie ze �wiatem umar�ych okaza�o si� bardzo szkodliwe. Mam nadziej�, �e uwolnisz ich z tej udr�ki.
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
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Przypomnij mi znowu, gdzie si� znajduj� budynki.
		b_whrearehousesofrulers();
	};
};


instance DIA_ADDON_RIORDIAN_ORKSWEG(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_orksweg_condition;
	information = dia_addon_riordian_orksweg_info;
	description = "Orkowie wkr�tce przestan� si� interesowa� tym regionem.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Orkowie wkr�tce przestan� si� interesowa� tym regionem.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Czemu tak uwa�asz?
	if(orcshaman_sit_canyonlibrarykey.aivar[AIV_KILLEDBYPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Zabi�em ich przyw�dc�.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Ich przyw�dca nie �yje.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Miejmy nadziej�, �e to prawda.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Naprawd� nie mo�emy sobie teraz pozwoli� na tego rodzaju k�opoty.
	TOPIC_END_CANYONORCS = TRUE;
	b_giveplayerxp(XP_ADDON_RIORDIAN_ORKSWEG);
};


instance DIA_ADDON_RIORDIAN_FOUNDALLHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundallhouses_condition;
	information = dia_addon_riordian_foundallhouses_info;
	description = "Znalaz�em wszystkie posiad�o�ci.";
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
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Znalaz�em wszystkie posiad�o�ci.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Wszystkie by�y tam, gdzie wskaza�em?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Tak, mniej wi�cej.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Bardzo dobrze. Wi�c moja praca si� op�aci�a.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Dzi�kuj�.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FOUNDALLHOUSES);
};


instance DIA_ADDON_RIORDIAN_ADW_PRETEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_adw_preteach_condition;
	information = dia_addon_riordian_adw_preteach_info;
	description = "Mo�esz mnie nauczy� swych umiej�tno�ci?";
};


func int dia_addon_riordian_adw_preteach_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Mo�esz mnie nauczy� swych umiej�tno�ci?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Mog� ci� podszkoli� w sztuce alchemii.
	if(Npc_HasItems(other,itam_addon_wispdetector) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//Mog� ci tak�e pokaza�, jak nauczy� twojego ognika szukania przedmiot�w.
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
	description = "Poka� mi, jak wyszkoli� mojego ognika.";
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
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Eliksir zwinno�ci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_riordian_adw_teachalchemy_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Mo�esz przygotowywa� mikstury na stole alchemicznym. Znajdziesz go na pi�trze w naszym domu.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Ale potrzebna ci b�dzie pusta butelka, niezb�dne sk�adniki oraz umiej�tno�� przyrz�dzania mikstury.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Mo�esz si� ode mnie nauczy�, jak to robi�. Pozosta�ych rzeczy musisz poszuka� sam.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Co chcesz przyrz�dzi�?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Nie mog� ci� nauczy� niczego nowego.
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


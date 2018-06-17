
instance DIA_ADDON_SKIP_NW_EXIT(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 999;
	condition = dia_addon_skip_nw_exit_condition;
	information = dia_addon_skip_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOSKIPNW = TRUE;
};


instance DIA_ADDON_SKIP_NW_HALLO(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 1;
	condition = dia_addon_skip_nw_hallo_condition;
	information = dia_addon_skip_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_skip_nw_hallo_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//No, nareszcie jeste�. Czekam ju� od paru godzin.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//Chwileczk�. Nie jeste� kupcem z miasta, prawda?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//Gdzie jest Baltram?
};


instance DIA_ADDON_SKIP_NW_WERBISTDU(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_werbistdu_condition;
	information = dia_addon_skip_nw_werbistdu_info;
	description = "Kim jeste�?";
};


func int dia_addon_skip_nw_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Nie mam poj�cia, czemu mia�oby ci� to obchodzi�, ale je�li musisz wiedzie�, to na imi� mam Skip. M�wi ci to co�?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//Kto?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Nie m�w, �e nie s�ysza�e� o Skipie. Sk�d ty si� w og�le wzi��e�?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Jestem najbardziej poszukiwanym w Khorinis przest�pc�. Ja i moi ch�opcy od lat grasujemy na tych wodach.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//Musia�e� o tym s�ysze�.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Jeste� piratem.",dia_addon_skip_nw_werbistdu_pirat);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"A powinienem ci� zna�?",dia_addon_skip_nw_werbistdu_keineahnung);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"No tak! Dopiero teraz sobie przypomnia�em.",dia_addon_skip_nw_werbistdu_ja);
};

func void dia_addon_skip_nw_werbistdu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//No tak! Dopiero teraz sobie przypomnia�em.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//Naprawd�? S�ysza�e� o mnie?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Niech to diabli! W�a�nie zastanawia�em si�, czy nie p�j�� do miasta.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Ca�e szcz�cie, �e tego nie zrobi�em.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Stra�nicy od razu wtr�ciliby mnie do lochu, bez dw�ch zda�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Chwila, chyba nie przyszed�e� tu, �eby mnie aresztowa�?!
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Taaaaa...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//To by�by tw�j ostatni b��d w �yciu. Ka�dy, kto chce przeszkodzi� Skipowi, szybko staje si� �arciem dla rekin�w.
	};
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_keineahnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//A powinienem ci� zna�?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Uwa�aj, co m�wisz, ch�opcze, bo znasz Skipa tylko z dobrej strony. M�dl si�, �eby� nie pozna� go z tej z�ej.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Jeste� piratem.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//Tak, do cholery. Przecie� to wida� od razu. Jestem te� nerwowy.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Jest tak potwornie nudno, �e a� chce si� gry�� liny.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};


instance DIA_ADDON_SKIP_NW_BALTRAM(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_baltram_condition;
	information = dia_addon_skip_nw_baltram_info;
	description = "Baltram? Czekasz na tego kupca?";
};


func int dia_addon_skip_nw_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_baltram_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Baltram? Czekasz na tego kupca?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//My�lisz, �e jeste� cholernie sprytny, co?
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//Przecie� m�wi�em, nie?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Wygl�da na to, �e ten przekl�ty handlarzyna zapomnia� o mnie.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Ech, jak ja bym chcia�, �eby jeszcze raz wpad� mi w �apy.
	Log_CreateTopic(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Pirat Skip powiedzia� mi, �e Baltram, kupiec z miasta, robi interesy z piratami.");
	SCKNOWSBALTRAMASPIRATETRADER = TRUE;
};


instance DIA_ADDON_SKIP_BALTRAMPAKET(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_baltrampaket_condition;
	information = dia_addon_skip_baltrampaket_info;
	description = "Mam dla ciebie przesy�k� od Baltrama.";
};


func int dia_addon_skip_baltrampaket_condition()
{
	if((MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skip_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//Mam dla ciebie przesy�k� od Baltrama.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Co u licha? To on teraz wysy�a ch�opc�w na posy�ki?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Ma pe�ne gacie strachu, co? Ale czego mo�na spodziewa� si� po takim kiepskim kupczyku, jak on?
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//M�wi, �e chce za to trzy butelki rumu.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//A to dobre! Najpierw ka�e mi tu czeka�, bogowie wiedz� ile, a potem nie ma odwagi targowa� si� ze mn� osobi�cie.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Daj mu dwie butelki. Powinno wystarczy�.
	CreateInvItems(self,itfo_addon_rum,2);
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_NW_WOHER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_woher_condition;
	information = dia_addon_skip_nw_woher_info;
	description = "Sk�d pochodzisz?";
};


func int dia_addon_skip_nw_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_woher_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Sk�d pochodzisz?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Chcesz wiedzie�, gdzie mie�ci si� nasza kryj�wka?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Nie jest to rzecz, o kt�rej chcia�bym m�wi� jakiemu� typkowi ze Stra�y.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//Je�li ci to powiem, to tak, jakbym poszed� do Khorinis i odda� si� w r�ce stra�nik�w.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//Nie mam zamiaru ci o tym m�wi�. Po co masz si� kr�ci� w�r�d nas?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Wyspa Khorinis jest du�a, ale je�li nie masz kogi lub okr�tu wojennego, to i tak si� nie dostaniesz do naszej kryj�wki.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Musia�by� te� zna� drog� przez klify. Nikomu, kto nie zna tajnego przesmyku, nie uda�o si� jeszcze tamt�dy przep�yn��.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Tylko dw�ch ludzi zna t� drog�, a ty nie jeste� jednym z nich.
};


instance DIA_ADDON_SKIP_SCSAWGREG(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_scsawgreg_condition;
	information = dia_addon_skip_scsawgreg_info;
	description = "Znasz mo�e cz�owieka z przepask� na oku?";
};


func int dia_addon_skip_scsawgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (SC_KNOWSCONNECTIONSKIPGREG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_scsawgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Znasz mo�e cz�owieka z przepask� na oku?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Znam wielu takich ludzi.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//To cz�owiek z Khorinis, kt�ry chyba zna ci� ca�kiem nie�le.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Niemo�liwe. Nie znam �adnych szczur�w l�dowych.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Ale...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Daj mi spok�j. Nie obchodzi mnie to.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SKIP_NW_MISSINGPEOPLE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_missingpeople_condition;
	information = dia_addon_skip_nw_missingpeople_info;
	description = "Ostatnio znikn�o wielu mieszka�c�w miasta.";
};


func int dia_addon_skip_nw_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Ostatnio znikn�o wielu mieszka�c�w miasta i co� mi si� wydaje, �e macza�e� w tym palce.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//Co? A niech to szlag! Ale widzisz... To nie jest takie proste.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Wygl�dam na handlarza �ywym towarem? Nie! Wo�� tylko towary i nie interesuje mnie, co to za �adunek i sk�d pochodzi.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Wozili�my ju� wiele towar�w dla tych �wi�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Na pocz�tku to by�y zwyk�e rzeczy. No, czasami troch� si� szmuglowa�o...
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Dopiero p�niej dowiedzieli�my si�, �e porywaj� tych ludzi. Nie mam zielonego poj�cia, co z nimi robi�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//My ich tylko przewozimy.
};


instance DIA_ADDON_SKIP_NW_DEXTER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_dexter_condition;
	information = dia_addon_skip_nw_dexter_info;
	description = "Co to za 'oni'?";
};


func int dia_addon_skip_nw_dexter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_dexter_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//Co to za "oni"?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//Bandyci, a kto inny? Szumowiny, kt�re kryj� si� na ca�ej wyspie.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//I dzia�aj� nie tylko w pobli�u Khorinis.
};

func void b_skip_saysdextersname()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//O, przypomnia�em sobie w�a�nie jedno imi�. Dexter. Tak, jeden z nich na pewno nazywa si� Dexter.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Zaginieni ludzie zostali porwani na rozkaz kapitana bandyt�w, Dextera. Chodz� plotki, �e ukrywa si� on gdzie� na po�udnie od farmy Onara.");
	SC_KNOWSDEXTERASKIDNAPPER = TRUE;
	RANGER_SCKNOWSDEXTER = TRUE;
};


instance DIA_ADDON_SKIP_NW_NAME(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_name_condition;
	information = dia_addon_skip_nw_name_info;
	description = "'Bandyci' m�wi� mi niewiele. M�w konkretnie. Imiona, miejsca, kontakty...";
};


func int dia_addon_skip_nw_name_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_dexter) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_name_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//"Bandyci" m�wi� mi niewiele. M�w konkretnie. Imiona, miejsca, kontakty...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Imiona? Chcesz wiedzie�, jak si� nazywa ich herszt? Szlag by to trafi�, pami�ta�em przecie�... No, jak ten pies si� nazywa?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Ech, nie mog� sobie przypomnie�. Chocia� jego imi� by�o kr�tkie i �atwe do zapami�tania.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Ale mog� ci powiedzie�, gdzie go spotka�.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//Masz przy sobie porz�dn� map�?
	if(Npc_HasItems(other,itwr_map_newworld) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Mam tu tak� map�. Mo�e by�?
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//Ta mapa jest ju� ca�a zabazgrana.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Nie.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//W takim razie chyba musz� ci opisa� to miejsce.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Na wschodzie znajdziesz farm�. Jej w�a�ciciel ma na imi� Onar, o ile dobrze pami�tam.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Farma otoczona jest przez du�e po�acie p�l, a na po�udnie od niej, na wysokiej skale, wznosi si� twierdza.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//W niej znajdziesz tego cz�owieka.
		b_skip_saysdextersname();
	};
};


instance DIA_ADDON_SKIP_NW_LANDKARTE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_landkarte_condition;
	information = dia_addon_skip_nw_landkarte_info;
	description = "Mam tu tak� map�. Mo�e by�?";
};


func int dia_addon_skip_nw_landkarte_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_name) && Npc_HasItems(other,itwr_map_newworld) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_landkarte_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Mam tu tak� map�. Mo�e by�?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//Mo�e. Zaznacz� ci, gdzie znale�� tego cz�owieka.
	b_giveinvitems(other,self,itwr_map_newworld,1);
	b_skip_saysdextersname();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Prosz�, oto twoja mapa.
	Npc_RemoveInvItems(self,itwr_map_newworld,1);
	CreateInvItems(self,itwr_map_newworld_dexter,1);
	b_giveinvitems(self,other,itwr_map_newworld_dexter,1);
};


instance DIA_ADDON_SKIP_NW_WOHIN(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 99;
	condition = dia_addon_skip_nw_wohin_condition;
	information = dia_addon_skip_nw_wohin_info;
	permanent = TRUE;
	description = "Dok�d zawozicie tych ludzi?";
};


func int dia_addon_skip_nw_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_wohin_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Dok�d zawozicie tych ludzi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//Ju� m�wi�em, �e nie wyjawi� ci po�o�enia naszej tajnej przystani.
};


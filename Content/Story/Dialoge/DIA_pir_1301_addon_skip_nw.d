
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
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//No, nareszcie jesteœ. Czekam ju¿ od paru godzin.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//Chwileczkê. Nie jesteœ kupcem z miasta, prawda?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//Gdzie jest Baltram?
};


instance DIA_ADDON_SKIP_NW_WERBISTDU(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_werbistdu_condition;
	information = dia_addon_skip_nw_werbistdu_info;
	description = "Kim jesteœ?";
};


func int dia_addon_skip_nw_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Nie mam pojêcia, czemu mia³oby ciê to obchodziæ, ale jeœli musisz wiedzieæ, to na imiê mam Skip. Mówi ci to coœ?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//Kto?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Nie mów, ¿e nie s³ysza³eœ o Skipie. Sk¹d ty siê w ogóle wzi¹³eœ?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Jestem najbardziej poszukiwanym w Khorinis przestêpc¹. Ja i moi ch³opcy od lat grasujemy na tych wodach.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//Musia³eœ o tym s³yszeæ.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Jesteœ piratem.",dia_addon_skip_nw_werbistdu_pirat);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"A powinienem ciê znaæ?",dia_addon_skip_nw_werbistdu_keineahnung);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"No tak! Dopiero teraz sobie przypomnia³em.",dia_addon_skip_nw_werbistdu_ja);
};

func void dia_addon_skip_nw_werbistdu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//No tak! Dopiero teraz sobie przypomnia³em.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//Naprawdê? S³ysza³eœ o mnie?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Niech to diabli! W³aœnie zastanawia³em siê, czy nie pójœæ do miasta.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Ca³e szczêœcie, ¿e tego nie zrobi³em.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Stra¿nicy od razu wtr¹ciliby mnie do lochu, bez dwóch zdañ.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Chwila, chyba nie przyszed³eœ tu, ¿eby mnie aresztowaæ?!
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Taaaaa...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//To by³by twój ostatni b³¹d w ¿yciu. Ka¿dy, kto chce przeszkodziæ Skipowi, szybko staje siê ¿arciem dla rekinów.
	};
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_keineahnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//A powinienem ciê znaæ?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Uwa¿aj, co mówisz, ch³opcze, bo znasz Skipa tylko z dobrej strony. Módl siê, ¿ebyœ nie pozna³ go z tej z³ej.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Jesteœ piratem.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//Tak, do cholery. Przecie¿ to widaæ od razu. Jestem te¿ nerwowy.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Jest tak potwornie nudno, ¿e a¿ chce siê gryŸæ liny.
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
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Myœlisz, ¿e jesteœ cholernie sprytny, co?
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//Przecie¿ mówi³em, nie?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Wygl¹da na to, ¿e ten przeklêty handlarzyna zapomnia³ o mnie.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Ech, jak ja bym chcia³, ¿eby jeszcze raz wpad³ mi w ³apy.
	Log_CreateTopic(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Pirat Skip powiedzia³ mi, ¿e Baltram, kupiec z miasta, robi interesy z piratami.");
	SCKNOWSBALTRAMASPIRATETRADER = TRUE;
};


instance DIA_ADDON_SKIP_BALTRAMPAKET(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_baltrampaket_condition;
	information = dia_addon_skip_baltrampaket_info;
	description = "Mam dla ciebie przesy³kê od Baltrama.";
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
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//Mam dla ciebie przesy³kê od Baltrama.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Co u licha? To on teraz wysy³a ch³opców na posy³ki?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Ma pe³ne gacie strachu, co? Ale czego mo¿na spodziewaæ siê po takim kiepskim kupczyku, jak on?
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//Mówi, ¿e chce za to trzy butelki rumu.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//A to dobre! Najpierw ka¿e mi tu czekaæ, bogowie wiedz¹ ile, a potem nie ma odwagi targowaæ siê ze mn¹ osobiœcie.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Daj mu dwie butelki. Powinno wystarczyæ.
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
	description = "Sk¹d pochodzisz?";
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
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Sk¹d pochodzisz?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Chcesz wiedzieæ, gdzie mieœci siê nasza kryjówka?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Nie jest to rzecz, o której chcia³bym mówiæ jakiemuœ typkowi ze Stra¿y.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//Jeœli ci to powiem, to tak, jakbym poszed³ do Khorinis i odda³ siê w rêce stra¿ników.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//Nie mam zamiaru ci o tym mówiæ. Po co masz siê krêciæ wœród nas?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Wyspa Khorinis jest du¿a, ale jeœli nie masz kogi lub okrêtu wojennego, to i tak siê nie dostaniesz do naszej kryjówki.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Musia³byœ te¿ znaæ drogê przez klify. Nikomu, kto nie zna tajnego przesmyku, nie uda³o siê jeszcze tamtêdy przep³yn¹æ.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Tylko dwóch ludzi zna tê drogê, a ty nie jesteœ jednym z nich.
};


instance DIA_ADDON_SKIP_SCSAWGREG(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_scsawgreg_condition;
	information = dia_addon_skip_scsawgreg_info;
	description = "Znasz mo¿e cz³owieka z przepask¹ na oku?";
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
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Znasz mo¿e cz³owieka z przepask¹ na oku?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Znam wielu takich ludzi.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//To cz³owiek z Khorinis, który chyba zna ciê ca³kiem nieŸle.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Niemo¿liwe. Nie znam ¿adnych szczurów l¹dowych.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Ale...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Daj mi spokój. Nie obchodzi mnie to.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SKIP_NW_MISSINGPEOPLE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_missingpeople_condition;
	information = dia_addon_skip_nw_missingpeople_info;
	description = "Ostatnio zniknê³o wielu mieszkañców miasta.";
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
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Ostatnio zniknê³o wielu mieszkañców miasta i coœ mi siê wydaje, ¿e macza³eœ w tym palce.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//Co? A niech to szlag! Ale widzisz... To nie jest takie proste.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Wygl¹dam na handlarza ¿ywym towarem? Nie! Wo¿ê tylko towary i nie interesuje mnie, co to za ³adunek i sk¹d pochodzi.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Woziliœmy ju¿ wiele towarów dla tych œwiñ.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Na pocz¹tku to by³y zwyk³e rzeczy. No, czasami trochê siê szmuglowa³o...
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//Dopiero póŸniej dowiedzieliœmy siê, ¿e porywaj¹ tych ludzi. Nie mam zielonego pojêcia, co z nimi robi¹.
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
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//Bandyci, a kto inny? Szumowiny, które kryj¹ siê na ca³ej wyspie.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//I dzia³aj¹ nie tylko w pobli¿u Khorinis.
};

func void b_skip_saysdextersname()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//O, przypomnia³em sobie w³aœnie jedno imiê. Dexter. Tak, jeden z nich na pewno nazywa siê Dexter.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Zaginieni ludzie zostali porwani na rozkaz kapitana bandytów, Dextera. Chodz¹ plotki, ¿e ukrywa siê on gdzieœ na po³udnie od farmy Onara.");
	SC_KNOWSDEXTERASKIDNAPPER = TRUE;
	RANGER_SCKNOWSDEXTER = TRUE;
};


instance DIA_ADDON_SKIP_NW_NAME(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_name_condition;
	information = dia_addon_skip_nw_name_info;
	description = "'Bandyci' mówi¹ mi niewiele. Mów konkretnie. Imiona, miejsca, kontakty...";
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
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//"Bandyci" mówi¹ mi niewiele. Mów konkretnie. Imiona, miejsca, kontakty...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Imiona? Chcesz wiedzieæ, jak siê nazywa ich herszt? Szlag by to trafi³, pamiêta³em przecie¿... No, jak ten pies siê nazywa?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Ech, nie mogê sobie przypomnieæ. Chocia¿ jego imiê by³o krótkie i ³atwe do zapamiêtania.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Ale mogê ci powiedzieæ, gdzie go spotkaæ.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//Masz przy sobie porz¹dn¹ mapê?
	if(Npc_HasItems(other,itwr_map_newworld) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Mam tu tak¹ mapê. Mo¿e byæ?
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//Ta mapa jest ju¿ ca³a zabazgrana.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Nie.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//W takim razie chyba muszê ci opisaæ to miejsce.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Na wschodzie znajdziesz farmê. Jej w³aœciciel ma na imiê Onar, o ile dobrze pamiêtam.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Farma otoczona jest przez du¿e po³acie pól, a na po³udnie od niej, na wysokiej skale, wznosi siê twierdza.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//W niej znajdziesz tego cz³owieka.
		b_skip_saysdextersname();
	};
};


instance DIA_ADDON_SKIP_NW_LANDKARTE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_landkarte_condition;
	information = dia_addon_skip_nw_landkarte_info;
	description = "Mam tu tak¹ mapê. Mo¿e byæ?";
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
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Mam tu tak¹ mapê. Mo¿e byæ?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//Mo¿e. Zaznaczê ci, gdzie znaleŸæ tego cz³owieka.
	b_giveinvitems(other,self,itwr_map_newworld,1);
	b_skip_saysdextersname();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Proszê, oto twoja mapa.
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
	description = "Dok¹d zawozicie tych ludzi?";
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
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Dok¹d zawozicie tych ludzi?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//Ju¿ mówi³em, ¿e nie wyjawiê ci po³o¿enia naszej tajnej przystani.
};


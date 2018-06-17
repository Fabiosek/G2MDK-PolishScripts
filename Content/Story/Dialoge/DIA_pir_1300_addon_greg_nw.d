
instance DIA_ADDON_GREG_NW_EXIT(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 999;
	condition = dia_addon_greg_nw_exit_condition;
	information = dia_addon_greg_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOGREGNW = TRUE;
};


instance DIA_ADDON_GREG_NW_HALLO(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_hallo_condition;
	information = dia_addon_greg_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_greg_nw_hallo_condition()
{
	if(GREGLOCATION == GREG_FARM1)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Psst. Hej, ty! Podejd� no na chwilk�.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//O co chodzi?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Idziesz do miasta? Pewnie w wa�nych interesach?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//S�uchaj, wygl�dasz na bystrego go�cia. Jestem pewien, �e daleko zajdziesz.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Od razu wida�, �e nie dasz si� �atwo nabra�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Mo�e chcia�by� dorobi� sobie troch� na boku, co?
	PLAYERTALKEDTOGREGNW = TRUE;
	SC_MEETSGREGTIME = 1;
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Musz� ju� i��.",dia_addon_greg_nw_hallo_weg);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Sko�cz z tym be�kotem. M�w, czego chcesz.",dia_addon_greg_nw_hallo_schleim);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Nie wygl�dasz na takiego, co ma z�oto.",dia_addon_greg_nw_hallo_vorsicht);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Ukrywasz si� przed kim�?",dia_addon_greg_nw_hallo_hide);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Dlaczego nie!",dia_addon_greg_nw_hallo_ja);
};

func void dia_addon_greg_nw_hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//A wi�c nie chcesz mi pom�c? Zapami�tam to, kole�. Jeszcze si� spotkamy!
	AI_StopProcessInfos(self);
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_FAILED;
};

func void dia_addon_greg_nw_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Dlaczego nie!
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Wybacz staremu wilkowi morskiemu. Jestem po raz pierwszy w tej okolicy i nie znam panuj�cych tu zwyczaj�w.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Na w�asnej sk�rze przekona�em si�, �e podr�ni z dalekich stron nie s� mile widziani w tym portowym mie�cie.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//A teraz jestem ca�kiem zagubiony! Nie wiem, jak dosta� si� do miasta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//Mam do za�atwienia w mie�cie niezwykle wa�ne interesy, a moi klienci nie toleruj� op�nie�, �e tak powiem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Pom�g�by� mi przedosta� si� przez posterunek stra�y miejskiej, co?
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Ten dziwny cz�owiek z opask� na oku chce wej�� do portowego miasta. Mam znale�� spos�b, jak m�g�by omin�� stra�nik�w.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_RUNNING;
};

func void dia_addon_greg_nw_hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Nie wygl�dasz na takiego, co ma z�oto.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//Nie nale�� do towarzystwa, do kt�rego zapewne przyzwyczajony jest szanowny pan.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Jednak nie mia�by pan nic przeciwko drobnemu powi�kszeniu pa�skiej poka�nej fortuny, prawda?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Mog� na pana liczy�?
};

func void dia_addon_greg_nw_hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//Sko�cz z tym be�kotem. M�w, czego chcesz.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Widzisz, dok�adnie o to mi chodzi.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//Nie wystarcz� mi�e s�owa, by ci� przekona�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//Od razu wiedzia�em, �e targi z tob� nie b�d� �atwe.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//Tak przedsi�biorczy cz�owiek, jak ty, na pewno by�by zainteresowany pogrubieniem swojej sakiewki.
};

func void dia_addon_greg_nw_hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Ukrywasz si� przed kim�?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Ale� sk�d. To jaka� bzdura. Po prostu lubi� chowa� si� za drzewami, aby wiatr nie wia� mi prosto w twarz.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//No to jak b�dzie? Chcesz t� robot�?
};


instance DIA_ADDON_GREG_NW_STADTWACHEN(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_stadtwachen_condition;
	information = dia_addon_greg_nw_stadtwachen_info;
	permanent = TRUE;
	description = "Je�li chodzi o stra�nik�w...";
};


func int dia_addon_greg_nw_stadtwachen_condition()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};


var int dia_addon_greg_nw_stadtwachen_choiceclose_geld;
var int dia_addon_greg_nw_stadtwachen_choiceclose_schein;
var int dia_addon_greg_nw_stadtwachen_choiceclose_constantino;

func void dia_addon_greg_nw_stadtwachen_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//Je�li chodzi o stra�nik�w...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Tak. Masz jaki� pomys�?
	Info_ClearChoices(dia_addon_greg_nw_stadtwachen);
	Info_AddChoice(dia_addon_greg_nw_stadtwachen,"B�d� musia� o tym pomy�le�.",dia_addon_greg_nw_stadtwachen_nochnicht);
	if(DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"A mo�e spr�bujesz �ap�wki?",dia_addon_greg_nw_stadtwachen_geld);
	};
	if((DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN == FALSE) && Npc_HasItems(other,itwr_passierschein))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Mam przepustk� do miasta.",dia_addon_greg_nw_stadtwachen_schein);
	};
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0) && (DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO == FALSE))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Do miasta mog� wej�� zbieracze zi�.",dia_addon_greg_nw_stadtwachen_constantino);
	};
	if(Npc_HasItems(other,itar_bau_l) || Npc_HasItems(other,itar_bau_m))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"Powinni ci� wpu�ci�, je�li za�o�ysz ten str�j rolnika.",dia_addon_greg_nw_stadtwachen_klamotten);
	};
};

func void dia_addon_greg_nw_stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//Powinni ci� wpu�ci�, je�li za�o�ysz ten str�j rolnika.
	if(Npc_HasItems(other,itar_bau_l))
	{
		b_giveinvitems(other,self,itar_bau_l,1);
	}
	else
	{
		b_giveinvitems(other,self,itar_bau_m,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//Tego mi w�a�nie trzeba. Wiedzia�em, �e mog� na ciebie liczy�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//Nikt na mnie nie zwr�ci uwagi, je�li przebior� si� za wsiowego g�upka. Ha, ha!
	if(Npc_HasItems(self,itar_bau_l))
	{
		AI_EquipArmor(self,itar_bau_l);
	}
	else
	{
		AI_EquipArmor(self,itar_bau_m);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Doskonale. Dobrze si� spisa�e�. Oto obiecana zap�ata.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	b_giveplayerxp(XP_GREG_NW_GIVEBAUARMOR);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//Co? N�dzne 50 z�otych monet? Chyba �artujesz.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//Z�oto to nie wszystko, przyjacielu. Niech ci to na razie wystarczy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//Mam przeczucie, �e wkr�tce si� spotkamy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//I kto wie? Mog� by� wtedy bardziej szczodry. Trzymaj si�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	b_logentry(TOPIC_ADDON_GREG_NW,"Da�em mu ubranie farmera. Mo�e omin�� stra�nik�w w przebraniu.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_SUCCESS;
};

func void dia_addon_greg_nw_stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//B�d� musia� o tym pomy�le�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//Dobra. Ale niech to nie trwa za d�ugo. Nie mam czasu do stracenia.
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_nw_stadtwachen_schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//Mam przepustk� do miasta.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//Oczywi�cie. Po prostu b�d� udawa� mieszka�ca tego pi�knego miasta...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//Przyjrzyj mi si� uwa�nie, ch�opcze. Nabra�by si� na to chyba tylko �lepiec.
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Do miasta mog� wej�� zbieracze zi�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//Co? Czy ja wygl�dam, jakbym hasa� po lesie, zbieraj�c kwiatki?
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//A mo�e spr�bujesz �ap�wki?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//Tak, gdyby to mog�o si� uda�, ju� pewnie bym spr�bowa�.
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD = TRUE;
};


instance DIA_ADDON_GREG_NW_PERM(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_perm_condition;
	information = dia_addon_greg_nw_perm_info;
	permanent = TRUE;
	description = "Jeszcze jedno...";
};


func int dia_addon_greg_nw_perm_condition()
{
	if(((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Jeszcze jedno...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//Pos�uchaj mnie, ch�opcze. Musz� si� teraz zaj�� wa�nymi sprawami.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//Pogadamy p�niej. Jasne?
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_MEETGREGSECONDTIME(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_meetgregsecondtime_condition;
	information = dia_addon_greg_nw_meetgregsecondtime_info;
	important = TRUE;
};


func int dia_addon_greg_nw_meetgregsecondtime_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_meetgregsecondtime_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Patrzcie, kogo my tu mamy.
	if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Nasz pastuch.
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Dure�, kt�ry postanowi� mi odm�wi�. Nie oczekiwa�e�, �e mnie jeszcze spotkasz, co?
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//My�la�em, �e chcesz mi pom�c. A ty co zrobi�e�? Po prostu zwia�e�.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//S�dzi�e�, �e b�d� tam uziemiony na zawsze, co?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//No i masz. Jak sam si� o siebie nie zatroszczysz, to nikt ci nie pomo�e. Nast�pnym razem tak �atwo ci nie p�jdzie, wi�c lepiej dotrzymuj s�owa.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Zreszt� potrzebuj� w�a�nie kogo� takiego jak ty.
	SC_SAWGREGINTAVERNE = TRUE;
};


instance DIA_ADDON_GREG_NW_WER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wer_condition;
	information = dia_addon_greg_nw_wer_info;
	description = "A kim ty w�a�ciwie jeste�?";
};


func int dia_addon_greg_nw_wer_condition()
{
	if(GREGLOCATION >= GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//A kim ty w�a�ciwie jeste�?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//To nie twoja sprawa.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Gdybym chcia� ci powiedzie�, kim jestem, to chyba bym to zrobi�, nie?
};


instance DIA_ADDON_GREG_NW_WAS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_was_condition;
	information = dia_addon_greg_nw_was_info;
	description = "Czego ode mnie chcesz?";
};


func int dia_addon_greg_nw_was_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void b_greg_search_dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Szukam pewnego go�cia. Nie mog�em go znale�� w mie�cie, a ci durnie tutaj te� nic nie wiedz�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Jest szczup�y, ma ciemne w�osy i nosi czerwon� zbroj�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//O ile wiem, by� skaza�cem w starej kolonii. Jego imi� zaczyna�o si� chyba na D.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Cz�owiek z opask� na oku szuka kogo�, kogo imi� zaczyna si� na 'D'.");
	SC_KNOWSGREGSSEARCHSDEXTER = TRUE;
};

func void dia_addon_greg_nw_was_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Czego ode mnie chcesz?
	if(MIS_ADDON_GREG_BRINGMETOTHECITY != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//Wci�� masz problemy ze stra�nikami miejskimi?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//Sam zaraz ZA�ATWI� ci problemy, durniu.
	};
	b_greg_search_dexter();
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"M�wisz o Diego.",dia_addon_greg_nw_was_diego);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_addon_greg_nw_was,"Czy ma na imi� Dexter?",dia_addon_greg_nw_was_dexter);
	};
	Info_AddChoice(dia_addon_greg_nw_was,"Nie znam nikogo, kto pasowa�by do tego opisu.",dia_addon_greg_nw_was_no);
};

func void dia_addon_greg_nw_was_gregunsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//Mo�liwe, �e tak ma na imi�. Nie jestem pewien.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//B�d� musia� poczeka�, a� stan� z nim twarz� w twarz.
};

func void dia_addon_greg_nw_was_unnun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Co� jeszcze?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//Tak, ty pysza�ku. Jest co� jeszcze.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Potrzebuj� broni. Potrzebuj� prowiantu. Troch� z�ota te� by nie zaszkodzi�o.
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"Nie mog� ci w tym pom�c.",dia_addon_greg_nw_was_nohelp);
	Info_AddChoice(dia_addon_greg_nw_was,"Prowiant? Przecie� w�a�nie stoisz przed karczm�!",dia_addon_greg_nw_was_orlan);
	Info_AddChoice(dia_addon_greg_nw_was,"Bro�? Maj� j� najemnicy.",dia_addon_greg_nw_was_sld);
	Info_AddChoice(dia_addon_greg_nw_was,"Oto 10 z�otych monet.",dia_addon_greg_nw_was_hiergold);
	Info_AddChoice(dia_addon_greg_nw_was,"W mie�cie nie by�o �adnych handlarzy broni�?",dia_addon_greg_nw_was_waffenhaendler);
	Info_AddChoice(dia_addon_greg_nw_was,"Z�oto? Wszyscy chcemy z�ota.",dia_addon_greg_nw_was_gold);
};

func void dia_addon_greg_nw_was_nohelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Nie mog� ci w tym pom�c.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//Czy�by? A mo�e po prostu NIE CHCESZ?
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//Ju� po raz drugi wp�dzasz mnie w tarapaty.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//Pozw�l, �e dam ci ma�� rad�: upewnij si�, �e ju� wi�cej si� nie spotkamy.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Zapami�tam to. Mo�esz by� pewien.
	};
	MIS_ADDON_GREG_RAKECAVE = LOG_OBSOLETE;
	GREGLOCATION = GREG_BIGCROSS;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};

func void dia_addon_greg_nw_was_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Z�oto? Wszyscy chcemy z�ota.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Zapewne. Tylko co z nim zrobisz? S�dz�c po twoim wygl�dzie, wydasz je na w�dk� albo przepu�cisz w burdelu.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//A ty masz pewnie lepszy plan, co?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//Gdyby� wiedzia�, co osi�gn��em, to ze strachu wlaz�by� pod kamie�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Wi�c przesta� mle� ozorem, bo b�d� musia� zamkn�� ci bu�k�.
};

func void dia_addon_greg_nw_was_waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//W mie�cie nie by�o �adnych handlarzy broni�?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//Chyba �artujesz? Maj� tylko jakie� �mieci.
};

func void dia_addon_greg_nw_was_hiergold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Oto 10 z�otych monet.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//Ty biedaku. Zatrzymaj te grosze. Mam lepszy pomys�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Niedaleko st�d jest jaskinia. Zakopa�em tam swoje rzeczy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//W jaskini jest niebezpiecznie i nie mog� tam i�� sam. Chc�, �eby� mi pom�g�.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Zaproponowa�em cz�owiekowi z opask� na oku troch� z�ota, ale go nie chcia�. Mam i�� z nim do jego jaskini.");
	MIS_ADDON_GREG_RAKECAVE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_greg_nw_was);
};

func void dia_addon_greg_nw_was_sld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Bro�? Maj� j� najemnicy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Ciekawe. S�ysza�em, �e Onar, ten gruby farmer, naj�� paru ch�opc�w.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//Nie�le jak na szczura l�dowego.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//Wcale niez�y pomys�. Mo�e powinienem z�o�y� im wizyt�.
};

func void dia_addon_greg_nw_was_orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Prowiant? Przecie� w�a�nie stoisz przed karczm�!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Ten stukni�ty gospodarz nie da ci niczego, chyba �e za to zap�acisz.
};

func void dia_addon_greg_nw_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Nie znam nikogo, kto pasowa�by do tego opisu.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//Powiniene� zna�.
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//M�wisz o Diego.
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//Czy ma na imi� Dexter?
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};


instance DIA_ADDON_GREG_NW_RAKECAVELOS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavelos_condition;
	information = dia_addon_greg_nw_rakecavelos_info;
	description = "Chod�my do twojej jaskini.";
};


func int dia_addon_greg_nw_rakecavelos_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavelos_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Chod�my do twojej jaskini.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Ruszajmy.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void b_greg_gonow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//Na co czekasz? W�a� do �rodka i przynie� moje b�yskotki.
};


instance DIA_ADDON_GREG_NW_RAKECAVETHERE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavethere_condition;
	information = dia_addon_greg_nw_rakecavethere_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecavethere_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavethere_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Patrz, m�j przyjacielu. Oto ta jaskinia.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//Tu masz kilof.
	b_giveinvitems(self,other,itmw_2h_axe_l_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Rzeczy zakopa�em gdzie� w �rodku. Miejsce oznaczy�em krzy�ykiem.
	b_greg_gonow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//A co z tob�?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//Kto� musi pilnowa� ty��w. A teraz w�a� do �rodka.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"Ten cz�owiek chce, �ebym poszuka� w jaskini jego rzeczy. Zakopa� je tam i zaznaczy� miejsce krzy�em. Da� mi te� kilof.");
	MIS_ADDON_GREG_RAKECAVE_DAY = Wld_GetDay();
};


instance DIA_ADDON_GREG_NW_RAKECAVEPLUNDERED(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecaveplundered_condition;
	information = dia_addon_greg_nw_rakecaveplundered_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecaveplundered_condition()
{
	if(((MIS_ADDON_GREG_RAKECAVE_DAY <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Czemu tak d�ugo ci� nie by�o? Znalaz�e� co�?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Tak. Wykopa�em sakiewk� ze z�otem.",dia_addon_greg_nw_rakecaveplundered_gold);
	};
	Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Nie.",dia_addon_greg_nw_rakecaveplundered_no);
};

func void dia_addon_greg_nw_rakecaveplundered_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Nie.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//Jaja sobie robisz?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//Tam NAPRAWD� nic nie by�o.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Cholera jasna! Wiedzia�em. Te szuje znowu mnie wyprzedzi�y.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//No c�. Niewa�ne, ma�y. Musz� rusza� w drog�. Do zobaczenia.
	AI_StopProcessInfos(self);
	GREGLOCATION = GREG_BIGCROSS;
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};


var int b_greg_rakeplacebriefing_onetime;

func void b_greg_rakeplacebriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Dobra. Na ma�ym jeziorze z dwoma wodospadami jest wysepka. Tam powinna by� moja skrytka.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//Na p�askowy�u znajdziesz dwa kolejne miejsca, w kt�rych co� zakopa�em.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Pierwsze miejsce le�y za tamt� farm�, a drugie w pobli�u wej�cia na prze��cz, przy wodospadzie.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//S� tam schody prowadz�ce z p�l do Onara.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//U podn�y schod�w jest wg��bienie, a w nim kolejne miejsce.
	if(b_greg_rakeplacebriefing_onetime == FALSE)
	{
		b_logentry(TOPIC_ADDON_GREG_NW,"S� te� inne schowki. 1) Na wysepce na jeziorze z dwoma wodospadami. 2) Na pastwisku za farm�. 3) Obok wej�cia do prze��czy, w pobli�u wodospad�w. 4) W jarze pod schodami, kt�re prowadz� z pastwiska na pola bogatego farmera. Mam odzyska� jego rzeczy. B�dzie na mnie czeka� na skrzy�owaniu mi�dzy polami.");
		b_greg_rakeplacebriefing_onetime = TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Tak. Wykopa�em sakiewk� ze z�otem.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//Dawaj j�!
	if(Npc_HasItems(other,itse_goldpocket25) || (Npc_HasItems(other,itmi_gold) >= 25))
	{
		if(b_giveinvitems(other,self,itse_goldpocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Prosz�.
		}
		else if(b_giveinvitems(other,self,itmi_gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//W �rodku by�o 25 sztuk z�ota. Prosz�, we� je.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Dobrze. To znaczy, �e wci�� s� tutaj.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//Okazuje si�, �e jednak na co� si� przydajesz.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Dobra, s�uchaj. Zakopa�em wi�cej z�ota w innych skrytkach. A ty je dla mnie znajdziesz.
		b_greg_rakeplacebriefing();
		GREG_SUCHWEITER = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//B�d� na ciebie czeka� na rozdro�u pomi�dzy polami tego bogatego farmera. Nie zawied� mnie, bo b�dziesz tego �a�owa�, jasne?
		AI_StopProcessInfos(self);
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_giveplayerxp(XP_ADDON_RAKECAVEPLUNDERED);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//Ju� tego nie mam.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Przesta� chrzani�. Mam ci do�o�y�, �eby� mi odda� moj� w�asno��?
		AI_StopProcessInfos(self);
		MIS_ADDON_GREG_RAKECAVE = LOG_FAILED;
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_ADDON_GREG_NW_LAKECAVE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 100;
	condition = dia_addon_greg_nw_lakecave_condition;
	information = dia_addon_greg_nw_lakecave_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_greg_nw_lakecave_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (GREG_SUCHWEITER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_lakecave_info()
{
	b_greg_gonow();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_WHERETREASURES(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 10;
	condition = dia_addon_greg_nw_wheretreasures_condition;
	information = dia_addon_greg_nw_wheretreasures_info;
	permanent = TRUE;
	description = "Przypomnij mi, gdzie dok�adnie zakopa�e� swoje rzeczy?";
};


func int dia_addon_greg_nw_wheretreasures_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wheretreasures_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Przypomnij mi, gdzie dok�adnie zakopa�e� swoje rzeczy?
	b_greg_rakeplacebriefing();
};


instance DIA_ADDON_GREG_NW_PERMTAVERNE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 99;
	condition = dia_addon_greg_nw_permtaverne_condition;
	information = dia_addon_greg_nw_permtaverne_info;
	permanent = TRUE;
	description = "Jeszcze jedno...";
};


func int dia_addon_greg_nw_permtaverne_condition()
{
	if(((GREGLOCATION == GREG_BIGCROSS) && (Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS))) || ((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_waswillstdu)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_permtaverne_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Jeszcze jedno...
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Najpierw przynie� moje zakopane rzeczy. P�niej b�dziemy mogli porozmawia� o innych sprawach.
	}
	else if(MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Dzi�kuj� ci za pomoc. Ale to nie znaczy, �e jeste�my teraz kumplami, jasne?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//I tak ju� za d�ugo ze sob� gadamy.
	};
};


instance DIA_ADDON_GREG_NW_BIGCROSS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_bigcross_condition;
	information = dia_addon_greg_nw_bigcross_info;
	description = "Wszystko w porz�dku?";
};


func int dia_addon_greg_nw_bigcross_condition()
{
	if((GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_bigcross_info()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED) || (MIS_ADDON_GREG_RAKECAVE == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Kogo my tu mamy? Kolega nies�owny.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Nie do ko�ca. Najemnicy nie okazali si� szczeg�lnie pomocni.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//My�la�em, �e maj� w sobie troch� ikry.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Ale wychodzi na to, �e to zgraja zadufanych w sobie pysza�k�w.
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//Jak ci idzie poszukiwanie moich zakopanych skarb�w? Znalaz�e� ju� co�?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Nie, jeszcze nie wszystko.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//No to bierz si� do roboty. To chyba nie takie trudne, co?
		};
	};
};


instance DIA_ADDON_GREG_NW_WHATWANTFROMSLD(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_whatwantfromsld_condition;
	information = dia_addon_greg_nw_whatwantfromsld_info;
	description = "Czego chcia�e� od najemnik�w?";
};


func int dia_addon_greg_nw_whatwantfromsld_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_whatwantfromsld_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Czego chcia�e� od najemnik�w?
	if(SC_KNOWSGREGSSEARCHSDEXTER == FALSE)
	{
		b_greg_search_dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//Przecie� wiesz. Szukam tego faceta w czerwonej zbroi.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Ale ci idioci te� nic nie wiedz�.
	};
};


instance DIA_ADDON_GREG_NW_DEXTERFOUND(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_dexterfound_condition;
	information = dia_addon_greg_nw_dexterfound_info;
	description = "Rozumiem, �e szukasz niejakiego Dextera?";
};


func int dia_addon_greg_nw_dexterfound_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && ((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_dexterfound_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Rozumiem, �e szukasz niejakiego Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Cholera wie. Nie mam poj�cia, jak si� nazywa.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"To tylko taki pomys�.",dia_addon_greg_nw_dexterfound_weg);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Co powiesz na to, �eby�my poszli razem?",dia_addon_greg_nw_dexterfound_together);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Wiem, gdzie mo�esz go znale��.",dia_addon_greg_nw_dexterfound_wo);
};

func void dia_addon_greg_nw_dexterfound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//To tylko taki pomys�.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
};

func void dia_addon_greg_nw_dexterfound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//Wiem, gdzie mo�esz go znale��.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//Naprawd�? GADAJ!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Niedaleko st�d.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Wygl�da na to, �e przewodzi gro�nej grupie bandyt�w.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//HA! Tak. To on.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Wiedzia�em, �e zaszy� si� gdzie� w okolicy. Stary szczur l�dowy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//Musz� teraz jedynie zajrze� do wszystkich nor i dziur na tym terenie.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Znajd� t� �wini�. Nie potrzebuj� ju� twojej pomocy.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_greg_nw_dexterfound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Co powiesz na to, �eby�my poszli razem?
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Mam z nim stare porachunki. Nie potrzebuj� towarzystwa.
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter_condition;
	information = dia_addon_greg_nw_caughtdexter_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//Gdzie jest ta �winia?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Kto? Kapitan? Jest tutaj.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//No to zr�b przej�cie.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};


instance DIA_ADDON_GREG_NW_WODENNNU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wodennnu_condition;
	information = dia_addon_greg_nw_wodennnu_info;
	important = TRUE;
};


func int dia_addon_greg_nw_wodennnu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wodennnu_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//A gdzie teraz poszed�?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//By� tutaj.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//Wi�c id� go poszuka�!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER2(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter2_condition;
	information = dia_addon_greg_nw_caughtdexter2_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter2_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter2_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//A wi�c Dexter nie b�dzie ju� sprawia� k�opot�w, co?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Wygl�da na to, �e nie �yje.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Najwy�szy czas. Sprawd�, co mia� przy sobie.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_RAVENSLETTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_ravensletter_condition;
	information = dia_addon_greg_nw_ravensletter_info;
	description = "Znalaz�em jedynie ten list.";
};


func int dia_addon_greg_nw_ravensletter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_caughtdexter2) && Npc_HasItems(other,itwr_ravenskidnappermission_addon) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_ravensletter_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Znalaz�em jedynie ten list.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Poka� go.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//Ech, cholera. To mi te� w niczym nie pomo�e.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Nie powinni�my byli pozwoli� temu gnojkowi tak szybko zdechn��.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Nie wiesz mo�e, jak da�oby si� przekroczy� g�ry w p�nocno-wschodniej cz�ci Khorinis?
	if((nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (saturas_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Mo�e przez podziemny tunel? Magowie Wody badaj� w�a�nie portal, kt�ry prowadzi w g��b g�r na p�nocnym wschodzie.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//Co to znowu za bzdura?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//Phi. Magowie Wody. Nie masz lepszego planu?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Nie.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//A wi�c jestem tu uziemiony.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter by� moj� jedyn� nadziej�.
};


instance DIA_ADDON_GREG_NW_WASWILLSTDU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_waswillstdu_condition;
	information = dia_addon_greg_nw_waswillstdu_info;
	description = "Co chcia�e� od Dextera?";
};


func int dia_addon_greg_nw_waswillstdu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_ravensletter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_waswillstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//Co chcia�e� od Dextera?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//Przybywam zza g�r, kt�re rozci�gaj� si� na p�nocno-wschodniej cz�ci wyspy. I tam te� chcia�em wr�ci�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Mia�em nadziej�, �e ten dra� zna� spos�b na dostanie si� tam bez statku.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(dia_addon_greg_nw_waswillstdu);
	Info_AddChoice(dia_addon_greg_nw_waswillstdu,"Co znajduje si� po drugiej stronie g�r?",dia_addon_greg_nw_waswillstdu_da);
	if(skip_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_waswillstdu,"W pobli�u miasta portowego widzia�em pirata, niejakiego Skipa.",dia_addon_greg_nw_waswillstdu_skip);
	};
};

func void dia_addon_greg_nw_waswillstdu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//Co znajduje si� po drugiej stronie g�r?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//Mog� ci tylko poradzi�, aby� si� tam nie wybiera�.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//To bardzo niebezpieczne miejsce. Taki chudzielec, jak ty, d�ugo by tam nie po�y�.
};

func void dia_addon_greg_nw_waswillstdu_skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//W pobli�u miasta portowego widzia�em pirata, niejakiego Skipa.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//Co za idiota. Czeka�em tam przez 3 dni. Dlaczego pojawi� si� dopiero teraz?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Jak tylko wr�c� mi si�y, spotka go nauczka.
	SC_KNOWSCONNECTIONSKIPGREG = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_FOUNDTREASURE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_foundtreasure_condition;
	information = dia_addon_greg_nw_foundtreasure_info;
	permanent = TRUE;
	description = "Znalaz�em twoje ukryte �upy.";
};


func int dia_addon_greg_nw_foundtreasure_condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_foundtreasure_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Znalaz�em twoje ukryte �upy.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Na pewno masz przy sobie moje rzeczy - jakie� 100 monet, z�oty kielich, srebrn� mis� oraz amulet. Oddawaj!
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Nie mam tego teraz przy sobie.",dia_addon_greg_nw_foundtreasure_not);
	if((Npc_HasItems(other,itse_goldpocket100) || (Npc_HasItems(other,itmi_gold) >= 100)) && Npc_HasItems(other,itmi_goldcup) && Npc_HasItems(other,itmi_silverchalice) && Npc_HasItems(other,itam_prot_point_01))
	{
		Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Oto twoje rzeczy.",dia_addon_greg_nw_foundtreasure_ja);
	};
};

func void dia_addon_greg_nw_foundtreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Oto twoje rzeczy.
	if(b_giveinvitems(other,self,itse_goldpocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Sakiewka z setk� sztuk z�ota.
	}
	else if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 z�otych monet.
	};
	if(b_giveinvitems(other,self,itmi_goldcup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Z�oty kielich.
	};
	if(b_giveinvitems(other,self,itmi_silverchalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Srebrna misa.
	};
	if(b_giveinvitems(other,self,itam_prot_point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//Amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Bardzo dobrze. Masz szcz�cie, �e nie jeste� na tyle g�upi, �eby uciec ze znale�nym.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Oto twoja cz�� �upu.
	b_giveinvitems(self,other,itmi_gold,30);
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	MIS_ADDON_GREG_RAKECAVE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GREG_RAKECAVE);
};

func void dia_addon_greg_nw_foundtreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//Nie mam tego teraz przy sobie.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Lepiej dostarcz mi te rzeczy, zanim wpadn� we w�ciek�o��.
	AI_StopProcessInfos(self);
};


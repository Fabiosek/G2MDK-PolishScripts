
instance DIA_IGARANZ_KAP1_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap1_exit_condition;
	information = dia_igaraz_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_HELLO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_hello_condition;
	information = dia_igaraz_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_igaraz_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_igaraz_hello_info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Co mog� dla ciebie zrobi�, Bracie?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Co mog� dla ciebie zrobi�?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "Jestem zaj�ty roznoszeniem kie�bas.";
};


func int dia_igaraz_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Jestem zaj�ty roznoszeniem kie�bas.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//A zatem pracujesz dla Goraxa, tak? Dobrze, poprosz� o kie�bas�.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_IGARANZ_NOTWORK(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 3;
	condition = dia_igaraz_notwork_condition;
	information = dia_igaraz_notwork_info;
	permanent = FALSE;
	description = "Dlaczego nie pracujesz?";
};


func int dia_igaraz_notwork_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_notwork_info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Dlaczego nie pracujesz?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Dosta�em pozwolenie na studiowanie nauk Innosa. Zg��biam m�dro�� zawart� w jego s�owach.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Kt�rego� dnia zostan� Wybra�cem - a wtedy przejd� przez pr�b� magii i wejd� do Ognistego Kr�gu.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "Kim s� Wybra�cy?";
};


func int dia_igaraz_choosen_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_choosen_info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Kim s� Wybra�cy?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Nowicjusze, kt�rych Innos wybra� do Pr�by Magii.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Ten, kto j� przejdzie, zostaje wprowadzony do kr�gu Mag�w Ognia.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"Czym jest Pr�ba Magii?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"Jak mo�na zosta� Wybra�cem?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Czym jest Pr�ba Magii?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//To sprawdzian, kt�ry musz� przej�� wybrani nowicjusze.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Celem Pr�by Magii jest sprawdzenie wiary i sprytu Wybra�c�w.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Bior� w niej udzia� wszyscy wybrani nowicjusze - jednak tylko jeden mo�e z niej wyj�� zwyci�sko.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Jak mo�na zosta� Wybra�cem?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Nie masz na to �adnego wp�ywu. Tylko Innos mo�e wyznaczy� nowicjuszy, a Najwy�sza Rada jedynie oznajmia jego wol�.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "Jak mog� uzyska� dost�p do pism?";
};


func int dia_igaraz_studyinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (PARLAN_ERLAUBNIS == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_studyinnos_info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Jak mog� uzyska� dost�p do pism?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Musisz si� dosta� do biblioteki.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Jednak Mistrz Parlan przeka�e ci klucz tylko pod warunkiem, �e najpierw wype�nisz wszystkie swoje obowi�zki.
};


instance DIA_IGARAZ_IMTHEMAN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_imtheman_condition;
	information = dia_igaraz_imtheman_info;
	important = TRUE;
};


func int dia_igaraz_imtheman_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_imtheman_info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//Sta�o si�. Innos wybra� mnie i wezm� udzia� w pr�bie magii.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "Ja te� bior� w niej udzia�.";
};


var int dia_igaraz_metoo_noperm;

func int dia_igaraz_metoo_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_metoo_info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//Ja te� bior� w niej udzia�. Za��da�em Pr�by Ognia.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//Za��da�e� CZEGO? Albo jeste� ulubie�cem Innosa, albo kompletnym szale�cem.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Zrobi�em wiele szalonych rzeczy, wi�c tym razem mo�e te� mi si� jako� uda...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Strze�e mnie Innos - zatem nie mog� przegra�.
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"Mo�e mogliby�my po��czy� si�y...",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"Dowiedzia�e� si� czego� nowego?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"Widzia�e� mo�e Agona lub Ulfa?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//Znalaz�e� ju� co�?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Poniewa� i tak nie masz �adnych szans, mog� ci chyba udzieli� pewnej wskaz�wki:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Nie masz co szuka� w pobli�u farm, tam nic nie ma.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Mo�e mogliby�my po��czy� si�y...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Zapomnij o tym. Musz� wykona� moje zadanie sam. Tylko by� mi przeszkadza�.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Widzia�e� mo�e Agona lub Ulfa?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Rozdzielili�my si� w gospodzie. Ja uda�em si� w stron� farm, a tamci poszli razem, ale nie wiem gdzie.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "Czy wiesz co� na temat '�ywej ska�y'?";
};


func int dia_igaraz_add_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE) && (Npc_KnowsInfo(other,dia_igaraz_stein) == FALSE) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_add_info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Czy wiesz co� na temat '�ywej ska�y'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//Nie! Czy to Serpentes da� ci to zadanie?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Tak, dlaczego pytasz?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//S�dz�, �e wiem o co mu mo�e chodzi�...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Nie by�by� pierwsz� osob�, kt�ra obla�a ten test...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Gdzie dok�adnie mog� znale�� '�yw� ska��'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Id� t� �cie�k�. Po jakim� czasie dojdziesz do rzeki.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Potem teren zacznie si� wznosi�. Id�c dalej, dojdziesz wreszcie do pasma g�r - �ywa ska�a musi by� gdzie� tam.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Je�li dojdziesz do mostu, b�dzie to oznacza�o, �e min��e� w�a�ciwe miejce.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//JE�LI uda ci si� doj�� tak daleko...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//To wszystko, co mog� ci powiedzie�... Przecie� to w ko�cu TW�J test, nie m�j!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "Dowiedzia�e� si� czego� nowego?";
};


func int dia_igaraz_pruefung_condition()
{
	if((other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) < 1) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_pruefung_info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Dowiedzia�e� si� czego� nowego?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Nie, ale wci�� szukam odpowiedzi.
	AI_StopProcessInfos(self);
	if(IGARAZ_WAIT == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		IGARAZ_WAIT = TRUE;
	};
};


instance DIA_IGARAZ_STEIN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 1;
	condition = dia_igaraz_stein_condition;
	information = dia_igaraz_stein_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_igaraz_stein_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_66") <= 3500) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_stein_info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hej, zaczekaj. Musimy porozmawia�...
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//Nie s�dz�...
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Straci�em ca�e lata, czekaj�c na t� pr�b�. Innos jest po mojej stronie, MUSZ� wygra� ten test.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//To brzmi znajomo.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Nie jeste� pierwszym, kt�ry tak m�wi.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Do�� gadania. Potrzebuj� twojego znaleziska. Przygotuj si� na �mier�!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_IGARANZ_KAP2_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap2_exit_condition;
	information = dia_igaraz_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP3_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap3_exit_condition;
	information = dia_igaraz_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_TALKABOUTBABO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_talkaboutbabo_condition;
	information = dia_igaraz_talkaboutbabo_info;
	permanent = FALSE;
	description = "Musimy porozmawia� o Babo.";
};


func int dia_igaraz_talkaboutbabo_condition()
{
	if(MIS_BABOSDOCS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_igaraz_talkaboutbabo_info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Musimy porozmawia� o Babo.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//Tak, co� si� sta�o?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "Masz co�, co nale�y do Babo.";
};


func int dia_igaraz_babosbelongings_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_talkaboutbabo))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosbelongings_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//Masz co�, co nale�y do Babo.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//A c� to niby takiego?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Troch� papier�w. Babo chce je z powrotem.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//Z pewno�ci�. W to akurat mog� �atwo uwierzy�. Niestety, mamy tu ma�y problem, poniewa� ja nie zamierzam ich odda�.
};


instance DIA_IGARANZ_WHEREDOCS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_wheredocs_condition;
	information = dia_igaraz_wheredocs_info;
	permanent = FALSE;
	description = "Gdzie trzymasz te papiery?";
};


func int dia_igaraz_wheredocs_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_wheredocs_info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Gdzie trzymasz te papiery?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//Oczywi�cie nie nosz� ich przy sobie. Obawiam si�, �e nie mog� ci pom�c.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Gdzie one s�?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//S� bezpieczne, zamkni�te w miejscu, do kt�rego tylko ja mam klucz.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "Co mia� dla ciebie zrobi� Babo?";
};


func int dia_igaraz_babosjob_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosjob_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Co mia� dla ciebie zrobi� Babo?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Gdybym wiedzia�, �e ten dzieciak narobi w gacie z powodu odrobiny bagiennego ziela, dopilnowa�bym, �eby kto� inny zaj�� si� klasztornym ogrodem.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//Mia� hodowa� bagienne ziele?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Oczywi�cie. Poniewa� nie mamy ju� dostaw tego towaru zza Bariery, jego cena w mie�cie podskoczy�a trzykrotnie.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//To m�g�by by� dobry interes. Ale Babo chcia� si� wycofa�.
};


instance DIA_IGARANZ_PRICE(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_price_condition;
	information = dia_igaraz_price_info;
	permanent = FALSE;
	description = "Ile chcesz za te papiery?";
};


func int dia_igaraz_price_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_price_info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Ile chcesz za te papiery?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//Widzisz, tak naprawd� to te papiery s� bezcenne. Rzadko si� tutaj spotyka co� takiego.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Nie zamierzam jednak ryzykowa� mojej przysz�o�ci dla kilku sztuk z�ota.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 z�otych monet i s� twoje.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "Kupi� od ciebie te papiery.";
};


func int dia_igaraz_buyit_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_price) && (Npc_HasItems(other,itmi_gold) >= 300))
	{
		return TRUE;
	};
};

func void dia_igaraz_buyit_info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Kupi� od ciebie te papiery.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//S�uchaj, w tej chwili nie mog� si� st�d ruszy�. Dam ci klucz do mojego kufra, to wystarczy.
	b_giveinvitems(other,self,itmi_gold,300);
	b_giveinvitems(self,other,itke_igarazchest_mis,1);
};


instance DIA_IGARAZ_PICKPOCKET(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 900;
	condition = dia_igaraz_pickpocket_condition;
	information = dia_igaraz_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};


func int dia_igaraz_pickpocket_condition()
{
	if((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_igarazchest_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_igaraz_pickpocket_info()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_BACK,dia_igaraz_pickpocket_back);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_PICKPOCKET,dia_igaraz_pickpocket_doit);
};

func void dia_igaraz_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_igarazchest_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_igaraz_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_igaraz_pickpocket_back()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
};


instance DIA_IGARANZ_KAP4_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap4_exit_condition;
	information = dia_igaraz_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP5_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap5_exit_condition;
	information = dia_igaraz_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_PERM(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_perm_condition;
	information = dia_igaraz_perm_info;
	permanent = FALSE;
	description = "Masz dla mnie co� ciekawego?";
};


func int dia_igaraz_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF) && (MIS_BABOSDOCS != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_igaraz_perm_info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//Czy masz dla mnie co� ciekawego?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Ehm... nie.
	AI_StopProcessInfos(self);
};


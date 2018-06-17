
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
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Co mogê dla ciebie zrobiæ, Bracie?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Co mogê dla ciebie zrobiæ?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "Jestem zajêty roznoszeniem kie³bas.";
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
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Jestem zajêty roznoszeniem kie³bas.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//A zatem pracujesz dla Goraxa, tak? Dobrze, poproszê o kie³basê.
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
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Dosta³em pozwolenie na studiowanie nauk Innosa. Zg³êbiam m¹droœæ zawart¹ w jego s³owach.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Któregoœ dnia zostanê Wybrañcem - a wtedy przejdê przez próbê magii i wejdê do Ognistego Krêgu.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "Kim s¹ Wybrañcy?";
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
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Kim s¹ Wybrañcy?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Nowicjusze, których Innos wybra³ do Próby Magii.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Ten, kto j¹ przejdzie, zostaje wprowadzony do krêgu Magów Ognia.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"Czym jest Próba Magii?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"Jak mo¿na zostaæ Wybrañcem?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Czym jest Próba Magii?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//To sprawdzian, który musz¹ przejœæ wybrani nowicjusze.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Celem Próby Magii jest sprawdzenie wiary i sprytu Wybrañców.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Bior¹ w niej udzia³ wszyscy wybrani nowicjusze - jednak tylko jeden mo¿e z niej wyjœæ zwyciêsko.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Jak mo¿na zostaæ Wybrañcem?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Nie masz na to ¿adnego wp³ywu. Tylko Innos mo¿e wyznaczyæ nowicjuszy, a Najwy¿sza Rada jedynie oznajmia jego wolê.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "Jak mogê uzyskaæ dostêp do pism?";
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
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Jak mogê uzyskaæ dostêp do pism?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Musisz siê dostaæ do biblioteki.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Jednak Mistrz Parlan przeka¿e ci klucz tylko pod warunkiem, ¿e najpierw wype³nisz wszystkie swoje obowi¹zki.
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
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//Sta³o siê. Innos wybra³ mnie i wezmê udzia³ w próbie magii.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "Ja te¿ biorê w niej udzia³.";
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
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//Ja te¿ biorê w niej udzia³. Za¿¹da³em Próby Ognia.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//Za¿¹da³eœ CZEGO? Albo jesteœ ulubieñcem Innosa, albo kompletnym szaleñcem.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Zrobi³em wiele szalonych rzeczy, wiêc tym razem mo¿e te¿ mi siê jakoœ uda...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Strze¿e mnie Innos - zatem nie mogê przegraæ.
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"Mo¿e moglibyœmy po³¹czyæ si³y...",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"Dowiedzia³eœ siê czegoœ nowego?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"Widzia³eœ mo¿e Agona lub Ulfa?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//Znalaz³eœ ju¿ coœ?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Poniewa¿ i tak nie masz ¿adnych szans, mogê ci chyba udzieliæ pewnej wskazówki:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Nie masz co szukaæ w pobli¿u farm, tam nic nie ma.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Mo¿e moglibyœmy po³¹czyæ si³y...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Zapomnij o tym. Muszê wykonaæ moje zadanie sam. Tylko byœ mi przeszkadza³.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Widzia³eœ mo¿e Agona lub Ulfa?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Rozdzieliliœmy siê w gospodzie. Ja uda³em siê w stronê farm, a tamci poszli razem, ale nie wiem gdzie.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "Czy wiesz coœ na temat '¿ywej ska³y'?";
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
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Czy wiesz coœ na temat '¿ywej ska³y'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//Nie! Czy to Serpentes da³ ci to zadanie?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Tak, dlaczego pytasz?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//S¹dzê, ¿e wiem o co mu mo¿e chodziæ...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Nie by³byœ pierwsz¹ osob¹, która obla³a ten test...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Gdzie dok³adnie mogê znaleŸæ '¿yw¹ ska³ê'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//IdŸ t¹ œcie¿k¹. Po jakimœ czasie dojdziesz do rzeki.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Potem teren zacznie siê wznosiæ. Id¹c dalej, dojdziesz wreszcie do pasma gór - ¿ywa ska³a musi byæ gdzieœ tam.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Jeœli dojdziesz do mostu, bêdzie to oznacza³o, ¿e min¹³eœ w³aœciwe miejce.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//JEŒLI uda ci siê dojœæ tak daleko...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//To wszystko, co mogê ci powiedzieæ... Przecie¿ to w koñcu TWÓJ test, nie mój!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "Dowiedzia³eœ siê czegoœ nowego?";
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
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Dowiedzia³eœ siê czegoœ nowego?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Nie, ale wci¹¿ szukam odpowiedzi.
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
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hej, zaczekaj. Musimy porozmawiaæ...
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//Nie s¹dzê...
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Straci³em ca³e lata, czekaj¹c na tê próbê. Innos jest po mojej stronie, MUSZÊ wygraæ ten test.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//To brzmi znajomo.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Nie jesteœ pierwszym, który tak mówi.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Doœæ gadania. Potrzebujê twojego znaleziska. Przygotuj siê na œmieræ!
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
	description = "Musimy porozmawiaæ o Babo.";
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
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Musimy porozmawiaæ o Babo.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//Tak, coœ siê sta³o?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "Masz coœ, co nale¿y do Babo.";
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
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//Masz coœ, co nale¿y do Babo.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//A có¿ to niby takiego?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Trochê papierów. Babo chce je z powrotem.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//Z pewnoœci¹. W to akurat mogê ³atwo uwierzyæ. Niestety, mamy tu ma³y problem, poniewa¿ ja nie zamierzam ich oddaæ.
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
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//Oczywiœcie nie noszê ich przy sobie. Obawiam siê, ¿e nie mogê ci pomóc.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Gdzie one s¹?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//S¹ bezpieczne, zamkniête w miejscu, do którego tylko ja mam klucz.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "Co mia³ dla ciebie zrobiæ Babo?";
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
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Co mia³ dla ciebie zrobiæ Babo?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Gdybym wiedzia³, ¿e ten dzieciak narobi w gacie z powodu odrobiny bagiennego ziela, dopilnowa³bym, ¿eby ktoœ inny zaj¹³ siê klasztornym ogrodem.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//Mia³ hodowaæ bagienne ziele?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Oczywiœcie. Poniewa¿ nie mamy ju¿ dostaw tego towaru zza Bariery, jego cena w mieœcie podskoczy³a trzykrotnie.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//To móg³by byæ dobry interes. Ale Babo chcia³ siê wycofaæ.
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
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//Widzisz, tak naprawdê to te papiery s¹ bezcenne. Rzadko siê tutaj spotyka coœ takiego.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Nie zamierzam jednak ryzykowaæ mojej przysz³oœci dla kilku sztuk z³ota.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 z³otych monet i s¹ twoje.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "Kupiê od ciebie te papiery.";
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
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Kupiê od ciebie te papiery.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//S³uchaj, w tej chwili nie mogê siê st¹d ruszyæ. Dam ci klucz do mojego kufra, to wystarczy.
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
	description = "(Kradzie¿ tego klucza bêdzie doœæ ³atwa)";
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
	description = "Masz dla mnie coœ ciekawego?";
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
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//Czy masz dla mnie coœ ciekawego?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Ehm... nie.
	AI_StopProcessInfos(self);
};


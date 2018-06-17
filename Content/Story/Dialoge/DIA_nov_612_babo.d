
instance DIA_BABO_KAP1_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap1_exit_condition;
	information = dia_babo_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_babo_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_hello_condition;
	information = dia_babo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_babo_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_hello_info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//Ty te� tu jeste� nowy, prawda?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Tak. D�ugo tu jeste�?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Od czterech tygodni. Dosta�e� ju� kij do walki?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Jeszcze nie.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//No to we� ten. Wszyscy nowicjusze nosz� takie kije jako znak, �e potrafimy si� broni�. Potrafisz walczy�?
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//No c�, mia�em ju� kiedy� w r�kach bro�...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Je�li chcesz, mog� ci� czego� nauczy�. Ale mam pro�b�...
	b_giveinvitems(self,other,itmw_1h_nov_mace,1);
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_BABO_ANLIEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_anliegen_condition;
	information = dia_babo_anliegen_info;
	permanent = FALSE;
	description = "Co to za pro�ba?";
};


func int dia_babo_anliegen_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
	{
		return TRUE;
	};
};

func void dia_babo_anliegen_info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Co to za pro�ba?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//No c�, jeden z paladyn�w, Sergio, jest w tej chwili w klasztorze.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Je�li nam�wisz go, �eby ze mn� troch� po�wiczy�, to ci� wyszkol�.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Zobacz�, co da si� zrobi�.
	Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
	b_logentry(TOPIC_BABOTRAIN,"Je�li przekonam paladyna Sergia, aby po�wiczy� z Babo, ten ostatni nauczy mnie walczy� or�em dwur�cznym.");
};


instance DIA_BABO_SERGIO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_sergio_condition;
	information = dia_babo_sergio_info;
	permanent = FALSE;
	description = "Rozmawia�em z Sergiem.";
};


func int dia_babo_sergio_condition()
{
	if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_sergio_info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Rozmawia�em z Sergiem. Codziennie rano b�dzie z tob� trenowa� przez dwie godziny, od pi�tej.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Dzi�kuj�! To dla mnie zaszczyt!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Je�li chcesz, wyja�ni� ci te� tajniki walki.
	BABO_TEACHPLAYER = TRUE;
	BABO_TRAINING = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Babo mo�e mnie nauczy� walki or�em dwur�cznym.");
};


instance DIA_BABO_TEACH(C_INFO)
{
	npc = nov_612_babo;
	nr = 100;
	condition = dia_babo_teach_condition;
	information = dia_babo_teach_info;
	permanent = TRUE;
	description = "Jestem got�w do treningu.";
};


var int dia_babo_teach_permanent;
var int babo_labercount;

func int dia_babo_teach_condition()
{
	if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void dia_babo_teach_info()
{
	BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Jestem got�w do treningu.
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Przekaza�em ci ju� ca�� swoj� wiedz� o walce or�em obur�cznym.
		DIA_BABO_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_babo_teach);
};

func void dia_babo_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Walcz za Innosa. Innos jest naszym �yciem, a wiara - najpot�niejszym or�em.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//S�uga Innosa nigdy nie prowokuje swojego przeciwnika - zawsze dzia�a z zaskoczenia!
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//Wsz�dzie, gdzie si� udasz, miej ze sob� sw�j kostur.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//S�uga Innosa zawsze jest got�w do walki. Je�li nie posiadasz mocy magicznej, twoj� podstawow� broni� jest kostur.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Broni� s�ugi Innosa jest nie tylko jego kostur, lecz r�wnie� waleczne serce.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Musisz wiedzie�, kiedy mo�esz si� wycofa�.
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Pami�taj, dobra walka to taka, w kt�rej to ty kontrolujesz swojego przeciwnika, nie daj�c mu najmniejszej szansy na przej�cie kontroli nad tob�.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Przegrywasz tylko wtedy, gdy si� poddasz.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};


instance DIA_BABO_WURST(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_wurst_condition;
	information = dia_babo_wurst_info;
	permanent = FALSE;
	description = "Prosz�, we� kie�bas�.";
};


func int dia_babo_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_babo_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Prosz�, we� kie�bas�.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Och, kie�basy z barana, wspaniale! S� najlepsze - no, daj mi jeszcze jedn�!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Wtedy nie wystarczy dla pozosta�ych.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//I tak masz o jedn� za du�o. T�, kt�ra jest dla ciebie. A co znaczy jedna kie�baska dla przyjaciela?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Daj spok�j. Dam ci za ni� zw�j z czarem 'Ognista strza�a'.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_babo_wurst);
	Info_AddChoice(dia_babo_wurst,"Dobrze, we� jeszcze jedn�.",dia_babo_wurst_ja);
	Info_AddChoice(dia_babo_wurst,"Nie, nie zrobi� tego.",dia_babo_wurst_nein);
};

func void dia_babo_wurst_ja()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//Dobrze, we� jeszcze jedn�.
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Dobrze. Oto tw�j zw�j z czarem.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	b_giveinvitems(self,other,itsc_firebolt,1);
	Info_ClearChoices(dia_babo_wurst);
};

func void dia_babo_wurst_nein()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Nie, nie zrobi� tego.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Cz�owieku, jeste� z tych, co to s� zawsze bardzo skrupulatni, no nie?
	Info_ClearChoices(dia_babo_wurst);
};


instance DIA_BABO_YOUANDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_youandagon_condition;
	information = dia_babo_youandagon_info;
	permanent = FALSE;
	description = "Co zasz�o mi�dzy tob� i Agonem?";
};


func int dia_babo_youandagon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_youandagon_info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Co zasz�o mi�dzy tob� i Agonem?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Och, mieli�my odmienne pogl�dy na temat ognistych pokrzyw.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon za bardzo je podlewa� i zgni�y im korzenie.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//A kiedy tak si� sta�o, mnie za to obwini�.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Od tej pory ka�� mi przez ca�y dzie� zamiata� dziedziniec.
};


instance DIA_BABO_WHYDIDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 4;
	condition = dia_babo_whydidagon_condition;
	information = dia_babo_whydidagon_info;
	permanent = FALSE;
	description = "Dlaczego Agon to zrobi�?";
};


func int dia_babo_whydidagon_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_whydidagon_info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Dlaczego Agon to zrobi�?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Musisz go o to zapyta�. Wydaje mi si�, �e on po prostu nie znosi, kiedy kto� jest lepszy od niego.
};


instance DIA_BABO_PLANTLORE(C_INFO)
{
	npc = nov_612_babo;
	nr = 5;
	condition = dia_babo_plantlore_condition;
	information = dia_babo_plantlore_info;
	permanent = FALSE;
	description = "Wygl�da na to, �e wiesz co nieco o ro�linach?";
};


func int dia_babo_plantlore_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_plantlore_info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Wygl�da na to, �e wiesz co nieco o ro�linach?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//Mieli�my ogr�d z zio�ami i tam nauczy�em si� paru sztuczek od mojego dziadka.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Naprawd� wola�bym znowu pracowa� w ogrodzie.
	MIS_HELPBABO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
	b_logentry(TOPIC_BABOGAERTNER,"Babo wola�by pracowa� w ogrodzie, ni� zamiata� podw�rze.");
};


instance DIA_BABO_FEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_fegen_condition;
	information = dia_babo_fegen_info;
	permanent = FALSE;
	description = "Mam posprz�ta� komnaty nowicjuszy.";
};


func int dia_babo_fegen_condition()
{
	if(MIS_PARLANFEGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_babo_fegen_info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Mam posprz�ta� komnaty nowicjuszy.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Wzi��e� spory ci�ar na barki. Wiesz co - pomog� ci. Sam nigdy tego nie sko�czysz.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Ale naprawd� potrzebuj� zwoju z czarem 'Pi�� wichru' - wiesz, mia�em szcz�cie i pozwolili mi przeczyta� o tym ksi��k�.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//No i teraz, oczywi�cie, chc� wypr�bowa� ten czar. Wi�c przynie� mi ten zw�j, a ch�tnie ci pomog�.
	b_logentry(TOPIC_PARLANFEGEN,"Babo pomo�e mi pozamiata� komnaty nowicjuszy, je�li przynios� mu zw�j Pi�ci wichru.");
};


instance DIA_BABO_WINDFAUST(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_windfaust_condition;
	information = dia_babo_windfaust_info;
	permanent = TRUE;
	description = "Co do tego zwoju... (oddaj zw�j Pi�ci wichru)";
};


var int dia_babo_windfaust_permanent;

func int dia_babo_windfaust_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_babo_windfaust_info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Co do tego zwoju z zakl�ciem...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//Czy masz dla mnie zakl�cie 'Pi�� wichru'?
	if(b_giveinvitems(other,self,itsc_windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Tu jest zw�j, o kt�ry ci chodzi�o.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//To dobrze. A wi�c pomog� ci posprz�ta� komnaty.
		NOV_HELFER = NOV_HELFER + 1;
		DIA_BABO_WINDFAUST_PERMANENT = TRUE;
		b_giveplayerxp(XP_FEGER);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		b_logentry(TOPIC_PARLANFEGEN,"Babo pomo�e mi pozamiata� komnaty nowicjuszy.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Nie, jeszcze nie.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//A wi�c poczekam, a� je zdob�dziesz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_LIFE(C_INFO)
{
	npc = nov_612_babo;
	nr = 10;
	condition = dia_babo_life_condition;
	information = dia_babo_life_info;
	permanent = TRUE;
	description = "Jak tu si� �yje, w klasztorze?";
};


func int dia_babo_life_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_babo_life_info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Jak tu si� �yje, w klasztorze?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Nie chc� narzeka�, ale nie s�dzi�em, �e obowi�zuje tutaj taki rygor. Je�li nie trzymasz si� �ci�le zasad, spotyka ci� kara.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Oczywi�cie, wielu nowicjuszy chce studiowa� nauki Innosa w bibliotece. Pragn� by� gotowi, kiedy zostan� wybrani.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Ale ja my�l�, �e najlepszym przygotowaniem do Pr�by Magii jest wykonywanie w�asnych zada�.
	if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//O co chodzi z tym Wybranym i Pr�b�?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Porozmawiaj z bratem Igarazem. On wie du�o na ten temat.
	};
};


instance DIA_BABO_HOWISIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 1;
	condition = dia_babo_howisit_condition;
	information = dia_babo_howisit_info;
	permanent = TRUE;
	description = "Jak si� masz?";
};


func int dia_babo_howisit_condition()
{
	if((hero.guild == GIL_KDF) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int babo_xpgiven;

func void dia_babo_howisit_info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Jak si� masz?
	if(MIS_HELPBABO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//Dzi�kuj� magom za moje zadanie.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Cieszy mnie praca w ogrodzie i mam nadziej�, �e magowie s� ze mnie zadowoleni, Panie.
		if(BABO_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			BABO_XPGIVEN = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//D... d... dobrze, Panie.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//Pracuj� ci�ko i staram si� nie zawie�� mag�w.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP2_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap2_exit_condition;
	information = dia_babo_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_babo_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap3_exit_condition;
	information = dia_babo_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_hello_condition;
	information = dia_babo_kap3_hello_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_babo_kap3_hello_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_hello_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Co tu robisz?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//Staram si� wykona� moje zadania dla dobra klasztoru.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Nie wolno mi z tob� rozmawia�. Naszym prze�o�onym nie podoba si�, kiedy kontaktujemy si� z obcymi.
	};
};


instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_keepthefaith_condition;
	information = dia_babo_kap3_keepthefaith_info;
	permanent = FALSE;
	description = "Nie wolno ci traci� wiary.";
};


func int dia_babo_kap3_keepthefaith_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_keepthefaith_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Nie wolno ci traci� wiary.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//Nie... To znaczy, nigdy bym czego� takiego nie zrobi�. Naprawd�!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//Ka�dy z nas wystawiany jest na ci�kie pr�by.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Tak, Panie. B�d� o tym pami�ta�. Dzi�kuj� ci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_unhappy_condition;
	information = dia_babo_kap3_unhappy_info;
	permanent = FALSE;
	description = "To nie brzmia�o, jakby� by� zadowolony.";
};


func int dia_babo_kap3_unhappy_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_unhappy_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//To nie brzmia�o, jakby� by� zadowolony.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//No c�... To znaczy, wszystko w porz�dku, naprawd�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Tylko... Och, nie chc� narzeka�.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Wi�c przesta� j�cze�.",dia_babo_kap3_unhappy_lament);
	Info_AddChoice(dia_babo_kap3_unhappy,"No dalej, mnie mo�esz powiedzie�.",dia_babo_kap3_unhappy_tellme);
};

func void dia_babo_kap3_unhappy_lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Wi�c przesta� j�cze�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//Tylko... prosz�... nie m�w magom.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Nie chc�, �eby mnie znowu ukarali.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Zastanowi� si�.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_tellme()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//No dalej, mnie mo�esz powiedzie�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//I naprawd� nie dasz zna� magom?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Czy wygl�dam na takiego, kt�ry by to zrobi�?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//W porz�dku. Mam problem z jednym z nowicjuszy. Ma mnie w gar�ci.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//No dalej, wykrztu� to z siebie.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, tak si� nazywa, znalaz� moje prywatne dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Zagrozi�, �e da je magom, je�li nie b�d� robi�, co mi ka�e.
	MIS_BABOSDOCS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
	b_logentry(TOPIC_BABOSDOCS,"Igaraz szanta�uje nowicjusza Babo jakimi� dokumentami.");
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"S�dz�, �e to zbyt osobista sprawa.",dia_babo_kap3_unhappy_privat);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co masz dla niego zrobi�?",dia_babo_kap3_unhappy_shoulddo);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co to za dokumenty?",dia_babo_kap3_unhappy_documents);
	Info_AddChoice(dia_babo_kap3_unhappy,"Mog� ci jako� pom�c?",dia_babo_kap3_unhappy_canhelpyou);
};

func void dia_babo_kap3_unhappy_privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//S�dz�, �e to zbyt osobista sprawa.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Rozumiem, nie chcesz mie� k�opot�w. Wi�c b�d� musia� si� tym sam zaj��.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//Jako� sobie poradzisz.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_shoulddo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Co masz dla niego zrobi�?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Nie lubi� o tym m�wi�. W ka�dym razie, nie spodoba�oby si� to Innosowi.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Wol� nie my�le�, co by si� sta�o, gdyby to wysz�o na jaw.
};

func void dia_babo_kap3_unhappy_documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Co to za dokumenty?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//To wy��cznie moja prywatna sprawa.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//No dalej, powiedz mi.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//To s�, eee... ca�kiem zwyczajne dokumenty. Nic szczeg�lnego.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Nie b�d� wi�cej pyta�.
};

func void dia_babo_kap3_unhappy_canhelpyou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Mog� ci jako� pom�c?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Zrobi�by� to?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//To zale�y, oczywi�cie.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//Oczywi�cie, zap�ac� ci za to.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Ile?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Rzecz jasna, nie mam wiele pieni�dzy, ale mog� da� ci zw�j z czarem. Mam czar leczniczy.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Wola�bym si� w to nie miesza�.",dia_babo_kap3_unhappy_no);
	Info_AddChoice(dia_babo_kap3_unhappy,"Zobacz�, co da si� zrobi�.",dia_babo_kap3_unhappy_yes);
};

func void dia_babo_kap3_unhappy_no()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Wola�bym si� w to nie miesza�
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//A wi�c nie mam wyboru, musz� ta�czy�, jak mi zagraj�.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Zobacz�, co da si� zrobi�.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//Naprawd�, to si� musi uda�. Musi!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Musisz si� tylko dowiedzie�, gdzie Igaraz schowa� te rzeczy. Potem je zakosisz i wszystko b�dzie w porz�dku.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Spokojnie. Wr�� do swoich zaj��. Ja zajm� si� reszt�.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};


instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_haveyourdocs_condition;
	information = dia_babo_kap3_haveyourdocs_info;
	permanent = FALSE;
	description = "Mam twoje dokumenty.";
};


func int dia_babo_kap3_haveyourdocs_condition()
{
	if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_haveyourdocs_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Mam twoje dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Naprawd�? Dzi�ki, uratowa�e� mnie. Nie wiem, jak ci dzi�kowa�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Tak, tak, uspok�j si�.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//To na pewno moje? Jeste� pewien? Poka�.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Zamierzam je na razie zatrzyma�.",dia_babo_kap3_haveyourdocs_keepthem);
	if(BABOSDOCSOPEN == TRUE)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Pewne okoliczno�ci spowodowa�y, �e cena posz�a w g�r�.",dia_babo_kap3_haveyourdocs_iwantmore);
	};
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Trzymaj.",dia_babo_kap3_haveyourdocs_heretheyare);
};

func void dia_babo_kap3_haveyourdocs_keepthem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Zamierzam je na razie zatrzyma�.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//Co?! Co to ma znaczy�?! Co zamierzasz?
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Tylko �artowa�em.",dia_babo_kap3_haveyourdocs_keepthem_justjoke);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To ju� moje zmartwienie.",dia_babo_kap3_haveyourdocs_keepthem_myconcern);
	if(IGARAZ_ISPARTNER == LOG_SUCCESS)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Igaraz to m�j wsp�lnik.",dia_babo_kap3_haveyourdocs_keepthem_partner);
	};
};

func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Tylko �artowa�em.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//Ha, ha, jako� mnie to nie �mieszy. A wi�c gdzie one s�?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Tutaj.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Nie chcia�em ci� obrazi�, ale ca�a ta sytuacja troch� mnie niepokoi.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//W porz�dku. Mi�ej zabawy z tymi DOKUMENTAMI.
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//To moja sprawa.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Te dokumenty s� moje. Nie masz prawa ich zatrzymywa�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Na razie.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Igaraz jest teraz moim wsp�lnikiem.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//Co?! Nie mo�esz tego zrobi�.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//Wygl�da na to, �e mog�. Zatrzymam te papiery i nic si� nie zmieni.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//Kwestie finansowe za�atwi� z Igarazem.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//No c�, zatem dbaj dobrze o ro�liny.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//Jeste� �wini�. N�dzn�, chciw� �wini�. Innos ci� uka�e.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Uwa�aj na to, co m�wisz.",dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Nie masz co robi�?",dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo);
};

func void dia_babo_kap3_haveyourdocs_end()
{
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Uwa�aj na to, co m�wisz.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//Jestem jak zwykle zbyt uprzejmy.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Nie masz co robi�?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Dobrze to rozumiem, ale uwierz mi, to b�dzie mia�o pewne konsekwencje.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_iwantmore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Pewne okoliczno�ci spowodowa�y, �e cena posz�a w g�r�.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Nie jeste� lepszy od pozosta�ych. Czego chcesz?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//Co masz?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Mog� ci da� 121 sztuk z�ota. To wszystko, co mam.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To nie wystarczy.",dia_babo_kap3_haveyourdocs_iwantmore_notenough);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Zgoda.",dia_babo_kap3_haveyourdocs_iwantmore_thatsenough);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//To nie wystarczy.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Ale ja ju� nie mam pieni�dzy. Gdybym przypuszcza�, �e tak si� stanie, nigdy nie wszed�bym do tego klasztoru.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Zgoda.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Tu masz pieni�dze i zw�j z czarem.
	CreateInvItems(self,itsc_mediumheal,1);
	CreateInvItems(self,itmi_gold,121);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	b_giveinvitems(self,other,itmi_gold,121);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_heretheyare()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Trzymaj.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Tak, s� w komplecie.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Zagl�da�e� do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//A czy to jaka� r�nica?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Nie, pod warunkiem, �e dostan� je z powrotem.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Mam nadziej�, �e teraz b�d� m�g� odpocz�� w spokoju.
	CreateInvItems(self,itsc_mediumheal,1);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};


instance DIA_BABO_KAP3_PERM(C_INFO)
{
	npc = nov_612_babo;
	nr = 39;
	condition = dia_babo_kap3_perm_condition;
	information = dia_babo_kap3_perm_info;
	permanent = TRUE;
	description = "Czy jeste� zadowolony ze swojego zadania?";
};


func int dia_babo_kap3_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Czy jeste� zadowolony ze swojego zadania?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//Tak, oczywi�cie. Wiara w m�dro�� i pot�g� Innosa daje mi si��.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//Nie chc� okaza� braku szacunku, ale mam dzi� du�o do zrobienia.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Mo�esz kontynuowa�.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//Dzi�kuj�.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Jako� idzie, ale musz� wraca� do pracy, bo w przeciwnym razie dzisiaj jej nie sko�cz�.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Nie chc� znowu pracowa� przez p� nocy, �eby wype�ni� moje obowi�zki i unikn�� k�opot�w.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP4_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap4_exit_condition;
	information = dia_babo_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_babo_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP5_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap5_exit_condition;
	information = dia_babo_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_babo_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_PICKPOCKET(C_INFO)
{
	npc = nov_612_babo;
	nr = 900;
	condition = dia_babo_pickpocket_condition;
	information = dia_babo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_babo_pickpocket_condition()
{
	return c_beklauen(17,25);
};

func void dia_babo_pickpocket_info()
{
	Info_ClearChoices(dia_babo_pickpocket);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};

func void dia_babo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babo_pickpocket);
};

func void dia_babo_pickpocket_back()
{
	Info_ClearChoices(dia_babo_pickpocket);
};


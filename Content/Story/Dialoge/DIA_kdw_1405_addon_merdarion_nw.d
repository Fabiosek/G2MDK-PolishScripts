
instance DIA_ADDON_MERDARION_EXIT(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 999;
	condition = dia_addon_merdarion_exit_condition;
	information = dia_addon_merdarion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_merdarion_exit_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MERDARION_HALLO(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_hallo_condition;
	information = dia_addon_merdarion_hallo_info;
	description = "Jak tam praca?";
};


func int dia_addon_merdarion_hallo_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Jak tam praca?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Te krypty stanowi� dla mnie ca�kowit� tajemnic�. Nie jestem w stanie poj��, czemu tak d�ugo nikt ich nie odkry�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Bez trudu odkopali�my wej�cie.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Ludzie byli tak zaj�ci swymi codziennymi obowi�zkami, �e nikt nie przyjrza� si� tym budynkom.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Nie mam na to innego wyt�umaczenia.
};


instance DIA_ADDON_MERDARION_AUFGABE(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_aufgabe_condition;
	information = dia_addon_merdarion_aufgabe_info;
	description = "Jakie masz zadanie?";
};


func int dia_addon_merdarion_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_aufgabe_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Jakie masz zadanie?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Pr�buj� ustali�, dok�d mo�e prowadzi� ten okr�g�y portal.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//Pomagam te� Nefariusowi w poszukiwaniu zaginionego ornamentu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//To pewne, �e portal prowadzi do innej cz�ci wyspy. Tej, kt�rej jeszcze nie znamy.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//Nie pami�tam, �ebym kiedykolwiek o niej czyta� lub s�ysza�.
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(cronos_nw,"START");
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		b_logentry(TOPIC_ADDON_KDW,"Nefarius szuka brakuj�cego ornamentu.");
	};
};


instance DIA_ADDON_MERDARION_DADURCH(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_dadurch_condition;
	information = dia_addon_merdarion_dadurch_info;
	description = "Naprawd� chcesz przej�� przez portal?";
};


func int dia_addon_merdarion_dadurch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_dadurch_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Naprawd� chcesz przej�� przez portal?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Pewnie. Oczywi�cie pod warunkiem, �e znajdziemy brakuj�cy ornament.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Musz� przyzna�, �e to do�� niebezpieczne przedsi�wzi�cie.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Ale najpierw musimy pozna� przyczyn� tych ci�g�ych trz�sie� ziemi.
};


instance DIA_ADDON_MERDARION_BEDROHUNG(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_bedrohung_condition;
	information = dia_addon_merdarion_bedrohung_info;
	description = "Co wiesz o trz�sieniach ziemi?";
};


func int dia_addon_merdarion_bedrohung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_dadurch))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_bedrohung_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//Co wiesz o trz�sieniach ziemi?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//Wywo�uje je co� znajduj�cego si� po drugiej stronie.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//Prawdopodobnie nag�e przebudzenie kamiennych stra�nik�w jest spowodowane t� sam� przyczyn�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Ale to nie le�y w moich kompetencjach. Saturas i Cronos b�d� pewnie mogli powiedzie� ci wi�cej na ten temat.
};


instance DIA_ADDON_MERDARION_WASDAHINTER2(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_wasdahinter2_condition;
	information = dia_addon_merdarion_wasdahinter2_info;
	description = "Co spodziewasz si� znale�� po drugiej stronie?";
};


func int dia_addon_merdarion_wasdahinter2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_wasdahinter2_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//Co spodziewasz si� znale�� po drugiej stronie?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//Nie jestem tego do ko�ca pewien.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Wydaje mi si�, �e b�dzie tam budynek podobny do tego... oraz odpowiednik portalu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//Reszt� zobaczymy, gdy si� tam dostaniemy.
};


instance DIA_ADDON_MERDARION_PERM(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 99;
	condition = dia_addon_merdarion_perm_condition;
	information = dia_addon_merdarion_perm_info;
	permanent = TRUE;
	description = "Mo�esz nauczy� mnie czego� o magii?";
};


func int dia_addon_merdarion_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//Mo�esz nauczy� mnie czego� o magii?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Kiedy tylko b�dziemy po drugiej stronie, ch�tnie ci pomog�.
};


instance DIA_ADDON_MERDARION_TELEPORTSTEIN(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportstein_condition;
	information = dia_addon_merdarion_teleportstein_info;
	description = "Jak mo�na st�d najszybciej doj�� do miasta?";
};


func int dia_addon_merdarion_teleportstein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_teleportstein_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Jak mo�na st�d najszybciej doj�� do miasta?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Po prostu wr�� t� sam� drog�, kt�r� przyszed�e�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//Albo m�g�by�... Nie. To by�oby zbyt niebezpieczne.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Wydu� to z siebie.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//No dobrze. Budowniczowie tych sal mieli w�asn� metod� podr�owania.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Z tego, co uda�o si� ustali�, znali sztuk� teleportacji.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//Co w tym takiego wyj�tkowego?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//W Khorinis znale�li�my kamienie teleportacyjne.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Wygl�da na to, �e kamie� teleportacyjny ukryty w tych salach przenosi prosto do portu.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Jednak nikomu z nas nie starczy�o odwagi, �eby do nich wej��.
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Jak my�lisz, co si� stanie, je�li spr�buj� go u�y�?",dia_addon_merdarion_teleportstein_ich);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Gdzie jest kamie� teleportacyjny?",dia_addon_merdarion_teleportstein_wo);
};

func void dia_addon_merdarion_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Gdzie jest kamie� teleportacyjny?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//W komnacie ze zbiornikiem s� drzwi. Kamie� jest za nimi.
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Daj mi klucz. Chc� si� temu bli�ej przyjrze�.",dia_addon_merdarion_teleportstein_key);
};

func void dia_addon_merdarion_teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Jak my�lisz, co si� stanie, je�li spr�buj� go u�y�?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Trudno powiedzie�. Za ma�o wiemy na ten temat. Bardzo mo�liwe, �e tego nie prze�yjesz.
};

func void dia_addon_merdarion_teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Daj mi klucz. Chc� si� temu bli�ej przyjrze�.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//Naprawd�? Ale nie bior� za to odpowiedzialno�ci.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Nie gadaj, tylko dawaj.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Skoro nalegasz. Trzymaj.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	b_giveinvitems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GOTPORTALTEMPELWALKTHROUGHKEY = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Merdarion da� mi klucz do zamkni�tych drzwi krypty w pobli�u portalu. Za nimi znajduje si� teleporter, kt�ry, miejmy nadziej�, ode�le mnie z powrotem do miasta portowego.");
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
};


instance DIA_ADDON_MERDARION_WHEREOTHERTELEPORTS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_whereotherteleports_condition;
	information = dia_addon_merdarion_whereotherteleports_info;
	description = "Gdzie s� pozosta�e kamienie teleportacyjne?";
};


func int dia_addon_merdarion_whereotherteleports_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_teleportstein))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_whereotherteleports_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Gdzie s� pozosta�e kamienie teleportacyjne?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Znale�li�my jeszcze tylko jeden. Mniej wi�cej w centrum Khorinis.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//W pobli�u karczmy Martwa Harpia.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"W pobli�u gospody 'Martwa Harpia' prawdopodobnie znajduje si� kolejny teleporter.");
};


instance DIA_ADDON_MERDARION_TELEPORTSTEINSUCCESS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportsteinsuccess_condition;
	information = dia_addon_merdarion_teleportsteinsuccess_info;
	description = "Wygl�da na to, �e kamienie teleportacyjne dzia�aj� naprawd� dobrze.";
};


func int dia_addon_merdarion_teleportsteinsuccess_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_teleportstein) && (SCUSED_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_teleportsteinsuccess_info()
{
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Wygl�da na to, �e kamienie teleportacyjne dzia�aj� naprawd� dobrze.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Naprawd� to zrobi�e�? U�y�e� jednego z nich?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Tak. Wychodzi na to, �e wci�� dzia�aj�.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//Niewiarygodne. P�niej b�d� musia� si� temu bli�ej przyjrze�.
};


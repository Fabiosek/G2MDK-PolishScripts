
instance DIA_ADDON_ESTEBAN_EXIT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 999;
	condition = dia_addon_esteban_exit_condition;
	information = dia_addon_esteban_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_esteban_exit_condition()
{
	if(BODYGUARD_KILLER == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ESTEBAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 900;
	condition = dia_addon_esteban_pickpocket_condition;
	information = dia_addon_esteban_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_esteban_pickpocket_condition()
{
	return c_beklauen(105,500);
};

func void dia_addon_esteban_pickpocket_info()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_BACK,dia_addon_esteban_pickpocket_back);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_PICKPOCKET,dia_addon_esteban_pickpocket_doit);
};

func void dia_addon_esteban_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};

func void dia_addon_esteban_pickpocket_back()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};


instance DIA_ADDON_ESTEBAN_HI(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 2;
	condition = dia_addon_esteban_hi_condition;
	information = dia_addon_esteban_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_esteban_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Wi�c to ty jeste� tym go�ciem, kt�ry wywalczy� sobie wej�cie do obozu.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//Wie�ci szybko si� rozchodz�...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franko by� twardy. Nikt nie �mia� mu si� przeciwstawi�. Nikt poza tob�.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//M�wi� to tylko po to, �eby�my si� dobrze zrozumieli. Je�li spr�bujesz tego samego ze mn�, zabij� ci�.
};


instance DIA_ADDON_ESTEBAN_MINE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_mine_condition;
	information = dia_addon_esteban_mine_info;
	permanent = FALSE;
	description = "Chc� wej�� do kopalni!";
};


func int dia_addon_esteban_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_hi))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Chc� wej�� do kopalni!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//Oczywi�cie, �e tak. Rozmawiasz z w�a�ciw� osob�.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Ka�dy, kto pracuje w kopalni, dostanie �adny udzia� w z�ocie.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//A ja odpowiadam za czerwone kamienie, bez kt�rych Thorus nikogo nie przepu�ci.
};


instance DIA_ADDON_ESTEBAN_ROT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_rot_condition;
	information = dia_addon_esteban_rot_info;
	permanent = FALSE;
	description = "Daj mi jeden z tych czerwonych kamieni.";
};


func int dia_addon_esteban_rot_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_mine))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_rot_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Daj mi jeden z tych czerwonych kamieni.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Pewnie, ale nie za darmo.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Zwykle domagam si� pewnego udzia�u w wykopanym z�ocie.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//Jak tam twoja sprawno�� w kopaniu?
	if(HERO_HACKCHANCE > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//Znasz ju� par� sztuczek, prawda?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Nie wygl�dasz na eksperta w tej dziedzinie...
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//Gdybym da� ci czerwony kamie�, to na pewno nie dlatego, �e jeste� wykwalifikowanym kopaczem.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//Nie, mam dla ciebie inne zadanie.
};


instance DIA_ADDON_ESTEBAN_MIS(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 4;
	condition = dia_addon_esteban_mis_condition;
	information = dia_addon_esteban_mis_info;
	permanent = FALSE;
	description = "Tak?";
};


func int dia_addon_esteban_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//Tak?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Jeden z bandyt�w pr�bowa� mnie usun��. Jednak to ON zosta� usuni�ty przez moich stra�nik�w.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Pewnie chcia� zaj�� twoje miejsce, co?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//To by� dure�! Skretynia�y oprych. Szczerze w�tpi�, �e sam wpad� na ten pomys�.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Nie, wykonywa� czyje� zlecenie...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//A ja mam si� dowiedzie�, kto za tym stoi.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//Niewa�ne, kto wys�a� zab�jc� - zap�aci za to. Znajd� go, a ja wpuszcz� ci� do kopalni.
	if(!Npc_IsDead(senyan) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//W�a�nie dlatego przys�a� mnie tu Senyan.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? On te� dla mnie pracuje. Kaza�em mu mie� oczy szeroko otwarte.
	};
	MIS_JUDAS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ESTEBAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ESTEBAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Mia�a miejsce pr�ba zab�jstwa Estebana. Mam si� dowiedzie�, kto za tym stoi.");
};


instance DIA_ADDON_ESTEBAN_KERL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_kerl_condition;
	information = dia_addon_esteban_kerl_info;
	permanent = FALSE;
	description = "Od czego mam zacz��?";
};


func int dia_addon_esteban_kerl_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_kerl_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//Od czego mam zacz��?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Wszyscy w obozie wiedz� o tym incydencie. Tak wi�c nie musisz tego trzyma� w tajemnicy.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Spr�buj si� dowiedzie�, kto jest po mojej stronie, a kto nie!
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Porozmawiaj ze Snafem. Ten gruby kucharzyna zawsze du�o wie.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Aby wytropi� spiskowca, powinienem porozmawia� ze wszystkimi lud�mi w obozie i ustali�, po czyjej s� stronie. Najlepiej rozpocz�� od Snafa. Dociera do niego mn�stwo plotek.");
};


instance DIA_ADDON_ESTEBAN_ARMOR(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 9;
	condition = dia_addon_esteban_armor_condition;
	information = dia_addon_esteban_armor_info;
	permanent = FALSE;
	description = "Potrzebuj� lepszego pancerza.";
};


func int dia_addon_esteban_armor_condition()
{
	if(HUNO_ARMORCHEAP == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Potrzebuj� lepszego pancerza.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Po co? Masz ju� zbroj�. Musi ci wystarczy�.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Popro�, jak wykonasz zadanie...
	};
};


instance DIA_ADDON_ESTEBAN_AUFTRAG(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_auftrag_condition;
	information = dia_addon_esteban_auftrag_info;
	permanent = TRUE;
	description = "Co do tego zadania...";
};


func int dia_addon_esteban_auftrag_condition()
{
	if(((MIS_JUDAS == LOG_RUNNING) || (MIS_JUDAS == LOG_SUCCESS)) && (BODYGUARD_KILLER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//Co do tego zadania...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//S�uchaj, mam tak�e inne sprawy, kt�rymi musz� si� zajmowa�.
	if(MIS_JUDAS == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//Och, my�la�em, �e zaciekawi ci� informacja o tym, kto sta� za pr�b� zab�jstwa...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Kto to jest? Podaj mi imi�, �eby moi stra�nicy mogli mu poder�n�� gard�o.
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//To handlarz Fisk. Siedzi sobie teraz w karczmie i popija. Nie ma poj�cia, �e wiem...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Doskona�a robota, ch�opcze. Moi stra�nicy si� nim zajm�...
		AI_TurnToNPC(self,wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Ch�opaki, s�yszeli�cie! Id�cie po tego Fiska.
		AI_TurnToNPC(self,other);
		BODYGUARD_KILLER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Wr��, gdy dowiesz si�, kto to by�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ESTEBAN_AWAY(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_away_condition;
	information = dia_addon_esteban_away_info;
	permanent = FALSE;
	description = "I co teraz?";
};


func int dia_addon_esteban_away_condition()
{
	if(BODYGUARD_KILLER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_away_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//I co teraz?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//Teraz? Powiem ci, co zrobimy.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk umrze w cierpieniach i dowiedz� si� o tym wszyscy w obozie.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//To b�dzie dla nich ostrze�enie.
	b_startotherroutine(wache_01,"AMBUSH");
	b_startotherroutine(wache_02,"AMBUSH");
};


instance DIA_ADDON_ESTEBAN_STONE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_stone_condition;
	information = dia_addon_esteban_stone_info;
	permanent = FALSE;
	description = "Dobra, a czy dostan� teraz czerwony kamie�?";
};


func int dia_addon_esteban_stone_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_away) && (BODYGUARD_KILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_stone_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Dobra, a czy dostan� teraz czerwony kamie�?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Dobrze si� spisa�e�. Kto� taki jak ty nie powinien siedzie� w kopalni.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Bardziej mi si� przydasz w obozie. Zostaniesz tu i b�dziesz dalej dla mnie pracowa�.
};


instance DIA_ADDON_ESTEBAN_NOT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_not_condition;
	information = dia_addon_esteban_not_info;
	permanent = FALSE;
	description = "Zastanowi� si� nad tym.";
};


func int dia_addon_esteban_not_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_not_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Zastanowi� si� nad tym.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//Najwyra�niej zapomnia�e�, z kim rozmawiasz. To ja jestem szefem w obozie i b�dziesz robi�, co ci ka��.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//A ja m�wi�, �e b�dziesz pracowa� dla mnie i dla nikogo innego. Zrozumia�e�?
};


instance DIA_ADDON_ESTEBAN_FIGHT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 6;
	condition = dia_addon_esteban_fight_condition;
	information = dia_addon_esteban_fight_info;
	permanent = FALSE;
	description = "Chyba �artujesz?";
};


func int dia_addon_esteban_fight_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//Chyba �artujesz. Nie taka by�a umowa.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Nie ka�demu zaproponowa�bym co� takiego. Oczywi�cie, je�li ci si� co� nie podoba, mo�esz zawsze opu�ci� obozowisko...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//A mo�e dotrzymasz s�owa i dasz mi czerwony kamie�?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hej - jeszcze jedno s�owo i moi stra�nicy zajm� si� tak�e tob�.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//Jacy stra�nicy?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Co? Ach, rozumiem. Chcesz mnie zdradzi�. Kiepski pomys�.
	BODYGUARD_KILLER = FALSE;
	b_killnpc(wache_01);
	b_killnpc(wache_02);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_ESTEBAN_DUELL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_duell_condition;
	information = dia_addon_esteban_duell_info;
	permanent = FALSE;
	description = "DAWAJ czerwony kamie�, bo sam go sobie wezm�.";
};


func int dia_addon_esteban_duell_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot) && (BODYGUARD_KILLER != TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_duell_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//DAWAJ czerwony kamie�, bo sam go sobie wezm�.
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//Chyba znudzi�o ci si� �ycie. Dobrze, zrobi� ci przys�ug� i pomog� rozwi�za� ten problem!!!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


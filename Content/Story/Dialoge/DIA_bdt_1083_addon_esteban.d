
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
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Wiêc to ty jesteœ tym goœciem, który wywalczy³ sobie wejœcie do obozu.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//Wieœci szybko siê rozchodz¹...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franko by³ twardy. Nikt nie œmia³ mu siê przeciwstawiæ. Nikt poza tob¹.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Mówiê to tylko po to, ¿ebyœmy siê dobrze zrozumieli. Jeœli spróbujesz tego samego ze mn¹, zabijê ciê.
};


instance DIA_ADDON_ESTEBAN_MINE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_mine_condition;
	information = dia_addon_esteban_mine_info;
	permanent = FALSE;
	description = "Chcê wejœæ do kopalni!";
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
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Chcê wejœæ do kopalni!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//Oczywiœcie, ¿e tak. Rozmawiasz z w³aœciw¹ osob¹.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Ka¿dy, kto pracuje w kopalni, dostanie ³adny udzia³ w z³ocie.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//A ja odpowiadam za czerwone kamienie, bez których Thorus nikogo nie przepuœci.
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
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Zwykle domagam siê pewnego udzia³u w wykopanym z³ocie.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//Jak tam twoja sprawnoœæ w kopaniu?
	if(HERO_HACKCHANCE > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//Znasz ju¿ parê sztuczek, prawda?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Nie wygl¹dasz na eksperta w tej dziedzinie...
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//Gdybym da³ ci czerwony kamieñ, to na pewno nie dlatego, ¿e jesteœ wykwalifikowanym kopaczem.
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
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Jeden z bandytów próbowa³ mnie usun¹æ. Jednak to ON zosta³ usuniêty przez moich stra¿ników.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Pewnie chcia³ zaj¹æ twoje miejsce, co?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//To by³ dureñ! Skretynia³y oprych. Szczerze w¹tpiê, ¿e sam wpad³ na ten pomys³.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Nie, wykonywa³ czyjeœ zlecenie...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//A ja mam siê dowiedzieæ, kto za tym stoi.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//Niewa¿ne, kto wys³a³ zabójcê - zap³aci za to. ZnajdŸ go, a ja wpuszczê ciê do kopalni.
	if(!Npc_IsDead(senyan) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//W³aœnie dlatego przys³a³ mnie tu Senyan.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? On te¿ dla mnie pracuje. Kaza³em mu mieæ oczy szeroko otwarte.
	};
	MIS_JUDAS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ESTEBAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ESTEBAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Mia³a miejsce próba zabójstwa Estebana. Mam siê dowiedzieæ, kto za tym stoi.");
};


instance DIA_ADDON_ESTEBAN_KERL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_kerl_condition;
	information = dia_addon_esteban_kerl_info;
	permanent = FALSE;
	description = "Od czego mam zacz¹æ?";
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
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//Od czego mam zacz¹æ?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Wszyscy w obozie wiedz¹ o tym incydencie. Tak wiêc nie musisz tego trzymaæ w tajemnicy.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Spróbuj siê dowiedzieæ, kto jest po mojej stronie, a kto nie!
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Porozmawiaj ze Snafem. Ten gruby kucharzyna zawsze du¿o wie.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Aby wytropiæ spiskowca, powinienem porozmawiaæ ze wszystkimi ludŸmi w obozie i ustaliæ, po czyjej s¹ stronie. Najlepiej rozpocz¹æ od Snafa. Dociera do niego mnóstwo plotek.");
};


instance DIA_ADDON_ESTEBAN_ARMOR(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 9;
	condition = dia_addon_esteban_armor_condition;
	information = dia_addon_esteban_armor_info;
	permanent = FALSE;
	description = "Potrzebujê lepszego pancerza.";
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
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Potrzebujê lepszego pancerza.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Po co? Masz ju¿ zbrojê. Musi ci wystarczyæ.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Poproœ, jak wykonasz zadanie...
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
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//S³uchaj, mam tak¿e inne sprawy, którymi muszê siê zajmowaæ.
	if(MIS_JUDAS == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//Och, myœla³em, ¿e zaciekawi ciê informacja o tym, kto sta³ za prób¹ zabójstwa...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Kto to jest? Podaj mi imiê, ¿eby moi stra¿nicy mogli mu poder¿n¹æ gard³o.
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//To handlarz Fisk. Siedzi sobie teraz w karczmie i popija. Nie ma pojêcia, ¿e wiem...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Doskona³a robota, ch³opcze. Moi stra¿nicy siê nim zajm¹...
		AI_TurnToNPC(self,wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Ch³opaki, s³yszeliœcie! IdŸcie po tego Fiska.
		AI_TurnToNPC(self,other);
		BODYGUARD_KILLER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Wróæ, gdy dowiesz siê, kto to by³.
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
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk umrze w cierpieniach i dowiedz¹ siê o tym wszyscy w obozie.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//To bêdzie dla nich ostrze¿enie.
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
	description = "Dobra, a czy dostanê teraz czerwony kamieñ?";
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
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Dobra, a czy dostanê teraz czerwony kamieñ?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Dobrze siê spisa³eœ. Ktoœ taki jak ty nie powinien siedzieæ w kopalni.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Bardziej mi siê przydasz w obozie. Zostaniesz tu i bêdziesz dalej dla mnie pracowa³.
};


instance DIA_ADDON_ESTEBAN_NOT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_not_condition;
	information = dia_addon_esteban_not_info;
	permanent = FALSE;
	description = "Zastanowiê siê nad tym.";
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
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Zastanowiê siê nad tym.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//NajwyraŸniej zapomnia³eœ, z kim rozmawiasz. To ja jestem szefem w obozie i bêdziesz robi³, co ci ka¿ê.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//A ja mówiê, ¿e bêdziesz pracowa³ dla mnie i dla nikogo innego. Zrozumia³eœ?
};


instance DIA_ADDON_ESTEBAN_FIGHT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 6;
	condition = dia_addon_esteban_fight_condition;
	information = dia_addon_esteban_fight_info;
	permanent = FALSE;
	description = "Chyba ¿artujesz?";
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
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//Chyba ¿artujesz. Nie taka by³a umowa.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Nie ka¿demu zaproponowa³bym coœ takiego. Oczywiœcie, jeœli ci siê coœ nie podoba, mo¿esz zawsze opuœciæ obozowisko...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//A mo¿e dotrzymasz s³owa i dasz mi czerwony kamieñ?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hej - jeszcze jedno s³owo i moi stra¿nicy zajm¹ siê tak¿e tob¹.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//Jacy stra¿nicy?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Co? Ach, rozumiem. Chcesz mnie zdradziæ. Kiepski pomys³.
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
	description = "DAWAJ czerwony kamieñ, bo sam go sobie wezmê.";
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
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//DAWAJ czerwony kamieñ, bo sam go sobie wezmê.
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//Chyba znudzi³o ci siê ¿ycie. Dobrze, zrobiê ci przys³ugê i pomogê rozwi¹zaæ ten problem!!!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


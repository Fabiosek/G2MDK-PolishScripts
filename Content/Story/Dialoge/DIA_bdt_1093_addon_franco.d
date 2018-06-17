
instance DIA_ADDON_FRANCO_EXIT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 999;
	condition = dia_addon_franco_exit_condition;
	information = dia_addon_franco_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_franco_exit_condition()
{
	return TRUE;
};

func void dia_addon_franco_exit_info()
{
	if((FRANCO_EXIT == FALSE) && (MIS_HLPLOGAN == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Nie zab³¹dŸ, bo skoñczysz jako miêso dla wê¿y.
		FRANCO_EXIT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_PICKPOCKET(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 900;
	condition = dia_franco_pickpocket_condition;
	information = dia_franco_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego amuletu bêdzie ryzykowna)";
};


func int dia_franco_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && ((other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)) && (Npc_HasItems(self,itam_addon_franco) >= 1)))
	{
		return TRUE;
	};
};

func void dia_franco_pickpocket_info()
{
	Info_ClearChoices(dia_franco_pickpocket);
	Info_AddChoice(dia_franco_pickpocket,DIALOG_BACK,dia_franco_pickpocket_back);
	Info_AddChoice(dia_franco_pickpocket,DIALOG_PICKPOCKET,dia_franco_pickpocket_doit);
};

func void dia_franco_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itam_addon_franco,1);
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_franco_pickpocket);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX] = 196;
		self.attribute[ATR_HITPOINTS] = 196;
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_franco_pickpocket_back()
{
	Info_ClearChoices(dia_franco_pickpocket);
};


instance DIA_ADDON_FRANCO_HI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 1;
	condition = dia_addon_franco_hi_condition;
	information = dia_addon_franco_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_franco_hi_condition()
{
	return TRUE;
};

func void dia_addon_franco_hi_info()
{
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"Jeœli wykonam dobr¹ robotê dla Franka, wpuœci mnie do obozu.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hej, czego szukasz? Chcesz wejœæ do obozu?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Tak, jestem...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//Nie interesuje mnie, coœ ty za jeden. Jestem Franko, przywódca tego obozu.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Je¿eli wyka¿esz siê poza obozem, zabiorê ciê do œrodka.
	if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Stra¿nik bramy, Ramon, powie ci, kiedy w obozie bêd¹ potrzebni nowi ludzie. Porozmawiaj z nim.
		b_logentry(TOPIC_ADDON_FRANCO,"Mam zapytaæ Ramona, stra¿nika przy bramie, czy potrzebuj¹ w obozie nowych ludzi.");
	};
};


instance DIA_ADDON_FRANCO_HAI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 2;
	condition = dia_addon_franco_hai_condition;
	information = dia_addon_franco_hai_info;
	permanent = FALSE;
	description = "Thorus potrzebuje nowego cz³owieka.";
};


func int dia_addon_franco_hai_condition()
{
	if(RAMON_NEWS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_franco_hai_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus potrzebuje nowego cz³owieka.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Dobrze, zajmê siê tym.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Chwila, a co ze mn¹?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//Nic jeszcze nie zrobi³eœ.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Sporo ju¿ osi¹gn¹³em, ale ty nic o tym nie wiesz...
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Dobra, daæ ci szansê? Proszê bardzo. Zabieraj dupsko do Logana. Ostatnio dokuczaj¹ mu bagienne wê¿e.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Pomó¿ mu siê ich pozbyæ, a wtedy dostaniesz siê do obozu.
	b_logentry(TOPIC_ADDON_FRANCO,"Przed wpuszczeniem mnie do obozu Franko chce, ¿ebym pomóg³ Loganowi.");
};


instance DIA_ADDON_FRANCO_WO(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 3;
	condition = dia_addon_franco_wo_condition;
	information = dia_addon_franco_wo_info;
	permanent = FALSE;
	description = "Gdzie znajdê tego Logana?";
};


func int dia_addon_franco_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_hai) && !Npc_IsDead(logan) && (MIS_HLPLOGAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_franco_wo_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Gdzie znajdê tego Logana?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Gdy staniesz przed wejœciem do obozu, idŸ w lewo wzd³u¿ urwiska. To kawa³ek drogi w bagno.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_TOT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 5;
	condition = dia_addon_franco_tot_condition;
	information = dia_addon_franco_tot_info;
	permanent = FALSE;
	description = "Logan nie ¿yje.";
};


func int dia_addon_franco_tot_condition()
{
	if((MIS_HLPLOGAN != LOG_SUCCESS) && Npc_IsDead(logan) && Npc_KnowsInfo(other,dia_addon_franco_hai))
	{
		return TRUE;
	};
};

func void dia_addon_franco_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Cholera. By³ najlepszym myœliwym, jakiego mieliœmy. Szlag by to trafi³!
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Wys³a³em do obozu kogoœ innego.
	if(MIS_HLPLOGAN == LOG_RUNNING)
	{
		MIS_HLPLOGAN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_ADDON_FRANCO_HAISUCCESS(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 6;
	condition = dia_addon_franco_haisuccess_condition;
	information = dia_addon_franco_haisuccess_info;
	permanent = FALSE;
	description = "Pomog³em Loganowi...";
};


func int dia_addon_franco_haisuccess_condition()
{
	if((MIS_HLPLOGAN == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_franco_hai))
	{
		return TRUE;
	};
};

func void dia_addon_franco_haisuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//Pomog³em Loganowi...
	if(Npc_IsDead(logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//...ale on tego nie prze¿y³.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//Dobra, walczy³eœ z wê¿ami - mo¿esz siê przydaæ - przynajmniej bardziej ni¿ wiêkszoœæ tutejszych ch³opaków.
	b_giveplayerxp(XP_ADDON_HLPLOGAN);
	b_logentry(TOPIC_ADDON_FRANCO,"Pomog³em Loganowi, ale to nie wystarczy³o, aby Franko wpuœci³ mnie do obozu.");
};


instance DIA_ADDON_FRANCO_MIS2(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 7;
	condition = dia_addon_franco_mis2_condition;
	information = dia_addon_franco_mis2_info;
	permanent = FALSE;
	description = "Czyli mogê wejœæ do obozu?";
};


func int dia_addon_franco_mis2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_haisuccess) || Npc_KnowsInfo(other,dia_addon_franco_tot))
	{
		return TRUE;
	};
};

func void dia_addon_franco_mis2_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//Czyli mogê wejœæ do obozu?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//S³uchaj - jest jeszcze jedna rzecz, do której mi siê przydasz.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//Kilka dni temu wys³a³em na bagna Edgora.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//Mia³ dla mnie zdobyæ star¹ kamienn¹ tabliczkê - ale od tamtej pory nikt go nie widzia³.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Poszukaj go i przynieœ mi tê przeklêt¹ tabliczkê.
	MIS_HLPEDGOR = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATE,"Franko chce dostaæ kamienn¹ tablicê, któr¹ mia³ mu przynieœæ Edgor. Teraz ja muszê j¹ zdobyæ.");
	b_logentry(TOPIC_ADDON_FRANCO,"Przed wpuszczeniem mnie do obozu Franko chce, ¿ebym pomóg³ Edgarowi.");
};


instance DIA_ADDON_FRANCO_WHILE(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 8;
	condition = dia_addon_franco_while_condition;
	information = dia_addon_franco_while_info;
	permanent = FALSE;
	description = "A jak to wygl¹da od strony z³ota?";
};


func int dia_addon_franco_while_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_haisuccess))
	{
		return TRUE;
	};
};

func void dia_addon_franco_while_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//A jak to wygl¹da od strony z³ota?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Dostanê zap³atê za moj¹ pracê na bagnach?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//Chcesz trochê z³ota? Pewnie, ile potrzebujesz? Piêædziesi¹t samorodków? Sto? Dam ci tyle, ile zdo³asz udŸwign¹æ...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//Co ty sobie wyobra¿asz... ¿e co? ¯arty sobie stroisz?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//A teraz ruszaj i zrób coœ po¿ytecznego. Bo inaczej nie dostaniesz ani bry³ki z³ota!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_WOEDGOR(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 9;
	condition = dia_addon_franco_woedgor_condition;
	information = dia_addon_franco_woedgor_info;
	permanent = TRUE;
	description = "Wiêc gdzie znajdê tego Edgora?";
};


func int dia_addon_franco_woedgor_condition()
{
	if((MIS_HLPEDGOR == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_stone_04) < 1))
	{
		return TRUE;
	};
};

func void dia_addon_franco_woedgor_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//Wiêc gdzie znajdê tego Edgora?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Chcesz znaæ ³atwiejsz¹ czy krótsz¹ drogê?
	Info_ClearChoices(dia_addon_franco_woedgor);
	Info_AddChoice(dia_addon_franco_woedgor,"Chcê siê tam dostaæ szybko.",dia_addon_franco_woedgor_fast);
	Info_AddChoice(dia_addon_franco_woedgor,"Powiedz mi, jaka jest ³atwiejsza droga.",dia_addon_franco_woedgor_easy);
};

func void b_addon_franco_there()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//Wszêdzie tam s¹ ruiny. Gdzieœ w nich siedzi.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//Myœlê, ¿e jest doœæ rozgarniêty, ¿eby rozpaliæ ognisko, które powinieneœ zobaczyæ.
};

func void dia_addon_franco_woedgor_easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//Powiedz mi, jaka jest ³atwiejsza droga.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//IdŸ mostem a¿ do bramy. Tam powinien staæ Sancho.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Skrêæ tam w lewo i idŸ wzd³u¿ mostu.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};

func void dia_addon_franco_woedgor_fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Chcê siê tam dostaæ szybko.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Dobra, trochê w lewo i w bagno.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};


instance DIA_ADDON_FRANCO_TAFEL(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 10;
	condition = dia_addon_franco_tafel_condition;
	information = dia_addon_franco_tafel_info;
	permanent = FALSE;
	description = "Tu masz tê kamienn¹ tabliczkê.";
};


func int dia_addon_franco_tafel_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_04) >= 1) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_franco_tafel_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Tu masz tê kamienn¹ tabliczkê.
	b_giveinvitems(other,self,itmi_addon_stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Dobrze, znakomicie. Kruk bêdzie z ciebie zadowolony.
	MIS_HLPEDGOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HLPEDGOR);
	b_logentry(TOPIC_ADDON_FRANCO,"Przynios³em Frankowi kamienn¹ tablicê, której szuka³.");
};


instance DIA_ADDON_FRANCO_JEMANDANDEREN(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 11;
	condition = dia_addon_franco_jemandanderen_condition;
	information = dia_addon_franco_jemandanderen_info;
	permanent = FALSE;
	description = "A co z obozem? Mogê w koñcu wejœæ?";
};


func int dia_addon_franco_jemandanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_tafel))
	{
		return TRUE;
	};
};

func void dia_addon_franco_jemandanderen_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//A co z obozem? Mogê w koñcu wejœæ?
	if(!Npc_IsDead(logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Nie, wys³a³em tam Logana. Zajmowa³ wy¿sz¹ pozycjê na mojej liœcie.
		LOGAN_INSIDE = TRUE;
		AI_Teleport(logan,"BL_INN_CORNER_02");
		b_startotherroutine(logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Nie, wys³a³em ju¿ kogoœ innego.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//W obozie nie potrzebuj¹ nikogo wiêcej.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Poza tym przydasz mi siê tutaj, skoro nie ma ju¿ Logana.
	b_logentry(TOPIC_ADDON_FRANCO,"Franko nie wpuœci mnie do obozu. Coœ mi siê zdaje, ¿e bêdê musia³ siê jakoœ pozbyæ tego 'frankowego problemu'...");
};


instance DIA_ADDON_FRANCO_FIGHT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 12;
	condition = dia_addon_franco_fight_condition;
	information = dia_addon_franco_fight_info;
	permanent = TRUE;
	description = "Wpuœæ mnie, NATYCHMIAST!";
};


func int dia_addon_franco_fight_condition()
{
	return TRUE;
};

func void dia_addon_franco_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//Wpuœæ mnie, NATYCHMIAST!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//A co siê stanie, jeœli odmówiê?
	Info_ClearChoices(dia_addon_franco_fight);
	Info_AddChoice(dia_addon_franco_fight,"W takim razie jeszcze trochê poczekam...",dia_addon_franco_fight_nothing);
	Info_AddChoice(dia_addon_franco_fight,"Bardzo tego po¿a³ujesz.",dia_addon_franco_fight_duel);
};

func void dia_addon_franco_fight_duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Bardzo tego po¿a³ujesz.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Próbujesz MI groziæ? Myœlê, ¿e pora ciê czegoœ nauczyæ...
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_addon_franco_fight_nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//W takim razie jeszcze trochê poczekam...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//W³aœnie.
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_PIG(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 13;
	condition = dia_addon_franco_pig_condition;
	information = dia_addon_franco_pig_info;
	permanent = TRUE;
	description = "Ty œwinio! Zaraz ciê za³atwiê!";
};


func int dia_addon_franco_pig_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_jemandanderen))
	{
		return TRUE;
	};
};

func void dia_addon_franco_pig_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Ty œwinio! Zaraz ciê za³atwiê!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//Taki kurdupel, jak ty, chce siê ze mn¹ mierzyæ? Poczekaj tylko!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


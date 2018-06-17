
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
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Nie zab��d�, bo sko�czysz jako mi�so dla w�y.
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
	description = "(Kradzie� tego amuletu b�dzie ryzykowna)";
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
	b_logentry(TOPIC_ADDON_FRANCO,"Je�li wykonam dobr� robot� dla Franka, wpu�ci mnie do obozu.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hej, czego szukasz? Chcesz wej�� do obozu?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Tak, jestem...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//Nie interesuje mnie, co� ty za jeden. Jestem Franko, przyw�dca tego obozu.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Je�eli wyka�esz si� poza obozem, zabior� ci� do �rodka.
	if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Stra�nik bramy, Ramon, powie ci, kiedy w obozie b�d� potrzebni nowi ludzie. Porozmawiaj z nim.
		b_logentry(TOPIC_ADDON_FRANCO,"Mam zapyta� Ramona, stra�nika przy bramie, czy potrzebuj� w obozie nowych ludzi.");
	};
};


instance DIA_ADDON_FRANCO_HAI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 2;
	condition = dia_addon_franco_hai_condition;
	information = dia_addon_franco_hai_info;
	permanent = FALSE;
	description = "Thorus potrzebuje nowego cz�owieka.";
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
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus potrzebuje nowego cz�owieka.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Dobrze, zajm� si� tym.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Chwila, a co ze mn�?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//Nic jeszcze nie zrobi�e�.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Sporo ju� osi�gn��em, ale ty nic o tym nie wiesz...
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Dobra, da� ci szans�? Prosz� bardzo. Zabieraj dupsko do Logana. Ostatnio dokuczaj� mu bagienne w�e.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Pom� mu si� ich pozby�, a wtedy dostaniesz si� do obozu.
	b_logentry(TOPIC_ADDON_FRANCO,"Przed wpuszczeniem mnie do obozu Franko chce, �ebym pom�g� Loganowi.");
};


instance DIA_ADDON_FRANCO_WO(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 3;
	condition = dia_addon_franco_wo_condition;
	information = dia_addon_franco_wo_info;
	permanent = FALSE;
	description = "Gdzie znajd� tego Logana?";
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
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Gdzie znajd� tego Logana?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Gdy staniesz przed wej�ciem do obozu, id� w lewo wzd�u� urwiska. To kawa�ek drogi w bagno.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_TOT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 5;
	condition = dia_addon_franco_tot_condition;
	information = dia_addon_franco_tot_info;
	permanent = FALSE;
	description = "Logan nie �yje.";
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
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan nie �yje.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Cholera. By� najlepszym my�liwym, jakiego mieli�my. Szlag by to trafi�!
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Wys�a�em do obozu kogo� innego.
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
	description = "Pomog�em Loganowi...";
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
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//Pomog�em Loganowi...
	if(Npc_IsDead(logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//...ale on tego nie prze�y�.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//Dobra, walczy�e� z w�ami - mo�esz si� przyda� - przynajmniej bardziej ni� wi�kszo�� tutejszych ch�opak�w.
	b_giveplayerxp(XP_ADDON_HLPLOGAN);
	b_logentry(TOPIC_ADDON_FRANCO,"Pomog�em Loganowi, ale to nie wystarczy�o, aby Franko wpu�ci� mnie do obozu.");
};


instance DIA_ADDON_FRANCO_MIS2(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 7;
	condition = dia_addon_franco_mis2_condition;
	information = dia_addon_franco_mis2_info;
	permanent = FALSE;
	description = "Czyli mog� wej�� do obozu?";
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
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//Czyli mog� wej�� do obozu?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//S�uchaj - jest jeszcze jedna rzecz, do kt�rej mi si� przydasz.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//Kilka dni temu wys�a�em na bagna Edgora.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//Mia� dla mnie zdoby� star� kamienn� tabliczk� - ale od tamtej pory nikt go nie widzia�.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Poszukaj go i przynie� mi t� przekl�t� tabliczk�.
	MIS_HLPEDGOR = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATE,"Franko chce dosta� kamienn� tablic�, kt�r� mia� mu przynie�� Edgor. Teraz ja musz� j� zdoby�.");
	b_logentry(TOPIC_ADDON_FRANCO,"Przed wpuszczeniem mnie do obozu Franko chce, �ebym pom�g� Edgarowi.");
};


instance DIA_ADDON_FRANCO_WHILE(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 8;
	condition = dia_addon_franco_while_condition;
	information = dia_addon_franco_while_info;
	permanent = FALSE;
	description = "A jak to wygl�da od strony z�ota?";
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
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//A jak to wygl�da od strony z�ota?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Dostan� zap�at� za moj� prac� na bagnach?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//Chcesz troch� z�ota? Pewnie, ile potrzebujesz? Pi��dziesi�t samorodk�w? Sto? Dam ci tyle, ile zdo�asz ud�wign��...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//Co ty sobie wyobra�asz... �e co? �arty sobie stroisz?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//A teraz ruszaj i zr�b co� po�ytecznego. Bo inaczej nie dostaniesz ani bry�ki z�ota!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_WOEDGOR(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 9;
	condition = dia_addon_franco_woedgor_condition;
	information = dia_addon_franco_woedgor_info;
	permanent = TRUE;
	description = "Wi�c gdzie znajd� tego Edgora?";
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
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//Wi�c gdzie znajd� tego Edgora?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Chcesz zna� �atwiejsz� czy kr�tsz� drog�?
	Info_ClearChoices(dia_addon_franco_woedgor);
	Info_AddChoice(dia_addon_franco_woedgor,"Chc� si� tam dosta� szybko.",dia_addon_franco_woedgor_fast);
	Info_AddChoice(dia_addon_franco_woedgor,"Powiedz mi, jaka jest �atwiejsza droga.",dia_addon_franco_woedgor_easy);
};

func void b_addon_franco_there()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//Wsz�dzie tam s� ruiny. Gdzie� w nich siedzi.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//My�l�, �e jest do�� rozgarni�ty, �eby rozpali� ognisko, kt�re powiniene� zobaczy�.
};

func void dia_addon_franco_woedgor_easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//Powiedz mi, jaka jest �atwiejsza droga.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Id� mostem a� do bramy. Tam powinien sta� Sancho.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Skr�� tam w lewo i id� wzd�u� mostu.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};

func void dia_addon_franco_woedgor_fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Chc� si� tam dosta� szybko.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Dobra, troch� w lewo i w bagno.
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
	description = "Tu masz t� kamienn� tabliczk�.";
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
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Tu masz t� kamienn� tabliczk�.
	b_giveinvitems(other,self,itmi_addon_stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Dobrze, znakomicie. Kruk b�dzie z ciebie zadowolony.
	MIS_HLPEDGOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HLPEDGOR);
	b_logentry(TOPIC_ADDON_FRANCO,"Przynios�em Frankowi kamienn� tablic�, kt�rej szuka�.");
};


instance DIA_ADDON_FRANCO_JEMANDANDEREN(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 11;
	condition = dia_addon_franco_jemandanderen_condition;
	information = dia_addon_franco_jemandanderen_info;
	permanent = FALSE;
	description = "A co z obozem? Mog� w ko�cu wej��?";
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
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//A co z obozem? Mog� w ko�cu wej��?
	if(!Npc_IsDead(logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Nie, wys�a�em tam Logana. Zajmowa� wy�sz� pozycj� na mojej li�cie.
		LOGAN_INSIDE = TRUE;
		AI_Teleport(logan,"BL_INN_CORNER_02");
		b_startotherroutine(logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Nie, wys�a�em ju� kogo� innego.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//W obozie nie potrzebuj� nikogo wi�cej.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Poza tym przydasz mi si� tutaj, skoro nie ma ju� Logana.
	b_logentry(TOPIC_ADDON_FRANCO,"Franko nie wpu�ci mnie do obozu. Co� mi si� zdaje, �e b�d� musia� si� jako� pozby� tego 'frankowego problemu'...");
};


instance DIA_ADDON_FRANCO_FIGHT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 12;
	condition = dia_addon_franco_fight_condition;
	information = dia_addon_franco_fight_info;
	permanent = TRUE;
	description = "Wpu�� mnie, NATYCHMIAST!";
};


func int dia_addon_franco_fight_condition()
{
	return TRUE;
};

func void dia_addon_franco_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//Wpu�� mnie, NATYCHMIAST!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//A co si� stanie, je�li odm�wi�?
	Info_ClearChoices(dia_addon_franco_fight);
	Info_AddChoice(dia_addon_franco_fight,"W takim razie jeszcze troch� poczekam...",dia_addon_franco_fight_nothing);
	Info_AddChoice(dia_addon_franco_fight,"Bardzo tego po�a�ujesz.",dia_addon_franco_fight_duel);
};

func void dia_addon_franco_fight_duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Bardzo tego po�a�ujesz.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Pr�bujesz MI grozi�? My�l�, �e pora ci� czego� nauczy�...
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_addon_franco_fight_nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//W takim razie jeszcze troch� poczekam...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//W�a�nie.
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
	description = "Ty �winio! Zaraz ci� za�atwi�!";
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
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Ty �winio! Zaraz ci� za�atwi�!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//Taki kurdupel, jak ty, chce si� ze mn� mierzy�? Poczekaj tylko!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


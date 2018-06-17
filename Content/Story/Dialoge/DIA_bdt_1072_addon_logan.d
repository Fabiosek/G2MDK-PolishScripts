
instance DIA_ADDON_LOGAN_EXIT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 999;
	condition = dia_addon_logan_exit_condition;
	information = dia_addon_logan_exit_info;
	permanent = TRUE;
	description = "Przyjdê póŸniej...";
};


func int dia_addon_logan_exit_condition()
{
	return TRUE;
};

func void dia_addon_logan_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Przyjdê póŸniej...
	if(((!MIS_HLPLOGAN == LOG_RUNNING) || (!MIS_HLPLOGAN == LOG_SUCCESS)) && (LOGAN_INSIDE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//Tak, uciekaj. Bêdê tu sta³ i zatrzymam ka¿dego, kto spróbuje siê zbli¿yæ.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LOGAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 900;
	condition = dia_addon_logan_pickpocket_condition;
	information = dia_addon_logan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_logan_pickpocket_condition()
{
	return c_beklauen(59,50);
};

func void dia_addon_logan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_BACK,dia_addon_logan_pickpocket_back);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_PICKPOCKET,dia_addon_logan_pickpocket_doit);
};

func void dia_addon_logan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_logan_pickpocket);
};

func void dia_addon_logan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
};


instance DIA_ADDON_BDT_1072_LOGAN_MINE(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_mine_condition;
	information = dia_addon_logan_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_logan_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Uda³o ci siê, co? W porz¹dku, dobrze, ¿e mi pomagasz.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LOGAN_HOW2(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_how2_condition;
	information = dia_addon_logan_how2_info;
	permanent = FALSE;
	description = "Co u ciebie s³ychaæ?";
};


func int dia_addon_logan_how2_condition()
{
	if((LOGAN_INSIDE == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_how2_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Co u ciebie s³ychaæ?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//No có¿, przynajmniej jestem w œrodku. Lucia pêdzi naprawdê mocny bimber.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Esteban nie pozwala mi jednak wejœæ do kopalni. Przynajmniej na razie. Ale dosta³em kilka innych zadañ.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//No i? Co ci kaza³ robiæ?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//Ktoœ próbowa³ zabiæ Estebana. Chce wiedzieæ, kto za tym stoi.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//Esteban s¹dzi, ¿e w sprawê zamieszany jest Snaf. Mam mieæ na niego oko...
};


instance DIA_ADDON_LOGAN_ATTENTAT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_attentat_condition;
	information = dia_addon_logan_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_logan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && (LOGAN_INSIDE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//A wiêc szukasz ludzi, którzy s¹ za to odpowiedzialni?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//Nic o tym nie wiem. Sk¹d niby mia³em siê dowiedzieæ? Siedzia³em jeszcze w bagnie, gdy ca³a ta historia mia³a miejsce.
};


instance DIA_ADDON_LOGAN_HI(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_hi_condition;
	information = dia_addon_logan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_hi_condition()
{
	if((LOGAN_INSIDE == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_logan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Patrzcie, pañstwo, nowa twarz.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Zamierzasz tak staæ czy przyszed³eœ mi pomóc?
	if(Npc_KnowsInfo(other,dia_addon_franco_hi))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franko mnie przys³a³. Mówi³, ¿e przyda ci siê pomoc. To o co chodzi?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//To zale¿y - jakiej pomocy ci trzeba?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//B³otne wê¿e ostatnimi czasy trochê za bardzo siê do nas zbli¿aj¹. Pora zabiæ czêœæ z nich.
	Log_CreateTopic(TOPIC_ADDON_LOGAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LOGAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LOGAN,"Logan chce, ¿ebym zapolowa³ z nim na wê¿e b³otne.");
};


instance DIA_ADDON_LOGAN_WHY(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_why_condition;
	information = dia_addon_logan_why_info;
	permanent = FALSE;
	description = "A co za to dostanê?";
};


func int dia_addon_logan_why_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_why_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//A co za to dostanê?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//Franko pozwoli ci tu gniæ, jeœli nie bêdzie dla ciebie lepszego zastosowania.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Chcesz wejœæ do obozu? No to musisz pomagaæ. Same s³owa nie przybli¿¹ ciê do celu.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Poza tym mogê ci pokazaæ, jak patroszyæ te bestie.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Nie s¹dzê jednak, ¿eby Franko wpuœci³ ciê do œrodka tylko dlatego, ¿e zabijesz parê wê¿y.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Jest tu sporo ludzi, którzy ju¿ trochê czekaj¹.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//I lepiej bêdzie, jeœli nastêpn¹ osob¹, która wejdzie do obozu, bêdê ja...
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Logan mo¿e nauczyæ mnie zdejmowania futra, wyrywania pazurów i zêbów.");
};


instance DIA_ADDON_LOGAN_LAGER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_lager_condition;
	information = dia_addon_logan_lager_info;
	permanent = FALSE;
	description = "Czym jest obóz?";
};


func int dia_addon_logan_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//Czym jest obóz?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//Pytanie powinno brzmieæ: czym NIE jest obóz. Bez wê¿y, bez mokrych dziur... No wiesz, bez BAGNA.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Zamiast tego maj¹ gorza³ê i z³oto. Z tego, co wiem, jest tam nawet jakaœ kobieta. Teraz rozumiesz?
};


instance DIA_ADDON_LOGAN_MIS(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 99;
	condition = dia_addon_logan_mis_condition;
	information = dia_addon_logan_mis_info;
	permanent = FALSE;
	description = "ChodŸmy zabiæ parê b³otnych wê¿y.";
};


func int dia_addon_logan_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//ChodŸmy zabiæ parê b³otnych wê¿y.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//Wygl¹da na to, ¿e zrozumia³eœ, jak siê robi postêpy. Tak jak i... Cii. S³ysza³eœ? S³yszê je.
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//Rozumiem. Co teraz zrobimy?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//Id¹. Na pewno maj¹ ochotê na przek¹skê. Zobaczymy, kto kogo bêdzie jad³. Dalej!
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HLPLOGAN = LOG_RUNNING;
	Wld_InsertNpc(mis_addon_swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(mis_addon_swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(mis_addon_swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_ADDON_LOGAN_TOT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_tot_condition;
	information = dia_addon_logan_tot_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_tot_condition()
{
	if(Npc_IsDead(mis_addon_swampshark_01) && Npc_IsDead(mis_addon_swampshark_02) && Npc_IsDead(mis_addon_swampshark_03) && Npc_KnowsInfo(other,dia_addon_logan_mis))
	{
		return TRUE;
	};
};

func void dia_addon_logan_tot_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Dobry b³otny w¹¿ to martwy b³otny w¹¿. To powinno byæ przestrog¹ dla pozosta³ych.
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//W porz¹dku, masz coœ jeszcze do zrobienia? Bo muszê ruszaæ dalej...
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//W tej chwili nic. Wiesz, kogo musisz poszukaæ, jeœli bêdziesz chcia³ siê czegoœ nauczyæ.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HLPLOGAN = LOG_SUCCESS;
	b_checklog();
	b_logentry(TOPIC_ADDON_FRANCO,"Pomog³em Loganowi. Czas zobaczyæ, co s¹dzi o tym Franko.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_LOGAN_LERN(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 100;
	condition = dia_addon_logan_lern_condition;
	information = dia_addon_logan_lern_info;
	permanent = FALSE;
	description = "Poka¿ mi, jak patroszyæ zwierzêta...";
};


func int dia_addon_logan_lern_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lern_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Poka¿ mi, jak patroszyæ zwierzêta...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Jeœli chcesz siê czegoœ dowiedzieæ o krwiopijcach, zapytaj lepiej Edgora.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//Je¿eli bêdziesz patroszy³ bagienne wê¿e czy jaszczurki, to mo¿e chcesz nauczyæ siê, jak je obdzieraæ ze skóry i wyrywaæ im zêby?
};


instance DIA_ADDON_LOGAN_ALLG(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_allg_condition;
	information = dia_addon_logan_allg_info;
	permanent = TRUE;
	description = "Chcê siê nauczyæ...";
};


func int dia_addon_logan_allg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_logan_allg_info()
{
	Info_ClearChoices(dia_addon_logan_allg);
	Info_AddChoice(dia_addon_logan_allg,DIALOG_BACK,dia_addon_logan_allg_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Wyrywania zêbów",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_logan_allg_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Wyrywania pazurów",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_addon_logan_allg_claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Zdejmowania futra",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_addon_logan_allg_fur);
	};
};

func void dia_addon_logan_allg_back()
{
	Info_ClearChoices(dia_addon_logan_allg);
};

func void dia_addon_logan_allg_teeth()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
};

func void dia_addon_logan_allg_claws()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS);
};

func void dia_addon_logan_allg_fur()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR);
};


var int logan_lohn;

instance DIA_ADDON_LOGAN_HACKER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_hacker_condition;
	information = dia_addon_logan_hacker_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_addon_logan_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_logan_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Co nowego?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej, uda³o mi siê dziêki twojej pomocy! Dosta³em pozwolenie na wejœcie do kopalni!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Nie znam siê na wydobyciu z³ota, ale jakoœ sobie poradzê.
	if(LOGAN_LOHN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//Opanowa³em ju¿ podstawy. Dobrze siê ustaw i wal tak mocno, jak mo¿esz!
		b_upgrade_hero_hackchance(10);
		LOGAN_LOHN = TRUE;
	};
};



instance DIA_ADDON_LOGAN_EXIT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 999;
	condition = dia_addon_logan_exit_condition;
	information = dia_addon_logan_exit_info;
	permanent = TRUE;
	description = "Przyjd� p�niej...";
};


func int dia_addon_logan_exit_condition()
{
	return TRUE;
};

func void dia_addon_logan_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Przyjd� p�niej...
	if(((!MIS_HLPLOGAN == LOG_RUNNING) || (!MIS_HLPLOGAN == LOG_SUCCESS)) && (LOGAN_INSIDE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//Tak, uciekaj. B�d� tu sta� i zatrzymam ka�dego, kto spr�buje si� zbli�y�.
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
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Uda�o ci si�, co? W porz�dku, dobrze, �e mi pomagasz.
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
	description = "Co u ciebie s�ycha�?";
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
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Co u ciebie s�ycha�?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//No c�, przynajmniej jestem w �rodku. Lucia p�dzi naprawd� mocny bimber.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Esteban nie pozwala mi jednak wej�� do kopalni. Przynajmniej na razie. Ale dosta�em kilka innych zada�.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//No i? Co ci kaza� robi�?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//Kto� pr�bowa� zabi� Estebana. Chce wiedzie�, kto za tym stoi.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//Esteban s�dzi, �e w spraw� zamieszany jest Snaf. Mam mie� na niego oko...
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
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//A wi�c szukasz ludzi, kt�rzy s� za to odpowiedzialni?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//Nic o tym nie wiem. Sk�d niby mia�em si� dowiedzie�? Siedzia�em jeszcze w bagnie, gdy ca�a ta historia mia�a miejsce.
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
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Patrzcie, pa�stwo, nowa twarz.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Zamierzasz tak sta� czy przyszed�e� mi pom�c?
	if(Npc_KnowsInfo(other,dia_addon_franco_hi))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franko mnie przys�a�. M�wi�, �e przyda ci si� pomoc. To o co chodzi?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//To zale�y - jakiej pomocy ci trzeba?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//B�otne w�e ostatnimi czasy troch� za bardzo si� do nas zbli�aj�. Pora zabi� cz�� z nich.
	Log_CreateTopic(TOPIC_ADDON_LOGAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LOGAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LOGAN,"Logan chce, �ebym zapolowa� z nim na w�e b�otne.");
};


instance DIA_ADDON_LOGAN_WHY(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_why_condition;
	information = dia_addon_logan_why_info;
	permanent = FALSE;
	description = "A co za to dostan�?";
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
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//A co za to dostan�?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//Franko pozwoli ci tu gni�, je�li nie b�dzie dla ciebie lepszego zastosowania.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Chcesz wej�� do obozu? No to musisz pomaga�. Same s�owa nie przybli�� ci� do celu.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Poza tym mog� ci pokaza�, jak patroszy� te bestie.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Nie s�dz� jednak, �eby Franko wpu�ci� ci� do �rodka tylko dlatego, �e zabijesz par� w�y.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Jest tu sporo ludzi, kt�rzy ju� troch� czekaj�.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//I lepiej b�dzie, je�li nast�pn� osob�, kt�ra wejdzie do obozu, b�d� ja...
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Logan mo�e nauczy� mnie zdejmowania futra, wyrywania pazur�w i z�b�w.");
};


instance DIA_ADDON_LOGAN_LAGER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_lager_condition;
	information = dia_addon_logan_lager_info;
	permanent = FALSE;
	description = "Czym jest ob�z?";
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
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//Czym jest ob�z?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//Pytanie powinno brzmie�: czym NIE jest ob�z. Bez w�y, bez mokrych dziur... No wiesz, bez BAGNA.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Zamiast tego maj� gorza�� i z�oto. Z tego, co wiem, jest tam nawet jaka� kobieta. Teraz rozumiesz?
};


instance DIA_ADDON_LOGAN_MIS(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 99;
	condition = dia_addon_logan_mis_condition;
	information = dia_addon_logan_mis_info;
	permanent = FALSE;
	description = "Chod�my zabi� par� b�otnych w�y.";
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
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Chod�my zabi� par� b�otnych w�y.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//Wygl�da na to, �e zrozumia�e�, jak si� robi post�py. Tak jak i... Cii. S�ysza�e�? S�ysz� je.
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//Rozumiem. Co teraz zrobimy?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//Id�. Na pewno maj� ochot� na przek�sk�. Zobaczymy, kto kogo b�dzie jad�. Dalej!
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
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Dobry b�otny w�� to martwy b�otny w��. To powinno by� przestrog� dla pozosta�ych.
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//W porz�dku, masz co� jeszcze do zrobienia? Bo musz� rusza� dalej...
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//W tej chwili nic. Wiesz, kogo musisz poszuka�, je�li b�dziesz chcia� si� czego� nauczy�.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HLPLOGAN = LOG_SUCCESS;
	b_checklog();
	b_logentry(TOPIC_ADDON_FRANCO,"Pomog�em Loganowi. Czas zobaczy�, co s�dzi o tym Franko.");
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
	description = "Poka� mi, jak patroszy� zwierz�ta...";
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
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Poka� mi, jak patroszy� zwierz�ta...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Je�li chcesz si� czego� dowiedzie� o krwiopijcach, zapytaj lepiej Edgora.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//Je�eli b�dziesz patroszy� bagienne w�e czy jaszczurki, to mo�e chcesz nauczy� si�, jak je obdziera� ze sk�ry i wyrywa� im z�by?
};


instance DIA_ADDON_LOGAN_ALLG(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_allg_condition;
	information = dia_addon_logan_allg_info;
	permanent = TRUE;
	description = "Chc� si� nauczy�...";
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
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Wyrywania z�b�w",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_logan_allg_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Wyrywania pazur�w",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_addon_logan_allg_claws);
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
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej, uda�o mi si� dzi�ki twojej pomocy! Dosta�em pozwolenie na wej�cie do kopalni!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Nie znam si� na wydobyciu z�ota, ale jako� sobie poradz�.
	if(LOGAN_LOHN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//Opanowa�em ju� podstawy. Dobrze si� ustaw i wal tak mocno, jak mo�esz!
		b_upgrade_hero_hackchance(10);
		LOGAN_LOHN = TRUE;
	};
};


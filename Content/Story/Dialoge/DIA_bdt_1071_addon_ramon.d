
instance DIA_ADDON_RAMON_EXIT(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 999;
	condition = dia_addon_ramon_exit_condition;
	information = dia_addon_ramon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_ramon_exit_condition()
{
	return TRUE;
};

func void dia_addon_ramon_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1071_CHECKPOINT = "BL_UP_CHECK";

instance DIA_ADDON_RAMON_FIRSTWARN(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 1;
	condition = dia_addon_ramon_firstwarn_condition;
	information = dia_addon_ramon_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_firstwarn_info()
{
	if(Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_00");	//Hej, co tu si� sta�o?
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_01");	//Pobi�em Franka.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_02");	//No i co? To teraz TY musisz zadba�, by te lenie odwala�y swoj� robot�.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_03");	//Hej, nie zamierzam marnowa� tu czasu. Chc� wej�� do obozu.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_04");	//Nie teraz. Pokona�e� Franka. Czyli jeste� nowym przyw�dc�. No to r�b swoje.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_05");	//Skoro jestem przyw�dc�, to mog� wybra� nast�pn� osob�, kt�ra wejdzie do obozu.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_06");	//No to m�wi�, �e nast�pny mam by� JA.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_07");	//To nie takie proste. Nie potrzebujemy nikogo nowego, wi�c nikt nie wejdzie do �rodka.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_08");	//Thorus mo�e wys�a� nowego przyw�dc� my�liwych, zwalniaj�c tym samym w obozie miejsce dla mnie.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_09");	//Nie poddajesz si�, co? Dobra, pakuj do obozu swoje cztery litery.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_10");	//Thorus si� tym zajmie i przy�le nowego przyw�dc�.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_11");	//No to na co czekasz? Nie zapomnij zabra� kilofa.
		self.aivar[AIV_PASSGATE] = TRUE;
		PLAYER_HASTALKEDTOBANDITCAMP = TRUE;
		b_giveplayerxp(XP_ADDON_HINEIN);
		AI_StopProcessInfos(self);
		AI_Teleport(carlos,"BL_WAIT_FINN");
		b_startotherroutine(carlos,"START");
		b_startotherroutine(finn,"START");
	}
	else if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_12");	//Hej, kim jeste�? Nie mog� sobie wyobrazi�, �eby kto� taki jak ty mia� pozwolenie na wej�cie.
		if(Npc_KnowsInfo(other,dia_addon_franco_hi))
		{
			AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_13");	//Franko mnie przysy�a�. Chce wiedzie�, czy nie potrzeba nowych robotnik�w.
		};
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_14");	//Tak, w zasadzie potrzeba. Wczoraj jeden go�� strzeli� w kalendarz.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_15");	//Ten idiota zdenerwowa� Estebana.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_16");	//Kto to jest Esteban?
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_17");	//To szef obozowiska. On decyduje, komu pozwoli� na wej�cie do kopalni.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_18");	//Powiedz Frankowi, �e Thorus prosi o nowego robotnika. Jasne?
		Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FRANCO,"Thorus potrzebuje nowego cz�owieka do obozu. To zainteresuje Franka.");
		Info_ClearChoices(dia_addon_ramon_firstwarn);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? TEN Thorus?",dia_addon_ramon_firstwarn_yes);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? Pierwsze s�ysz�...",dia_addon_ramon_firstwarn_no);
		RAMON_NEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_19");	//Hej, st�j! Nie wejdziesz tam, wi�c zje�d�aj.
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};

func void dia_addon_ramon_firstwarn_yes()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_00");	//Thorus? TEN Thorus?
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_01");	//Tak. TEN Thorus. Cz�owiek, kt�ry prosi o nowych robotnik�w.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_02");	//Cz�owiek, kt�ry decyduje, czy kto� nowy mo�e przej�� z bagien do obozu.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_03");	//Nie chcesz mi chyba powiedzie�, �e znasz go z wcze�niejszych czas�w?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//No c�... Tak.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_05");	//Rozumiem... KA�DY zna Thorusa.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_06");	//Niemniej jednak to ci wcale nie pomo�e. I nie zamierzam przekazywa� �ADNYCH wiadomo�ci.
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};

func void dia_addon_ramon_firstwarn_no()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_NO_15_00");	//Thorus? Pierwsze s�ysz�...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_01");	//Oj, ch�opie, nie znasz go? By� dow�dc� stra�nik�w w Starym Obozie.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_02");	//Jest cz�owiekiem, kt�rego wszyscy szanuj� i kt�remu ufaj�.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_03");	//On mo�e poprosi� o nowych ludzi.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_04");	//Je�li po�yjesz dostatecznie d�ugo, to b�dziesz mia� okazj� go pozna�.
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};


instance DIA_ADDON_RAMON_SECONDWARN(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 2;
	condition = dia_addon_ramon_secondwarn_condition;
	information = dia_addon_ramon_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Ramon_SecondWarn_07_00");	//Zr�b jeszcze jeden krok bli�ej, a b�dzie to tw�j ostatni!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_ATTACK(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 3;
	condition = dia_addon_ramon_attack_condition;
	information = dia_addon_ramon_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Ramon_Attack_07_00");	//Niekt�rzy nigdy si� nie naucz�...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_ADDON_RAMON_NEWS(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_news_condition;
	information = dia_addon_ramon_news_info;
	permanent = FALSE;
	description = "Jestem tym nowym.";
};


func int dia_addon_ramon_news_condition()
{
	if(!Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_news_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_News_15_00");	//Jestem tym nowym.
	AI_Output(self,other,"DIA_Addon_Ramon_News_07_01");	//Nie pr�buj sobie ze mnie �artowa�. Decyzja o tym, kto mo�e wej�� do obozu, wci�� nale�y do Franko.
};


instance DIA_ADDON_RAMON_LIE(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_lie_condition;
	information = dia_addon_ramon_lie_info;
	permanent = FALSE;
	description = "To w�a�nie Franko mnie przys�a�...";
};


func int dia_addon_ramon_lie_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_ramon_news) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_lie_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Lie_15_00");	//To w�a�nie Franko mnie przys�a�...
	AI_Output(self,other,"DIA_Addon_Ramon_Lie_07_01");	//Nie zrobi� tego. A teraz zje�d�aj, bo porachuj� ci gnaty.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_PERM(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 99;
	condition = dia_addon_ramon_perm_condition;
	information = dia_addon_ramon_perm_info;
	permanent = TRUE;
	description = "I jak? Wszystko w porz�dku?";
};


func int dia_addon_ramon_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_ramon_news) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Perm_15_00");	//I jak? Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_Ramon_Perm_07_01");	//Wszystko dobrze - przynajmniej dop�ki kto� niepowo�any nie pr�buje si� dosta� do �rodka.
	AI_StopProcessInfos(self);
};


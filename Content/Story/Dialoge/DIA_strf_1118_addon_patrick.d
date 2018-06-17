
instance DIA_ADDON_PATRICK_EXIT(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 999;
	condition = dia_addon_patrick_exit_condition;
	information = dia_addon_patrick_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_patrick_exit_condition()
{
	return TRUE;
};

func void dia_addon_patrick_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PATRICK_HI(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hi_condition;
	information = dia_addon_patrick_hi_info;
	permanent = FALSE;
	description = "Przybywam tu z polecenia Mag�w Wody.";
};


func int dia_addon_patrick_hi_condition()
{
	return TRUE;
};

func void dia_addon_patrick_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Przybywam tu z polecenia Mag�w Wody, aby ci� uwolni�.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//Naprawd�? Niby czemu mia�bym ci wierzy�?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Chcesz si� st�d wydosta�?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Pewnie, �e chc� st�d uciec. Ale...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Przys�a� mnie Vatras. Je�li to ci� nie satysfakcjonuje, to nie b�d� si� narzuca�. Mo�esz tu zosta�, je�li bardzo chcesz.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//Dobrze, wierz� ci.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//Naprawd�? To by�o �atwiejsze, ni� si� spodziewa�em. Dobra, teraz potrzebny nam plan.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Ucieczka to ryzykowna sprawa. William pr�bowa� i teraz w�cha kwiatki od spodu.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//Wi�niowie to rolnicy i robotnicy. Ufaj� mi, ale nie zechc� ryzykowa� g�ow�.
	Info_ClearChoices(dia_addon_patrick_hi);
	Info_AddChoice(dia_addon_patrick_hi,"Chcesz, �ebym za�atwi� ci u�askawienie od Kruka?",dia_addon_patrick_hi_raven);
	Info_AddChoice(dia_addon_patrick_hi,"Mam za�atwi� wszystkich bandzior�w, zanim si� w og�le ruszysz?",dia_addon_patrick_hi_kill);
};

func void b_say_patrick_plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Ale to si� nie uda.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Je�li jednak zajmiesz si� stra�nikami, to reszta mo�e wykorzysta� szans�.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Dobrze. Stra�nik�w bior� na siebie. Powiedz innym, �eby si� przygotowali.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Niewolnicy nie b�d� pr�bowa� ucieczki. Musz� znale�� spos�b, �eby bezpiecznie mogli opu�ci� ob�z.");
};

func void dia_addon_patrick_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//Chcesz, �ebym za�atwi� ci u�askawienie od Kruka?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//To nie by�oby takie z�e.
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};

func void dia_addon_patrick_hi_kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//Mam za�atwi� wszystkich bandzior�w, zanim si� w og�le ruszysz?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//To by�oby czyste szale�stwo!
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};


instance DIA_ADDON_PATRICK_READY(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_ready_condition;
	information = dia_addon_patrick_ready_info;
	permanent = FALSE;
	description = "Droga wolna. Uciekajcie!";
};


func int dia_addon_patrick_ready_condition()
{
	if(((READY_TOGO == TRUE) && Npc_KnowsInfo(other,dia_addon_patrick_hi)) || (Npc_IsDead(prisonguard) && Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_thorus_answer)) || (Npc_IsDead(thorus) && Npc_IsDead(bloodwyn) && Npc_IsDead(prisonguard)))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_ready_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//Droga wolna. Uciekajcie!
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Wspaniale. Znam jedn� jaskini� na bagnach, w kt�rej mog� ukry� ludzi, ale co potem?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Id�c z bagien, kierujcie si� na po�udniowy zach�d, a powinni�cie trafi� do obozu, kt�ry Magowie Wody rozbili w ruinach starej �wi�tyni.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Oni poka�� wam drog�.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//Wielkie dzi�ki, naprawd�. Jeste�my g��boko wdzi�czni za okazane nam mi�osierdzie i pozostajemy zobowi�zani...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Spokojnie, po co ta ceremonia...
	SKLAVEN_FLUCHT = TRUE;
	b_giveplayerxp(XP_ADDON_FLUCHT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	b_startotherroutine(telbor,"FLUCHT");
	b_startotherroutine(tonak,"FLUCHT");
	b_startotherroutine(pardos,"FLUCHT");
	b_startotherroutine(monty,"FLUCHT");
	b_startotherroutine(buddler_1,"WORK");
	b_startotherroutine(buddler_2,"WORK");
	b_startotherroutine(buddler_3,"WORK");
	b_removenpc(strf_1128_addon_sklave);
	b_removenpc(strf_1129_addon_sklave);
	b_removenpc(strf_1130_addon_sklave);
	b_removenpc(strf_1136_addon_sklave);
	b_removenpc(strf_1137_addon_sklave);
	b_removenpc(strf_1138_addon_sklave);
	b_removenpc(strf_1139_addon_sklave);
	b_removenpc(strf_1140_addon_sklave);
};


instance DIA_ADDON_PATRICK_KILLER(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_killer_condition;
	information = dia_addon_patrick_killer_info;
	permanent = FALSE;
	description = "Zaj��em si� stra�nikiem. Mo�ecie ucieka�.";
};


func int dia_addon_patrick_killer_condition()
{
	if(Npc_IsDead(prisonguard) && (READY_TOGO == FALSE) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_killer_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Zaj��em si� stra�nikiem. Mo�ecie ucieka�.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//A co b�dzie, je�li opu�cimy kopalni�? Pozostali stra�nicy zabij� nas w mgnieniu oka!
};


instance DIA_ADDON_PATRICK_HOEHLE(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hoehle_condition;
	information = dia_addon_patrick_hoehle_info;
	permanent = TRUE;
	description = "Chcecie ucieka�?";
};


func int dia_addon_patrick_hoehle_condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_patrick_hoehle_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Chcecie ucieka�?
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Pewnie. Po prostu czekamy na odpowiedni� chwil�.
};


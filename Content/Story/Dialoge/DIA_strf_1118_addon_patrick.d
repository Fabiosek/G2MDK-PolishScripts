
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
	description = "Przybywam tu z polecenia Magów Wody.";
};


func int dia_addon_patrick_hi_condition()
{
	return TRUE;
};

func void dia_addon_patrick_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Przybywam tu z polecenia Magów Wody, aby ciê uwolniæ.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//Naprawdê? Niby czemu mia³bym ci wierzyæ?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Chcesz siê st¹d wydostaæ?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Pewnie, ¿e chcê st¹d uciec. Ale...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Przys³a³ mnie Vatras. Jeœli to ciê nie satysfakcjonuje, to nie bêdê siê narzuca³. Mo¿esz tu zostaæ, jeœli bardzo chcesz.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//Dobrze, wierzê ci.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//Naprawdê? To by³o ³atwiejsze, ni¿ siê spodziewa³em. Dobra, teraz potrzebny nam plan.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Ucieczka to ryzykowna sprawa. William próbowa³ i teraz w¹cha kwiatki od spodu.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//WiêŸniowie to rolnicy i robotnicy. Ufaj¹ mi, ale nie zechc¹ ryzykowaæ g³ow¹.
	Info_ClearChoices(dia_addon_patrick_hi);
	Info_AddChoice(dia_addon_patrick_hi,"Chcesz, ¿ebym za³atwi³ ci u³askawienie od Kruka?",dia_addon_patrick_hi_raven);
	Info_AddChoice(dia_addon_patrick_hi,"Mam za³atwiæ wszystkich bandziorów, zanim siê w ogóle ruszysz?",dia_addon_patrick_hi_kill);
};

func void b_say_patrick_plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Ale to siê nie uda.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Jeœli jednak zajmiesz siê stra¿nikami, to reszta mo¿e wykorzystaæ szansê.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Dobrze. Stra¿ników biorê na siebie. Powiedz innym, ¿eby siê przygotowali.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Niewolnicy nie bêd¹ próbowaæ ucieczki. Muszê znaleŸæ sposób, ¿eby bezpiecznie mogli opuœciæ obóz.");
};

func void dia_addon_patrick_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//Chcesz, ¿ebym za³atwi³ ci u³askawienie od Kruka?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//To nie by³oby takie z³e.
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};

func void dia_addon_patrick_hi_kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//Mam za³atwiæ wszystkich bandziorów, zanim siê w ogóle ruszysz?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//To by³oby czyste szaleñstwo!
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
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Wspaniale. Znam jedn¹ jaskiniê na bagnach, w której mogê ukryæ ludzi, ale co potem?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Id¹c z bagien, kierujcie siê na po³udniowy zachód, a powinniœcie trafiæ do obozu, który Magowie Wody rozbili w ruinach starej œwi¹tyni.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Oni poka¿¹ wam drogê.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//Wielkie dziêki, naprawdê. Jesteœmy g³êboko wdziêczni za okazane nam mi³osierdzie i pozostajemy zobowi¹zani...
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
	description = "Zaj¹³em siê stra¿nikiem. Mo¿ecie uciekaæ.";
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
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Zaj¹³em siê stra¿nikiem. Mo¿ecie uciekaæ.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//A co bêdzie, jeœli opuœcimy kopalniê? Pozostali stra¿nicy zabij¹ nas w mgnieniu oka!
};


instance DIA_ADDON_PATRICK_HOEHLE(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hoehle_condition;
	information = dia_addon_patrick_hoehle_info;
	permanent = TRUE;
	description = "Chcecie uciekaæ?";
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
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Chcecie uciekaæ?
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Pewnie. Po prostu czekamy na odpowiedni¹ chwilê.
};


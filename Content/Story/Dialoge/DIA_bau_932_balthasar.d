
instance DIA_BALTHASAR_EXIT(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 999;
	condition = dia_balthasar_exit_condition;
	information = dia_balthasar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_balthasar_exit_condition()
{
	return TRUE;
};

func void dia_balthasar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTHASAR_HALLO(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 3;
	condition = dia_balthasar_hallo_condition;
	information = dia_balthasar_hallo_info;
	description = "Jak leci?";
};


func int dia_balthasar_hallo_condition()
{
	return TRUE;
};

func void dia_balthasar_hallo_info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//O, nowy w gospodarstwie! Czy¿by stary sknera w koñcu za³atwi³ mi pomocnika?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Nie jestem pomocnikiem.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Och. Rozumiem. Nie jestem ju¿ taki m³ody, wiesz? Od lat czekam na nastêpcê.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Chyba nie przyszed³eœ tu dlatego, ¿e s¹siedzi siê zdenerwowali, co?
};


instance DIA_BALTHASAR_WASMACHSTDU(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 4;
	condition = dia_balthasar_wasmachstdu_condition;
	information = dia_balthasar_wasmachstdu_info;
	description = "Na czym polega twoja praca?";
};


func int dia_balthasar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo))
	{
		return TRUE;
	};
};

func void dia_balthasar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//Na czym polega twoja praca?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Och, pilnujê owiec. Robiê to, odk¹d pamiêtam.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Zwierzaki s¹ bardzo m¹dre i wierne, wiesz. Jeœli je dobrze traktujesz, bêd¹ ciê s³uchaæ przez ca³e ¿ycie.
};


instance DIA_ADDON_BALTHASAR_RANGERBANDITS(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_addon_balthasar_rangerbandits_condition;
	information = dia_addon_balthasar_rangerbandits_info;
	description = "Widzia³eœ mo¿e bandytów w okolicy?";
};


func int dia_addon_balthasar_rangerbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo) && ((MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING) || (SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_balthasar_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Widzia³eœ mo¿e bandytów w okolicy?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Pewnie. Przechodzili przez pole w pobli¿u farmy Sekoba, a potem zaszyli siê w lesie.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//Mieli ze sob¹ du¿o broni. Wygl¹dali, jakby chcieli wygraæ wojnê z orkami na w³asn¹ rêkê.
	};
	if(SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//Wydawa³o mi siê, ¿e prowadzili ze sob¹ dziewczynê, ale nie dam za to g³owy.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Mam nadziejê, ¿e jej nie skrzywdzili.
	};
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Cieszê siê, ¿e ominêli nasz¹ farmê.
};


instance DIA_BALTHASAR_AERGERMITNACHBARN(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_balthasar_aergermitnachbarn_condition;
	information = dia_balthasar_aergermitnachbarn_info;
	description = "Masz jakieœ k³opoty z s¹siadami?";
};


func int dia_balthasar_aergermitnachbarn_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_aergermitnachbarn_info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//Masz jakieœ k³opoty z s¹siadami?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Trawa po tej stronie wielkiego pola jest zawsze wysuszona i rzadka. Wiêc zazwyczaj chodzê na pastwiska innych farmerów.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Onarowi to wszystko jedno, ale Bengar, do którego nale¿¹ pastwiska na p³askowy¿u, zawsze robi wielk¹ aferê, kiedy wyprowadzam tam zwierzêta.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//Mówi, ¿e Sekob winien mu zap³aciæ, skoro zwierzêta pas¹ siê na jego ziemi.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Ale Sekob nie wyda na to ani grosza, wiêc nie mogê ju¿ chodziæ na p³askowy¿.
};


instance DIA_BALTHASAR_WOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 10;
	condition = dia_balthasar_wobengar_condition;
	information = dia_balthasar_wobengar_info;
	description = "Gdzie mogê znaleŸæ te pastwiska i gospodarstwo Bengara?";
};


func int dia_balthasar_wobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_balthasar_wobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Gdzie mogê znaleŸæ te pastwiska i gospodarstwo Bengara?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//IdŸ t¹ œcie¿k¹ i przejdŸ przez du¿e rozstaje.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Jeœli skrêcisz w prawo, zobaczysz wielk¹ ska³ê. Za ni¹, na prawo, s¹ pastwiska na p³askowy¿u i prze³êcz.
};


instance DIA_BALTHASAR_TALKTOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 6;
	condition = dia_balthasar_talktobengar_condition;
	information = dia_balthasar_talktobengar_info;
	description = "Mo¿e powinienem pomówiæ z Bengarem.";
};


func int dia_balthasar_talktobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_talktobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Mo¿e powinienem pomówiæ z Bengarem.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Zrobisz to dla mnie? A co mu powiesz? To znaczy, wiesz, nie chcê ¿adnych k³opotów.
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Zobaczymy.
	Log_CreateTopic(TOPIC_BALTHASARSSCHAFE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTHASARSSCHAFE,LOG_RUNNING);
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Farmer Bengar zabroni³ pasterzowi Balthasarowi zabieraæ owce na p³askowy¿.");
	MIS_BALTHASAR_BENGARSWEIDE = LOG_RUNNING;
};


instance DIA_BALTHASAR_BENGARUEBERREDET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 8;
	condition = dia_balthasar_bengarueberredet_condition;
	information = dia_balthasar_bengarueberredet_info;
	description = "Mo¿esz znowu wyprowadzaæ owce na pastwiska Bengara.";
};


func int dia_balthasar_bengarueberredet_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_talktobengar) && (MIS_BALTHASAR_BENGARSWEIDE == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_bengarueberredet_info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//Mo¿esz znowu wprowadziæ owce na pastwiska Bengara. Rozmawia³em z nim.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Dziêkujê! Od razu ruszam w drogê.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//A ty weŸ w podziêce za pomoc te baranie skóry.
	b_giveinvitems(self,other,itat_sheepfur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	b_giveplayerxp(XP_BALTHASAR_BENGARSWEIDE);
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BALTHASARSHEEP1 = Hlp_GetNpc(balthasar_sheep1);
	if(Hlp_IsValidNpc(balthasarsheep1) && !Npc_IsDead(balthasarsheep1))
	{
		AI_StartState(balthasarsheep1,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP2 = Hlp_GetNpc(balthasar_sheep2);
	if(Hlp_IsValidNpc(balthasarsheep2) && !Npc_IsDead(balthasarsheep2))
	{
		AI_StartState(balthasarsheep2,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP3 = Hlp_GetNpc(balthasar_sheep3);
	if(Hlp_IsValidNpc(balthasarsheep3) && !Npc_IsDead(balthasarsheep3))
	{
		AI_StartState(balthasarsheep3,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
};


instance DIA_BALTHASAR_PERMKAP1(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 70;
	condition = dia_balthasar_permkap1_condition;
	information = dia_balthasar_permkap1_info;
	permanent = TRUE;
	description = "Oprócz tego, wszystko w porz¹dku?";
};


func int dia_balthasar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_balthasar_permkap1_info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//A poza tym, wszystko w porz¹dku?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,balthasar_sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Nie mogê narzekaæ. Dziêkujê za troskê.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Czasy s¹ ciê¿kie. Nie mogê znaleŸæ moich owiec!
		if(Npc_IsDead(sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//Chyba muszê siê wyspowiadaæ Sekobowi.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_BALTHASAR_PICKPOCKET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 900;
	condition = dia_balthasar_pickpocket_condition;
	information = dia_balthasar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_balthasar_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_balthasar_pickpocket_info()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_BACK,dia_balthasar_pickpocket_back);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_PICKPOCKET,dia_balthasar_pickpocket_doit);
};

func void dia_balthasar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_balthasar_pickpocket);
};

func void dia_balthasar_pickpocket_back()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
};


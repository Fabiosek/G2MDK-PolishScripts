
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
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//O, nowy w gospodarstwie! Czy�by stary sknera w ko�cu za�atwi� mi pomocnika?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Nie jestem pomocnikiem.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Och. Rozumiem. Nie jestem ju� taki m�ody, wiesz? Od lat czekam na nast�pc�.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Chyba nie przyszed�e� tu dlatego, �e s�siedzi si� zdenerwowali, co?
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
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Och, pilnuj� owiec. Robi� to, odk�d pami�tam.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Zwierzaki s� bardzo m�dre i wierne, wiesz. Je�li je dobrze traktujesz, b�d� ci� s�ucha� przez ca�e �ycie.
};


instance DIA_ADDON_BALTHASAR_RANGERBANDITS(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_addon_balthasar_rangerbandits_condition;
	information = dia_addon_balthasar_rangerbandits_info;
	description = "Widzia�e� mo�e bandyt�w w okolicy?";
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
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Widzia�e� mo�e bandyt�w w okolicy?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Pewnie. Przechodzili przez pole w pobli�u farmy Sekoba, a potem zaszyli si� w lesie.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//Mieli ze sob� du�o broni. Wygl�dali, jakby chcieli wygra� wojn� z orkami na w�asn� r�k�.
	};
	if(SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//Wydawa�o mi si�, �e prowadzili ze sob� dziewczyn�, ale nie dam za to g�owy.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Mam nadziej�, �e jej nie skrzywdzili.
	};
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Ciesz� si�, �e omin�li nasz� farm�.
};


instance DIA_BALTHASAR_AERGERMITNACHBARN(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_balthasar_aergermitnachbarn_condition;
	information = dia_balthasar_aergermitnachbarn_info;
	description = "Masz jakie� k�opoty z s�siadami?";
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
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//Masz jakie� k�opoty z s�siadami?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Trawa po tej stronie wielkiego pola jest zawsze wysuszona i rzadka. Wi�c zazwyczaj chodz� na pastwiska innych farmer�w.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Onarowi to wszystko jedno, ale Bengar, do kt�rego nale�� pastwiska na p�askowy�u, zawsze robi wielk� afer�, kiedy wyprowadzam tam zwierz�ta.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//M�wi, �e Sekob winien mu zap�aci�, skoro zwierz�ta pas� si� na jego ziemi.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Ale Sekob nie wyda na to ani grosza, wi�c nie mog� ju� chodzi� na p�askowy�.
};


instance DIA_BALTHASAR_WOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 10;
	condition = dia_balthasar_wobengar_condition;
	information = dia_balthasar_wobengar_info;
	description = "Gdzie mog� znale�� te pastwiska i gospodarstwo Bengara?";
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
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Gdzie mog� znale�� te pastwiska i gospodarstwo Bengara?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Id� t� �cie�k� i przejd� przez du�e rozstaje.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Je�li skr�cisz w prawo, zobaczysz wielk� ska��. Za ni�, na prawo, s� pastwiska na p�askowy�u i prze��cz.
};


instance DIA_BALTHASAR_TALKTOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 6;
	condition = dia_balthasar_talktobengar_condition;
	information = dia_balthasar_talktobengar_info;
	description = "Mo�e powinienem pom�wi� z Bengarem.";
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
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Mo�e powinienem pom�wi� z Bengarem.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Zrobisz to dla mnie? A co mu powiesz? To znaczy, wiesz, nie chc� �adnych k�opot�w.
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Zobaczymy.
	Log_CreateTopic(TOPIC_BALTHASARSSCHAFE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTHASARSSCHAFE,LOG_RUNNING);
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Farmer Bengar zabroni� pasterzowi Balthasarowi zabiera� owce na p�askowy�.");
	MIS_BALTHASAR_BENGARSWEIDE = LOG_RUNNING;
};


instance DIA_BALTHASAR_BENGARUEBERREDET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 8;
	condition = dia_balthasar_bengarueberredet_condition;
	information = dia_balthasar_bengarueberredet_info;
	description = "Mo�esz znowu wyprowadza� owce na pastwiska Bengara.";
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
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//Mo�esz znowu wprowadzi� owce na pastwiska Bengara. Rozmawia�em z nim.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Dzi�kuj�! Od razu ruszam w drog�.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//A ty we� w podzi�ce za pomoc te baranie sk�ry.
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
	description = "Opr�cz tego, wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//A poza tym, wszystko w porz�dku?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,balthasar_sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Nie mog� narzeka�. Dzi�kuj� za trosk�.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Czasy s� ci�kie. Nie mog� znale�� moich owiec!
		if(Npc_IsDead(sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//Chyba musz� si� wyspowiada� Sekobowi.
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


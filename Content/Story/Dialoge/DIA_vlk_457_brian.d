
instance DIA_BRIAN_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_exit_condition;
	information = dia_brian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_PICKPOCKET(C_INFO)
{
	npc = vlk_457_brian;
	nr = 900;
	condition = dia_brian_pickpocket_condition;
	information = dia_brian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_brian_pickpocket_condition()
{
	return c_beklauen(55,100);
};

func void dia_brian_pickpocket_info()
{
	Info_ClearChoices(dia_brian_pickpocket);
	Info_AddChoice(dia_brian_pickpocket,DIALOG_BACK,dia_brian_pickpocket_back);
	Info_AddChoice(dia_brian_pickpocket,DIALOG_PICKPOCKET,dia_brian_pickpocket_doit);
};

func void dia_brian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brian_pickpocket);
};

func void dia_brian_pickpocket_back()
{
	Info_ClearChoices(dia_brian_pickpocket);
};


instance DIA_BRIAN_HALLO(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_hallo_condition;
	information = dia_brian_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_brian_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_brian_hallo_info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//Nowa twarz w mie�cie, co? Nazywam si� Brian! Jestem czeladnikiem mistrza Harada.
};


instance DIA_BRIAN_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_aboutlehrling_condition;
	information = dia_brian_aboutlehrling_info;
	permanent = FALSE;
	description = "Jak to jest by� czeladnikiem u kowala?";
};


func int dia_brian_aboutlehrling_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_brian_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//Jak to jest by� czeladnikiem u kowala?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Dlaczego pytasz? Chcesz zosta� moim nast�pc�?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Mo�e.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Czemu nie... Okres nauki mam ju� prawie za sob�, a po nim wyjad� z miasta.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//Ale nie z powodu Harada. To dobry mistrz - wiele si� od niego nauczy�em.
};


instance DIA_BRIAN_WHYLEAVE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_whyleave_condition;
	information = dia_brian_whyleave_info;
	permanent = FALSE;
	description = "Dlaczego chcesz wyjecha� z miasta?";
};


func int dia_brian_whyleave_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_aboutlehrling))
	{
		return TRUE;
	};
};

func void dia_brian_whyleave_info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Dlaczego chcesz wyjecha� z miasta?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Bo tutejsi mieszka�cy dzia�aj� mi na nerwy! Nie wspominaj�c o pozosta�ych mistrzach.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//Wci�� pami�tam, ile by�o zamieszania z dostaniem si� na czeladnika do Harada.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Naprawd�, ka�dy z tych dowcipnisi�w mia� na ten temat co� do powiedzenia.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//Sam chc� decydowa�, kogo mam przyj�� na czeladnika.
};


instance DIA_BRIAN_OTHERMASTERS(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_othermasters_condition;
	information = dia_brian_othermasters_info;
	permanent = FALSE;
	description = "Kim s� pozostali mistrzowie?";
};


func int dia_brian_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_whyleave) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_brian_othermasters_info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//Kim s� pozostali mistrzowie?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//Jest Thorben - stolarz, Bosper - �uczarz, Constantino - alchemik i Matteo.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//Sprzedaje pancerze, ale przede wszystkim jest kupcem.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//Wszyscy mistrzowie maj� swoje domy na tej ulicy.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//A sklep Constantina znajduje si� w tunelu prowadz�cym do �wi�tyni.
};


instance DIA_BRIAN_ABOUTHARAD(C_INFO)
{
	npc = vlk_457_brian;
	nr = 2;
	condition = dia_brian_aboutharad_condition;
	information = dia_brian_aboutharad_info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej o Mistrzu Haradzie.";
};


func int dia_brian_aboutharad_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_aboutlehrling))
	{
		return TRUE;
	};
};

func void dia_brian_aboutharad_info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Powiedz mi co� wi�cej o Mistrzu Haradzie.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//Jest teraz w kiepskim humorze.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//Kilka dni temu przyszli paladyni i kazali mu wyku� dla siebie troch� mieczy.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//No i zakazali mu sprzedawa� miecze komukolwiek innemu.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Teraz haruje dzie� i noc, �eby jak najszybciej uko�czy� t� prac�.
};


instance DIA_BRIAN_NEEDWEAPONS(C_INFO)
{
	npc = vlk_457_brian;
	nr = 4;
	condition = dia_brian_needweapons_condition;
	information = dia_brian_needweapons_info;
	permanent = FALSE;
	description = "Mog� od ciebie kupi� bro�?";
};


func int dia_brian_needweapons_condition()
{
	return TRUE;
};

func void dia_brian_needweapons_info()
{
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Mog� od ciebie kupi� bro�?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Raczej nie. Jestem tylko czeladnikiem.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//Bro� robion� w tej ku�ni stra�nicy zabieraj� do wie�, gdzie jest przechowywana.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//Ale je�li ma to jakikolwiek zwi�zek z kuciem, to mo�e potrafi� ci pom�c.
};


var int brian_trade_einmal;

instance DIA_BRIAN_WASKAUFEN(C_INFO)
{
	npc = vlk_457_brian;
	nr = 4;
	condition = dia_brian_waskaufen_condition;
	information = dia_brian_waskaufen_info;
	permanent = TRUE;
	description = "Co mog� u ciebie dosta�?";
	trade = TRUE;
};


func int dia_brian_waskaufen_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_needweapons))
	{
		return TRUE;
	};
};

func void dia_brian_waskaufen_info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//Co mog� u ciebie dosta�?
	b_givetradeinv(self);
	if(Npc_IsDead(harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Wci�� mam jeszcze kilka stalowych pr�t�w, je�li chcesz, mog� by� twoje.
		if(MIS_JACK_NEWLIGHTHOUSEOFFICER == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//Odk�d Harada ju� tu nie ma, stra� ca�y czas mnie obserwuje.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//Nie wolno mi prowadzi� ku�ni. Boj� si�, �e sprzedam wszystko i uciekn�.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_05");	//Mog� ci sprzeda� kilka stalowych pr�t�w.
	};
	if(BRIAN_TRADE_EINMAL == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Brian, asystent Harada, sprzedaje stalowe pr�ty.");
		BRIAN_TRADE_EINMAL = TRUE;
	};
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_BRIAN_KAP3_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap3_exit_condition;
	information = dia_brian_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brian_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 8;
	condition = dia_brian_repairnecklace_condition;
	information = dia_brian_repairnecklace_info;
	permanent = FALSE;
	description = "Potrafisz naprawi� bi�uteri�?";
};


func int dia_brian_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_brian_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Potrafisz naprawi� bi�uteri�?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//Jestem tylko czeladnikiem. Ciesz� si�, gdy pozwol� mi zrobi� cho� sztylet.
	if(Npc_IsDead(harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Bi�uteri�? Musisz zapyta� mistrza.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BRIAN_KAP4_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap4_exit_condition;
	information = dia_brian_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brian_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_KAP5_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap5_exit_condition;
	information = dia_brian_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_brian_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_NEWLIGHTHOUSEOFFICER(C_INFO)
{
	npc = vlk_457_brian;
	nr = 51;
	condition = dia_brian_newlighthouseofficer_condition;
	information = dia_brian_newlighthouseofficer_info;
	description = "Podobno interesuje ci� stara latarnia morska Jacka.";
};


func int dia_brian_newlighthouseofficer_condition()
{
	if((KAPITEL == 5) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_brian_needweapons))
	{
		return TRUE;
	};
};

func void dia_brian_newlighthouseofficer_info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//Podobno interesuje ci� stara latarnia morska Jacka.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Jack rozwa�a mo�liwo�� powrotu na morze, ale wtedy jego latarnia by�aby niestrze�ona.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//Dla Jacka powinno by� oczywiste, �e kiedy go tutaj nie b�dzie, zrobi� z jego latarni morskiej ku�ni�.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Jaki� problem?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//Nie dla mnie. Ja i tak nie dostan� ku�ni Harada. Ju� dawno przyj��em to do wiadomo�ci.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Zgoda. Spotkamy si� u Jacka.
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_BRIAN_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 8;
	condition = dia_brian_lighthousefree_condition;
	information = dia_brian_lighthousefree_info;
	permanent = TRUE;
	description = "I co ty na to?";
};


func int dia_brian_lighthousefree_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_brian_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//I co ty na to?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//Ale ba�agan. Jak sko�cz�, Jack nie rozpozna tego miejsca.
};


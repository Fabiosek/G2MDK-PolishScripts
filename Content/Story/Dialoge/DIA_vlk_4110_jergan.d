
instance DIA_JERGAN_EXIT(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 999;
	condition = dia_jergan_exit_condition;
	information = dia_jergan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jergan_exit_condition()
{
	return TRUE;
};

func void dia_jergan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_HALLO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_hallo_condition;
	information = dia_jergan_hallo_info;
	permanent = FALSE;
	description = "Czemu tu tak stoisz?";
};


func int dia_jergan_hallo_condition()
{
	return TRUE;
};

func void dia_jergan_hallo_info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Czemu tu tak stoisz?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Przychodz� z zamku. Przys�ali mnie, �ebym poszuka� zaginionych i sprawdzi� teren.
};


instance DIA_JERGAN_VERMISSTE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_vermisste_condition;
	information = dia_jergan_vermisste_info;
	permanent = FALSE;
	description = "Zaginionych?";
};


func int dia_jergan_vermisste_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};

func void dia_jergan_vermisste_info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Zaginionych?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Niekt�rzy uciekli, kiedy zaatakowa�y smoki. Wi�kszo�ci si� nie uda�o - no i nic dziwnego!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Je�li jednak komu� uda�o si� prze�y�, mam go sprowadzi� z powrotem.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "Mo�esz mi pom�c dosta� si� do zamku?";
};


func int dia_jergan_burg_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_burg_info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Mo�esz mi pom�c dosta� si� do zamku?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Pewnie, ale musisz co� dla mnie zrobi�.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Je�eli uda ci si� dotrze� do zamku, porozmawiaj z paladynem Orikiem. Powiedz mu, �e jego brat poleg� na prze��czy.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"Kiedy znajd� si� w zamku, mam powiedzie� Orikowi, �e jego brat poleg� na prze��czy.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "Co powinienem wiedzie� o tej okolicy?";
};


func int dia_jergan_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};


var int jergan_tell;

func void dia_jergan_gegend_info()
{
	if(JERGAN_TELL == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Co powinienem wiedzie� o tej okolicy?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Wracaj, sk�d przyszed�e�, je�li ci �ycie mi�e.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Zielonosk�rzy ju� od kilku tygodni oblegaj� zamek. A smoki gdzie� si� ukrywaj�.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Ca�a G�rnicza Dolina a� roi si� od ork�w. Niezale�nie od tego dok�d zmierzasz, to nie b�dzie maj�wka.
	JERGAN_TELL = TRUE;
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "Jak mog� dosta� si� do zamku?";
};


func int dia_jergan_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_hilfe_info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Jak mog� dosta� si� do zamku?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Po pierwsze zapomnij o drodze na wprost. Je�li jednak obejdziesz zamek dooko�a, mo�e b�dziesz mie� jakie� szanse na powr�t.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Trzymaj si� z dala od �cie�ek i skorzystaj z rzeki. Najlepiej b�dzie, jak pop�yniesz kawa�ek w d� strumienia. Stamt�d powinno by� �atwiej.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Orkowie ustawili za zamkiem taran. W ten spos�b mo�esz si� dosta� do �rodka. Podkradnij si� do ork�w, tak blisko jak zdo�asz, a potem biegnij ile si� w nogach.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//Je�eli jeste� dostatecznie szybki, to mo�e ci si� uda�.
};


instance DIA_JERGAN_MINE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_mine_condition;
	information = dia_jergan_mine_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_jergan_mine_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_mine_info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Jestem zwiadowc�. Przemierzam kraj. Z�bacze nie u�atwiaj� mi jednak zadania.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//To dobry czas, �eby zdoby� kilka trofe�w - zak�adaj�c, �e wiesz, co robi�.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "Mo�esz mnie tego nauczy�?";
};


func int dia_jergan_claw_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_claw_info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Mo�esz mnie tego nauczy�?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Mog� ci pokaza�, jak zdj�� z tych stwor�w pazury, kiedy ju� b�d� martwe.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = "(Nauka usuwania pazur�w)";
};


func int dia_jergan_teach_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_teach_info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Poka� mi, jak usuwa� pazury.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Najwa�niejsze jest to, �eby usun�� pazur jednym szarpni�ciem. Nie wolno si� waha� ani d�uba� no�em.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Tym sposobem mo�na zdoby� pazury nie tylko z�baczy, ale tak�e jaszczurek i cieniostwor�w.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "Wiesz, gdzie si� podzia� Diego?";
};


func int dia_jergan_diego_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,dia_diegoow_hallo) == FALSE) && Npc_KnowsInfo(other,dia_parcival_diego))
	{
		return TRUE;
	};
};

func void dia_jergan_diego_info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Wiesz, gdzie si� podzia� Diego?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? To by� jeden z kret�w Silvestra. Ale si� ulotni�.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Widzia�em go z dwoma rycerzami i jak�� skrzyni�, niedaleko st�d.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Widzisz st�d star� wie�� stra�nicz�, tak? Id� tam, a potem w stron� zamku.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Po prawej stronie jest �cie�ka przez ska�y. Tamt�dy w�a�nie poszli.
};


instance DIA_JERGAN_LEADER(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_leader_condition;
	information = dia_jergan_leader_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_leader_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(newmine_leadsnapper) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_jergan_leader_info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Wi�c zabi�e� przyw�dc� stada. Zabra�e� pazury tej bestii?
	if(Npc_HasItems(other,itat_clawleader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Tak.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Na pewno s� du�� warte. S� tacy, co zbieraj� takie rzeczy.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Je�eli znajdziesz dobrego kupca, to dostaniesz za to niez�� sumk� w z�ocie.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Nie.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Powiniene� tak zrobi�. Jestem pewien, �e s� warte fortun�.
	};
};


instance DIA_JERGAN_PICKPOCKET(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 900;
	condition = dia_jergan_pickpocket_condition;
	information = dia_jergan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_jergan_pickpocket_condition()
{
	return c_beklauen(84,110);
};

func void dia_jergan_pickpocket_info()
{
	Info_ClearChoices(dia_jergan_pickpocket);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_BACK,dia_jergan_pickpocket_back);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_PICKPOCKET,dia_jergan_pickpocket_doit);
};

func void dia_jergan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jergan_pickpocket);
};

func void dia_jergan_pickpocket_back()
{
	Info_ClearChoices(dia_jergan_pickpocket);
};


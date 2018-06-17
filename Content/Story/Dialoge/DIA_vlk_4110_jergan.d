
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
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Przychodzê z zamku. Przys³ali mnie, ¿ebym poszuka³ zaginionych i sprawdzi³ teren.
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
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Niektórzy uciekli, kiedy zaatakowa³y smoki. Wiêkszoœci siê nie uda³o - no i nic dziwnego!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Jeœli jednak komuœ uda³o siê prze¿yæ, mam go sprowadziæ z powrotem.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "Mo¿esz mi pomóc dostaæ siê do zamku?";
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
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Mo¿esz mi pomóc dostaæ siê do zamku?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Pewnie, ale musisz coœ dla mnie zrobiæ.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Je¿eli uda ci siê dotrzeæ do zamku, porozmawiaj z paladynem Orikiem. Powiedz mu, ¿e jego brat poleg³ na prze³êczy.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"Kiedy znajdê siê w zamku, mam powiedzieæ Orikowi, ¿e jego brat poleg³ na prze³êczy.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "Co powinienem wiedzieæ o tej okolicy?";
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
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Co powinienem wiedzieæ o tej okolicy?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Wracaj, sk¹d przyszed³eœ, jeœli ci ¿ycie mi³e.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Zielonoskórzy ju¿ od kilku tygodni oblegaj¹ zamek. A smoki gdzieœ siê ukrywaj¹.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Ca³a Górnicza Dolina a¿ roi siê od orków. Niezale¿nie od tego dok¹d zmierzasz, to nie bêdzie majówka.
	JERGAN_TELL = TRUE;
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "Jak mogê dostaæ siê do zamku?";
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
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Jak mogê dostaæ siê do zamku?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Po pierwsze zapomnij o drodze na wprost. Jeœli jednak obejdziesz zamek dooko³a, mo¿e bêdziesz mieæ jakieœ szanse na powrót.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Trzymaj siê z dala od œcie¿ek i skorzystaj z rzeki. Najlepiej bêdzie, jak pop³yniesz kawa³ek w dó³ strumienia. Stamt¹d powinno byæ ³atwiej.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Orkowie ustawili za zamkiem taran. W ten sposób mo¿esz siê dostaæ do œrodka. Podkradnij siê do orków, tak blisko jak zdo³asz, a potem biegnij ile si³ w nogach.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//Je¿eli jesteœ dostatecznie szybki, to mo¿e ci siê udaæ.
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
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Jestem zwiadowc¹. Przemierzam kraj. Zêbacze nie u³atwiaj¹ mi jednak zadania.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//To dobry czas, ¿eby zdobyæ kilka trofeów - zak³adaj¹c, ¿e wiesz, co robiæ.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "Mo¿esz mnie tego nauczyæ?";
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
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Mo¿esz mnie tego nauczyæ?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Mogê ci pokazaæ, jak zdj¹æ z tych stworów pazury, kiedy ju¿ bêd¹ martwe.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = "(Nauka usuwania pazurów)";
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
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Poka¿ mi, jak usuwaæ pazury.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Najwa¿niejsze jest to, ¿eby usun¹æ pazur jednym szarpniêciem. Nie wolno siê wahaæ ani d³ubaæ no¿em.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Tym sposobem mo¿na zdobyæ pazury nie tylko zêbaczy, ale tak¿e jaszczurek i cieniostworów.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "Wiesz, gdzie siê podzia³ Diego?";
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
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Wiesz, gdzie siê podzia³ Diego?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? To by³ jeden z kretów Silvestra. Ale siê ulotni³.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Widzia³em go z dwoma rycerzami i jak¹œ skrzyni¹, niedaleko st¹d.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Widzisz st¹d star¹ wie¿ê stra¿nicz¹, tak? IdŸ tam, a potem w stronê zamku.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Po prawej stronie jest œcie¿ka przez ska³y. Tamtêdy w³aœnie poszli.
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
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Wiêc zabi³eœ przywódcê stada. Zabra³eœ pazury tej bestii?
	if(Npc_HasItems(other,itat_clawleader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Tak.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Na pewno s¹ du¿¹ warte. S¹ tacy, co zbieraj¹ takie rzeczy.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Je¿eli znajdziesz dobrego kupca, to dostaniesz za to niez³¹ sumkê w z³ocie.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Nie.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Powinieneœ tak zrobiæ. Jestem pewien, ¿e s¹ warte fortunê.
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



instance DIA_ADDON_CRONOS_EXIT(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 999;
	condition = dia_addon_cronos_exit_condition;
	information = dia_addon_cronos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cronos_exit_condition()
{
	return TRUE;
};

func void dia_addon_cronos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRONOS_HALLO(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_hallo_condition;
	information = dia_addon_cronos_hallo_info;
	description = "Mogê ci przeszkodziæ?";
};


func int dia_addon_cronos_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cronos_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Mogê ci przeszkodziæ?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//To TY? Nie myœla³em, ¿e jeszcze ciê kiedyœ zobaczê.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//Masz du¿o odwagi, pokazuj¹c siê tu. Swego czasu chcieliœmy obedrzeæ ciê ze skóry.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//Masz szczêœcie, ¿e minê³o ju¿ parê tygodni i wszyscy siê trochê uspokoili.
};


instance DIA_ADDON_CRONOS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_wasmachstdu_condition;
	information = dia_addon_cronos_wasmachstdu_info;
	description = "Co robisz?";
};


func int dia_addon_cronos_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Co robisz?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//Moim zadaniem jest dowiedzieæ siê wiêcej na temat stra¿ników œwi¹tyni.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Maj¹ kamienne cia³a! Ci stra¿nicy naprawdê posiadaj¹ zdumiewaj¹ce zdolnoœci.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//W jednej chwili stoj¹ w ca³kowitym bezruchu, by nagle rzuciæ siê na ciebie niczym opêtani.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Nie uda³o mi siê jeszcze ustaliæ, jaka energia ich napêdza, ale jedno jest pewne - jest magicznego pochodzenia.
};


instance DIA_ADDON_CRONOS_WAECHTER(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_waechter_condition;
	information = dia_addon_cronos_waechter_info;
	description = "Opowiedz mi wiêcej o tych kamiennych stra¿nikach.";
};


func int dia_addon_cronos_waechter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_waechter_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Opowiedz mi wiêcej o tych kamiennych stra¿nikach.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Wiele wiêcej ci nie powiem. Musieliœmy ich zniszczyæ. Teraz s¹ niegroŸni.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Zaatakowali nas, kiedy tu przybyliœmy.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Pokonaliœmy ich dopiero zjednoczonymi si³ami. Obawiam siê, ¿e po drugiej stronie portalu czeka wiêcej takich stra¿ników.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Musi byæ jakiœ sposób na wy³¹czenie napêdzaj¹cej ich energii. Coœ, co sprawi, ¿e stan¹ siê zwyk³ymi kamiennymi pos¹gami.
};


instance DIA_ADDON_CRONOS_NW_TRADE(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_nw_trade_condition;
	information = dia_addon_cronos_nw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Mo¿esz mi sprzedaæ trochê sprzêtu?";
};


func int dia_addon_cronos_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_wasmachstdu))
	{
		return TRUE;
	};
};


var int dia_addon_cronos_nw_trade_onetime;

func void dia_addon_cronos_nw_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Mo¿esz mi sprzedaæ trochê sprzêtu?
	if(DIA_ADDON_CRONOS_NW_TRADE_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Czemu nie? Jeœli dobrze pamiêtam, ostatnim razem tak¿e handlowaliœmy.
		DIA_ADDON_CRONOS_NW_TRADE_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Powiedz mi, czego potrzebujesz.
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_CRONOSTRADE);
};


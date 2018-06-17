
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
	description = "Mog� ci przeszkodzi�?";
};


func int dia_addon_cronos_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cronos_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Mog� ci przeszkodzi�?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//To TY? Nie my�la�em, �e jeszcze ci� kiedy� zobacz�.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//Masz du�o odwagi, pokazuj�c si� tu. Swego czasu chcieli�my obedrze� ci� ze sk�ry.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//Masz szcz�cie, �e min�o ju� par� tygodni i wszyscy si� troch� uspokoili.
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
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//Moim zadaniem jest dowiedzie� si� wi�cej na temat stra�nik�w �wi�tyni.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Maj� kamienne cia�a! Ci stra�nicy naprawd� posiadaj� zdumiewaj�ce zdolno�ci.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//W jednej chwili stoj� w ca�kowitym bezruchu, by nagle rzuci� si� na ciebie niczym op�tani.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Nie uda�o mi si� jeszcze ustali�, jaka energia ich nap�dza, ale jedno jest pewne - jest magicznego pochodzenia.
};


instance DIA_ADDON_CRONOS_WAECHTER(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_waechter_condition;
	information = dia_addon_cronos_waechter_info;
	description = "Opowiedz mi wi�cej o tych kamiennych stra�nikach.";
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
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Opowiedz mi wi�cej o tych kamiennych stra�nikach.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//Wiele wi�cej ci nie powiem. Musieli�my ich zniszczy�. Teraz s� niegro�ni.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Zaatakowali nas, kiedy tu przybyli�my.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Pokonali�my ich dopiero zjednoczonymi si�ami. Obawiam si�, �e po drugiej stronie portalu czeka wi�cej takich stra�nik�w.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Musi by� jaki� spos�b na wy��czenie nap�dzaj�cej ich energii. Co�, co sprawi, �e stan� si� zwyk�ymi kamiennymi pos�gami.
};


instance DIA_ADDON_CRONOS_NW_TRADE(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_nw_trade_condition;
	information = dia_addon_cronos_nw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Mo�esz mi sprzeda� troch� sprz�tu?";
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
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Mo�esz mi sprzeda� troch� sprz�tu?
	if(DIA_ADDON_CRONOS_NW_TRADE_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Czemu nie? Je�li dobrze pami�tam, ostatnim razem tak�e handlowali�my.
		DIA_ADDON_CRONOS_NW_TRADE_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Powiedz mi, czego potrzebujesz.
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_CRONOSTRADE);
};


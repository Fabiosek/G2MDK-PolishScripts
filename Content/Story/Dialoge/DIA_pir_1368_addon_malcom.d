
instance DIA_ADDON_MALCOM_EXIT(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 999;
	condition = dia_addon_malcom_exit_condition;
	information = dia_addon_malcom_exit_info;
	permanent = TRUE;
	description = "Musz� i��.";
};


func int dia_addon_malcom_exit_condition()
{
	return TRUE;
};

func void dia_addon_malcom_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//Musz� i��.
	if(MALCOMBOTSCHAFT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Nie daj si� po�re� �adnym bestiom. To niebezpieczna okolica.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Hej! Je�eli wracasz do obozu, to przeka� co� Henry'emu.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//Te drzewa s� strasznie twarde.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//Wycinka jest ci�ka, wi�c jeszcze przez jaki� czas drewna nie b�dzie. Powiedz mu to.
		MALCOMBOTSCHAFT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MALCOM_PICKPOCKET(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 900;
	condition = dia_addon_malcom_pickpocket_condition;
	information = dia_addon_malcom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_malcom_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_malcom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_BACK,dia_addon_malcom_pickpocket_back);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_PICKPOCKET,dia_addon_malcom_pickpocket_doit);
};

func void dia_addon_malcom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};

func void dia_addon_malcom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};


instance DIA_ADDON_MALCOM_HELLO(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 1;
	condition = dia_addon_malcom_hello_condition;
	information = dia_addon_malcom_hello_info;
	important = TRUE;
};


func int dia_addon_malcom_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//Nie jeste� st�d, prawda?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//Wygl�dasz na kogo�, kto widzia� ju� spory kawa�ek �wiata.
};


instance DIA_ADDON_MALCOM_WASMACHEN(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 2;
	condition = dia_addon_malcom_wasmachen_condition;
	information = dia_addon_malcom_wasmachen_info;
	description = "Zaj�ty?";
};


func int dia_addon_malcom_wasmachen_condition()
{
	return TRUE;
};

func void dia_addon_malcom_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Zaj�ty?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//S�uchaj uwa�nie, bo nie b�d� powtarza�. Henry chce drewna, co oznacza, �e musz� wyci�� jeszcze sporo drzew.
	if(henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Henry?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//Dowodzi nasz� grup�.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//Stoi przed obozem i lubi sobie pogada�.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//Wiesz, r�ne rzeczy o tym, �e musimy robi� to, co do nas nale�y, dla dobra innych i takie tam brednie.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//Oczywi�cie on nawet palcem nie kiwnie.
};


instance DIA_ADDON_MALCOM_ENTERTRUPP(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 5;
	condition = dia_addon_malcom_entertrupp_condition;
	information = dia_addon_malcom_entertrupp_info;
	description = "Henry jest waszym przyw�dc�?";
};


func int dia_addon_malcom_entertrupp_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_entertrupp_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Henry jest waszym przyw�dc�?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Tak. Jest dow�dc� naszej grupy aborda�owej.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//Za to naszym kapitanem jest Greg.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//Ale nie ma go w tej chwili.
	};
};


instance DIA_ADDON_MALCOM_LAGER(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 3;
	condition = dia_addon_malcom_lager_condition;
	information = dia_addon_malcom_lager_info;
	description = "Gdzie le�y wasz ob�z?";
};


func int dia_addon_malcom_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//Gdzie le�y wasz ob�z?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Id� t� �cie�k� na zach�d.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//Na pewno spotkasz Henry'ego.
};


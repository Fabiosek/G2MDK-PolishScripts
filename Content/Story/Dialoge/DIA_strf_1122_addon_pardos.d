
instance DIA_ADDON_PARDOS_EXIT(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 999;
	condition = dia_addon_pardos_exit_condition;
	information = dia_addon_pardos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_pardos_exit_condition()
{
	return TRUE;
};

func void dia_addon_pardos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PARDOS_HI(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 2;
	condition = dia_addon_pardos_hi_condition;
	information = dia_addon_pardos_hi_info;
	permanent = FALSE;
	description = "Co z tob�?";
};


func int dia_addon_pardos_hi_condition()
{
	if(SKLAVEN_FLUCHT == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_pardos_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_00");	//Co z tob�?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_01");	//Powoli nadchodzi koniec... M�j koniec... Czy to pi�kny letni poranek, czy te� gor�ca noc, podczas kt�rej gwiazdy migoc� na kryszta�owo czystym niebie?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_02");	//Nie wiem... Gdzie jest majowy deszcz, gdzie jest jesienny wiatr... Nie czuj� ich...
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_03");	//Wzrok odchodzi jako pierwszy...
};


instance DIA_ADDON_PARDOS_SAVE(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 2;
	condition = dia_addon_pardos_save_condition;
	information = dia_addon_pardos_save_info;
	permanent = FALSE;
	description = "Trzymaj si�. Pomoc ju� nadchodzi.";
};


func int dia_addon_pardos_save_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_pardos_hi) && (SKLAVEN_FLUCHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_pardos_save_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_save_15_00");	//Trzymaj si�. Pomoc ju� nadchodzi.
	AI_Output(self,other,"DIA_Addon_Pardos_save_03_01");	//Dzi�kuj�... Dzi�kuj� za te koj�ce s�owa.
};


var int pardos_geheilt;

instance DIA_ADDON_PARDOS_TRANK(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 2;
	condition = dia_addon_pardos_trank_condition;
	information = dia_addon_pardos_trank_info;
	permanent = FALSE;
	description = "Wypij to. (Daj nap�j)";
};


func int dia_addon_pardos_trank_condition()
{
	if((PARDOS_GEHEILT == FALSE) && Npc_KnowsInfo(other,dia_addon_pardos_save))
	{
		return TRUE;
	};
};

func void dia_addon_pardos_trank_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_15_00");	//Wypij to.
	AI_StandupQuick(self);
	Info_ClearChoices(dia_addon_pardos_trank);
	Info_AddChoice(dia_addon_pardos_trank,DIALOG_BACK,dia_addon_pardos_trank_back);
	if(Npc_HasItems(other,itpo_health_01))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Daj esencj� lecznicz�",dia_addon_pardos_trank_01);
	};
	if(Npc_HasItems(other,itpo_health_02))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Daj ekstrakt leczniczy",dia_addon_pardos_trank_02);
	};
	if(Npc_HasItems(other,itpo_health_03))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Daj eliksir leczniczy",dia_addon_pardos_trank_03);
	};
	if(Npc_HasItems(other,itfo_addon_meatsoup))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Daj gulasz",dia_addon_pardos_trank_soup);
	};
};

func void b_saypardosthanks()
{
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_00");	//Dzi�ki. Czuj� si� jakby lepiej...
};

func void dia_addon_pardos_trank_back()
{
	Info_ClearChoices(dia_addon_pardos_trank);
};

func void dia_addon_pardos_trank_01()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	PARDOS_GEHEILT = TRUE;
	b_saypardosthanks();
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_pardos_trank_02()
{
	if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	PARDOS_GEHEILT = TRUE;
	b_saypardosthanks();
	b_giveplayerxp(XP_AMBIENT * 2);
};

func void dia_addon_pardos_trank_03()
{
	if(b_giveinvitems(other,self,itpo_health_01,3))
	{
		b_useitem(self,itpo_health_03);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	PARDOS_GEHEILT = TRUE;
	b_saypardosthanks();
	b_giveplayerxp(XP_AMBIENT * 3);
};

func void dia_addon_pardos_trank_soup()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_soup_15_00");	//Zjedz troch� gulaszu.
	if(b_giveinvitems(other,self,itfo_addon_meatsoup,1))
	{
		b_useitem(self,itfo_addon_meatsoup);
	};
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_01");	//Dzi�kuj�. Powinienem szybko odzyska� si�y.
	b_giveplayerxp(XP_AMBIENT * 3);
};


instance DIA_ADDON_PARDOS_PERM(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 99;
	condition = dia_addon_pardos_perm_condition;
	information = dia_addon_pardos_perm_info;
	permanent = TRUE;
	description = "Jak si� trzymasz?";
};


func int dia_addon_pardos_perm_condition()
{
	if(PARDOS_GEHEILT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_pardos_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_perm_15_00");	//Jak si� trzymasz?
	AI_Output(self,other,"DIA_Addon_Pardos_perm_03_01");	//Dzi�ki twoim staraniom czuj� si� znacznie lepiej. Wraca mi dawna si�a.
};


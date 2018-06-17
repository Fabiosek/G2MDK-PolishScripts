
instance DIA_GORNOW_EXIT(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 999;
	condition = dia_gornow_exit_condition;
	information = dia_gornow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornow_exit_condition()
{
	return TRUE;
};

func void dia_gornow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNOW_HELLO(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_hello_condition;
	information = dia_gornow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_hello_condition()
{
	return TRUE;
};

func void dia_gornow_hello_info()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Do�� tego wylegiwania! Jeste� wolny!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//Najwy�szy czas, �eby kto� mnie st�d wyci�gn��.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Ale w �yciu bym si� nie spodziewa�, �e to b�dziesz ty! Dobrze ci� znowu widzie�!
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//Garond narzeka, �e za du�o jesz i nie mo�e sobie pozwoli� na utrzymywanie takiego darmozjada.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Skoro ju� o tym mowa - napi�bym si� dobrego piwa! Chod�my st�d, zbrzyd�a mi ta cela.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Czekaj chwil�. Mam tutaj co�, co mo�e ci si� przyda�.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//Znalaz�em w celi t� zbroj�. Jaki� wi�zie� musia� j� tutaj ukry�.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//Na mnie jest za ma�a, ale na ciebie powinna pasowa�.
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//Dzi�ki! Zobaczymy si� u Miltena...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//W porz�dku. Zobaczymy si� u Miltena.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Jasna sprawa!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	b_startotherroutine(milten,"GORNFREE");
	MIS_RESCUEGORN = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEGORN);
};


instance DIA_GORNOW_METMILTEN(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_metmilten_condition;
	information = dia_gornow_metmilten_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_metmilten_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_metmilten_info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//S�uchaj, do�� si� ju� tutaj wynudzi�em. Mam wielk� ochot� rozejrze� si� troch� poza dolin�.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Jak si� przedosta�e� przez prze��cz?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Znalaz�em ukryt� �cie�k�, kt�ra prowadzi przez opuszczon� kopalni�.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//�wietnie. Zaczekam na w�a�ciw� chwil�, a potem dam st�d nog�.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//Dok�d p�jdziesz?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Podobno Lee jeszcze �yje. Spr�buj� znowu do niego do��czy�.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//W takim razie id� na farm� Onara. Znajdziesz tam Lee i jego ch�opc�w. Na pewno uciesz� si� na tw�j widok.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//Tak zrobi�! Dzi�ki za cynk.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "Jeszcze si� spotkamy.";
};


func int dia_gornow_seeyou_condition()
{
	if(Npc_KnowsInfo(other,dia_gornow_metmilten) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_seeyou_info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Jeszcze si� spotkamy.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//Mo�esz na to liczy�.
	AI_StopProcessInfos(self);
};


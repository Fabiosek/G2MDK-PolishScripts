
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
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Doœæ tego wylegiwania! Jesteœ wolny!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//Najwy¿szy czas, ¿eby ktoœ mnie st¹d wyci¹gn¹³.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Ale w ¿yciu bym siê nie spodziewa³, ¿e to bêdziesz ty! Dobrze ciê znowu widzieæ!
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//Garond narzeka, ¿e za du¿o jesz i nie mo¿e sobie pozwoliæ na utrzymywanie takiego darmozjada.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Skoro ju¿ o tym mowa - napi³bym siê dobrego piwa! ChodŸmy st¹d, zbrzyd³a mi ta cela.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Czekaj chwilê. Mam tutaj coœ, co mo¿e ci siê przydaæ.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//Znalaz³em w celi tê zbrojê. Jakiœ wiêzieñ musia³ j¹ tutaj ukryæ.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//Na mnie jest za ma³a, ale na ciebie powinna pasowaæ.
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//Dziêki! Zobaczymy siê u Miltena...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//W porz¹dku. Zobaczymy siê u Miltena.
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
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//S³uchaj, doœæ siê ju¿ tutaj wynudzi³em. Mam wielk¹ ochotê rozejrzeæ siê trochê poza dolin¹.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Jak siê przedosta³eœ przez prze³êcz?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Znalaz³em ukryt¹ œcie¿kê, która prowadzi przez opuszczon¹ kopalniê.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Œwietnie. Zaczekam na w³aœciw¹ chwilê, a potem dam st¹d nogê.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//Dok¹d pójdziesz?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Podobno Lee jeszcze ¿yje. Spróbujê znowu do niego do³¹czyæ.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//W takim razie idŸ na farmê Onara. Znajdziesz tam Lee i jego ch³opców. Na pewno uciesz¹ siê na twój widok.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//Tak zrobiê! Dziêki za cynk.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "Jeszcze siê spotkamy.";
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
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Jeszcze siê spotkamy.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//Mo¿esz na to liczyæ.
	AI_StopProcessInfos(self);
};


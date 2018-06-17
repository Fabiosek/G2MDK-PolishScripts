
instance DIA_TALBIN_NW_EXIT(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_nw_exit_condition()
{
	return TRUE;
};

func void dia_talbin_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_NW(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 15;
	condition = dia_talbin_nw_condition;
	information = dia_talbin_nw_info;
	description = "No proszê, prze³êcz nie by³a chyba a¿ tak straszna?";
};


func int dia_talbin_nw_condition()
{
	return TRUE;
};

func void dia_talbin_nw_info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//No proszê, prze³êcz nie by³a chyba a¿ tak straszna?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//Dziêki za ratunek.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//Proszê, znalaz³em ten kamieñ na prze³êczy. Myœlê, ¿e ci siê przyda.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//To chyba kamieñ runiczny.
		CreateInvItems(self,itmi_runeblank,1);
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//To chyba kawa³ek rudy.
		CreateInvItems(self,itmi_nugget,1);
		b_giveinvitems(self,other,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//Niech Innos ma ciê w swojej opiece.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_TALBIN_RUNS = TRUE;
	b_giveplayerxp(XP_SAVEDTALBIN);
};


instance DIA_TALBIN_NW_PERM(C_INFO)
{
	npc = vlk_4132_talbin_nw;
	nr = 15;
	condition = dia_talbin_nw_perm_condition;
	information = dia_talbin_nw_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_talbin_nw_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_nw))
	{
		return TRUE;
	};
};

func void dia_talbin_nw_perm_info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//Tak, dziêkujê. IdŸ ju¿, poradzê sobie.
	AI_StopProcessInfos(self);
};


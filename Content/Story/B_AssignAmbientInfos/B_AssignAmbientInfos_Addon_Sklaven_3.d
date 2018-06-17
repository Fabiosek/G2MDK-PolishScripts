
instance DIA_SKALVEN_3_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_skalven_3_exit_condition;
	information = dia_skalven_3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_skalven_3_exit_condition()
{
	return TRUE;
};

func void dia_skalven_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKALVEN_3_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_skalven_3_standard_condition;
	information = dia_skalven_3_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_skalven_3_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_skalven_3_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_00");	//Czego ode mnie chcesz? OdejdŸ!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_01");	//Nic nie zrobi³em! Zostaw mnie w spokoju.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_02");	//Proszê, nie bij mnie!
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_addon_sklaven_3(var C_NPC slf)
{
	dia_skalven_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_skalven_3_standard.npc = Hlp_GetInstanceID(slf);
};


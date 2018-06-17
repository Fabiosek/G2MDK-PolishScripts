
instance DIA_STRF_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_strf_13_exit_condition;
	information = dia_strf_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_strf_13_exit_condition()
{
	return TRUE;
};

func void dia_strf_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_13_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_strf_13_standard_condition;
	information = dia_strf_13_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_strf_13_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_strf_13_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_STRF_13_STANDARD_13_00");	//Zostaw mnie w spokoju, cz�owieku!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_STRF_13_STANDARD_13_01");	//Czego chcesz? Nie czepiaj si� mnie!
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_STRF_13_STANDARD_13_02");	//Wszyscy tutaj umrzemy!
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_strf_13(var C_NPC slf)
{
	dia_strf_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_strf_13_standard.npc = Hlp_GetInstanceID(slf);
};


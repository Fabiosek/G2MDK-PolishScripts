
instance DIA_OUT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_out_1_exit_condition;
	information = dia_out_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_out_1_exit_condition()
{
	return TRUE;
};

func void dia_out_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_1_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_out_1_standard_condition;
	information = dia_out_1_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_out_1_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_out_1_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_01_00");	//Od kiedy pad³a Bariera otaczaj¹ca koloniê karn¹, mamy wielki problem z bandytami.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_01_01");	//Na stra¿y nie mo¿na polegaæ. Sami musimy siê broniæ.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_1_STANDARD_01_02");	//Nie pozwolê siê nikomu wykorzystywaæ - ani Królowi, ani temu t³ustemu Onarowi. Sam potrafiê o siebie zadbaæ.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_out_1(var C_NPC slf)
{
	dia_out_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_1_standard.npc = Hlp_GetInstanceID(slf);
};


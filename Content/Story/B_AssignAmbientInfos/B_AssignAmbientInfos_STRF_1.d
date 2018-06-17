
instance DIA_STRF_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_strf_1_exit_condition;
	information = dia_strf_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_strf_1_exit_condition()
{
	return TRUE;
};

func void dia_strf_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_strf_1_standard_condition;
	information = dia_strf_1_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_strf_1_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_strf_1_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_STRF_1_STANDARD_01_00");	//Gdybym odszed�, kiedy mia�em na to szans�, dzi� nie musia�bym harowa� dla tych �wi�!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_STRF_1_STANDARD_01_01");	//Wszystko przez rud�! Ci�gle to samo. Wszystkim zale�y tylko na tej cholernej rudzie.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_STRF_1_STANDARD_01_02");	//Gdyby� cho� raz spr�bowa� �arcia, kt�re nam daj�, sam zacz��by� my�le� o buncie.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_strf_1(var C_NPC slf)
{
	dia_strf_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_strf_1_standard.npc = Hlp_GetInstanceID(slf);
};


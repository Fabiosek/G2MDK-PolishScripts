
instance DIA_ADDON_TONAK_EXIT(C_INFO)
{
	npc = strf_1120_addon_tonak;
	nr = 999;
	condition = dia_addon_tonak_exit_condition;
	information = dia_addon_tonak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tonak_exit_condition()
{
	return TRUE;
};

func void dia_addon_tonak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TONAK_HI(C_INFO)
{
	npc = strf_1120_addon_tonak;
	nr = 2;
	condition = dia_addon_tonak_hi_condition;
	information = dia_addon_tonak_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_tonak_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (SKLAVEN_FLUCHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_tonak_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Tonak_Hi_03_00");	//Czego chcesz? Jestem tu wiêŸniem, choæ nie zrobi³em nic z³ego.
	AI_StopProcessInfos(self);
};


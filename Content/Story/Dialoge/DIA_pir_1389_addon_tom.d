
instance DIA_ADDON_PIR_1389_TOM_EXIT(C_INFO)
{
	npc = pir_1389_addon_tom;
	nr = 999;
	condition = dia_addon_pir_tom_exit_condition;
	information = dia_addon_pir_tom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_pir_tom_exit_condition()
{
	return TRUE;
};

func void dia_addon_pir_tom_exit_info()
{
	AI_StopProcessInfos(self);
};



instance DIA_MIL_332_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_332_stadtwache;
	nr = 999;
	condition = dia_mil_332_stadtwache_exit_condition;
	information = dia_mil_332_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_332_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_332_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_332_STADTWACHE_PERM(C_INFO)
{
	npc = mil_332_stadtwache;
	nr = 1;
	condition = dia_mil_332_stadtwache_perm_condition;
	information = dia_mil_332_stadtwache_perm_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_mil_332_stadtwache_perm_condition()
{
	return TRUE;
};

func void dia_mil_332_stadtwache_perm_info()
{
	AI_Output(other,self,"DIA_Mil_332_Stadtwache_PERM_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Mil_332_Stadtwache_PERM_04_01");	//Odsun¹æ siê! Jestem na s³u¿bie!
	AI_StopProcessInfos(self);
};


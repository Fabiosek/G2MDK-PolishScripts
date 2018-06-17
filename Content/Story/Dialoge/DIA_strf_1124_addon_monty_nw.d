
instance DIA_ADDON_MONTY_NW_EXIT(C_INFO)
{
	npc = strf_1124_addon_monty_nw;
	nr = 999;
	condition = dia_addon_monty_nw_exit_condition;
	information = dia_addon_monty_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_monty_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_monty_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MONTY_NW_HI(C_INFO)
{
	npc = strf_1124_addon_monty_nw;
	nr = 2;
	condition = dia_addon_monty_nw_hi_condition;
	information = dia_addon_monty_nw_hi_info;
	permanent = FALSE;
	description = "Z powrotem do pracy?";
};


func int dia_addon_monty_nw_hi_condition()
{
	return TRUE;
};

func void dia_addon_monty_nw_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_00");	//Z powrotem do pracy?
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_01");	//A jak myœlisz? S³uchaj, ch³opie, kiedy mnie nie by³o, te ³achudry nie po³o¿y³y jednej deski prawid³owo! Muszê pomyœleæ, jak to wszystko z³o¿yæ do kupy.
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_02");	//Dobrze. Nie bêdê ci przeszkadza³.
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_03");	//Jasne. Bezpiecznej podró¿y.
};


instance DIA_ADDON_MONTY_NW_PICKPOCKET(C_INFO)
{
	npc = strf_1124_addon_monty_nw;
	nr = 900;
	condition = dia_addon_monty_nw_pickpocket_condition;
	information = dia_addon_monty_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_monty_nw_pickpocket_condition()
{
	return c_beklauen(60,60);
};

func void dia_addon_monty_nw_pickpocket_info()
{
	Info_ClearChoices(dia_addon_monty_nw_pickpocket);
	Info_AddChoice(dia_addon_monty_nw_pickpocket,DIALOG_BACK,dia_addon_monty_nw_pickpocket_back);
	Info_AddChoice(dia_addon_monty_nw_pickpocket,DIALOG_PICKPOCKET,dia_addon_monty_nw_pickpocket_doit);
};

func void dia_addon_monty_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_monty_nw_pickpocket);
};

func void dia_addon_monty_nw_pickpocket_back()
{
	Info_ClearChoices(dia_addon_monty_nw_pickpocket);
};


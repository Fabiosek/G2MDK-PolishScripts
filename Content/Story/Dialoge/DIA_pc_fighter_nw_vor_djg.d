
instance DIA_GORNNW_KAP3_EXIT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 999;
	condition = dia_gornnw_kap3_exit_condition;
	information = dia_gornnw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_kap3_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_HALLO(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_hallo_condition;
	information = dia_gornnw_hallo_info;
	permanent = FALSE;
	description = "Wszystko w porz�dku?";
};


func int dia_gornnw_hallo_condition()
{
	return TRUE;
};

func void dia_gornnw_hallo_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//Wszystko w porz�dku?
	if(MIS_RESCUEGORN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//Uratowa�e� m�j ty�ek, kolego.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//Nigdy ci tego nie zapomn�.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//Milten mnie wyci�gn��.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//Nigdy mu tego nie zapomn�.
	};
};


instance DIA_GORNNW_WHATNEXT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_whatnext_condition;
	information = dia_gornnw_whatnext_info;
	permanent = TRUE;
	description = "Co b�dziesz teraz robi�?";
};


func int dia_gornnw_whatnext_condition()
{
	return TRUE;
};

func void dia_gornnw_whatnext_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//Co b�dziesz teraz robi�?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//Najpierw zamierzam porz�dnie si� naje��.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//A potem?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//Kto wie? Mo�e wr�c� do Kolonii?
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//Kto� musi mie� oko na ork�w. Nie chcemy chyba, �eby bez ostrze�enia zapukali nam do drzwi, nie?
};


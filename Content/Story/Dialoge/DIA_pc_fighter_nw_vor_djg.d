
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
	description = "Wszystko w porz¹dku?";
};


func int dia_gornnw_hallo_condition()
{
	return TRUE;
};

func void dia_gornnw_hallo_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//Wszystko w porz¹dku?
	if(MIS_RESCUEGORN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//Uratowa³eœ mój ty³ek, kolego.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//Nigdy ci tego nie zapomnê.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//Milten mnie wyci¹gn¹³.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//Nigdy mu tego nie zapomnê.
	};
};


instance DIA_GORNNW_WHATNEXT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_whatnext_condition;
	information = dia_gornnw_whatnext_info;
	permanent = TRUE;
	description = "Co bêdziesz teraz robi³?";
};


func int dia_gornnw_whatnext_condition()
{
	return TRUE;
};

func void dia_gornnw_whatnext_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//Co bêdziesz teraz robi³?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//Najpierw zamierzam porz¹dnie siê najeœæ.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//A potem?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//Kto wie? Mo¿e wrócê do Kolonii?
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//Ktoœ musi mieæ oko na orków. Nie chcemy chyba, ¿eby bez ostrze¿enia zapukali nam do drzwi, nie?
};


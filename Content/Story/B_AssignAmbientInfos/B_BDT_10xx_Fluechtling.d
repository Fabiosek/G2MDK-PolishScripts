
func void b_dia_bdt_10xx_fluechtling_stimme7()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00");	//Nie ma mowy! Nie wr�c� do wi�zienia!
};

func void b_dia_bdt_10xx_fluechtling_stimme6()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00");	//Nie przyszed�e� chyba po to, �eby zabra� nas z powrotem do wi�zienia, co?
};


instance DIA_BDT_1031_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 999;
	condition = dia_bdt_1031_fluechtling_exit_condition;
	information = dia_bdt_1031_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1031_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1031_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_FLUECHTLING_TIP1(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 2;
	condition = dia_bdt_1031_fluechtling_tip1_condition;
	information = dia_bdt_1031_fluechtling_tip1_info;
	important = TRUE;
};


func int dia_bdt_1031_fluechtling_tip1_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_tip1_info()
{
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");	//Trzymaj si� ode mnie z daleka, chyba �e chcesz wyl�dowa� w wi�zieniu.
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1031_fluechtling_tip1);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Nie b�j si�, nie chc� ci� wyda�.",dia_bdt_1031_fluechtling_tip1_frei);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Przybywam, by ci� aresztowa�.",dia_bdt_1031_fluechtling_tip1_knast);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Gdzie jest Morgahard, tw�j dow�dca?",dia_bdt_1031_fluechtling_tip1_morgahard);
	};
};

func void dia_bdt_1031_fluechtling_tip1_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");	//Gdzie jest Morgahard, tw�j dow�dca?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");	//Rozdzielili�my si�, �eby trudniej nas by�o z�apa�. Nie mam poj�cia, gdzie s� pozostali.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Szkoda, w takim razie b�d� chyba musia� powiadomi� s�dziego.",dia_bdt_1031_fluechtling_tip1_morgahard_drohen);
};

func void dia_bdt_1031_fluechtling_tip1_morgahard_drohen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00");	//Szkoda, w takim razie b�d� chyba musia� powiadomi� s�dziego.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01");	//Dobra ju�, dobra. Wydaje mi si�, �e niekt�rzy schronili si� w tawernie. Ale pami�taj, nie wiesz tego ode mnie!
	AI_StopProcessInfos(self);
};

func void dia_bdt_1031_fluechtling_tip1_knast()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");	//Przyszed�em tu, by ci� aresztowa�.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");	//Po moim trupie.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1031_fluechtling_tip1_frei()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");	//Nie b�j si�, nie chc� ci� wyda�.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");	//Je�li przysy�a ci� s�dzia, to powiedz mu, �e mo�e si� poca�owa�.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Co takiego zrobi�e�?",dia_bdt_1031_fluechtling_tip1_frei_verbrechen);
};

func void dia_bdt_1031_fluechtling_tip1_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");	//Co takiego zrobi�e�?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");	//Nie twoja sprawa.
};


instance DIA_BDT_1031_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 3;
	condition = dia_bdt_1031_fluechtling_perm_condition;
	information = dia_bdt_1031_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1031_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 999;
	condition = dia_bdt_1032_fluechtling_exit_condition;
	information = dia_bdt_1032_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1032_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1032_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 2;
	condition = dia_bdt_1032_fluechtling_perm_condition;
	information = dia_bdt_1032_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1032_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1032_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 999;
	condition = dia_bdt_1033_fluechtling_exit_condition;
	information = dia_bdt_1033_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1033_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1033_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_TIP2(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 2;
	condition = dia_bdt_1033_fluechtling_tip2_condition;
	information = dia_bdt_1033_fluechtling_tip2_info;
	important = TRUE;
};


func int dia_bdt_1033_fluechtling_tip2_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_tip2_info()
{
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");	//Czego ode mnie chcesz?
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1033_fluechtling_tip2);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Uspok�j si�. Chc� tylko porozmawia�.",dia_bdt_1033_fluechtling_tip2_frei);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Przys�a� mnie s�dzia. Mam ci� do niego zaprowadzi�.",dia_bdt_1033_fluechtling_tip2_knast);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Gdzie jest Morgahard, tw�j dow�dca?",dia_bdt_1033_fluechtling_tip2_morgahard);
	};
};

func void dia_bdt_1033_fluechtling_tip2_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");	//Gdzie jest Morgahard, tw�j dow�dca?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");	//Nie chc� �adnych k�opot�w. Id� do zarz�dcy. Wiem, �e chcia� si� ukry� w�r�d najemnik�w. A teraz zostaw mnie w spokoju.
	AI_StopProcessInfos(self);
};

func void dia_bdt_1033_fluechtling_tip2_knast()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");	//Przys�a� mnie s�dzia. Mam ci� do niego zaprowadzi�.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");	//NIE.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1033_fluechtling_tip2_frei()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");	//Uspok�j si�. Chc� tylko porozmawia�.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");	//Ale ja nie chc� rozmawia� z tob�. Odwal si�.
	Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Narobi�e� w portki ze strachu?",dia_bdt_1033_fluechtling_tip2_frei_verbrechen);
};

func void dia_bdt_1033_fluechtling_tip2_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");	//Narobi�e� w portki ze strachu?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");	//Gadaj zdr�w, to nie na ciebie czeka szubienica.
};


instance DIA_BDT_1033_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 3;
	condition = dia_bdt_1033_fluechtling_perm_condition;
	information = dia_bdt_1033_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1033_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 999;
	condition = dia_bdt_1034_fluechtling_exit_condition;
	information = dia_bdt_1034_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1034_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1034_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 2;
	condition = dia_bdt_1034_fluechtling_perm_condition;
	information = dia_bdt_1034_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1034_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1034_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 999;
	condition = dia_bdt_1035_fluechtling_exit_condition;
	information = dia_bdt_1035_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1035_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1035_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 2;
	condition = dia_bdt_1035_fluechtling_perm_condition;
	information = dia_bdt_1035_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1035_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1035_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


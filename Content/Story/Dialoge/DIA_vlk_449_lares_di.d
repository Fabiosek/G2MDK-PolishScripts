
instance DIA_LARES_DI_EXIT(C_INFO)
{
	npc = vlk_449_lares_di;
	nr = 999;
	condition = dia_lares_di_exit_condition;
	information = dia_lares_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_di_exit_condition()
{
	return TRUE;
};

func void dia_lares_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_DI_HALLO(C_INFO)
{
	npc = vlk_449_lares_di;
	nr = 2;
	condition = dia_lares_di_hallo_condition;
	information = dia_lares_di_hallo_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_lares_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lares_di_hallo_info()
{
	AI_Output(other,self,"DIA_Lares_DI_Hallo_15_00");	//Jak idzie?
	if(ORKSTURMDI == TRUE)
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_01");	//Po�piesz si�. Orkowie na pewno wr�c�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_02");	//Ta grota rzeczywi�cie jest straszna.
	};
};


instance DIA_LARES_DI_TRAINING(C_INFO)
{
	npc = vlk_449_lares_di;
	nr = 10;
	condition = dia_lares_di_training_condition;
	information = dia_lares_di_training_info;
	permanent = TRUE;
	description = "Naucz mnie tego, co potrafisz.";
};


func int dia_lares_di_training_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lares_di_training_info()
{
	AI_Output(other,self,"DIA_Lares_DI_Training_15_00");	//Naucz mnie tego, co potrafisz.
	AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//�aden problem.
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania si�",dia_lares_di_training_sneak);
	};
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_di_training_dex_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_di_training_dex_5);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lares_di_training_1h_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lares_di_training_1h_5);
};

func void dia_lares_di_training_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//Musisz lekko ugi�� wysuni�t� nog�, a drug� trzyma� prosto. Dzi�ki temu �atwiej zachowasz r�wnowag�.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania si�",dia_lares_di_training_sneak);
	};
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_di_training_dex_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_di_training_dex_5);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lares_di_training_1h_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lares_di_training_1h_5);
};

func void dia_lares_di_training_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//Biodra powinny by� w ruchu. B�dzie ci �atwiej unikn�� ataku.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania si�",dia_lares_di_training_sneak);
	};
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_di_training_dex_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_di_training_dex_5);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lares_di_training_1h_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lares_di_training_1h_5);
};

func void dia_lares_di_training_dex_1()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//G�rna cz�� cia�a musi porusza� si� w zgodzie z reszt�.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania si�",dia_lares_di_training_sneak);
	};
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_di_training_dex_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_di_training_dex_5);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lares_di_training_1h_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lares_di_training_1h_5);
};

func void dia_lares_di_training_dex_5()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//Ca�y czas musisz uwa�a�, �eby nie straci� r�wnowagi.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania si�",dia_lares_di_training_sneak);
	};
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_di_training_dex_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_di_training_dex_5);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lares_di_training_1h_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lares_di_training_1h_5);
};

func void dia_lares_di_training_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_SNEAK_09_00");	//Zawsze stawiaj ca�� stop�, kiedy si� skradasz.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania si�",dia_lares_di_training_sneak);
	};
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_di_training_dex_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_di_training_dex_5);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_lares_di_training_1h_1);
	Info_AddChoice(dia_lares_di_training,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_lares_di_training_1h_5);
};

func void dia_lares_di_training_back()
{
	Info_ClearChoices(dia_lares_di_training);
};


instance DIA_LARES_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_449_lares_di;
	nr = 5;
	condition = dia_lares_di_undeaddragondead_condition;
	information = dia_lares_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Wygl�dasz, jakby� niezbyt si� tym przejmowa�.";
};


func int dia_lares_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_lares_di_undeaddragondead_onetime;

func void dia_lares_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_00");	//Wygl�dasz, jakby� niezbyt si� tym przejmowa�.
	AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_01");	//Ech, no wiesz. My�la�em, �e ci si� uda.
	if(DIA_LARES_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_02");	//Co zamierzasz teraz zrobi�?
		AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_03");	//Nie mam poj�cia. Na razie b�d� si� chyba trzyma� ciebie.
		DIA_LARES_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_StopProcessInfos(self);
};


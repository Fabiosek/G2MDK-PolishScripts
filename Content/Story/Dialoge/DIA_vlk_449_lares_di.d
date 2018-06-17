
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
	description = "Co s³ychaæ?";
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
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_01");	//Poœpiesz siê. Orkowie na pewno wróc¹.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_02");	//Ta grota rzeczywiœcie jest straszna.
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
	AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//¯aden problem.
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania siê",dia_lares_di_training_sneak);
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
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//Musisz lekko ugi¹æ wysuniêt¹ nogê, a drug¹ trzymaæ prosto. Dziêki temu ³atwiej zachowasz równowagê.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania siê",dia_lares_di_training_sneak);
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
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//Biodra powinny byæ w ruchu. Bêdzie ci ³atwiej unikn¹æ ataku.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania siê",dia_lares_di_training_sneak);
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
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//Górna czêœæ cia³a musi poruszaæ siê w zgodzie z reszt¹.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania siê",dia_lares_di_training_sneak);
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
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//Ca³y czas musisz uwa¿aæ, ¿eby nie straciæ równowagi.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania siê",dia_lares_di_training_sneak);
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
		AI_Output(self,other,"DIA_Lares_DI_Training_SNEAK_09_00");	//Zawsze stawiaj ca³¹ stopê, kiedy siê skradasz.
	};
	Info_ClearChoices(dia_lares_di_training);
	Info_AddChoice(dia_lares_di_training,DIALOG_BACK,dia_lares_di_training_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_lares_di_training,"Nauka skradania siê",dia_lares_di_training_sneak);
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
	description = "Wygl¹dasz, jakbyœ niezbyt siê tym przejmowa³.";
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
	AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_00");	//Wygl¹dasz, jakbyœ niezbyt siê tym przejmowa³.
	AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_01");	//Ech, no wiesz. Myœla³em, ¿e ci siê uda.
	if(DIA_LARES_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_02");	//Co zamierzasz teraz zrobiæ?
		AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_03");	//Nie mam pojêcia. Na razie bêdê siê chyba trzymaæ ciebie.
		DIA_LARES_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_StopProcessInfos(self);
};


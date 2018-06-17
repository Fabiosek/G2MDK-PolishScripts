
instance DIA_RUGA_EXIT(C_INFO)
{
	npc = mil_317_ruga;
	nr = 999;
	condition = dia_ruga_exit_condition;
	information = dia_ruga_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ruga_exit_condition()
{
	return TRUE;
};

func void dia_ruga_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUGA_PICKPOCKET(C_INFO)
{
	npc = mil_317_ruga;
	nr = 900;
	condition = dia_ruga_pickpocket_condition;
	information = dia_ruga_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie doœæ ³atwa)";
};


func int dia_ruga_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_03) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ruga_pickpocket_info()
{
	Info_ClearChoices(dia_ruga_pickpocket);
	Info_AddChoice(dia_ruga_pickpocket,DIALOG_BACK,dia_ruga_pickpocket_back);
	Info_AddChoice(dia_ruga_pickpocket,DIALOG_PICKPOCKET,dia_ruga_pickpocket_doit);
};

func void dia_ruga_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_city_tower_03,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_ruga_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ruga_pickpocket_back()
{
	Info_ClearChoices(dia_ruga_pickpocket);
};


instance DIA_RUGA_HALLO(C_INFO)
{
	npc = mil_317_ruga;
	nr = 2;
	condition = dia_ruga_hallo_condition;
	information = dia_ruga_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ruga_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ruga_hallo_info()
{
	AI_Output(other,self,"DIA_Ruga_Hallo_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Ruga_Hallo_11_01");	//Próbujê pokazaæ ch³opakom, jak w³aœciwie trzymaæ kuszê, i pomagam im nabraæ trochê zrêcznoœci.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ruga, stra¿nik miejski, pomo¿e mi w trenowaniu zrêcznoœci i nauczy mnie pos³ugiwaæ siê kusz¹, jednak tylko pod warunkiem, ¿e zostanê s³ug¹ Króla.");
};


instance DIA_RUGA_TRAIN(C_INFO)
{
	npc = mil_317_ruga;
	nr = 5;
	condition = dia_ruga_train_condition;
	information = dia_ruga_train_info;
	permanent = TRUE;
	description = "Mo¿esz mnie przeszkoliæ?";
};


func int dia_ruga_train_condition()
{
	if(RUGA_TEACHCROSSBOW == FALSE)
	{
		return TRUE;
	};
};

func void dia_ruga_train_info()
{
	AI_Output(other,self,"DIA_Ruga_Train_15_00");	//Czy móg³byœ mnie trenowaæ?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_01");	//Jasne. Jeœli masz ju¿ trochê doœwiadczenia, chêtnie ci pomogê.
		AI_Output(self,other,"DIA_Ruga_Train_11_02");	//Zawsze pamiêtaj, zwi¹zek miêdzy zrêcznoœci¹ a walk¹ na dystans jest równie wielki jak zwi¹zek kuszy i be³tu...
		AI_Output(other,self,"DIA_Ruga_Train_15_03");	//...Jedno nie istnieje bez drugiego, rozumiem.
		RUGA_TEACHCROSSBOW = TRUE;
		RUGA_TEACHDEX = TRUE;
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_04");	//ZejdŸ mi z oczu, najemniku.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_05");	//Nie, trenujê tylko osoby bêd¹ce na s³u¿bie u Króla. Nikogo wiêcej.
		AI_Output(self,other,"DIA_Ruga_Train_11_06");	//Zawsze jednak przyda siê nam ktoœ taki jak ty. Jeœli wiêc chcesz zaci¹gn¹æ siê do stra¿y, porozmawiaj z Lordem Andre.
	};
};


instance DIA_RUGA_TEACH(C_INFO)
{
	npc = mil_317_ruga;
	nr = 100;
	condition = dia_ruga_teach_condition;
	information = dia_ruga_teach_info;
	permanent = TRUE;
	description = "Poka¿ mi proszê, jak u¿ywaæ kuszy.";
};


var int dia_ruga_teach_permanent;

func int dia_ruga_teach_condition()
{
	if((RUGA_TEACHCROSSBOW == TRUE) && (DIA_RUGA_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ruga_teach_info()
{
	AI_Output(other,self,"DIA_Ruga_Teach_15_00");	//Poka¿ mi proszê, jak u¿ywaæ kuszy.
	Info_ClearChoices(dia_ruga_teach);
	Info_AddChoice(dia_ruga_teach,DIALOG_BACK,dia_ruga_teach_back);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_ruga_teach_1h_1);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_ruga_teach_1h_5);
};

func void dia_ruga_teach_back()
{
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 90)
	{
		AI_Output(self,other,"DIA_Ruga_Teach_11_00");	//Niczego wiecej ju¿ ciê nie nauczê. Czas, byœ znalaz³ sobie innego nauczyciela.
		DIA_RUGA_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_ruga_teach);
};

func void dia_ruga_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,90);
	Info_ClearChoices(dia_ruga_teach);
	Info_AddChoice(dia_ruga_teach,DIALOG_BACK,dia_ruga_teach_back);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_ruga_teach_1h_1);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_ruga_teach_1h_5);
};

func void dia_ruga_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,90);
	Info_ClearChoices(dia_ruga_teach);
	Info_AddChoice(dia_ruga_teach,DIALOG_BACK,dia_ruga_teach_back);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_ruga_teach_1h_1);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_ruga_teach_1h_5);
};


instance DIA_RUGA_TEACHDEX(C_INFO)
{
	npc = mil_317_ruga;
	nr = 101;
	condition = dia_ruga_teachdex_condition;
	information = dia_ruga_teachdex_info;
	permanent = TRUE;
	description = "Chcê byæ zrêczniejszy.";
};


var int dia_ruga_teachdex_permanent;

func int dia_ruga_teachdex_condition()
{
	if((RUGA_TEACHDEX == TRUE) && (DIA_RUGA_TEACHDEX_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ruga_teachdex_info()
{
	AI_Output(other,self,"DIA_Ruga_TEACHDEX_15_00");	//Chcia³bym zwiêkszyæ swoj¹ zrêcznoœæ.
	Info_ClearChoices(dia_ruga_teachdex);
	Info_AddChoice(dia_ruga_teachdex,DIALOG_BACK,dia_ruga_teachdex_back);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ruga_teachdex_1);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ruga_teachdex_5);
};

func void dia_ruga_teachdex_back()
{
	if(other.attribute[ATR_DEXTERITY] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Ruga_TEACHDEX_11_00");	//To wszystko, czego mog³em ciê nauczyæ. Jeœli chcesz podszlifowaæ sw¹ zrêcznoœæ, musisz znaleŸæ innego nauczyciela.
		DIA_RUGA_TEACHDEX_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_ruga_teachdex);
};

func void dia_ruga_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_LOW);
	Info_ClearChoices(dia_ruga_teachdex);
	Info_AddChoice(dia_ruga_teachdex,DIALOG_BACK,dia_ruga_teachdex_back);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ruga_teachdex_1);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ruga_teachdex_5);
};

func void dia_ruga_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_LOW);
	Info_ClearChoices(dia_ruga_teachdex);
	Info_AddChoice(dia_ruga_teachdex,DIALOG_BACK,dia_ruga_teachdex_back);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ruga_teachdex_1);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ruga_teachdex_5);
};


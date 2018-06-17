
instance DIA_1061_WACHE_EXIT(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 999;
	condition = dia_1061_wache_exit_condition;
	information = dia_1061_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1061_wache_exit_condition()
{
	return TRUE;
};

func void dia_1061_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_WACHE_HALLO(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 1;
	condition = dia_1061_wache_hallo_condition;
	information = dia_1061_wache_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1061_wache_hallo_condition()
{
	return TRUE;
};

func void dia_1061_wache_hallo_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//Stój! Têdy nie przejdziesz.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//Chcê rozmawiaæ z twoim przywódc¹.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//Ach, rozumiem, chcesz porozmawiaæ z moim szefem. W takim razie OCZYWIŒCIE ciê przepuszczê.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//Ale tylko pod warunkiem, ¿e wiesz, jak siê nazywa. Bo jeœli nie, to bêdê musia³ ciê zabiæ. A wiêc?
	Info_ClearChoices(dia_1061_wache_hallo);
	Info_AddChoice(dia_1061_wache_hallo,"Lee.",dia_1061_wache_hallo_lee);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_1061_wache_hallo,"Dexter.",dia_1061_wache_hallo_dexter);
	};
	Info_AddChoice(dia_1061_wache_hallo,"Diego.",dia_1061_wache_hallo_diego);
	Info_AddChoice(dia_1061_wache_hallo,"Nie mam pojêcia.",dia_1061_wache_hallo_ahnung);
};

func void dia_1061_wache_hallo_lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Lee.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//Hmmm, jakby to uj¹æ... W³aœnie po¿egna³eœ siê z ¿yciem, facet!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//Dexter.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//No dobrze... Wygl¹da na to, ¿e rzeczywiœcie znasz szefa. Dobrze, przepuszczê ciê. Ale uwa¿aj!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//Jeœli za bardzo siê do kogoœ zbli¿ysz, nie wyjdziesz st¹d ¿ywy!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//WeŸ wiêc g³êboki oddech i nie wyci¹gaj broni. Dextera znajdziesz w domu.
	KNOWS_DEXTER = TRUE;
	banditguard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
};

func void dia_1061_wache_hallo_diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//Diego.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//Prawda!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//Nie, tylko ¿artowa³em. Nie masz pojêcia, kto jest moim szefem.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//Nie ma wiêc ¿adnego powodu, dla którego nie mia³bym ciê zabiæ.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//Nie mam pojêcia.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//A wiêc zginiesz, g³upcze!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_1061_WACHE_PERM(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 2;
	condition = dia_1061_wache_perm_condition;
	information = dia_1061_wache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_1061_wache_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_1061_wache_perm_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//Pamiêtaj, zachowuj siê spokojnie, a wyjdziesz st¹d ¿ywy.
	AI_StopProcessInfos(self);
};


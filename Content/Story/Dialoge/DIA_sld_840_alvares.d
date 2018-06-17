
instance DIA_ALVARES_EXIT(C_INFO)
{
	npc = sld_840_alvares;
	nr = 999;
	condition = dia_alvares_exit_condition;
	information = dia_alvares_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alvares_exit_condition()
{
	return TRUE;
};

func void dia_alvares_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_HAUAB(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_hauab_condition;
	information = dia_alvares_hauab_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_hauab_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_hauab_info()
{
	AKILS_SLDSTILLTHERE = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//Nie wiem, co ci� tu przygna�o, ale lepiej zapomnij o tym i ruszaj w dalsz� drog�.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Farmie Akila zagra�aj� najemnicy.");
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_ATTACK(C_INFO)
{
	npc = sld_840_alvares;
	nr = 6;
	condition = dia_alvares_attack_condition;
	information = dia_alvares_attack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_attack_condition()
{
	if(Npc_KnowsInfo(other,dia_alvares_hauab) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_attack_info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//Hej, ci�gle tu jeste�? Dam ci szans�, przybyszu: wyno� si� st�d albo zginiesz.
	Info_ClearChoices(dia_alvares_attack);
	Info_AddChoice(dia_alvares_attack,"Kim jeste�cie, ch�opaki - w�drownymi b�aznami?",dia_alvares_attack_kerle);
	Info_AddChoice(dia_alvares_attack,"Chc� si� do was zaci�gn��.",dia_alvares_attack_soeldner);
	Info_AddChoice(dia_alvares_attack,"Wyno�cie si� st�d, zrozumiano?",dia_alvares_attack_witz);
	Info_AddChoice(dia_alvares_attack,"Nie chc� �adnych k�opot�w.",dia_alvares_attack_aerger);
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		Info_AddChoice(dia_alvares_attack,"Przyszed�em tylko co� zabra�.",dia_alvares_attack_lieferung);
	};
};

func void dia_alvares_attack_witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//Wyno�cie si� st�d, zrozumiano?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//No patrzcie, wpad� nam w �apy bohater - prawdziwy, durny bohater.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//Wiesz, co my�l�?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//A kogo obchodzi, co my�lisz?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//My�l�, �e dobry bohater to martwy bohater. Wi�c zr�b co� dla mnie - umieraj szybko!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//Kim jeste�cie, ch�opaki - w�drownymi b�aznami?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//Sam tego chcia�e�. Wci�� b�d� si� �mia�, kiedy ty b�dziesz le�a� z g�b� w b�ocie.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//Engardo, zaczynamy! Ty �ap wie�niaka - ja zajm� si� tym pajacem!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//Nie chc� �adnych k�opot�w.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//Ale my w�a�nie szukamy k�opot�w. Przebyli�my d�ug� drog� w�a�nie po to, �eby narobi� troch� zamieszania.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//Tak, zamierzamy narobi� sporo k�opot�w. I zaczn� od ciebie, je�li zaraz st�d nie znikniesz.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//Przyszed�em tylko co� zabra�.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//My te�. I byli�my pierwsi. Wi�c spadaj, bo b�d� musia� zrobi� ci krzywd�.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//Chc� si� do was zaci�gn��.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//Och, naprawd�? No to spad�wa - bo ju� si� nigdy nigdzie nie zaci�gniesz.
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_SCHLUSS(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_schluss_condition;
	information = dia_alvares_schluss_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_schluss_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_alvares_attack))
	{
		return TRUE;
	};
};

func void dia_alvares_schluss_info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//Mia�e� szans�. Ale chyba nie chcesz pos�ucha� m�drej rady.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//Dobra - no to teraz ci� zabij�. Engardo, za�atwmy ich!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_ALVARES_PICKPOCKET(C_INFO)
{
	npc = sld_840_alvares;
	nr = 900;
	condition = dia_alvares_pickpocket_condition;
	information = dia_alvares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alvares_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_alvares_pickpocket_info()
{
	Info_ClearChoices(dia_alvares_pickpocket);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_BACK,dia_alvares_pickpocket_back);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_PICKPOCKET,dia_alvares_pickpocket_doit);
};

func void dia_alvares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alvares_pickpocket);
};

func void dia_alvares_pickpocket_back()
{
	Info_ClearChoices(dia_alvares_pickpocket);
};


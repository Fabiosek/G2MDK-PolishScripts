
instance DIA_STRF_1107_EXIT(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 999;
	condition = dia_strf_1107_exit_condition;
	information = dia_strf_1107_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_strf_1107_exit_condition()
{
	return TRUE;
};

func void dia_strf_1107_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_finger_condition;
	information = dia_strf_1107_finger_info;
	important = TRUE;
};


func int dia_strf_1107_finger_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_strf_1107_finger_info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//£apy precz od moich garnków! Nikt nie bêdzie ich rusza³.
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Ja odpowiadam za jedzenie, a to oznacza, ¿e nikt inny nie ma tu wstêpu! Rozumiemy siê!
};


instance DIA_STRF_1107_COOK(C_INFO)
{
	npc = strf_1107_straefling;
	condition = dia_strf_1107_cook_condition;
	information = dia_strf_1107_cook_info;
	description = "Kto wybra³ ciê na kucharza?";
};


func int dia_strf_1107_cook_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cook_info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Kto wybra³ ciê na kucharza?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Kapitan Garond. Nim zosta³em wiêŸniem, by³em kucharzem we 'Wœciek³ym Dziku'.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//Za co ciê zamknêli?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Miêdzy mn¹, a pewnym goœciem dosz³o do ma³ej sprzeczki z u¿yciem tasaków.
};


instance DIA_STRF_1107_PERM(C_INFO)
{
	npc = strf_1107_straefling;
	nr = 900;
	condition = dia_strf_1107_perm_condition;
	information = dia_strf_1107_perm_info;
	permanent = TRUE;
	description = "Coœ nowego?";
};


func int dia_strf_1107_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void dia_strf_1107_perm_info()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//Jakieœ nowe wieœci?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Jeœli chcesz poznaæ najnowsze wieœci, pogadaj z rycerzami. Ja tu jestem tylko kucharzem... Za kratkami.
};


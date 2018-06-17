
instance DIA_PAL_262_EXIT(C_INFO)
{
	npc = pal_262_wache;
	nr = 999;
	condition = dia_pal_262_exit_condition;
	information = dia_pal_262_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_262_exit_condition()
{
	return TRUE;
};

func void dia_pal_262_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_INFO)
{
	npc = pal_262_wache;
	nr = 2;
	condition = dia_pal_262_greet_condition;
	information = dia_pal_262_greet_info;
	important = TRUE;
};


func int dia_pal_262_greet_condition()
{
	return TRUE;
};

func void dia_pal_262_greet_info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Zatrzymaj si� - kim jeste�?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//Niewa�ne kim jestem, wa�ne sk�d przychodz�. Niedawno przekroczy�em prze��cz.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//B�dziesz sprawia� problemy, czy po prostu pozwolisz mi wej��?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//Sk�d mia�em wiedzie�? Oczywi�cie, �e ci� wpuszcz�, wchod�.
	AI_StopProcessInfos(self);
};


instance DIA_WACHE_PERM(C_INFO)
{
	npc = pal_262_wache;
	nr = 3;
	condition = dia_wache_perm_condition;
	information = dia_wache_perm_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_wache_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void dia_wache_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_PERM_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_01");	//Kapitan Garond wraz ze swymi doradcami, paladynami Oricem i Parcivalem.
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_02");	//Wchod� �mia�o - za dnia kr�c� si� po Sali tronowej na parterze.
};


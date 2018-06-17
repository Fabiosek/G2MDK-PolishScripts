
instance DIA_GRIMES_EXIT(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 999;
	condition = dia_grimes_exit_condition;
	information = dia_grimes_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int grimes_first;

func int dia_grimes_exit_condition()
{
	return TRUE;
};

func void dia_grimes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMES_HALLO(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_hallo_condition;
	information = dia_grimes_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimes_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_grimes_hallo_info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//To ty? Kto by pomyœla³, ¿e siê jeszcze spotkamy.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Wygl¹da na to, ¿e obaj wiemy, jak utrzymaæ siê przy ¿yciu. Jak widzisz, zajmujê siê teraz górnictwem.
	if(GRIMES_FIRST == FALSE)
	{
		Wld_InsertNpc(snapper,"OW_PATH_148_A");
		Wld_InsertNpc(snapper,"OW_PATH_146");
		Wld_InsertNpc(snapper,"OW_PATH_147");
		Wld_InsertNpc(snapper,"OW_PATH_148");
		Wld_InsertNpc(snapper,"OW_PATH_264");
		GRIMES_FIRST = TRUE;
	};
};


instance DIA_GRIMES_ERZ(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_erz_condition;
	information = dia_grimes_erz_info;
	permanent = FALSE;
	description = "Ile rudy uda³o wam siê wydobyæ?";
};


func int dia_grimes_erz_condition()
{
	if((KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_grimes_erz_info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Ile rudy uda³o wam siê wydobyæ?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Kilka skrzyñ. Ale nic ju¿ tutaj nie zosta³o.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladyn Marcos postanowi³ zabraæ rudê do zamku, poniewa¿ bezustannie atakowali nas orkowie.
};


instance DIA_GRIMES_WEG(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 3;
	condition = dia_grimes_weg_condition;
	information = dia_grimes_weg_info;
	permanent = FALSE;
	description = "Czy wiesz, w któr¹ stronê uda³ siê Marcos?";
};


func int dia_grimes_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_erz) && (Npc_KnowsInfo(other,dia_marcos_garond) == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimes_weg_info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Czy wiesz, w któr¹ stronê uda³ siê Marcos?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Nie wybra³ najkrótszej drogi - zamierza³ przekroczyæ rzekê na jej zamarzniêtym odcinku.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Planowa³ zatoczyæ ³uk i dotrzeæ do zamku od zachodniej strony.
};


instance DIA_GRIMES_GRIMES(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_grimes_condition;
	information = dia_grimes_grimes_info;
	permanent = FALSE;
	description = "Czy chcia³byœ opuœciæ dolinê?";
};


func int dia_grimes_grimes_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_grimes_grimes_info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Czy chcia³byœ opuœciæ dolinê?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Nie, bêdê dalej zajmowa³ siê wydobyciem.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Nie pozwolê, by powstrzyma³o mnie paru zgni³ych orków. Miewa³em ju¿ gorsze problemy.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Kiedyœ na przyk³ad dr¹¿yliœmy tunel w starej kopalni i nagle wdar³a siê tam woda...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//Ale to stare dzieje.
};


instance DIA_GRIMES_PERM(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_perm_condition;
	information = dia_grimes_perm_info;
	permanent = TRUE;
	description = "Jak idzie praca?";
};


func int dia_grimes_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_grimes_perm_info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Jak idzie praca?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Te ska³y s¹ cholernie twarde.
};


instance DIA_GRIMES_PICKPOCKET(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 900;
	condition = dia_grimes_pickpocket_condition;
	information = dia_grimes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_grimes_pickpocket_condition()
{
	return c_beklauen(43,21);
};

func void dia_grimes_pickpocket_info()
{
	Info_ClearChoices(dia_grimes_pickpocket);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_BACK,dia_grimes_pickpocket_back);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_PICKPOCKET,dia_grimes_pickpocket_doit);
};

func void dia_grimes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimes_pickpocket);
};

func void dia_grimes_pickpocket_back()
{
	Info_ClearChoices(dia_grimes_pickpocket);
};


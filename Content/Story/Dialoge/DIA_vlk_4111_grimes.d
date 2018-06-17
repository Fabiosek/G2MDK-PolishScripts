
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
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//To ty? Kto by pomy�la�, �e si� jeszcze spotkamy.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Wygl�da na to, �e obaj wiemy, jak utrzyma� si� przy �yciu. Jak widzisz, zajmuj� si� teraz g�rnictwem.
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
	description = "Ile rudy uda�o wam si� wydoby�?";
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
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Ile rudy uda�o wam si� wydoby�?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Kilka skrzy�. Ale nic ju� tutaj nie zosta�o.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladyn Marcos postanowi� zabra� rud� do zamku, poniewa� bezustannie atakowali nas orkowie.
};


instance DIA_GRIMES_WEG(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 3;
	condition = dia_grimes_weg_condition;
	information = dia_grimes_weg_info;
	permanent = FALSE;
	description = "Czy wiesz, w kt�r� stron� uda� si� Marcos?";
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
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Czy wiesz, w kt�r� stron� uda� si� Marcos?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Nie wybra� najkr�tszej drogi - zamierza� przekroczy� rzek� na jej zamarzni�tym odcinku.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Planowa� zatoczy� �uk i dotrze� do zamku od zachodniej strony.
};


instance DIA_GRIMES_GRIMES(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_grimes_condition;
	information = dia_grimes_grimes_info;
	permanent = FALSE;
	description = "Czy chcia�by� opu�ci� dolin�?";
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
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Czy chcia�by� opu�ci� dolin�?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Nie, b�d� dalej zajmowa� si� wydobyciem.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Nie pozwol�, by powstrzyma�o mnie paru zgni�ych ork�w. Miewa�em ju� gorsze problemy.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Kiedy� na przyk�ad dr��yli�my tunel w starej kopalni i nagle wdar�a si� tam woda...
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
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Te ska�y s� cholernie twarde.
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


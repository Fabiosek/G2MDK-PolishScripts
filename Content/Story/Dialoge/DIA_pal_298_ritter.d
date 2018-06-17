
instance DIA_PAL_298_EXIT(C_INFO)
{
	npc = pal_298_ritter;
	nr = 999;
	condition = dia_pal_298_exit_condition;
	information = dia_pal_298_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_298_exit_condition()
{
	return TRUE;
};

func void dia_pal_298_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_298_PASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_pass_condition;
	information = dia_pal_298_pass_info;
	permanent = FALSE;
	description = "Dok�d prowadzi ta �cie�ka?";
};


func int dia_pal_298_pass_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_298_pass_info()
{
	AI_Output(other,self,"DIA_PAL_298_Pass_15_00");	//Dok�d prowadzi ta �cie�ka?
	AI_Output(self,other,"DIA_PAL_298_Pass_09_01");	//Za bram� le�y prze��cz prowadz�ca do G�rniczej Doliny.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_02");	//Po tej stronie jeste�my my - po drugiej za� okopa�a si� grupa ork�w.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_03");	//Lepiej zawr�� - t�dy nie przejdziesz.
};


instance DIA_PAL_298_TRESPASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_trespass_condition;
	information = dia_pal_298_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_298_trespass_condition()
{
	if(MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pal_298_trespass_info()
{
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_00");	//Jeste� pewien, �e chcesz tam i��? Obawiam si�, �e daleko nie zajdziesz - po drugiej stronie stacjonuj� orkowie.
	AI_Output(other,self,"DIA_PAL_298_TRESPASS_15_01");	//Je�li istnieje droga prowadz�ca do G�rniczej Doliny, odnajd� j�.
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_02");	//W porz�dku, wi�c id�. Niech Innos ci� prowadzi.
};


instance DIA_PAL_298_PERM1(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm1_condition;
	information = dia_pal_298_perm1_info;
	permanent = TRUE;
	description = "Wi�c je�li p�jd�, to na w�asne ryzyko?";
};


func int dia_pal_298_perm1_condition()
{
	if((KAPITEL == 1) && Npc_KnowsInfo(other,dia_pal_298_pass))
	{
		return TRUE;
	};
};

func void dia_pal_298_perm1_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm1_15_00");	//Wi�c je�li p�jd�, to na w�asne ryzyko?
	AI_Output(self,other,"DIA_PAL_298_Perm1_09_01");	//Je�li p�jdziesz, zginiesz. Dlatego w�a�nie tu jeste�my. Staramy si� nie dopu�ci� do takiego aktu g�upoty.
};


instance DIA_PAL_298_PERM2(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm2_condition;
	information = dia_pal_298_perm2_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_pal_298_perm2_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pal_298_perm2_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm2_15_00");	//Jak wygl�da sytuacja?
	AI_Output(self,other,"DIA_PAL_298_Perm2_09_01");	//Wszystko jakby si� uspokoi�o. Sytuacja jest pod nasz� kontrol�.
};


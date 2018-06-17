
instance DIA_ADDON_BDT_10026_WACHE_EXIT(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 999;
	condition = dia_addon_10026_wache_exit_condition;
	information = dia_addon_10026_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10026_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10026_WACHE_HI(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 99;
	condition = dia_addon_10026_wache_hi_condition;
	information = dia_addon_10026_wache_hi_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_addon_10026_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Co s�ycha�?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		CreateInvItems(self,itfo_bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//Szkoda, �e zosta�o tak ma�o niewolnik�w. Wkr�tce b�dziemy musieli zorganizowa� nowych.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Ci kolesie s� kompletnie wyczerpani. Pewnie z g�odu.
		b_useitem(self,itfo_bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Wol� jednak wys�a� do pracy kilku kopaczy, ni� karmi� tych g�upc�w mi�sem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Nie ma ju� niewolnik�w - no jaka szkoda. Wygl�da na to, �e musimy znowu pogoni� kopaczy.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10026_WACHE_GRUFT(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 2;
	condition = dia_addon_10026_wache_gruft_condition;
	information = dia_addon_10026_wache_gruft_info;
	permanent = TRUE;
	description = "Co wiesz o krypcie?";
};


func int dia_addon_10026_wache_gruft_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Co wiesz o krypcie?
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//No... znajduje si� na ko�cu tej �cie�ki.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//Id� po trupach, a znajdziesz j�.
};


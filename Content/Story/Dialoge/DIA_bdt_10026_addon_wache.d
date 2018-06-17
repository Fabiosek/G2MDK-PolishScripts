
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
	description = "Co s³ychaæ?";
};


func int dia_addon_10026_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Co s³ychaæ?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		CreateInvItems(self,itfo_bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//Szkoda, ¿e zosta³o tak ma³o niewolników. Wkrótce bêdziemy musieli zorganizowaæ nowych.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Ci kolesie s¹ kompletnie wyczerpani. Pewnie z g³odu.
		b_useitem(self,itfo_bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Wolê jednak wys³aæ do pracy kilku kopaczy, ni¿ karmiæ tych g³upców miêsem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Nie ma ju¿ niewolników - no jaka szkoda. Wygl¹da na to, ¿e musimy znowu pogoniæ kopaczy.
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
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//No... znajduje siê na koñcu tej œcie¿ki.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//IdŸ po trupach, a znajdziesz j¹.
};


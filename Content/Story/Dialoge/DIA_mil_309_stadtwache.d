
instance DIA_MIL_309_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 999;
	condition = dia_mil_309_stadtwache_exit_condition;
	information = dia_mil_309_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_309_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_309_STADTWACHE_HALLO(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 2;
	condition = dia_mil_309_stadtwache_hallo_condition;
	information = dia_mil_309_stadtwache_hallo_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_mil_309_stadtwache_hallo_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_hallo_info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//Co s�ycha�?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Og�lnie spok�j. Mamy na wszystko baczenie.
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Pos�uchaj mnie uwa�nie: nie mo�emy ci� wpu�ci� do miasta.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//Dam ci jednak pewn� wskaz�wk�, i to ca�kowicie za darmo.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Trzymaj si� z dala od las�w rozci�gaj�cych si� przed nami, nawiedzaj� je potworne bestie.
		MIL_309_NEWS = 1;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Wpe�znij lepiej pod bezpieczny kamie�, robaku.
	};
	if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Pos�uchaj - masz zezwolenie na wej�cie do miasta, nie znaczy to jednak, �e mo�esz robi�, co ci si� �ywnie spodoba.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//Je�li nie b�dziesz przestrzega� zasad, stracisz wszystkie przywileje tak szybko, jak je zyska�e�!
		MIL_309_NEWS = 2;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//No dalej - id� ju�!
	};
	AI_StopProcessInfos(self);
};


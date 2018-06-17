
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
	description = "Co s³ychaæ?";
};


func int dia_mil_309_stadtwache_hallo_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_hallo_info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//Co s³ychaæ?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Ogólnie spokój. Mamy na wszystko baczenie.
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Pos³uchaj mnie uwa¿nie: nie mo¿emy ciê wpuœciæ do miasta.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//Dam ci jednak pewn¹ wskazówkê, i to ca³kowicie za darmo.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Trzymaj siê z dala od lasów rozci¹gaj¹cych siê przed nami, nawiedzaj¹ je potworne bestie.
		MIL_309_NEWS = 1;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Wpe³znij lepiej pod bezpieczny kamieñ, robaku.
	};
	if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Pos³uchaj - masz zezwolenie na wejœcie do miasta, nie znaczy to jednak, ¿e mo¿esz robiæ, co ci siê ¿ywnie spodoba.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//Jeœli nie bêdziesz przestrzega³ zasad, stracisz wszystkie przywileje tak szybko, jak je zyska³eœ!
		MIL_309_NEWS = 2;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//No dalej - idŸ ju¿!
	};
	AI_StopProcessInfos(self);
};


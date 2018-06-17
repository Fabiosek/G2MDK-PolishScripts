
instance DIA_PAL_263_EXIT(C_INFO)
{
	npc = pal_263_wache;
	nr = 999;
	condition = dia_pal_263_exit_condition;
	information = dia_pal_263_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_263_exit_condition()
{
	return TRUE;
};

func void dia_pal_263_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_263_PERM(C_INFO)
{
	npc = pal_263_wache;
	nr = 2;
	condition = dia_pal_263_perm_condition;
	information = dia_pal_263_perm_info;
	permanent = TRUE;
	description = "Melduj, �o�nierzu!";
};


func int dia_pal_263_perm_condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_pal_263_perm_info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//Melduj, �o�nierzu!
	AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//Tak jest! Zgodnie z rozkazem utrzymujemy pozycje. �adnych dodatkowych strat. Zapasy na wyczerpaniu, orkowie jak na razie spokojni.
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//Ostatni atak smok�w doszcz�tnie zniszczy� zewn�trzne mury. Od tamtego czasu nic wa�nego si� nie wydarzy�o.
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//W porz�dku, wracaj do s�u�by.
};


instance DIA_PAL_263_PERM_OTH(C_INFO)
{
	npc = pal_263_wache;
	nr = 2;
	condition = dia_pal_263_perm_oth_condition;
	information = dia_pal_263_perm_oth_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_pal_263_perm_oth_condition()
{
	if((hero.guild != GIL_MIL) || (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_pal_263_perm_oth_info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//Jak wygl�da sytuacja?
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//Kontrolujemy sytuacj�. Nie martw si�, cywilu. Wszystko dobrze si� sko�czy.
};


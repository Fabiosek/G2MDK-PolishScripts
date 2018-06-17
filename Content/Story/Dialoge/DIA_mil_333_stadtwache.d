
instance DIA_MIL_333_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 999;
	condition = dia_mil_333_stadtwache_exit_condition;
	information = dia_mil_333_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_333_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_333_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_333_CHECKPOINT = "NW_CITY_MERCHANT_PATH_29";

var int mil_333_personal_absolutionlevel;

instance DIA_MIL_333_STADTWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 1;
	condition = dia_mil_333_stadtwache_firstwarn_condition;
	information = dia_mil_333_stadtwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_333_CHECKPOINT) <= 1000)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_333_PERSONAL_ABSOLUTIONLEVEL))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_333_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_firstwarn_info()
{
	var C_ITEM itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//ST�J!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//O co chodzi?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//Ju� ty wiesz o co, nawet a� za dobrze.
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//Jeste� poszukiwany w mie�cie za morderstwo.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//Nie potrzebujemy tu �adnych brudnych z�odziei!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//W tym mie�cie nie ma miejsca dla awanturnik�w!
		};
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//A dlaczego mieliby�my ci� wpu�ci�?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Tak?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//Wygl�dasz na biedaka, nie potrzebujemy takich w naszym mie�cie.
			if(Npc_HasItems(other,itwr_passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//Ale� ja mam przepustk�!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//Dotyczy jedynie drugiej bramy.
			};
			if(Npc_KnowsInfo(other,dia_mil_310_stadtwache_milizwerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//Mam zamiar zaci�gn�� si� do stra�y miejskiej!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Heh! Nie roz�mieszaj mnie! Wynocha pod drug� bram�, mo�e TAM uwierz� w te brednie.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//Ju� tam by�em, przys�ano mnie tutaj.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//Cholera! �mietanka zawsze trafia do nas...
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//Co?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Chcia�em jedynie rzuci� na ciebie okiem. Wygl�da na to, �e masz pieni�dze. Mo�esz wej��.
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			MIL_333_SCHONMALREINGELASSEN = TRUE;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_333_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_333_STADTWACHE_SECONDWARN(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 2;
	condition = dia_mil_333_stadtwache_secondwarn_condition;
	information = dia_mil_333_stadtwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_333_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//Masz co� ze s�uchem? Jeszcze jeden krok, a zapoznasz si� bli�ej z ostrzem mojego miecza.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_333_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_333_STADTWACHE_ATTACK(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 3;
	condition = dia_mil_333_stadtwache_attack_condition;
	information = dia_mil_333_stadtwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_333_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//Sam si� o to prosi�e�...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_333_STADTWACHE_BRIBE(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_bribe_condition;
	information = dia_mil_333_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Masz tu 100 sztuk z�ota i wpu�� mnie!";
};


func int dia_mil_333_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_Bribe_15_00");	//Masz tu 100 sztuk z�ota i wpu�� mnie!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_01");	//100 sztuk z�ota, powiadasz. W porz�dku, mo�esz wej��.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_02");	//I od razu id� do Andre! M�wi� powa�nie, inaczej nast�pnym razem nalicz� ci kolejne 100.
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
		MIL_333_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_333_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_03");	//Co? Gdzie? Nie widz� �adnego z�ota. Sp�ywaj!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_333_STADTWACHE_PERM(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_perm_condition;
	information = dia_mil_333_stadtwache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_perm_info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Rusz si�!
	AI_StopProcessInfos(self);
};


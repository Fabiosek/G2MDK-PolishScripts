
instance DIA_ADDON_TELBOR_EXIT(C_INFO)
{
	npc = strf_1121_addon_telbor;
	nr = 999;
	condition = dia_addon_telbor_exit_condition;
	information = dia_addon_telbor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_telbor_exit_condition()
{
	return TRUE;
};

func void dia_addon_telbor_exit_info()
{
	AI_StopProcessInfos(self);
};


var int telbor_once;

instance DIA_ADDON_TELBOR_HI(C_INFO)
{
	npc = strf_1121_addon_telbor;
	nr = 2;
	condition = dia_addon_telbor_hi_condition;
	information = dia_addon_telbor_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_telbor_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(patrick) && !Npc_IsDead(pardos))
	{
		return TRUE;
	};
};

func void dia_addon_telbor_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_00");	//Hej, ze mn¹ wszystko w porz¹dku!
	if(SKLAVEN_FLUCHT == FALSE)
	{
		if(PARDOS_GEHEILT == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_01");	//Niestety, Pardos paskudnie oberwa³.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_02");	//Dziêki za to, ¿e pomog³eœ Pardosowi.
			if(TELBOR_ONCE == FALSE)
			{
				b_giveplayerxp(XP_AMBIENT);
				TELBOR_ONCE = TRUE;
			};
		};
	};
	AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_03");	//Jeœli bêdziesz czegoœ potrzebowa³, pogadaj z Patrickiem. To nasz rzecznik.
	AI_StopProcessInfos(self);
};


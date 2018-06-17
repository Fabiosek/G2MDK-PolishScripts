
instance DIA_MIL_304_TORWACHE_EXIT(C_INFO)
{
	npc = mil_304_torwache;
	nr = 999;
	condition = dia_mil_304_torwache_exit_condition;
	information = dia_mil_304_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_304_torwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_304_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_304_TORWACHE_WASMACHSTDU(C_INFO)
{
	npc = mil_304_torwache;
	nr = 3;
	condition = dia_mil_304_torwache_wasmachstdu_condition;
	information = dia_mil_304_torwache_wasmachstdu_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_mil_304_torwache_wasmachstdu_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_304_torwache_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Mil_304_Torwache_WASMACHSTDU_15_00");	//Jak leci?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_304_Torwache_WASMACHSTDU_08_01");	//Nie narzekam. Wykonujê swoj¹ pracê, zgodnie z wol¹ Innosa.
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_304_Torwache_WASMACHSTDU_08_02");	//Hej, przestañ mnie tu czarowaæ tym swoim 'jak leci?'. ZejdŸ mi z oczu, jasne?
	};
	AI_StopProcessInfos(self);
};


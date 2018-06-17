
instance DIA_PAL_212_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_212_schiffswache;
	nr = 999;
	condition = dia_pal_212_schiffswache_exit_condition;
	information = dia_pal_212_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_212_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_212_SCHIFFSWACHE_WERSEIDIHR(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_werseidihr_condition;
	information = dia_pal_212_schiffswache_werseidihr_info;
	description = "Kim jesteœ?";
};


func int dia_pal_212_schiffswache_werseidihr_condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pal_212_schiffswache_werseidihr_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Kim jesteœcie?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//Jesteœmy emisariuszami Króla Rhobara, s³ugami Innosa, ludzie nazywaj¹ nas tak¿e paladynami.
};


instance DIA_PAL_212_SCHIFFSWACHE_WASMACHSTDU2(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_wasmachstdu2_condition;
	information = dia_pal_212_schiffswache_wasmachstdu2_info;
	description = "Co tu porabiasz?";
};


func int dia_pal_212_schiffswache_wasmachstdu2_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_wasmachstdu2_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//Co tu robicie?
	if(MIS_SHIPISFREE == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//Nie musisz wiedzieæ nic wiêcej poza tym, ¿e nie wejdziesz na statek.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//Zostaliœmy przydzieleni do pracy jako stra¿nicy. Nikt z przechodniów nie mo¿e wejœæ na statek. Ty te¿ nie, przykro mi.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//To wszystko strata czasu. Zdecydowanie bardziej wola³bym wspomagaæ mych braci w Górniczej Dolinie.
	};
	AI_StopProcessInfos(self);
};


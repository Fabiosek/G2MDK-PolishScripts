
instance DIA_SLD_820_EXIT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 999;
	condition = dia_sld_820_exit_condition;
	information = dia_sld_820_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_820_exit_condition()
{
	return TRUE;
};

func void dia_sld_820_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_HALT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_halt_condition;
	information = dia_sld_820_halt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_820_halt_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_820_halt_info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//A ty gdzie leziesz?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//Do domu, oczywi�cie.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Onar p�aci nam za to, by�my nie wpuszczali tu takich jak ty!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Nie wa�cie mi si� wpuszcza� stra�nik�w! - to jego dok�adne s�owa.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Chc� pogada� z Lee!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Czego od niego chcesz?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"On i ja znamy si� od dawna...",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Lee jest w prawym skrzydle. Nawet nie my�l o wa��saniu si� gdzie indziej!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Ach, �wie�e mi�so armatnie! Wchod�, wchod� do �rodka.
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Ale pami�taj, trzymaj si� z daleka od Onara! Nie lubi, kiedy ktokolwiek si� do niego odzywa, tym bardziej bez pytania. Szczeg�lnie za� nie lubi takich jak ty.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//On i ja znamy si� od dawna...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//JESTE� kumplem Lee? Nie wierz�! Ale wchod�, je�li Lee ci� nie pozna, od razu si� domy�lisz...
	b_sld_820_leeisright();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_PERM(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_perm_condition;
	information = dia_sld_820_perm_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//Wejd�, je�li chcesz, ale nie odzywaj si� do mnie.
	AI_StopProcessInfos(self);
};


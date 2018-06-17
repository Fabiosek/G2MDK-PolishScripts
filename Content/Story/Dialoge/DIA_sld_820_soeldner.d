
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
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//Do domu, oczywiœcie.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Onar p³aci nam za to, byœmy nie wpuszczali tu takich jak ty!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Nie wa¿cie mi siê wpuszczaæ stra¿ników! - to jego dok³adne s³owa.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Chcê pogadaæ z Lee!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Czego od niego chcesz?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"On i ja znamy siê od dawna...",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Lee jest w prawym skrzydle. Nawet nie myœl o wa³êsaniu siê gdzie indziej!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Ach, œwie¿e miêso armatnie! WchodŸ, wchodŸ do œrodka.
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Ale pamiêtaj, trzymaj siê z daleka od Onara! Nie lubi, kiedy ktokolwiek siê do niego odzywa, tym bardziej bez pytania. Szczególnie zaœ nie lubi takich jak ty.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//On i ja znamy siê od dawna...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//JESTEŒ kumplem Lee? Nie wierzê! Ale wchodŸ, jeœli Lee ciê nie pozna, od razu siê domyœlisz...
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
	description = "Co s³ychaæ?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//WejdŸ, jeœli chcesz, ale nie odzywaj siê do mnie.
	AI_StopProcessInfos(self);
};


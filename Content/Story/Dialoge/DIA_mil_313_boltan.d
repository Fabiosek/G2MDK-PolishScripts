
instance DIA_BOLTAN_EXIT(C_INFO)
{
	npc = mil_313_boltan;
	nr = 999;
	condition = dia_boltan_exit_condition;
	information = dia_boltan_exit_info;
	permanent = TRUE;
	description = "W³aœnie wychodzi³em.";
};


func int dia_boltan_exit_condition()
{
	return TRUE;
};

func void dia_boltan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOLTAN_HALLO(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallo_condition;
	information = dia_boltan_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallo_condition()
{
	return TRUE;
};

func void dia_boltan_hallo_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Czego?
};


instance DIA_BOLTAN_TOCONVICTS(C_INFO)
{
	npc = mil_313_boltan;
	nr = 2;
	condition = dia_boltan_toconvicts_condition;
	information = dia_boltan_toconvicts_info;
	permanent = TRUE;
	description = "Chcê zobaczyæ wiêŸniów.";
};


func int dia_boltan_toconvicts_condition()
{
	return TRUE;
};

func void dia_boltan_toconvicts_info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Chcê zobaczyæ wiêŸniów.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//No, idŸ i po¿egnaj siê ze swoim kumplem.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Zamknêliœmy tê œwiniê, która zamordowa³a paladyna Lothara.
		};
	}
	else if((CANTHAR_AUSGELIEFERT == FALSE) && (SARAH_AUSGELIEFERT == FALSE) && (RENGARU_AUSGELIEFERT == FALSE) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//Wszystkie cele s¹ puste.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Dobra, koleœ.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Jasne.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//IdŸ, tylko nie marudŸ za d³ugo, zrozumiano?
	};
};


instance DIA_BOLTAN_HALLOBENNET(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallobennet_condition;
	information = dia_boltan_hallobennet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallobennet_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_boltan_hallobennet_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Chyba nie zamierzasz wyci¹gn¹æ st¹d swojego kumpla, hê?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Zapomnij o tym! Jak tylko krzyknê, zaraz zjawi¹ siê tu ch³opcy!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//A wtedy zjemy potrawkê z siekanego najemnika!
};


instance DIA_BOLTAN_HALLOCANTHAR(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallocanthar_condition;
	information = dia_boltan_hallocanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallocanthar_condition()
{
	if(((KAPITEL != 3) || ((KAPITEL == 3) && ((MIS_RESCUEBENNET == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (CANTHAR_WIEDERRAUS == TRUE) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_boltan_hallocanthar_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//To ty z³o¿y³eœ skargê na kupca Canthara!
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//By³o tu wielu ludzi, ¿eby za niego porêczyæ. Bardzo szanowanych ludzi.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Ta sprawa to jakieœ nieporozumienie. To siê czasem zdarza.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//Na przysz³oœæ uwa¿aj, kogo wysy³asz do wiêzienia.
};


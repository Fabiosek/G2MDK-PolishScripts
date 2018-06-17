
instance DIA_PAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_9_exit_condition;
	information = dia_pal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_9_exit_condition()
{
	return TRUE;
};

func void dia_pal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_9_join_condition;
	information = dia_pal_9_join_info;
	permanent = TRUE;
	description = "Jak mog� zosta� paladynem?";
};


func int dia_pal_9_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_9_join_info()
{
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//Jak mog� zosta� paladynem?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//Ci, kt�rzy wyka�� si� odwag� w s�u�bie Innosowi lub Kr�lowi, mog� zosta� wybrani!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//M�wi�c prosto: wybrani zostan� najlepsi. CIEBIE czeka jednak jeszcze d�uga droga.
};


instance DIA_PAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_9_people_condition;
	information = dia_pal_9_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_pal_9_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_9_people_info()
{
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_01");	//Lord Hagen.
	AI_Output(other,self,"DIA_PAL_9_PEOPLE_15_02");	//I?
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//I nikt wi�cej. Lord Hagen jest najwy�szym urz�dnikiem i dow�dc� na wyspie.
};


instance DIA_PAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_9_location_condition;
	information = dia_pal_9_location_info;
	permanent = TRUE;
	description = "Dlaczego wy, paladyni, przybyli�cie do Khorinis?";
};


func int dia_pal_9_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_9_location_info()
{
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//Dlaczego wy, paladyni, przybyli�cie do Khorinis?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//To nie twoja sprawa, kolego! Wystarczy ci wiedzie�, �e s�u�ymy Kr�lowi i Innosowi!
};


instance DIA_PAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_9_standard_condition;
	information = dia_pal_9_standard_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_pal_9_standard_condition()
{
	return TRUE;
};

func void dia_pal_9_standard_info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//Co s�ycha�?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//Teraz, kiedy przysz�o nam zmierzy� si� ze smokami, jestem pewien, �e nasz dow�dca odpowiednio zareaguje.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//Nie mamy �adnych wiadomo�ci od naszych oddzia��w w G�rniczej Dolinie. To bardzo niepokoj�ce.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//B�ogos�awiony niech b�dzie Innos! Niebezpiecze�stwo ataku smok�w zosta�o za�egnane. �eby dotrze� do rudy, musimy si� zaj�� ju� tylko orkami.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//Je�li nie masz ju� nic wi�cej do powiedzenia, to spadaj, prostaku.
	};
};

func void b_assignambientinfos_pal_9(var C_NPC slf)
{
	dia_pal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_9_standard.npc = Hlp_GetInstanceID(slf);
};


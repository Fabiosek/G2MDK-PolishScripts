
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
	description = "Jak mogê zostaæ paladynem?";
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
	AI_Output(other,self,"DIA_PAL_9_JOIN_15_00");	//Jak mogê zostaæ paladynem?
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_01");	//Ci, którzy wyka¿¹ siê odwag¹ w s³u¿bie Innosowi lub Królowi, mog¹ zostaæ wybrani!
	AI_Output(self,other,"DIA_PAL_9_JOIN_09_02");	//Mówi¹c prosto: wybrani zostan¹ najlepsi. CIEBIE czeka jednak jeszcze d³uga droga.
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
	AI_Output(self,other,"DIA_PAL_9_PEOPLE_09_03");	//I nikt wiêcej. Lord Hagen jest najwy¿szym urzêdnikiem i dowódc¹ na wyspie.
};


instance DIA_PAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_9_location_condition;
	information = dia_pal_9_location_info;
	permanent = TRUE;
	description = "Dlaczego wy, paladyni, przybyliœcie do Khorinis?";
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
	AI_Output(other,self,"DIA_PAL_9_LOCATION_15_00");	//Dlaczego wy, paladyni, przybyliœcie do Khorinis?
	AI_Output(self,other,"DIA_PAL_9_LOCATION_09_01");	//To nie twoja sprawa, kolego! Wystarczy ci wiedzieæ, ¿e s³u¿ymy Królowi i Innosowi!
};


instance DIA_PAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_9_standard_condition;
	information = dia_pal_9_standard_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_pal_9_standard_condition()
{
	return TRUE;
};

func void dia_pal_9_standard_info()
{
	AI_Output(other,self,"DIA_PAL_9_STANDARD_15_00");	//Co s³ychaæ?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_01");	//Teraz, kiedy przysz³o nam zmierzyæ siê ze smokami, jestem pewien, ¿e nasz dowódca odpowiednio zareaguje.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_9_STANDARD_09_02");	//Nie mamy ¿adnych wiadomoœci od naszych oddzia³ów w Górniczej Dolinie. To bardzo niepokoj¹ce.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_9_STANDARD_09_03");	//B³ogos³awiony niech bêdzie Innos! Niebezpieczeñstwo ataku smoków zosta³o za¿egnane. ¯eby dotrzeæ do rudy, musimy siê zaj¹æ ju¿ tylko orkami.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_9_STANDARD_09_04");	//Jeœli nie masz ju¿ nic wiêcej do powiedzenia, to spadaj, prostaku.
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


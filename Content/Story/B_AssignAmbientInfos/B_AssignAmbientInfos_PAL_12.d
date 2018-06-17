
instance DIA_PAL_12_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_12_exit_condition;
	information = dia_pal_12_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_12_exit_condition()
{
	return TRUE;
};

func void dia_pal_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_12_join_condition;
	information = dia_pal_12_join_info;
	permanent = TRUE;
	description = "Chcia³bym zostaæ paladynem!";
};


func int dia_pal_12_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_12_join_info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Chcia³bym zostaæ paladynem!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ty? Nie rozœmieszaj mnie! Nie nale¿ysz nawet do stra¿y miejskiej.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Gdybym nie widzia³, jaki z ciebie prostak, pewnie pomyœla³bym, ¿e chcesz mnie obraziæ.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Tylko najlepsi z najlepszych poddanych Króla i s³ug Innosa mog¹ zostaæ paladynami.
};


instance DIA_PAL_12_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_12_people_condition;
	information = dia_pal_12_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_pal_12_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_12_people_info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Kto tu dowodzi?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Wielmo¿ny Lord Hagen. Jednak sprawami plebsu zajmuje siê Lord Andre.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Znajdziesz go w koszarach. Mo¿e bêdziesz mia³ szczêœcie i Lord Andre poœwiêci ci kilka minut swego cennego czasu.
};


instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_12_location_condition;
	information = dia_pal_12_location_info;
	permanent = TRUE;
	description = "Co paladyni robi¹ tutaj, w Khorinis?";
};


func int dia_pal_12_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_12_location_info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Co robi¹ w Khorinis paladyni?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Ludzie zadaj¹cy takie pytania trafiaj¹ na szubienicê szybciej, ni¿ to zauwa¿¹.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Jeœli jest coœ, na co Lord Andre nie mo¿e sobie pozwoliæ, to przejêcie planów naszej misji przez szpiegów.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//Uwa¿aj wiêc lepiej na to, o co pytasz.
};


instance DIA_PAL_12_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_12_standard_condition;
	information = dia_pal_12_standard_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_pal_12_standard_condition()
{
	return TRUE;
};

func void dia_pal_12_standard_info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Jak siê maj¹ sprawy?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Teraz, kiedy wiemy, ¿e musimy zmierzyæ siê ze smokami, jestem pewien, ¿e nasz dowódca wkrótce podejmie s³uszn¹ decyzjê.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Wci¹¿ nie mamy ¿adnych informacji od oddzia³ów stacjonuj¹cych w Górniczej Dolinie. To bardzo niepokoj¹ce.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Innosowi niech bêd¹ dziêki! Zagro¿enie ze strony smoków zosta³o za¿egnane. Teraz od rudy dziel¹ nas ju¿ tylko orkowie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Chyba nie myœlisz, ¿e odpowiem na to pytanie!
	};
};

func void b_assignambientinfos_pal_12(var C_NPC slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};


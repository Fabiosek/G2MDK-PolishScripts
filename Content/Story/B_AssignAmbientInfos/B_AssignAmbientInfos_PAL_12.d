
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
	description = "Chcia�bym zosta� paladynem!";
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
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Chcia�bym zosta� paladynem!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ty? Nie roz�mieszaj mnie! Nie nale�ysz nawet do stra�y miejskiej.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Gdybym nie widzia�, jaki z ciebie prostak, pewnie pomy�la�bym, �e chcesz mnie obrazi�.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Tylko najlepsi z najlepszych poddanych Kr�la i s�ug Innosa mog� zosta� paladynami.
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
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Wielmo�ny Lord Hagen. Jednak sprawami plebsu zajmuje si� Lord Andre.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Znajdziesz go w koszarach. Mo�e b�dziesz mia� szcz�cie i Lord Andre po�wi�ci ci kilka minut swego cennego czasu.
};


instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_12_location_condition;
	information = dia_pal_12_location_info;
	permanent = TRUE;
	description = "Co paladyni robi� tutaj, w Khorinis?";
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
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Co robi� w Khorinis paladyni?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Ludzie zadaj�cy takie pytania trafiaj� na szubienic� szybciej, ni� to zauwa��.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Je�li jest co�, na co Lord Andre nie mo�e sobie pozwoli�, to przej�cie plan�w naszej misji przez szpieg�w.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//Uwa�aj wi�c lepiej na to, o co pytasz.
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
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Jak si� maj� sprawy?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Teraz, kiedy wiemy, �e musimy zmierzy� si� ze smokami, jestem pewien, �e nasz dow�dca wkr�tce podejmie s�uszn� decyzj�.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Wci�� nie mamy �adnych informacji od oddzia��w stacjonuj�cych w G�rniczej Dolinie. To bardzo niepokoj�ce.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Innosowi niech b�d� dzi�ki! Zagro�enie ze strony smok�w zosta�o za�egnane. Teraz od rudy dziel� nas ju� tylko orkowie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Chyba nie my�lisz, �e odpowiem na to pytanie!
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



instance DIA_SLD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_sld_6_exit_condition;
	information = dia_sld_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_6_exit_condition()
{
	return TRUE;
};

func void dia_sld_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_sld_6_join_condition;
	information = dia_sld_6_join_info;
	permanent = TRUE;
	description = "Chc� si� do was przy��czy�!";
};


func int dia_sld_6_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sld_6_join_info()
{
	AI_Output(other,self,"DIA_SLD_6_JOIN_15_00");	//Chc� si� do was przy��czy�.
	if(MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_01");	//S�ysza�em o sprawie ze stra��. Torlof powiada, �e zda�e� test. Mo�esz liczy� na m�j g�os.
	}
	else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_02");	//Ograbianie ch�op�w to jedno, ale potyczki z regularnymi oddzia�ami stra�y to zupe�nie inna sprawa. C�, je�li Onar uwa�a, �e si� nadajesz, to ja nie b�d� si� sprzeciwia�.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_03");	//Pogadaj z Torlofem. On ci dopiero poka�e...
	};
};


instance DIA_SLD_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_sld_6_people_condition;
	information = dia_sld_6_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_sld_6_people_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_people_info()
{
	AI_Output(other,self,"DIA_SLD_6_PEOPLE_15_00");	//Kto tu rz�dzi?
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_01");	//Farma nale�y do Onara, je�li o to ci chodzi. Jednak naszym przyw�dc� jest Lee.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_02");	//Swego czasu by� genera�em armii kr�lewskiej. Jednak chyba nie lubi� si� ju� z kr�lem.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_03");	//Zapami�taj jego imi�. Je�li wpadniesz w jakie� tarapaty, tylko on b�dzie m�g� uratowa� tw�j ty�ek. Ka�dy inny po prostu poder�nie ci gard�o.
};


instance DIA_SLD_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_sld_6_location_condition;
	information = dia_sld_6_location_info;
	permanent = TRUE;
	description = "Czy chronicie farmer�w?";
};


func int dia_sld_6_location_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_location_info()
{
	AI_Output(other,self,"DIA_SLD_6_LOCATION_15_00");	//Czy chronicie farmer�w?
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_01");	//Chronimy nie tylko farm� Onara, ale i ca�� dolin�.
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_02");	//Onar chce, by�my zaj�li si� ka�dym, kto sprawia k�opoty. Uwa�aj wi�c na siebie.
};


instance DIA_SLD_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_sld_6_standard_condition;
	information = dia_sld_6_standard_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_sld_6_standard_condition()
{
	return TRUE;
};

func void dia_sld_6_standard_info()
{
	AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL <= 2)
	{
		if(ENTEROW_KAPITEL2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_01");	//Teraz, dzieciaku, jeste� jednym z nas.
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_02");	//Czego chcesz?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_03");	//Kiedy pierwszy raz us�ysza�em o smokach, nie mog�em w to uwierzy�.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_04");	//Smok - to dopiero przeciwnik, nie jakie� owce czy g�upkowaci stra�nicy. To prawdziwe wyzwanie.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_05");	//I co, jak tam ten tw�j Lord Hagen? Posra� si� ju� w gacie ze strachu przed smokami?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_06");	//Wygl�da na to, �e w ko�cu b�dzie musia� ruszy� swoje szanowne dupsko z miasta.
		};
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_07");	//Lord Hagen ma szcz�cie. Jeszcze kilka dni, a sami odbiliby�my Benneta.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_08");	//Je�li w ci�gu kilku dni nie wypuszcz� Benneta z wi�zienia, sami po niego p�jdziemy.
		};
	};
	if(KAPITEL == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_09");	//Co tu jeszcze robisz? Nie wybiera�e� si� przypadkiem z innymi do Doliny?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_10");	//Je�li o mnie chodzi, to nie musicie wraca�.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_11");	//Powiniene� i�� do G�rniczej Doliny. S�ysza�em, �e te biedne psubraty same sobie nie poradz�.
		};
	};
	if(KAPITEL >= 5)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_12");	//Kiedy tylko si� pojawi�e� - wiedzia�em, �e wywr�cisz to miejsce do g�ry nogami.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_13");	//Ale smoki? No, to ju� co�. W najbli�szym czasie nikt nie odwa�y si� skrzy�owa� z tob� miecza.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_14");	//Jestem pod wra�eniem. Nie walczymy po tej samej stronie, ale zabicie smok�w to nie lada wyczyn.
		};
	};
};

func void b_assignambientinfos_sld_6(var C_NPC slf)
{
	dia_sld_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_standard.npc = Hlp_GetInstanceID(slf);
};


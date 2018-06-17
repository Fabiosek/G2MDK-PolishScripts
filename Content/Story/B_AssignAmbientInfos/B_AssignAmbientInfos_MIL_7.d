
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_7_exit_condition;
	information = dia_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_7_exit_condition()
{
	return TRUE;
};

func void dia_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_7_join_condition;
	information = dia_mil_7_join_info;
	permanent = TRUE;
	description = "Chc� wst�pi� do stra�y.";
};


func int dia_mil_7_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_7_join_info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//Chc� si� przy��czy� do stra�y!
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//Nie jeste� nawet obywatelem Khorinis! Dlaczego my�lisz, �e Lord Andre zechce ci� przyj��?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//Gdyby tak by�o, ka�dy m�g�by sobie przyj��, wzi�� przydzia�ow� bro� i zbroj�, a p�niej znikn�� na dobre!
		if(c_npcisinquarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//Ja m�wi� powa�nie!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//Nie wyja�niaj tego mnie, tylko Lordowi Andre. Znajdziesz go w koszarach.
		};
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_7_people_condition;
	information = dia_mil_7_people_info;
	permanent = TRUE;
	description = "Co wiesz o paladynach?";
};


func int dia_mil_7_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_7_people_info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//Co wiesz o paladynach?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//Niewiele. Nikt w�a�ciwie nie wie, dlaczego tu przybyli. Nawet ci z nas, kt�rzy s�u�� w stra�y.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//Przej�li kontrol� nad miastem, przegonili gubernatora z jego komnat, zwolnili te� s�dziego z urz�du.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//Je�li chcesz zna� moje zdanie, to dobrze si� sta�o. Tym nad�tym os�om przyda si� lekcja pokory.
};


instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_7_location_condition;
	information = dia_mil_7_location_info;
	permanent = TRUE;
	description = "Jakie perspektywy daje to miasto?";
};


func int dia_mil_7_location_condition()
{
	return TRUE;
};

func void dia_mil_7_location_info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//Jakie perspektywy daje to miasto?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//Je�li nie chcesz sko�czy� w rynsztoku dzielnicy portowej, znajd� sobie jak�� sta�� prac�. Popytaj w dolnej cz�ci miasta, mo�e tam uda ci si� co� znale��.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//Je�li chcesz d�u�ej pozosta� w mie�cie, powiniene� przy��czy� si� do stra�y lub chocia� podszkoli� si� w walce.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//Instruktorzy w koszarach szkol� tak�e cywili.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//Wkr�tce pojawi� si� tu orkowie, a wtedy docenisz wojskowy trening i godziny na nim sp�dzone.
};


instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_7_standard_condition;
	information = dia_mil_7_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_mil_7_standard_condition()
{
	return TRUE;
};

func void dia_mil_7_standard_info()
{
	var int randy;
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_MIL_7_STANDARD_07_00");	//Ludzie znikaj� jeden po drugim. Nie uda�o nam si� jeszcze dowiedzie�, co si� z nimi dzieje.
			if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
			};
			SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//Pono� ch�opi si� buntuj�. Nie do��, �e jeste�my w �rodku wojny z orkami, to jeszcze musimy si� u�era� z tymi prostakami.
		};
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//Czas ju�, by paladyni zaj�li si� rebeli� ch�op�w. Kto �amie prawo, powinien ponie�� tego surowe konsekwencje. Szczeg�lnie teraz, kiedy toczy si� wojna.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//Najemnik, kt�rego oskar�ono o zab�jstwo Lothara, jest prawdopodobnie niewinny. Pono� kto� znalaz� dow�d na to, �e go wrobiono.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//Jeden z najemnik�w Onara zamordowa� Lothara, czcigodnego paladyna. Na szcz�cie dra� zosta� z�apany i wtr�cony do wi�zienia.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//Niekt�rzy z najemnik�w opu�cili farm� Onara. Jak wida�, problem rozwi�zuje si� sam.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//Pozbyli�my si� smok�w, ale to nie koniec. Nast�pni w kolejce s� orkowie. Nied�ugo wszystkim si� zajmiemy!
	};
};

func void b_assignambientinfos_mil_7(var C_NPC slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};


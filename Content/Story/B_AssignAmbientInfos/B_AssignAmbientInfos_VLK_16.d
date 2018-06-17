
instance DIA_VLK_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_16_exit_condition;
	information = dia_vlk_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_16_exit_condition()
{
	return TRUE;
};

func void dia_vlk_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_16_join_condition;
	information = dia_vlk_16_join_info;
	permanent = TRUE;
	description = "Chcia�bym zosta� obywatelem tego miasta!";
};


func int dia_vlk_16_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_16_join_info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Chcia�bym zosta� obywatelem miasta!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Czy pomo�esz nam w obronie miasta przed atakami ork�w?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Je�li jeste� obywatelem Khorinis, mo�esz przy��czy� si� do oddzia��w stra�y - w tej sprawie porozmawiaj z kt�rym� ze stra�nik�w.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "Kto jest najwa�niejszy w mie�cie?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Kto jest najwa�niejszy w mie�cie?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Paladyni, ich siedziba znajduje si� w g�rnym mie�cie.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "Czy s� tutaj jakie� interesuj�ce rzeczy?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Kt�re miejsca warto tutaj odwiedzi�?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//Na targowisku odnajdziesz wszelkie mo�liwe towary.
};


instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_16_standard_condition;
	information = dia_vlk_16_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_vlk_16_standard_condition()
{
	return TRUE;
};

func void dia_vlk_16_standard_info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Co nowego?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//Mam nadziej�, �e stra� w ko�cu dowie si�, dlaczego Khorinis ma coraz mniej mieszka�c�w.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//Wiedz�c, ile os�b ju� zagin�o, cz�owiek zaczyna si� ba� o swoje �ycie.
		if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
		{
			Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
			b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
		};
		SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Nie s�ysza�e�, �e pono� na obrze�ach miasta dostrze�ono ork�w? Miejmy nadziej�, �e paladyni sobie z nimi poradz�.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//Zastanawiam si�, czy w�a�nie to jest powodem, dla kt�rego farmerzy nie zjawiaj� si� na targu.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//Najemnik, kt�rego oskar�ono o zab�jstwo Lothara, jest niewinny. Znaleziono dow�d na to, �e biedaka wrobiono! S�ysza�am o tym na targowisku...
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//To oburzaj�ce. Najemnicy zarz�dcy bez �adnych skrupu��w zamordowali czcigodnego paladyna Lothara!
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Jednak sprawiedliwa r�ka Innosa dosi�gnie tych grzesznik�w. Nikt nie ma prawa podnosi� miecza na wojownik�w naszego Pana.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Pono� przest�pcy opuszczaj� farm� Onara. M�wi�, �e boj� si� ludzi Lorda Hagena, i dlatego wracaj� do G�rniczej Doliny.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Dosz�y mnie s�uchy, �e straszliwe smoki w G�rniczej Dolinie zosta�y pokonane przez oddzia�y paladyn�w.
	};
};

func void b_assignambientinfos_vlk_16(var C_NPC slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};


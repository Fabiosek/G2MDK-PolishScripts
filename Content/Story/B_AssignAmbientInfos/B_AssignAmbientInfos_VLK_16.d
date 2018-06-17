
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
	description = "Chcia³bym zostaæ obywatelem tego miasta!";
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
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Chcia³bym zostaæ obywatelem miasta!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Czy pomo¿esz nam w obronie miasta przed atakami orków?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Jeœli jesteœ obywatelem Khorinis, mo¿esz przy³¹czyæ siê do oddzia³ów stra¿y - w tej sprawie porozmawiaj z którymœ ze stra¿ników.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "Kto jest najwa¿niejszy w mieœcie?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Kto jest najwa¿niejszy w mieœcie?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Paladyni, ich siedziba znajduje siê w górnym mieœcie.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "Czy s¹ tutaj jakieœ interesuj¹ce rzeczy?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Które miejsca warto tutaj odwiedziæ?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//Na targowisku odnajdziesz wszelkie mo¿liwe towary.
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
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//Mam nadziejê, ¿e stra¿ w koñcu dowie siê, dlaczego Khorinis ma coraz mniej mieszkañców.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//Wiedz¹c, ile osób ju¿ zaginê³o, cz³owiek zaczyna siê baæ o swoje ¿ycie.
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
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Nie s³ysza³eœ, ¿e ponoæ na obrze¿ach miasta dostrze¿ono orków? Miejmy nadziejê, ¿e paladyni sobie z nimi poradz¹.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//Zastanawiam siê, czy w³aœnie to jest powodem, dla którego farmerzy nie zjawiaj¹ siê na targu.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//Najemnik, którego oskar¿ono o zabójstwo Lothara, jest niewinny. Znaleziono dowód na to, ¿e biedaka wrobiono! S³ysza³am o tym na targowisku...
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//To oburzaj¹ce. Najemnicy zarz¹dcy bez ¿adnych skrupu³ów zamordowali czcigodnego paladyna Lothara!
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Jednak sprawiedliwa rêka Innosa dosiêgnie tych grzeszników. Nikt nie ma prawa podnosiæ miecza na wojowników naszego Pana.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Ponoæ przestêpcy opuszczaj¹ farmê Onara. Mówi¹, ¿e boj¹ siê ludzi Lorda Hagena, i dlatego wracaj¹ do Górniczej Doliny.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Dosz³y mnie s³uchy, ¿e straszliwe smoki w Górniczej Dolinie zosta³y pokonane przez oddzia³y paladynów.
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



instance DIA_MORTIS_EXIT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 999;
	condition = dia_mortis_exit_condition;
	information = dia_mortis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mortis_exit_condition()
{
	return TRUE;
};

func void dia_mortis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORTIS_HALLO(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_hallo_condition;
	information = dia_mortis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mortis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_hallo_info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Czego chcesz? Pecka tu nie ma, wi�c nic nie wsk�rasz. Przyjd� p�niej.
};


instance DIA_MORTIS_WAFFE(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_waffe_condition;
	information = dia_mortis_waffe_info;
	permanent = FALSE;
	description = "Gdzie jest Peck?";
};


func int dia_mortis_waffe_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_waffe_info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//Gdzie jest Peck?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//W�a�nie si� do nas przy��czy�e�, prawda? A zatem witam w dru�ynie.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Peck strasznie d�ugo zabawi� w mie�cie. Za�o�� si�, �e ma spotkanie z t� s�odk� Vanj� z Czerwonej Latarni.
};


instance DIA_MORTIS_PAKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_paket_condition;
	information = dia_mortis_paket_info;
	permanent = FALSE;
	description = "Co wiesz na temat pewnej paczki z zielem?";
};


func int dia_mortis_paket_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_paket_info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Co wiesz na temat pewnej paczki z zielem?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Hmmm... Ostatnio s�ysza�em w tawernie portowej, jak Kardif rozmawia� o niej z jakim� innym m�czyzn�.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Kim by� ten drugi?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Nie mam poj�cia. Powiedzia� tylko, �e znalaz� najlepsz� mo�liw� kryj�wk� na ziele - a potem obaj zacz�li si� �mia� niczym pijani orkowie.
	b_logentry(TOPIC_WAREHOUSE,"Mortis pods�ucha� w portowej knajpie rozmow� Kardifa z jakim� innym m�czyzn�. Zastanawiali si�, gdzie ukry� paczk�.");
};


instance DIA_MORTIS_REDLIGHT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_redlight_condition;
	information = dia_mortis_redlight_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o dzielnicy portowej?";
};


func int dia_mortis_redlight_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_redlight_info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Co wiesz na temat dzielnicy portowej? Musz� dotrze� do cz�owieka, kt�ry sprzedaje ziele bagienne.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Widzisz, ci faceci na dole nie s� specjalnie gadatliwi, a ju� na pewno nie powiedz� nic stra�nikowi miejskiemu.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Je�li chcesz si� czego� dowiedzie� tam na dole, to musisz zdj�� zbroj�.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//No dobrze, a potem?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Tawerna i burdel to dwa miejsca, gdzie mo�esz zdoby� informacje. Innymi s�owy, je�li w og�le zdo�asz si� czego� dowiedzie�, to w�a�nie tam.
	b_logentry(TOPIC_REDLIGHT,"Mortis uwa�a, �e je�li chc� kupi� bagienne ziele w dzielnicy portowej, powinienem si� tam uda� bez zbroi. Najlepiej zacz�� poszukiwania od tawerny lub burdelu.");
};


instance DIA_MORTIS_CANTEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 5;
	condition = dia_mortis_canteach_condition;
	information = dia_mortis_canteach_info;
	permanent = TRUE;
	description = "Chc� by� silniejszy.";
};


func int dia_mortis_canteach_condition()
{
	if(MORTIS_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_mortis_canteach_info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Chc� by� silniejszy.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Je�li zdob�dziesz wystarczaj�co du�o do�wiadczenia, pomog� ci w treningu.
		MORTIS_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Ale� oczywi�cie, kt� by nie chcia�. Niestety, dop�ki nie przy��czysz si� do nas albo do paladyn�w, nie mog� ci pom�c.
	};
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Mortis, stra�nik miejski, mo�e pokaza� mi kilka �wicze� zwi�kszaj�cych si��.");
};


instance DIA_MORTIS_TEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 100;
	condition = dia_mortis_teach_condition;
	information = dia_mortis_teach_info;
	permanent = TRUE;
	description = "Chc� by� silniejszy.";
};


func int dia_mortis_teach_condition()
{
	if(MORTIS_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_mortis_teach_info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Chc� by� silniejszy.
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//Ju� jeste� silny. Je�li potrzebujesz dalszego treningu, b�dziesz sobie musia� poszuka� innego nauczyciela.
	};
	Info_ClearChoices(dia_mortis_teach);
};

func void dia_mortis_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};


instance DIA_MORTIS_PICKPOCKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 900;
	condition = dia_mortis_pickpocket_condition;
	information = dia_mortis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_mortis_pickpocket_condition()
{
	return c_beklauen(38,60);
};

func void dia_mortis_pickpocket_info()
{
	Info_ClearChoices(dia_mortis_pickpocket);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_BACK,dia_mortis_pickpocket_back);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_PICKPOCKET,dia_mortis_pickpocket_doit);
};

func void dia_mortis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mortis_pickpocket);
};

func void dia_mortis_pickpocket_back()
{
	Info_ClearChoices(dia_mortis_pickpocket);
};


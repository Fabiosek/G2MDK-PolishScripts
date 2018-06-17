
instance DIA_GIRION_EXIT(C_INFO)
{
	npc = pal_207_girion;
	nr = 999;
	condition = dia_girion_exit_condition;
	information = dia_girion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_exit_condition()
{
	return TRUE;
};

func void dia_girion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_HALLO(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_hallo_condition;
	information = dia_girion_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SHIPISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_hallo_info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Jestem Girion, mistrz walki broni� obur�czn� i kr�lewski paladyn. Czemu mnie niepokoisz?
};


instance DIA_GIRION_CANTEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_canteach_condition;
	information = dia_girion_canteach_info;
	permanent = TRUE;
	description = "Czy mo�esz mnie wyszkoli�?";
};


func int dia_girion_canteach_condition()
{
	if(GIRION_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_canteach_info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Czy mo�esz udzieli� mi lekcji?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Wybieraj�c najszlachetniejsz� ze wszystkich sztuk walk, post�pi�e� jak prawdziwy wojownik Innosa.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Udziel� ci kilku wskaz�wek. Daj mi zna�, kiedy b�dziesz got�w do treningu.
		GIRION_TEACH2H = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladyn Girion mo�e mnie nauczy�, jak walczy� or�em dwur�cznym.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Je�li chcesz si� uczy�, musisz znale�� sobie mentora poza naszym zakonem.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Jestem wojownikiem, nie nauczycielem.
	};
};


instance DIA_GIRION_TEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 100;
	condition = dia_girion_teach_condition;
	information = dia_girion_teach_info;
	permanent = TRUE;
	description = "Jestem got�w do treningu.";
};


var int dia_girion_teach_permanent;

func int dia_girion_teach_condition()
{
	if((GIRION_TEACH2H == TRUE) && (DIA_GIRION_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void dia_girion_teach_info()
{
	GIRION_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Jestem got�w do treningu.
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Oczywi�cie, to jeszcze nie koniec twojej edukacji, ale ja nie potrafi� ci� nauczy� niczego wi�cej.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Je�li chcesz dalej �wiczy� walk� wr�cz, powiniene� poszuka� prawdziwego mistrza miecza.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Gdzie mog� znale�� kogo� takiego?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Lord Hagen jest mistrzem miecza. Z pewno�ci� udzieli ci lekcji.
		DIA_GIRION_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_girion_teach);
};

func void dia_girion_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Zawsze walcz honorowo. Walka to nasze �ycie - a czym jest �ycie bez honoru?
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//W walce b�d� szybki i ostro�ny. Zaskakuj swoich przeciwnik�w.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Nigdy nie rozpoczynaj walki bez odpowiedniego przygotowania. Ka�dy pojedynek mo�e by� twoim ostatnim.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Paladyn jest zawsze got�w do walki. Jednak nigdy nie wdaje si� w pojedynki, w kt�rych nie ma �adnych szans na zwyci�stwo.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Broni� paladyna jest nie tylko jego miecz, ale r�wnie� sprawny umys�.
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Musisz wiedzie�, kiedy mo�esz si� wycofa�.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Pami�taj, dobra walka to taka, w kt�rej to ty kontrolujesz swojego przeciwnika, nie daj�c mu najmniejszej szansy na przej�cie kontroli nad tob�.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Przegrywasz tylko wtedy, gdy si� poddasz.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};


instance DIA_GIRION_CATCHPLAYERSTOLENSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_catchplayerstolenship_condition;
	information = dia_girion_catchplayerstolenship_info;
	important = TRUE;
};


func int dia_girion_catchplayerstolenship_condition()
{
	if((KAPITEL >= 5) && (MIS_SHIPISFREE == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void dia_girion_catchplayerstolenship_info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Hej! Mo�esz mi powiedzie�, co tutaj robisz?
	Info_ClearChoices(dia_girion_catchplayerstolenship);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Nie wiem, o czym m�wisz.",dia_girion_catchplayerstolenship_no);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Zejd� mi z drogi albo b�d� zmuszony ci� zabi�.",dia_girion_catchplayerstolenship_weg);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Potrzebuj� okr�tu.",dia_girion_catchplayerstolenship_ship);
};

func void dia_girion_catchplayerstolenship_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Nie wiem, o czym m�wisz.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//M�wi� o tym, co wykombinowa�e� ze stra�� okr�tow�. Podejrzana sprawa.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//Je�li nawet jeste� magiem, nie ufam ci.
	};
};


var int girion_wantstokillsc;

func void dia_girion_catchplayerstolenship_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Zejd� mi z drogi albo b�d� zmuszony ci� zabi�.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Mo�esz by� wystarczaj�co sprytny, aby poradzi� sobie ze stra�� okr�tow�, ale ze mn� nie p�jdzie ci tak �atwo, ch�opcze.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//Je�li nawet jeste� jednym z nas, nie daje ci to prawa do kradzie�y kr�lewskiej w�asno�ci. Gi�, przekl�ty zdrajco.
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	GIRION_WANTSTOKILLSC = TRUE;
};

func void b_girionstayonship()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//Kiedy sko�czymy interesy, statek wr�ci do mnie. Czy to jasne?
};

func void dia_girion_catchplayerstolenship_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Potrzebuj� statku. Wi�c go sobie wezm�.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//Nie mo�esz tego zrobi�. Transport rudy...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Jak �miesz, ty �mierdz�cy skur...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//W G�rniczej Dolinie jest zbyt ma�o rudy, aby zaspokoi� kr�lewskie wymagania. By�em tam. Z�o�a si� wyczerpa�y. Misja Hagena to jedna wielka farsa.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Prawdziwe zagro�enie stanowi pewna niewielka przybrze�na wysepka, ca�kiem niedaleko st�d. Pop�yn� tam i po�o�� wszystkiemu kres.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Albo si� do mnie przy��czysz, albo zrobi� z tob� porz�dek raz na zawsze. Wyb�r nale�y do ciebie.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//Hmmm. Wygl�da na to, �e nie mam wyboru.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Dok�adnie tak.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//A zatem dobrze. Przy��cz� si� do ciebie, ale tylko pod jednym warunkiem.
	b_girionstayonship();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//Jako� to prze�yj�.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//A zatem r�b, co masz do zrobienia. Poczekam tutaj na ciebie.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	GIRION_ISONBOARD = LOG_SUCCESS;
};


instance DIA_GIRION_VERRAT(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_verrat_condition;
	information = dia_girion_verrat_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_verrat_condition()
{
	if(GIRION_WANTSTOKILLSC == TRUE)
	{
		return TRUE;
	};
};

func void dia_girion_verrat_info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Zdrajca!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GIRION_ONSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_onship_condition;
	information = dia_girion_onship_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_onship_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GIRION_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_girion_onship_info()
{
	b_girionstayonship();
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion;
	nr = 900;
	condition = dia_girion_pickpocket_condition;
	information = dia_girion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_pickpocket_condition()
{
	return c_beklauen(73,280);
};

func void dia_girion_pickpocket_info()
{
	Info_ClearChoices(dia_girion_pickpocket);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_BACK,dia_girion_pickpocket_back);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_PICKPOCKET,dia_girion_pickpocket_doit);
};

func void dia_girion_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_pickpocket);
};

func void dia_girion_pickpocket_back()
{
	Info_ClearChoices(dia_girion_pickpocket);
};


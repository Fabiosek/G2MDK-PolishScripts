
instance DIA_PARLAN_KAP1_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap1_exit_condition;
	information = dia_parlan_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_parlan_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int parlan_hammer;

func void b_parlan_hammer()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//Chwileczk�, m�j synu.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Plotka g�osi, �e z sanktuarium skradziono bardzo cenny artefakt.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Nie chc� wiedzie� nic wi�cej na ten temat. Rozumiem, �e wkr�tce wr�ci on na swoje dawne miejsce.
	PARLAN_HAMMER = TRUE;
};


var int parlan_lastpetzcounter;
var int parlan_lastpetzcrime;

instance DIA_PARLAN_PMSCHULDEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_pmschulden_condition;
	information = dia_parlan_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PARLAN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= PARLAN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_parlan_pmschulden_info()
{
	var int diff;
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Pogwa�ci�e� zasady naszego zgromadzenia.
	if(b_gettotalpetzcounter(self) > PARLAN_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//Nie jest to twoje pierwsze wykroczenie.
		if(PARLAN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Twe winy zostan� ci odpuszczone tylko wtedy, gdy ofiarujesz poka�ny datek na rzecz klasztoru.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Ile?
			diff = b_gettotalpetzcounter(self) - PARLAN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				PARLAN_SCHULDEN = PARLAN_SCHULDEN + (diff * 50);
			};
			if(PARLAN_SCHULDEN > 1000)
			{
				PARLAN_SCHULDEN = 1000;
			};
			b_say_gold(self,other,PARLAN_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Co ty sobie wyobra�asz? M�dl si� do Innosa, by przebaczy� ci twe wyst�pki.
		};
	}
	else if(b_getgreatestpetzcrime(self) < PARLAN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Twoja sytuacja uleg�a zmianie.
		if(PARLAN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Nie ma ju� �wiadk�w pope�nionego przez ciebie morderstwa.
		};
		if((PARLAN_LASTPETZCRIME == CRIME_THEFT) || ((PARLAN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Nikt nie chce zeznawa� w sprawie pope�nionej przez ciebie kradzie�y.
		};
		if((PARLAN_LASTPETZCRIME == CRIME_ATTACK) || ((PARLAN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Nie ma ju� nikogo, kto oskar�a�by ci� o spowodowanie b�jki.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Wszystkie oskar�enia wobec ciebie zosta�y wycofane.
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Mnie mo�esz oszuka� - ale Innos widzi wszystko!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Grzechy zosta�y ci odpuszczone.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//Nie zmarnuj tej szansy.
			PARLAN_SCHULDEN = 0;
			PARLAN_LASTPETZCOUNTER = 0;
			PARLAN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Zap�acisz za swe grzechy - taka jest wola Innosa!
			b_say_gold(self,other,PARLAN_SCHULDEN);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Uwolnij si� od swych grzech�w!
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_parlan_pmschulden);
		Info_ClearChoices(dia_parlan_petzmaster);
		Info_AddChoice(dia_parlan_pmschulden,"Nie mam dostatecznie du�o z�ota!",dia_parlan_petzmaster_paylater);
		Info_AddChoice(dia_parlan_pmschulden,"Ile to mia�o by�?",dia_parlan_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
		{
			Info_AddChoice(dia_parlan_pmschulden,"Chc� zap�aci� grzywn�!",dia_parlan_petzmaster_paynow);
		};
	};
};

func void dia_parlan_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Przypomnij mi, o jakiej sumie m�wili�my.
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_pmschulden,"Nie mam dostatecznie du�o z�ota!",dia_parlan_petzmaster_paylater);
	Info_AddChoice(dia_parlan_pmschulden,"Ile to mia�o by�?",dia_parlan_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_pmschulden,"Chc� zap�aci� grzywn�!",dia_parlan_petzmaster_paynow);
	};
};


instance DIA_PARLAN_PETZMASTER(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_petzmaster_condition;
	information = dia_parlan_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > PARLAN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_info()
{
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	PARLAN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Nie zamienili�my jeszcze ani s�owa, a ty ju� obarczy�e� si� ci�arem winy!
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Jeste� winny najgorszej z mo�liwych zbrodni! Morderstwa!
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		PARLAN_SCHULDEN = PARLAN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//A teraz masz na sumieniu jeszcze dodatkowe grzechy!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Gdyby to zale�a�o ode mnie, zosta�by� pot�piony tu i teraz, morderco!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Je�li jednak zap�acisz za swe czyny, mog� ci� rozgrzeszy�..
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Kradzie� to pogwa�cenie zasad klasztoru.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Pr�cz tego z�ama�e� jeszcze inne zasady.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Te przest�pstwa musz� zosta� ukarane. Takie jest prawo Innosa.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Przeka�esz klasztorowi stosowny datek.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//Nie tolerujemy tu �adnych b�jek. To naruszenie panuj�cych w klasztorze zasad.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//Dlaczego zabijasz nasze owce?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//�yjemy tu, przestrzegaj�c okre�lonych zasad. Dotycz� one tak�e ciebie.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//Za swe zbrodnie musisz z�o�y� ofiar� na rzecz klasztoru.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Zabi�e� nasze owce. Musisz zap�aci� odpowiedni� rekompensat�.
		PARLAN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Ile?
	if(PARLAN_SCHULDEN > 1000)
	{
		PARLAN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_petzmaster,"Nie mam dostatecznie du�o z�ota!",dia_parlan_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_petzmaster,"Chc� zap�aci� grzywn�!",dia_parlan_petzmaster_paynow);
	};
};

func void dia_parlan_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Chc� zap�aci� kar�!
	b_giveinvitems(other,self,itmi_gold,PARLAN_SCHULDEN);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//Przyjmuj� datek. Twoje wykroczenie zostaje ci wybaczone. Niech Innos obdarzy ci� m�dro�ci�, by� wi�cej nie grzeszy�.
	b_grantabsolution(LOC_MONASTERY);
	PARLAN_SCHULDEN = 0;
	PARLAN_LASTPETZCOUNTER = 0;
	PARLAN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
};

func void dia_parlan_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//Nie mam dostatecznie du�o z�ota!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Trzeba by�o o tym pomy�le�, zanim dopu�ci�e� si� owych wyst�pk�w.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Mo�e b�dzie to dla ciebie dobra nauczka. Pami�taj, je�li nie b�dziesz pope�nia� wykrocze�, nie b�dziesz musia� za nie p�aci�.
	PARLAN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	PARLAN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_WELCOME(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_welcome_condition;
	information = dia_parlan_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_welcome_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void b_dia_parlan_welcome_gofortribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Kiedy to ju� zrobisz, porozmawiamy na temat twojej pracy tu, w klasztorze.
};

func void b_dia_parlan_welcome_bringtribute2gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Swoj� ofiar� na rzecz klasztoru zanie� jak najszybciej Goraksowi. On ju� zadba, aby trafi�a gdzie trzeba.
};

func void dia_parlan_welcome_info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Witaj nowicjuszu, mam na imi� Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//Ja jestem...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//...NOWICJUSZEM. To, kim by�e� wcze�niej, nie ma znaczenia. Teraz jeste� s�ug� Innosa. Tylko to si� liczy.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//Wraz ze wst�pieniem do Bractwa Ognia twoje wcze�niejsze winy zostan� ci wybaczone.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Niech Innos b�ogos�awi i oczy�ci grzechy tego, kt�ry wst�puje do� na s�u�b�.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//Co teraz?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Najpierw musisz wype�ni� zadania nowicjusza. B�dziesz pracowa� i s�u�y� klasztorowi.
	b_grantabsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(TOPIC_GEMEINSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEMEINSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_GEMEINSCHAFT,"Jako nowicjusz jestem zobowi�zany s�u�y� spo�eczno�ci.");
	if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE)
	{
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Przedtem jednak zabierz swoj� owc� do Opolosa, on si� ni� zajmie.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Z�oto mo�esz zanie�� Goraxowi, naszemu ochmistrzowi. Znajdziesz go w winiarni.
			b_dia_parlan_welcome_gofortribute();
		};
	}
	else if(DIA_GORAX_GOLD_PERM == FALSE)
	{
		b_dia_parlan_welcome_bringtribute2gorax();
		b_dia_parlan_welcome_gofortribute();
	};
};


instance DIA_PARLAN_AUGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_auge_condition;
	information = dia_parlan_auge_info;
	permanent = FALSE;
	description = "Poszukuj� Oka Innosa.";
};


func int dia_parlan_auge_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_parlan_auge_info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Poszukuj� Oka Innosa.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Nie wiem, kto ci o nim powiedzia�, ale nikt nie ma dost�pu do boskiego artefaktu.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Gdzie przechowywane jest Oko Innosa?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//Im mniej os�b zna ten sekret, tym bezpieczniejsze jest Oko. Mo�esz sobie oszcz�dzi� wysi�ku - i tak go nie odnajdziesz.
};


instance DIA_PARLAN_AMULETT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_amulett_condition;
	information = dia_parlan_amulett_info;
	permanent = FALSE;
	description = "Powiedz mi co� o Oku Innosa.";
};


func int dia_parlan_amulett_condition()
{
	if((KAPITEL <= 2) && Npc_KnowsInfo(other,dia_parlan_auge))
	{
		return TRUE;
	};
};

func void dia_parlan_amulett_info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Powiedz mi co� o Oku Innosa.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Dobrze. Oko Innosa zawiera w sobie cz�stk� jego boskiej mocy. Tylko JEDEN wybrany s�uga Innosa mo�e nosi� ten amulet.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Zosta� on stworzony, by ochroni� nas przed mocami Z�a, kiedy nadejdzie w�a�ciwy moment.
};


instance DIA_PARLAN_HAGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_hagen_condition;
	information = dia_parlan_hagen_info;
	permanent = FALSE;
	description = "Musz� porozmawia� z dow�dc� paladyn�w!";
};


func int dia_parlan_hagen_condition()
{
	if((KAPITEL <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_hagen_info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Musz� porozmawia� z dow�dc� paladyn�w!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen nie przyjmuje nowicjuszy, jedynie my, magowie, mamy prawo si� z nim widzie�.
};


instance DIA_PARLAN_WORK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_work_condition;
	information = dia_parlan_work_info;
	permanent = TRUE;
	description = "W jaki spos�b m�g�bym s�u�y� zgromadzeniu?";
};


var int dia_parlan_work_perm;

func int dia_parlan_work_condition()
{
	if((KAPITEL == 1) && (Npc_KnowsInfo(other,dia_parlan_knowsjudge) == FALSE) && Npc_KnowsInfo(other,dia_parlan_welcome) && (DIA_PARLAN_WORK_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_work_info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//W jaki spos�b m�g�bym s�u�y� zgromadzeniu?
	if((LIESEL_GIVEAWAY == FALSE) || (DIA_GORAX_GOLD_PERM == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Najpierw musisz wype�ni� zadania nowicjusza. B�dziesz pracowa� i s�u�y� klasztorowi.
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Przedtem jednak zabierz swoj� owc� do Opolosa, on si� ni� zajmie.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE)
			{
				b_dia_parlan_welcome_bringtribute2gorax();
				b_dia_parlan_welcome_gofortribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Z�oto mo�esz zanie�� Goraxowi, naszemu ochmistrzowi. Znajdziesz go w winiarni.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Kiedy to ju� zrobisz, porozmawiamy na temat twojej pracy tu, w klasztorze.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//W tej chwili obowi�zuje cisza nocna. Praca nowicjuszy zaczyna si� o �wicie, a ko�czy o zmierzchu.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//Ty te� powiniene� uda� si� na spoczynek. Wr�� do mnie, kiedy rozpoczn� si� godziny pracy.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Porozmawiaj z innymi magami, dostaniesz od nich zadania.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//B�d� nadzorowa� twoj� prac�. Kiedy wype�nisz wszystkie swoje obowi�zki, otrzymasz pozwolenie na wej�cie do biblioteki, by studiowa� s�owo Innosa.
		DIA_PARLAN_WORK_PERM = TRUE;
		MIS_KLOSTERARBEIT = LOG_RUNNING;
		b_logentry(TOPIC_GEMEINSCHAFT,"Je�li wykonam wszystkie polecenia mag�w, b�d� m�g� korzysta� z biblioteki.");
	};
};


instance DIA_PARLAN_STAND(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_stand_condition;
	information = dia_parlan_stand_info;
	permanent = TRUE;
	description = "Czy mog� skorzysta� z biblioteki?";
};


func int dia_parlan_stand_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_stand_info()
{
	KLOSTER_PUNKTE = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Mog� skorzysta� z biblioteki?
	if(MIS_NEORASPFLANZEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Uda�o ci si� zdoby� ogniste pokrzywy dla Brata Neorasa.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Odnalaz�e� receptury Brata Neorasa.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_ISGAROTHWOLF == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Pozby�e� si� czarnego wilka, kt�ry zagra�a� kaplicy.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	};
	if(MIS_PARLANFEGEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Znalaz�e� czterech nowicjuszy, dzi�ki czemu mog�e� posprz�ta� komnaty.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 3;
	};
	if(MIS_GORAXESSEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Sprawiedliwie rozdzieli�e� jad�o mi�dzy nowicjuszy, tak jak prosi� ci� o to brat Gorax.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXESSEN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax nie by� z ciebie zadowolony, nie uda�o ci si� sprawiedliwie rozdzieli� jedzenia.
	};
	if(MIS_GORAXWEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Ku rado�ci Goraxa sprzeda�e� wino.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXWEIN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//Nie m�wmy ju� o tej sprawie z winem, tak chyba b�dzie najlepiej...
	};
	if(KLOSTER_PUNKTE >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Tak, wykona�e� dostatecznie du�o zada�. Czas postudiowa� nauki Innosa. Porozmawiaj prosz� z Mistrzem Hyglasem, znajdziesz go w bibliotece.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Przyjmij ten oto klucz.
		PARLAN_ERLAUBNIS = TRUE;
		MIS_KLOSTERARBEIT = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		b_giveinvitems(self,other,itke_klosterbibliothek,1);
		if(MIS_NEORASPFLANZEN == LOG_RUNNING)
		{
			MIS_NEORASPFLANZEN = LOG_OBSOLETE;
		};
		if(MIS_NEORASREZEPT == LOG_RUNNING)
		{
			MIS_NEORASREZEPT = LOG_OBSOLETE;
		};
		if(MIS_ISGAROTHWOLF == LOG_RUNNING)
		{
			MIS_ISGAROTHWOLF = LOG_OBSOLETE;
		};
		if(MIS_PARLANFEGEN == LOG_RUNNING)
		{
			MIS_PARLANFEGEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXESSEN == LOG_RUNNING)
		{
			MIS_GORAXESSEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXWEIN == LOG_RUNNING)
		{
			MIS_GORAXWEIN = LOG_OBSOLETE;
		};
		if(MIS_MARDUKBETEN == LOG_RUNNING)
		{
			MIS_MARDUKBETEN = LOG_OBSOLETE;
		};
		b_checklog();
	}
	else if(KLOSTER_PUNKTE >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Zaiste sporo si� napracowa�e�, wci�� jednak musisz s�u�y� zgromadzeniu.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Najpierw wype�nij obowi�zki na rzecz zgromadzenia. Kiedy sko�czysz, wr�cimy do tej rozmowy.
	};
};


instance DIA_PARLAN_AUFGABE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_aufgabe_condition;
	information = dia_parlan_aufgabe_info;
	permanent = FALSE;
	description = "Czy masz dla mnie jakie� zadanie?";
};


func int dia_parlan_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parlan_aufgabe_info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//Czy masz dla mnie jakie� zadanie?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmmm... Tak, w rzeczy samej, jest co�, co mo�esz zrobi� dla dobra zgromadzenia.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Komnatom nowicjuszy przyda�oby si� porz�dne zamiatanie. Zajmij si� tym.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Przecie� to potrwa wieki...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Chyba wi�c najlepiej b�dzie zacz�� od razu, prawda?
	MIS_PARLANFEGEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PARLANFEGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PARLANFEGEN,LOG_RUNNING);
	b_logentry(TOPIC_PARLANFEGEN,"Mistrz Parlan chce, abym posprz�ta� komnaty czterech nowicjuszy. To zajmie ca�e wieki.");
};


instance DIA_PARLAN_FEGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_fegen_condition;
	information = dia_parlan_fegen_info;
	permanent = TRUE;
	description = "Je�li chodzi o komnaty nowicjuszy...";
};


var int dia_parlan_fegen_permanent;

func int dia_parlan_fegen_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && (DIA_PARLAN_FEGEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_fegen_info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Je�li chodzi o komnaty nowicjuszy...
	if(NOV_HELFER >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Widz�, �e uda�o ci si� znale�� czterech pomocnik�w. My�l�, �e teraz mog� wr�ci� do swych obowi�zk�w.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Dobra robota, nowicjuszu. Wype�ni�e� powierzone ci przeze mnie zadanie.
		MIS_PARLANFEGEN = LOG_SUCCESS;
		b_giveplayerxp(XP_PARLANFEGEN);
		DIA_PARLAN_FEGEN_PERMANENT = TRUE;
		b_startotherroutine(feger1,"START");
		b_startotherroutine(feger2,"START");
		b_startotherroutine(feger3,"START");
		b_startotherroutine(babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Niew�tpliwie zadanie to nie nale�y do �atwych, jednak z pomoc� Innosa dasz sobie rad�.
	};
};


instance DIA_PARLAN_LEARN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_learn_condition;
	information = dia_parlan_learn_info;
	permanent = FALSE;
	description = "Jak m�g�bym si� nauczy� sztuk magicznych?";
};


func int dia_parlan_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_learn_info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Jak m�g�bym si� nauczy� sztuk magicznych?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Nie jeste� tu, by uczy� si� magii, lecz by s�u�y� Innosowi.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Mog� ci jednak pokaza�, jak zwi�kszy� swe magiczne moce.
	b_logentry(TOPIC_KLOSTERTEACHER,"Mistrz Parlan mo�e mi pom�c w doskonaleniu moich zdolno�ci magicznych.");
};


instance DIA_PARLAN_KNOWSJUDGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_knowsjudge_condition;
	information = dia_parlan_knowsjudge_info;
	permanent = FALSE;
	description = "Chc� si� podda� Pr�bie Ognia.";
};


func int dia_parlan_knowsjudge_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_knowsjudge_info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Chc� si� podda� Pr�bie Ognia.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Co...? Hm... M�wisz powa�nie?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Nalegam.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Wyj�tkowy z ciebie nowicjusz. W porz�dku, je�li m�wisz powa�nie, porozmawiaj z mistrzem Pyrokarem.
	b_logentry(TOPIC_FIRECONTEST,"Je�li chc� si� podj�� Pr�by Ognia, powinienem porozmawia� z Mistrzem Pyrokarem.");
};


instance DIA_PARLAN_TEACH_MANA(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_teach_mana_condition;
	information = dia_parlan_teach_mana_info;
	permanent = TRUE;
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
};


func int dia_parlan_teach_mana_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,dia_parlan_learn))) && (PARLAN_SENDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Chcia�bym powi�kszy� swoje magiczne zdolno�ci.
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Twoja magiczna moc wzros�a. Wi�cej nie mog� ci ju� pom�c.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Je�li pragniesz nauczy� si� wi�cej, porozmawiaj z Pyrokarem.
		PARLAN_SENDS = TRUE;
	};
	Info_ClearChoices(dia_parlan_teach_mana);
};

func void dia_parlan_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_parlan_teach_mana_5);
};


instance DIA_PARLAN_MAGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_mage_condition;
	information = dia_parlan_mage_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_mage_condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_parlan_mage_info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Z�o�y�e� przysi�g�, Bracie. Witaj w naszych szeregach.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//O kr�gach magii opowiem ci, kiedy zdob�dziesz wi�ksze do�wiadczenie.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//We� ten kamie� runiczny, to znak twojej mocy.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_PARLAN_CIRCLE1(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle1_condition;
	information = dia_parlan_circle1_info;
	permanent = TRUE;
	description = "Wprowad� mnie prosz� do pierwszego kr�gu magii.";
};


func int dia_parlan_circle1_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_parlan_circle1_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Wprowad� mnie prosz� do pierwszego kr�gu magii.
	if(b_teachmagiccircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//Magia pierwszego kr�gu pozwala na u�ywanie stworzonych przez siebie run.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Mo�esz nauczy� si� magicznych formu� i samemu tworzy� runy.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Ka�dy z nas specjalizuje si� w jakim� rodzaju magii. Zastan�w si� wi�c dok�adnie, kt�ry z nich wybierzesz dla siebie.
	};
};


instance DIA_PARLAN_CIRCLE2(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle2_condition;
	information = dia_parlan_circle2_info;
	permanent = TRUE;
	description = "Wprowad� mnie w tajniki drugiego kr�gu magii.";
};


func int dia_parlan_circle2_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_parlan_circle2_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Wprowad� mnie w tajniki drugiego kr�gu magii.
	if(KAPITEL >= 2)
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Poznasz teraz drugi kr�g i nauczysz si� pos�ugiwa� jeszcze pot�niejsz� magi�.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Pami�taj jednak o spoczywaj�cej na tobie odpowiedzialno�ci. Nie wobec mnie czy Pyrokara - wobec samego Innosa.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//To on wskazuje kierunek, jednak twoje czyny kszta�tuj� �cie�k�, po kt�rej st�pasz.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Nie nadszed� jeszcze czas.
	};
};


instance DIA_PARLAN_CIRCLE3(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle3_condition;
	information = dia_parlan_circle3_info;
	permanent = TRUE;
	description = "Wprowad� mnie w tajniki trzeciego kr�gu magii.";
};


func int dia_parlan_circle3_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_parlan_circle3_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Wprowad� mnie w tajniki trzeciego kr�gu magii.
	if(KAPITEL >= 3)
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Tak, najwy�szy czas, by� pozna� trzeci kr�g magii. Czekaj� na ciebie nowe zakl�cia.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//B�dziesz ich potrzebowa�. Z�o nie �pi, a jedynie pot�ga Innosa mo�e je pokona�.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Przekaza�em ci ju� wiedz� z zakresu wszystkich kr�g�w, jakie znam. Je�li pragniesz pozna� magi� wy�szych Kr�g�w, porozmawiaj z Karasem.
			b_logentry(TOPIC_KLOSTERTEACHER,"Brat Parlan zapozna� mnie z pierwszymi trzema kr�gami. Dalsze post�py mog� poczyni� dzi�ki Bratu Karrasowi.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Nie nadszed� jeszcze czas na to, by� m�g� wkroczy� do trzeciego kr�gu.
	};
};


instance DIA_PARLAN_TEACH(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_teach_condition;
	information = dia_parlan_teach_info;
	permanent = TRUE;
	description = "Nauczaj mnie (tworzenie run)";
};


func int dia_parlan_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_parlan_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Naucz mnie!
	Info_ClearChoices(dia_parlan_teach);
	Info_AddChoice(dia_parlan_teach,DIALOG_BACK,dia_parlan_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),dia_parlan_teach_light_heal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),dia_parlan_teach_light);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_parlan_teach_windfist);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),dia_parlan_teach_sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),dia_parlan_teach_mediumheal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),dia_parlan_teach_fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_parlan_teach_destroyundead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_parlan_teach_fullheal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//W tej chwili nie naucz� ci� �adnych nowych formu�.
	};
};

func void dia_parlan_teach_back()
{
	Info_ClearChoices(dia_parlan_teach);
};

func void dia_parlan_teach_light_heal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_parlan_teach_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_parlan_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_parlan_teach_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_parlan_teach_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_parlan_teach_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_parlan_teach_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_parlan_teach_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};


instance DIA_PARLAN_KAP2_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap2_exit_condition;
	information = dia_parlan_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_parlan_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_parlan_exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Niech Innos ci� prowadzi.
};


instance DIA_PARLAN_KAP3_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap3_exit_condition;
	information = dia_parlan_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parlan_kap3_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_IAMPARLAN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_iamparlan_condition;
	information = dia_parlan_iamparlan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_iamparlan_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_iamparlan_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Widz�, �e zdecydowa�e� si� walczy� po naszej stronie. Cieszy mnie to.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Przyda nam si� ka�da pomoc! Powiniene� od razu uda� si� do Marduka, to on przygotowuje paladyn�w do walki.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Nie wiem, kto ci� wpu�ci� do klasztoru. Jestem Parlan, opiekuj� si� nowicjuszami.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Nie �ycz� sobie, by kto� odrywa� ich od zaj��, i dr�czy� niem�drymi pytaniami, zrozumiano?
		PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
		Info_ClearChoices(dia_parlan_iamparlan);
		Info_AddChoice(dia_parlan_iamparlan,"B�d� robi�, co mi si� podoba.",dia_parlan_iamparlan_mychoice);
		Info_AddChoice(dia_parlan_iamparlan,"Jasne.",dia_parlan_iamparlan_ok);
	};
	Wld_InsertItem(itke_klosterbibliothek,"NW_MONASTERY_CORRIDOR_02");
};

func void dia_parlan_iamparlan_mychoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//B�d� robi�, co mi si� podoba.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Na pewno istnieje jaki� pow�d, dla kt�rego twa obecno�� jest tutaj tolerowana, ale pami�taj - wszystko ma swoje granice.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Je�li b�dziesz sprawia� k�opoty, s�ono za to zap�acisz. Trzymaj si� z dala od nowicjuszy.
	Info_ClearChoices(dia_parlan_iamparlan);
};

func void dia_parlan_iamparlan_ok()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Rozumiem.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//Mam tak� nadziej�.
	Info_ClearChoices(dia_parlan_iamparlan);
};


instance DIA_PARLAN_BIBLIOTHEK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 40;
	condition = dia_parlan_bibliothek_condition;
	information = dia_parlan_bibliothek_info;
	permanent = FALSE;
	description = "Czy masz dla mnie co� jeszcze?";
};


func int dia_parlan_bibliothek_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_parlan_bibliothek_info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//Czy masz dla mnie co� jeszcze?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Tak. Jako cz�onek biblioteki posiadasz do niej klucz. W bibliotece znajdziesz Braci Karasa i Hyglasa.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Je�li chcesz, mo�esz z nimi porozmawia�.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Tylko zostaw w spokoju nowicjuszy.
	};
	b_giveinvitems(self,other,itke_klosterbibliothek,1);
};


instance DIA_PARLAN_DONTDISTURB(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_dontdisturb_condition;
	information = dia_parlan_dontdisturb_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_dontdisturb_condition()
{
	if((PARLAN_DONTTALKTONOVICE == LOG_SUCCESS) && (b_getgreatestpetzcrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_dontdisturb_info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//Nie lubi� si� powtarza�, ale... zostaw nowicjuszy w spokoju.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//Maj� oczyszcza� swe dusze przy pomocy ci�kiej fizycznej pracy, aby przygotowywa� si� do �ycia w klasztorze.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//Nie b�d� tolerowa� twoich dalszych wybryk�w.
	PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
};


instance DIA_PARLAN_KAP3U4U5_PERM(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_kap3u4u5_perm_condition;
	information = dia_parlan_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Gdzie znajd�...";
};


func int dia_parlan_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_parlan_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Gdzie znajd�...
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,DIALOG_BACK,dia_parlan_kap3u4u5_perm_back);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...ko�ci�?",dia_parlan_kap3u4u5_perm_church);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...bibliotek�?",dia_parlan_kap3u4u5_perm_library);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...kaplic�?",dia_parlan_kap3u4u5_perm_chapel);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"...piwnice?",dia_parlan_kap3u4u5_perm_cellar);
};

func void dia_parlan_kap3u4u5_perm_back()
{
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
};

func void dia_parlan_kap3u4u5_perm_church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...ko�ci�?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Panie Wszechmog�cy! Czy�by Innos pozbawi� ci� wzroku?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//Gdzie tu jest ko�ci�? Hmmm... gdzie� on mo�e by�?
};

func void dia_parlan_kap3u4u5_perm_library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...bibliotek�?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Biblioteka znajduje si� na ko�cu kolumnady, na lewo. Dok�adnie po drugiej stronie ko�cio�a.
};

func void dia_parlan_kap3u4u5_perm_chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...kaplic�?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Kaplica to sala znajduj�ca si� mniej wi�cej w po�owie kolumnady po lewej stronie. Tam w�a�nie paladyni modl� si� do Innosa.
};

func void dia_parlan_kap3u4u5_perm_cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...piwnice?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Wej�cie do piwnic znajduje si� w po�owie kolumnady, po prawej stronie.
};


instance DIA_PARLAN_KAP4_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap4_exit_condition;
	information = dia_parlan_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parlan_kap4_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_KAP5_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap5_exit_condition;
	information = dia_parlan_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parlan_kap5_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


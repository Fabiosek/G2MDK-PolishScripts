
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Dobrze, �e jeste�. Mo�esz od razu zap�aci� grzywn�.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Widz�, �e lekcewa�ysz prawa tego miasta, co?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Lista twoich wyst�pk�w jeszcze si� powi�kszy�a!
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//Tylko mi tu nie udawaj niewini�tka!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Zap�acisz maksymaln� grzywn�.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//C�, wygl�da na to, �e sytuacja si� zmieni�a.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Nie ma �adnych �wiadk�w morderstwa!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Nikt nie chce zeznawa�, �e widzia� ci� podczas kradzie�y!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//Nie ma �adnych �wiadk�w twojej bijatyki.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//Wszystkie oskar�enia wobec ciebie zosta�y wycofane.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Nie wiem, co si� sta�o w mie�cie i NIE CHC� tego wiedzie�.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Po prostu staraj si� na przysz�o�� unika� k�opot�w.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//W ka�dym b�d� razie - postanowi�em darowa� ci kar�.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Staraj si� trzyma� z dala od podobnych awantur.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Mimo to zap�acisz nale�ne grzywny.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Wi�c jak b�dzie, p�acisz?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"Nie mam tyle pieni�dzy!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"Ile to mia�o by�?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"Chc� zap�aci� grzywn�!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Ile wynosi grzywna?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"Nie mam tyle pieni�dzy!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"Ile to mia�o by�?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"Chc� zap�aci� grzywn�!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Twoja reputacja ci� wyprzedza. S�ysza�em, �e pogwa�ci�e� prawa tego miasta.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Wpl�ta�e� si� w niez�� kaba��.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Morderstwo to powa�ne przest�pstwo!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Nie wspominaj�c nawet o twoich pozosta�ych przewinieniach.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Stra�nicy otrzymali rozkaz natychmiastowego zabijania ka�dego mordercy.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Mordercy nie b�d� tutaj tolerowani. Ale mo�esz okaza� skruch�, p�ac�c odpowiedni� grzywn�.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Oskar�ono ci� o kradzie�!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Nie wspominaj�c nawet o twoich pozosta�ych przewinieniach.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//To pogwa�cenie praw tego miasta. Musisz zap�aci� grzywn�.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Wda�e� si� w bijatyk�, tym samym �ami�c prawo tego miasta.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//A co to za sprawa z owcami?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Pogwa�cenie miejskiego prawa to z�amanie prawa ustanowionego przez Innosa.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Dlatego musisz zap�aci� za swoje przewinienia.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Zabija�e� nasze owce! Pocz�tkowo nie dawa�em temu wiary...
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Dlaczego musz� zajmowa� si� takimi b�ahostkami?
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Musisz zap�aci� grzywn�!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Ile mam zap�aci�?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"Nie mam tyle pieni�dzy!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"Chc� zap�aci� grzywn�!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Przychodz�, �eby zap�aci� grzywn�.
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//�wietnie! Dopilnuj�, �eby dowiedzieli si� o tym wszyscy mieszka�cy miasta. To poprawi troch� twoj� reputacj�.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//Nie mam tyle z�ota!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Zatem postaraj si� szybko je zdoby�.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//Ale ostrzegam: je�li pope�nisz jeszcze jakie� wykroczenia, nie b�dzie dla ciebie lito�ci!
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//S�ysza�em ju� o tobie.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Lothar doni�s� mi, �e chcia�e� ze mn� rozmawia�.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Jeste� tym obcym, kt�ry domaga si� Oka Innosa.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Jestem Lord Hagen.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Kr�lewski paladyn, wojownik w s�u�bie Innosa i namiestnik Khorinis.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//Jestem zaj�tym cz�owiekiem, wi�c nie marnuj mojego czasu. M�w od razu, co ci� tu sprowadza.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "Przynosz� propozycj� rozejmu od jednego z najemnik�w.";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//Przynosz� propozycj� rozejmu od jednego z najemnik�w.
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//Hmmm... Poka�!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Znam genera�a Lee. Znam te� okoliczno�ci, w wyniku kt�rych trafi� jako wi�zie� do Kolonii.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Uwa�am go za cz�owieka honoru. Jestem sk�onny go u�askawi�... Ale TYLKO jego.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//Jego ludzie zostan� na miejscu. Wi�kszo�� z nich to pozbawione skrupu��w �otry, kt�re trafi�y tu zas�u�enie.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Oni nie mog� liczy� na moj� �ask�.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Czy to wszystko?
	};
	b_logentry(TOPIC_FRIEDEN,"Lord Hagen mo�e wybaczy� Lee, ale nie pozosta�ym najemnikom.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "Armie ciemno�ci zbieraj� si� w pobli�u miasta, w G�rniczej Dolinie.";
};


func int dia_lord_hagen_armee_condition()
{
	if((!MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Armie ciemno�ci zbieraj� si� w pobli�u miasta, w G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//W Dolinie? Wys�a�em tam oddzia� moich ludzi. Doniesiono mi, �e prze��cz jest zaj�ta przez ork�w.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Ale pierwsze s�ysz� o... armiach ciemno�ci.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Czy to jaka� sztuczka, kt�ra ma mnie sk�oni� do zawarcia przymierza z najemnikami?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Nie.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//A co to niby za armia?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Stado smok�w, kt�rym towarzyszy horda r�wnie gro�nych istot.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Smoki? Stare pisma g�osz�, �e ostatnie smoki widziano setki lat temu!
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Dlaczego mia�bym ci uwierzy�, co?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Tu nie chodzi o to, czy mi wierzysz, tylko czy mo�esz sobie pozwoli�, �eby mi NIE wierzy�.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Dop�ki nie przedstawisz mi jakiego� dowodu, nie wy�l� tam �adnych nowych ludzi.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = TRUE;
	description = "A wi�c mam ci dostarczy� dowod�w?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (HAGEN_BRINGPROOF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//A wi�c mam ci dostarczy� dowod�w?
	if((hero.guild != GIL_NONE) && (hero.guild != GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Dok�adnie tak. Zejd� prze��cz� do G�rniczej Doliny. Na miejscu poszukaj naszej ekspedycji, a gdy j� znajdziesz - porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Je�li kto� mo�e co� powiedzie� o tej sytuacji, to w�a�nie on.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//Je�li Garond potwierdzi twoje s�owa, b�d� sk�onny ci zaufa�.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Czy to znaczy, �e przeka�esz mi Oko Innosa?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Oko Innosa... niech b�dzie. Przynie� mi niezbity dow�d, a dopilnuj�, �eby� dosta� ten amulet.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//Mam na to twoje s�owo?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Tak, masz moje s�owo.
		HAGEN_BRINGPROOF = TRUE;
	}
	else
	{
		if(hero.guild == GIL_NOV)
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED_NOV,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED,-1,-1,FONT_SCREEN,2);
		};
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "Co ci wiadomo na temat Oka Innosa?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Co ci wiadomo na temat Oka Innosa?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//To �wi�ty artefakt... Stare przepowiednie ��cz� go ze smokami.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//Ale g�osz� r�wnie�, �e tylko Wybraniec Innosa mo�e nosi� ten amulet.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//JA jestem Wybra�cem Innosa.
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Wi�c mo�e b�dziesz m�g� za�o�y� Oko.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "Jak mam si� dosta� na prze��cz?";
};


func int dia_lord_hagen_pass_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Jak mam si� dosta� na prze��cz?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//Dam ci klucz do bramy prowadz�cej na prze��cz. Dalej musisz jednak radzi� sobie sam. Tej drogi pilnuj� stada ork�w.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Niech Innos b�dzie z tob�.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"Lord Hagen chce, abym dostarczy� mu jaki� dow�d na istnienie armii Z�a. Powinienem si� uda� do G�rniczej Doliny i porozmawia� z Kapitanem Garondem.");
	if(FERNANDO_IMKNAST == FALSE)
	{
		b_startotherroutine(fernando,"WAIT");
	};
	Wld_InsertNpc(bdt_1020_bandit_l,"NW_TROLLAREA_PATH_47");
};


instance DIA_ADDON_LORD_HAGEN_ORNAMENT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 10;
	condition = dia_addon_lord_hagen_ornament_condition;
	information = dia_addon_lord_hagen_ornament_info;
	description = "Szukam metalowego ornamentu.";
};


func int dia_addon_lord_hagen_ornament_condition()
{
	if((MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING) && (LORD_HAGEN_GOTORNAMENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lord_hagen_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lord_Hagen_GiveOrnament_15_00");	//Szukam metalowego ornamentu. Powinien by� gdzie� w kamiennym kr�gu przy farmie Lobarta.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_01");	//Je�li chodzi ci o to tutaj... My�leli�my, �e mo�e to by� magiczna runa, ale to ca�kowicie bezwarto�ciowy przedmiot.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_02");	//We� go sobie, do niczego nam si� nie przyda.
	CreateInvItems(self,itmi_ornament_addon,1);
	b_giveinvitems(self,other,itmi_ornament_addon,1);
	LORD_HAGEN_GOTORNAMENT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "Co was sprowadza do Khorinis?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Co was sprowadza do Khorinis?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Wys�ano nas z misj� wagi pa�stwowej. Otrzymali�my rozkaz od samego Kr�la Rhobara.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//M�wi�em ci ju�, �e wys�ali�my ekspedycj� do G�rniczej Doliny. Po to tu w�a�nie przybyli�my.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "Co twoi ludzie robi� w G�rniczej Dolinie?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//Co twoi ludzie robi� w G�rniczej Dolinie?
	if(HAGEN_BRINGPROOF == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Nie widz� powodu, dla kt�rego mia�bym ci to m�wi�!
	}
	else
	{
		if(garond.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//By�e� tam. Sam powiniene� wiedzie�.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//No dobrze. Skoro i tak si� tam udajesz, mog� ci chyba powiedzie�.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Chodzi o magiczn� rud�. Dzi�ki niej mo�emy jeszcze wygra� t� wojn�.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Bez or�a wykonanego z tej rudy, kr�lewska armia nie ma �adnych szans w starciu z elitarnymi oddzia�ami ork�w.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//A na tej wyspie znajduj� si� ostatnie kopalnie, do kt�rych mamy jeszcze dost�p.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Wracamy na kontynent, gdy tylko za�adujemy ca�� rud� na statek.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//A wi�c przegrywamy t� wojn�?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//I tak powiedzia�em ci zbyt wiele.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "Szukam jakiego� mistrza miecza.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.aivar[REAL_TALENT_2H] >= 90) && (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Szukam jakiego� mistrza miecza.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//No to go znalaz�e�.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"Lord Hagen mo�e mnie nauczy� walki or�em dwur�cznym.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "Zacznijmy (trening walki broniami dwur�cznymi).";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Zaczynajmy.
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Jeste� teraz prawdziwym mistrzem miecza. Wi�cej nie mog� ci� nauczy�.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Niech m�dro�� mistrza miecza zawsze kieruje twoimi czynami.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "Chcia�bym wst�pi� do waszego zakonu.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Chcia�bym wst�pi� do waszego zakonu.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Dobrze, ale najpierw musisz udowodni�, �e posiadasz odwag�, umiej�tno�ci i wiedz� potrzebn� s�udze Innosa.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Twoje czyny �wiadcz�, �e jeste� cz�owiekiem honoru.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Je�li takie jest twoje �yczenie, ch�tnie powitam ci� w naszym zakonie.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"Nie podj��em jeszcze ostatecznej decyzji.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"Jestem got�w!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//Aby zosta� wojownikiem Innosa, musisz ca�kowicie po�wi�ci� si� wype�nianiu jego woli.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//W naszym zakonie s�u�y� mog� tylko najm�niejsi i najszlachetniejsi z wojownik�w.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Je�li naprawd� chcesz zosta� jednym z nas, musisz dowie��, �e jeste� tego godzien.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Nie podj��em jeszcze ostatecznej decyzji.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Zatem rozwa� t� spraw� w swoim sercu i wr��, gdy b�dziesz gotowy.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Jestem got�w!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//Niech tak si� stanie!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//Wielu z tych, kt�rzy wst�pili na t� �cie�k�, odda�o �ycie w s�u�bie Innosowi.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//Czy przysi�gasz czci� swymi czynami pami�� po nich i g�osi� wszem, i wobec chwa�� Innosa?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Przysi�gam!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Zatem od tej pory jeste� cz�onkiem naszego zakonu.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Niniejszym tytu�uj� ci� wojownikiem Innosa.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//Daj� ci or� i zbroj� godn� rycerza. No� je z dum�!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//Zostaj�c jednym z nas, otrzymujesz prawo wst�pu do klasztoru.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Albrecht wyuczy ci� naszej magii. Id� i porozmawiaj z nim.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//Nasze kwatery w g�rnym mie�cie s� oczywi�cie do twojej dyspozycji.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "Jak mam udowodni�, �e jestem godny, by do was do��czy�?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Jak mam udowodni�, �e jestem godny, by do was do��czy�?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//Tylko twoje czyny b�d� odpowiednim �wiadectwem.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//W imi� Innosa walczymy o wolno�� i sprawiedliwo��.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Stawiamy czo�a Beliarowi i jego s�ugom, kt�rzy pr�buj� zniszczy� �wi�ty �ad Innosa.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Rozumiem.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//Nic nie rozumiesz! Honor jest ca�ym naszym �yciem, a nasze �ycie nale�y do Innosa.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Paladyn rusza do boju z imieniem swojego boga na ustach. Wielu z nas z�o�y�o �ycie na o�tarzu odwiecznej walki Dobra ze Z�em.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//Ka�dy paladyn musi pozosta� wierny tej tradycji. Je�li zb��dzimy, zbrukamy pami�� naszych poleg�ych towarzyszy.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Aby zosta� paladynem, musisz w pe�ni zda� sobie z tego spraw�.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Jakie� wie�ci?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Musz� jako� uratowa� t� ekspedycj�.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Musimy co� zrobi� w sprawie tych smok�w.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//Mo�e Oko Innosa zdo�a nas jeszcze ocali�...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Ja tu chyba oszalej�. Jestem �o�nierzem, a nie urz�dnikiem!
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//Przez te wszystkie dokumenty, pisma i zarz�dzenia zapomnia�em ju� chyba, jak si� trzyma miecz w gar�ci!
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "Mam Oko przy sobie. Niestety, jest uszkodzone.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//Mam Oko przy sobie. Niestety, jest uszkodzone.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//CO TAKIEGO?! C�e� uczyni�?! Bez Oka jeste�my zgubieni!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Porozmawiaj z Pyrokarem! Musi by� jaki� spos�b, �eby je naprawi�!
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "Przynosz� wie�ci od Garonda.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//Przynosz� ci wie�ci od Garonda. Prosz�, kaza� mi wr�czy� ten list.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Sytuacja jest gro�niejsza, ni� przypuszcza�em. Ale m�w! M�w, co si� dzieje w G�rniczej Dolinie!
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Paladyni zabarykadowali si� w tamtejszym zamku. Oblega ich horda ork�w.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//Wielu �o�nierzy poleg�o. Zosta�o te� bardzo niewiele rudy.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//Obawiam si�, �e bez odpowiedniego wsparcia ci ludzie nie maj� szans.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Znajd� jaki� spos�b, �eby ich stamt�d wyci�gn��. Innos b�dzie ci wdzi�czny...
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Bardziej ni� jego wdzi�czno�� przyda mi si� Oko.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Tak, naturalnie. Dotrzymam s�owa. We� ten list. On otworzy przed tob� bramy klasztoru.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Porozmawiaj z Pyrokarem - najwy�szym z Mag�w Ognia. Poka� mu to pismo, a on zaprowadzi ci� do Oka.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//Jeszcze jedno, zanim p�jdziesz.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//We� t� run� jako wyraz mojej wdzi�czno�ci. W chwilach potrzeby przeniesie ci� ona bezpiecznie do miasta.
	b_giveinvitems(self,other,itru_teleportseaport,1);
	CreateInvItems(self,itwr_permissiontowearinnoseye_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"Lord Hagen wr�czy� mi przesy�k�, dzi�ki kt�rej Mistrz Pyrokar dopu�ci mnie do Oka Innosa.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_startotherroutine(pedro,"Tot");
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "Musz� z tob� porozmawia� o Bennecie.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Musz� z tob� porozmawia� o Bennecie.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Ale to ten najemnik, kt�ry zamordowa� jednego z moich ludzi!
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Sk�d masz pewno��, �e to Bennet jest morderc�?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"S�dz�, �e Bennet jest niewinny.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"Mo�e Bennet m�g�by naprawi� Oko Innosa.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Mo�e Bennet m�g�by naprawi� Oko Innosa.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//Cho�by nawet m�g� �ci�gn�� na ziemi� pot�g� samego Innosa...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//...ten cz�owiek zamordowa� paladyna i zostanie za to stracony.
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Sk�d masz pewno��, �e to Bennet jest morderc�?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//Mamy naocznego �wiadka.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Jak widzisz, wina tego najemnika nie podlega dyskusji.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Co to za �wiadek?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Cornelius, sekretarz gubernatora, widzia� ca�e zaj�cie.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Podany przez niego rysopis pasuje jak ula� do Benneta. Z mojego punktu widzenia, sprawa jest zamkni�ta.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Najemnik zostanie powieszony za zdrad� stanu.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius, sekretarz gubernatora, twierdzi, �e by� �wiadkiem morderstwa.");
	RECUEBENNET_KNOWSCORNELIUS = TRUE;
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//S�dz�, �e Bennet jest niewinny.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//Dowody s� jednoznaczne. To on jest sprawc�.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//A je�li dowody zosta�y sfa�szowane?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Uwa�aj, co m�wisz! To bardzo powa�ne oskar�enie!
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Je�li nie masz dowod�w, kt�re podwa�aj� zeznania mojego �wiadka, lepiej trzymaj j�zyk za z�bami.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "Cornelius k�amie.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Cornelius k�amie.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Sk�d ta pewno��?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Mam jego pami�tnik. S� tu wszystkie dowody.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//A to pod�a gnida!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//W �wietle nowych dowod�w mog� zrobi� tylko jedno.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Na mocy powierzonej mi przez Jego Wysoko�� i �wi�tyni� og�aszam...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//...�e wi�zie� Bennet zostaje oczyszczony ze wszystkich zarzut�w i ma zosta� zwolniony.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Za to Cornelius ma zosta� pojmany, pod zarzutem krzywoprzysi�stwa.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Oszcz�dz� ci k�opotu. Cornelius nie �yje.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//Zatem otrzyma� ju� sprawiedliw� kar�. Dobra robota.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Cornelius uciek�.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Znajdziemy go, pr�dzej czy p�niej. Nie wywinie si�.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Twoje czyny godne s� jednego z nas.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "Oko nale�y do mnie!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//Oko nale�y do mnie!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//Tak, Oko jest twoje!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//I to ty musisz je naprawi�!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//Zatem musisz by� Wybra�cem Innosa.
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Zamierzam po�o�y� kres zagro�eniu ze strony smok�w.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Id� wi�c, i z pomoc� Innosa zniszcz Z�o w zarodku.
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "Najlepsi wojownicy ork�w ruszyli do ataku.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Najlepsi wojownicy ork�w ruszyli do ataku.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Rozmawia�em z Lordem Hagenem na temat zbli�aj�cych si� hord herszt�w ork�w.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Dlaczego tak s�dzisz?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Rozmawia�em z jednym z nich. W rozmowie pad�o twoje imi�.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Brednie. Moi ludzie nie donie�li mi o �adnym pospolitym ruszeniu ork�w.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Mo�e jacy� ich zwiadowcy zab��kali si� do pobliskich las�w.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//To nie byli zwiadowcy. Przy jednym z nich znalaz�em ten pier�cie�.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Poka�.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//Hmmm... Niepokoj�ce...
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//To znak ich si�y. A wi�c orkowie porzucili swoje palisady i stan�li do boju w otwartym polu.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Nie widzia�em ich jeszcze zbyt wielu. G��wnie ich przyw�dc�w i kilku wojownik�w.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//Tak? Zatem planuj� co� innego. To ma�o podobne do ork�w, by ich przyw�dcy wypuszczali si� w pojedynk� poza swoje osiedla.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Ale to �wietna okazja, by uderzy� w ich czu�y punkt.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Gdy strac� swoich przyw�dc�w, morale ca�ej armii os�abnie.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//Mam dla ciebie nowe zadanie, rycerzu. Masz zabi� wszystkich orkowych przyw�dc�w, kt�rzy kr�c� si� po okolicy.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Tylko przynie� mi ich pier�cienie! Po takim ciosie szybko si� nie podnios�.
		b_logentry(TOPIC_ORCELITE,"Na dow�d moich s��w przynios�em Hagenowi orkowy pier�cie�. Kaza� sobie dostarczy� wszystkie pier�cienie, jakie tylko uda mi si� zdoby�.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Udaj si� najpierw do Ingmara. Doradzi ci, jak skutecznie walczy� z takim przeciwnikiem.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Elitarni wojownicy ork�w to jego specjalno��. Cz�sto mia� z nimi do czynienia.
			b_logentry(TOPIC_ORCELITE,"Elitarni orkowi wojownicy s� specjalno�ci� Ingmara.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Twoje s�owo, �e pokona�e� orkowego wodza, to dla mnie za ma�o!
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Je�li mam ci uwierzy�, potrzebuj� bardziej wiarygodnych dowod�w.
		b_logentry(TOPIC_ORCELITE,"Hagen nie chce mi uwierzy�. Za��da� dowod�w na to, �e orkowi wojownicy faktycznie atakuj� ludzkie siedziby. C�, by�bym zaskoczony, gdyby tego nie zrobi�.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "Mam jeszcze co� do powiedzenia w sprawie orkowych przyw�dc�w.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Mam jeszcze co� do powiedzenia w sprawie orkowych przyw�dc�w.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//S�ucham...
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Mam dla ciebie jeszcze jeden pier�cie�.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Mam dla ciebie kolejne pier�cienie.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Dobra robota! Tak trzyma�.
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//W okolicy mo�e si� kr�ci� jeszcze kilku.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Wkr�tce rzucimy te bestie na kolana!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//Zdziwi�bym si�, gdyby w okolicy kr�ci�o si� ich jeszcze wielu.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Je�li chcesz, mo�esz nadal przynosi� mi pier�cienie, ale my�l�, �e orkowie dostali ju� odpowiedni� nauczk�.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//Prosz�. We� to z�oto i kup za nie lepsze wyposa�enie.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie �yj�.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Wszystkie smoki zosta�y zg�adzone.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//Wiedzia�em, �e Innos doda ci si� w walce ze smokami!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Gdzie jest ruda?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Orkowie wci�� oblegaj� zamek w G�rniczej Dolinie. Garond nie mo�e opu�ci� twierdzy, p�ki nie odeprze ich ataku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//Niech to szlag!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Je�li Garond nie potrafi upora� si� z t� sytuacj�, sam si� tym zajm�!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//�adna banda ork�w nie stanie mi na przeszkodzie!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//Powiadomi�em ju� moich ludzi. Przygotowujemy si� do wyruszenia w drog�.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Zabieram ich wszystkich. Na stra�y statku pozostan� nieliczni wartownicy.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//Pora, by kto� wreszcie rozprawi� si� z tymi orkami!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "Potrzebuj� okr�tu.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Potrzebuj� okr�tu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//Nie ty jeden, �o�nierzu.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//S�ysz� to prawie codziennie, przyjacielu. Ale...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//Nie masz nawet kapitana, nie wspominaj�c ju� o za�odze...
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//A co z tym statkiem na przystani?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Ten okr�t nale�y do mnie. To na nim przewieziemy rud�.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Mog� ci go u�yczy�, dopiero gdy wywi��emy si� z zadania.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "Orkowie przypu�cili szturm na zamek w G�rniczej Dolinie!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Orkowie przypu�cili szturm na zamek w G�rniczej Dolinie!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//Na Innosa! Co tam si� sta�o?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Wygl�da na to, �e brama by�a otwarta...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Wygl�da... Jak to mo�liwe... W zamku musi by� zdrajca!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "Na co czekasz?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Na co czekasz?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//Czekam tylko na wyposa�enie i �ywno��. Zaraz potem ruszamy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Po szturmie na zamek potrzebujemy jeszcze wi�cej zapas�w.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//Ale to tylko nieznacznie op�ni nasz wymarsz.
	};
};


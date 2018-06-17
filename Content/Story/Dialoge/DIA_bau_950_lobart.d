
instance DIA_LOBART_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_exit_condition;
	information = dia_lobart_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lobart_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_STOLENCLOTHS(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_stolencloths_condition;
	information = dia_lobart_stolencloths_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_stolencloths_condition()
{
	if((Mob_HasItems("CHEST_LOBART",itar_bau_l) == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_stolencloths_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_bau_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//Nie wierz�! Ten dra� biega w MOICH ubraniach!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//Hej, ty!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//Zaraz po twojej wizycie okaza�o si�, �e w moim kufrze brakuje paru ubra�!
	};
	if(Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//Znajd� sobie jak�� robot�, zamiast w�szy� po moim domu, darmozjadzie!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//W tej chwili oddaj mi moje ubrania!
	Info_ClearChoices(dia_lobart_stolencloths);
	Info_AddChoice(dia_lobart_stolencloths,"Zapomnij o tym!",dia_lobart_stolencloths_forgetit);
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_lobart_stolencloths,"Prosz�, we� je.",dia_lobart_stolencloths_hereyougo);
	}
	else
	{
		Info_AddChoice(dia_lobart_stolencloths,"Ju� ich nie mam.",dia_lobart_stolencloths_donthaveit);
	};
};

func void dia_lobart_stolencloths_hereyougo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//Prosz�, we� je.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//Je�li s� ci potrzebne, zap�a� za nie!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//Zrobi�by� co� po�ytecznego!
	b_giveinvitems(other,self,itar_bau_l,1);
	Info_ClearChoices(dia_lobart_stolencloths);
};

func void dia_lobart_stolencloths_donthaveit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//Ju� ich nie mam.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//Sprzeda�e� je, co? Ju� ja ci poka��!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};

func void dia_lobart_stolencloths_forgetit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//Zapomnij o tym!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//Ju� ja ci poka��!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};


instance DIA_LOBART_HALLO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_hallo_condition;
	information = dia_lobart_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Czemu wkroczy�e� na m�j teren?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//Po czyjej ty jeste� stronie? Popierasz zbuntowanych farmer�w czy Kr�la?
		Info_ClearChoices(dia_lobart_hallo);
		Info_AddChoice(dia_lobart_hallo,"Nie rozumiem...",dia_lobart_hallo_what);
		Info_AddChoice(dia_lobart_hallo,"Jestem za Kr�lem!",dia_lobart_hallo_fortheking);
		Info_AddChoice(dia_lobart_hallo,"Jestem za farmerami!",dia_lobart_hallo_forthepeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//Co mog� dla ciebie zrobi�?
	};
};

func void dia_lobart_hallo_forthepeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//Jestem za farmerami!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ha! Ten przekl�ty pod�egacz, Onar, �ci�gnie na nas wszystkich nieszcz�cie!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//Jak s�dzisz, czy paladyni b�d� si� temu wszystkiemu przygl�da� w niesko�czono��?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//Po tym co zrobi� Onar, w ca�ym mie�cie a� zawrza�o.
	LOBART_AGAINSTKING = TRUE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_fortheking()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//Jestem za Kr�lem!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//'Za Kr�lem!' W�a�nie to powiedzia� stra�nik miejski, zabieraj�c mi moj� ostatni� owc�.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//Gdzie s� te �winie, kiedy naprawd� ich potrzebujemy? Gdzie byli, kiedy atakowali nas bandyci i orkowie?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//Powiem ci gdzie: w mie�cie, ukryci bezpiecznie za grubym murem obronnym.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//Wi�c daj mi spok�j z Kr�lem.
	LOBART_AGAINSTKING = FALSE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_what()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//Nie rozumiem...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//Co?! Lepiej ze mn� nie zadzieraj, ch�opcze! Chc�, �eby�my wiedzieli na czym stoimy! No wi�c? Po czyjej jeste� stronie?!
};


instance DIA_LOBART_KLEIDUNG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_kleidung_condition;
	information = dia_lobart_kleidung_info;
	permanent = FALSE;
	description = "Potrzebne mi jakie� ubranie!";
};


func int dia_lobart_kleidung_condition()
{
	if(!Npc_KnowsInfo(other,dia_lobart_stolencloths) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_kleidung_info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//Potrzebne mi jakie� ubranie!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//Mog� ci da� czyste ubranie robocze.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//Je�li mi za nie zap�acisz.
	Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
	b_logentry(TOPIC_KLEIDUNG,"Farmer Lobart chce mi sprzeda� ubranie robocze.");
	if(!Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//A je�li nie masz czym zap�aci�... na farmie zawsze przyda si� dodatkowa para r�k. To znaczy, je�li potrzebujesz pracy.
		b_logentry(TOPIC_KLEIDUNG,"Mog� na nie cz�ciowo zarobi�, pracuj�c na jego farmie. Im wi�cej pracy wykonam, tym ni�sza b�dzie cena ubra�.");
	};
};


instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_buyclothes_condition;
	information = dia_lobart_buyclothes_info;
	permanent = TRUE;
	description = "Ile chcesz za to ubranie?";
};


func int dia_lobart_buyclothes_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_kleidung) && (LOBART_KLEIDUNG_VERKAUFT == FALSE)) || (Npc_KnowsInfo(other,dia_lobart_stolencloths) && (LOBART_KLEIDUNG_GESTOHLEN == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void dia_lobart_buyclothes_info()
{
	WERT_LOBARTSRUESTUNG = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//Ile chcesz za to ubranie?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Zastan�wmy si�...
	if(LOBART_AGAINSTKING == TRUE)
	{
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//Pracowa�e� dla mnie w polu.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//Pomog�e� mojej �onie.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_VINO_WEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Vino m�wi, �e jeste� dla niego nieocenion� pomoc�. A to ju� o czym� �wiadczy - niecz�sto zdarza mu si� chwali� pracownik�w.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_MALETH_BANDITS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Maleth m�wi, �e przep�dzi�e� bandyt�w. Mieli�my przez nich ca�� mas� problem�w. Dzi�kuj� ci!
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
	if(WERT_LOBARTSRUESTUNG == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//Cena nie zmaleje.
		b_logentry(TOPIC_KLEIDUNG,"Jednak nie sprzeda mi go taniej ni� za 30 sztuk z�ota.");
	};
	Info_ClearChoices(dia_lobart_buyclothes);
	Info_AddChoice(dia_lobart_buyclothes,"To wci�� za du�o.",dia_lobart_buyclothes_notyet);
	Info_AddChoice(dia_lobart_buyclothes,"Daj mi wi�c to ubranie robocze (ochrona od broni i strza�: 10)",dia_lobart_buyclothes_buy);
};

func void dia_lobart_buyclothes_buy()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Daj mi to ubranie.
	if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
	{
		if(Npc_HasItems(self,itar_bau_l) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Tak, m�j ch�opcze. Uczciwo�� zawsze pop�aca. Prosz�!
			b_giveinvitems(self,other,itar_bau_l,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//W moim domu stoi kufer, w kt�rym zamkni�te s� czyste ubrania.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//�eby tylko ci nie przysz�o do g�owy wzi�� sobie co� jeszcze!
		};
		LOBART_KLEIDUNG_VERKAUFT = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		b_checklog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//Nie masz wystarczaj�co du�o z�ota!
	};
	Info_ClearChoices(dia_lobart_buyclothes);
};

func void dia_lobart_buyclothes_notyet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//To wci�� za du�o.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//Prosz� bardzo.
	Info_ClearChoices(dia_lobart_buyclothes);
};


instance DIA_LOBART_AUFSTANDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_aufstandinfo_condition;
	information = dia_lobart_aufstandinfo_info;
	permanent = FALSE;
	description = "Co tu si� dzieje?";
};


func int dia_lobart_aufstandinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_aufstandinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//Co si� tu dzieje?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Pytasz, co si� dzieje? Ch�opie, sk�d ty si� urwa�e�? Jeste�my w przededniu wojny domowej!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//Do tej pory farmerzy traktowali czynsz jako sprawiedliwie naliczany podatek.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//Jednak odk�d w mie�cie pojawili si� paladyni, coraz cz�ciej odwiedzaj� nas stra�nicy, kawa�ek po kawa�ku rozkradaj�c nasz dobytek.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//Je�li tak dalej p�jdzie, to wkr�tce nic nam ju� nie pozostanie.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//Niekt�rzy farmerzy zaczynaj� si� buntowa�. Pierwszy by� Onar!
};


instance DIA_LOBART_ONARSTORY(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_onarstory_condition;
	information = dia_lobart_onarstory_info;
	permanent = FALSE;
	description = "Powiedz mi co� wi�cej o tym Onarze.";
};


func int dia_lobart_onarstory_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_onarstory_info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//Powiedz mi co� wi�cej o tym Onarze.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//Jeste� najemnikiem, prawda? Wi�c chyba najlepiej znasz swojego szefa?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Onar jest w�a�cicielem najwi�kszej farmy w okolicy. Ca�kowicie zerwa� kontakty z miastem.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//Podobno zatrudni� najemnik�w, aby nie dopuszczali stra�y do jego posiad�o�ci!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//Trudno si� zreszt� temu dziwi�.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//W ka�dym razie to zadzia�a�o - �aden stra�nik miejski nie �mie postawi� stopy na jego terenach.
	};
};


instance DIA_LOBART_SLDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_sldinfo_condition;
	information = dia_lobart_sldinfo_info;
	permanent = FALSE;
	description = "Kim s� ci najemnicy zatrudnieni przez Onara?";
};


func int dia_lobart_sldinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_onarstory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_sldinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//Kim s� ci najemnicy zatrudnieni przez Onara?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//Nie wiem o nich zbyt wiele. Prawdopodobnie wi�kszo�� z nich to byli wi�niowie z Kolonii.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//Wszyscy wiemy, czego si� po nich mo�na spodziewa�...
};


instance DIA_LOBART_WHICHSIDE(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_whichside_condition;
	information = dia_lobart_whichside_info;
	permanent = FALSE;
	description = "Po czyjej jeste� stronie? Ch�op�w czy Kr�la?";
};


func int dia_lobart_whichside_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_whichside_info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//A co z tob�? Po kt�rej jeste� stronie? Ch�op�w czy Kr�la?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//Mieszkam zbyt blisko miasta, �eby mie� jakikolwiek wyb�r.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//Ale ciesz� si� z tego. To by�aby bardzo trudna decyzja.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//Kr�l zabiera nam wszystko, co mamy. Z kolei Onar szczuje swoimi najemnikami ka�dego, kto nie chce si� do niego przy��czy�.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//Dlatego wi�kszo�� farmer�w wci�� nie mo�e si� jeszcze zdecydowa�. Jednak wcze�niej czy p�niej b�d� musieli opowiedzie� si� po kt�rej� ze stron.
	};
};


instance DIA_LOBART_WORKNOW(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_worknow_condition;
	information = dia_lobart_worknow_info;
	permanent = FALSE;
	description = "Szukam pracy.";
};


func int dia_lobart_worknow_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) || Npc_KnowsInfo(other,dia_lobart_stolencloths) || Npc_KnowsInfo(other,dia_lobart_kleidung))
	{
		if(KAPITEL < 3)
		{
			return TRUE;
		};
	};
};

func void dia_lobart_worknow_info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//Szukam pracy.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//Je�li chcesz, mo�esz u mnie pracowa�.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//Mo�esz pracowa� w polu albo znale�� sobie jakie� inne zaj�cie. Roboty na farmie nigdy nie brakuje.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//Mog� ci zap�aci�, albo - je�li wolisz - dostaniesz ode mnie porz�dne ubranie.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//Te rzeczy s� troch� warte. Nie mog� ci ich tak po prostu odda�. Jednak je�li zgodzisz si� dla mnie pracowa�, sprzedam ci je po ni�szej cenie.
		Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
		b_logentry(TOPIC_KLEIDUNG,"Farmer Lobart chce mi sprzeda� ubranie robocze, kt�rego cz�� ceny mog� odpracowa� w polu. Im wi�cej pracy wykonam, tym ni�sza b�dzie cena ubra�.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//Na twoim miejscu wzi��bym ubranie...
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//Ale poniewa� masz ju� ca�kiem przyzwoite ubranie, pewnie wola�by� z�oto.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Trzeba zebra� rzep� z tego ma�ego poletka przy stodole.
	Info_ClearChoices(dia_lobart_worknow);
	Info_AddChoice(dia_lobart_worknow,"Mam wyrywa� rzep�? Chyba sobie ze mnie �artujesz!",dia_lobart_worknow_wannafoolme);
	Info_AddChoice(dia_lobart_worknow,"W porz�dku...",dia_lobart_worknow_ok);
};

func void dia_lobart_worknow_ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Dobrze...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Wi�c po�piesz si�, zanim zmieni� zdanie.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Farmer Lobart chce, abym zebra� z pola rzep�. W zamian oferuje mi z�oto albo obni�enie ceny ubra�.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};

func void dia_lobart_worknow_wannafoolme()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//Mam wyrywa� rzep�? Chyba sobie ze mnie �artujesz!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Tak, taki d�entelmen jak ty pewnie brzydzi si� uczciw� prac�, co?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//Jazda na pole albo wyno� si� z mojej farmy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//W tej chwili nie mam dla ciebie �adnej innej pracy.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Farmer Lobart chce, abym zebra� z pola rzep�. W zamian oferuje mi z�oto albo obni�enie ceny ubra�.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};


instance DIA_LOBART_RUEBENRUNNING(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_ruebenrunning_condition;
	information = dia_lobart_ruebenrunning_info;
	permanent = TRUE;
	description = "Oto twoja rzepa!";
};


func int dia_lobart_ruebenrunning_condition()
{
	if((MIS_LOBART_RUEBEN == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_ruebenrunning_info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Oto twoja rzepa!
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Widzisz, jednak jest z ciebie jaki� po�ytek.
		};
		if(Npc_IsDead(hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Zanie� je mojej �onie i powiedz, �eby je ugotowa�a.
			MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
			Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
			b_logentry(TOPIC_RUEBENBRINGEN,"Zebran� rzep� mam zanie�� do �ony Lobarta, kt�ra przyrz�dzi z niej posi�ek.");
		};
		MIS_LOBART_RUEBEN = LOG_SUCCESS;
		b_giveplayerxp(XP_LOBARTHOLRUEBEN);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//Co z moj� zap�at�?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//Mog� ci da� 5 sztuk z�ota.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//...albo sprzeda� ubranie po ni�szej cenie. Co wybierasz?
		};
		Info_ClearChoices(dia_lobart_ruebenrunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(dia_lobart_ruebenrunning,"Sprzedaj mi ubranie po ni�szej cenie!",dia_lobart_ruebenrunning_billiger);
		};
		Info_AddChoice(dia_lobart_ruebenrunning,"Daj mi 5 sztuk z�ota!",dia_lobart_ruebenrunning_gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//Ale tu nie ma nawet 20 sztuk!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Chcesz mi powiedzie�, �e zjad�e� reszt�?! Je�li tak, to mo�esz zapomnie� o wynagrodzeniu!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Jazda na pole po reszt� rzepy! Wracaj do pracy albo naprawd� si� rozgniewam!
		};
		AI_StopProcessInfos(self);
	};
};

func void dia_lobart_ruebenrunning_gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Daj mi 5 sztuk z�ota!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Prosz�.
	b_giveinvitems(self,other,itmi_gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//I nie przepij wszystkiego od razu.
	};
	Info_ClearChoices(dia_lobart_ruebenrunning);
};

func void dia_lobart_ruebenrunning_billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//Sprzedaj mi ubranie po ni�szej cenie!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Dobrze! Obni�� cen� o 10 monet.
	Info_ClearChoices(dia_lobart_ruebenrunning);
};


instance DIA_LOBART_MOREWORK(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_morework_condition;
	information = dia_lobart_morework_info;
	permanent = TRUE;
	description = "Czy masz dla mnie jeszcze jak�� robot�?";
};


func int dia_lobart_morework_condition()
{
	if(((MIS_LOBART_RUEBEN == LOG_RUNNING) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_morework_info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//Czy masz dla mnie jeszcze jak�� robot�?
	if(MIS_LOBART_RUEBEN == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//Najpierw przynie� rzep�. Potem zobaczymy.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//Nie, ale zapytaj moj� �on� albo ch�opc�w pracuj�cych w polu. Mo�e oni znajd� dla ciebie jakie� zaj�cie.
	};
};


instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_andrehelplobart_condition;
	information = dia_lobart_andrehelplobart_info;
	description = "Andre mnie do ciebie przys�a�.";
};


func int dia_lobart_andrehelplobart_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lobart_andrehelplobart_info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Przysy�a mnie Andre. Czy mog� co� dla ciebie zrobi�?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Tak, pewnie. Te cholerne polne bestie strasznie uprzykrzaj� mi �ycie.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//Za�atw jako� ten problem. Niewa�ne jak!
	Log_AddEntry(TOPIC_BECOMEMIL,"Pola Lobarta atakowane s� przez polne bestie. Prosi� mnie, abym si� nimi zaj��.");
	MIS_LOBARTKILLBUGS = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_BUGDEAD(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_bugdead_condition;
	information = dia_lobart_bugdead_info;
	permanent = TRUE;
	description = "Polne bestie nie �yj�!";
};


var int dia_lobart_bugdead_noperm;

func int dia_lobart_bugdead_condition()
{
	if((MIS_LOBARTKILLBUGS == LOG_RUNNING) && (DIA_LOBART_BUGDEAD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_bugdead_info()
{
	if(Npc_IsDead(lobarts_giant_bug1) && Npc_IsDead(lobarts_giant_bug2) && Npc_IsDead(lobarts_giant_bug3) && Npc_IsDead(lobarts_giant_bug4) && Npc_IsDead(lobarts_giant_bug5) && Npc_IsDead(lobarts_giant_bug6) && Npc_IsDead(lobarts_giant_bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//Polne bestie nie �yj�!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Dobra robota. Polec� twoje us�ugi znajomym. Prosz�, oto zap�ata.
		b_startotherroutine(vino,"Start");
		b_startotherroutine(lobartsbauer1,"Start");
		b_startotherroutine(lobartsbauer2,"Start");
		CreateInvItems(self,itmi_gold,20);
		b_giveinvitems(self,other,itmi_gold,20);
		MIS_LOBARTKILLBUGS = LOG_SUCCESS;
		MIS_ANDREHELPLOBART = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BECOMEMIL,"Lobart nie musi si� ju� przejmowa� polnymi bestiami. Zrobi�em z nimi porz�dek.");
		DIA_LOBART_BUGDEAD_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//Chyba wyko�czy�em je wszystkie!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Nie pr�buj mnie wykiwa�. Wci�� je tutaj widuj�. Albo zabijesz je wszystkie, albo nie mamy o czym gada�.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LOBART_KAP3_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap3_exit_condition;
	information = dia_lobart_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lobart_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_DMT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 30;
	condition = dia_lobart_dmt_condition;
	information = dia_lobart_dmt_info;
	description = "Co nowego na farmie?";
};


func int dia_lobart_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_lobart_dmt_info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//Co nowego na farmie?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//Ju� nie daj� rady...
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//Znienacka pojawili si� tutaj ci go�cie w czarnych kapturach.
	Info_ClearChoices(dia_lobart_dmt);
	Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
	if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//Najpierw Vino mia� z nimi bardzo d�ug� rozmow�, a potem gdzie� go zabrali.
		if(NPCOBSESSEDBYDMT_VINO == FALSE)
		{
			Info_AddChoice(dia_lobart_dmt,"Dok�d go zaci�gn�li?",dia_lobart_dmt_vinowohin);
		};
		Info_AddChoice(dia_lobart_dmt,"W czym mia� im pom�c Vino?",dia_lobart_dmt_vinowas);
	};
	if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//Nied�ugo potem moja �ona powa�nie si� rozchorowa�a. Wi�kszo�� czasu sp�dza w ��ku. Dosy� cz�sto jej si� to zdarza.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//Chyba oszalej�!
	if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(dia_lobart_dmt,"Czemu nie zabierzesz �ony do uzdrawiacza?",dia_lobart_dmt_frauheilen);
	};
	Info_AddChoice(dia_lobart_dmt,"Czemu nic nie zrobisz z tymi zakapturzonymi postaciami?",dia_lobart_dmt_hof);
	Info_AddChoice(dia_lobart_dmt,"Rozmawia�e� z tymi odzianymi na czarno m�czyznami?",dia_lobart_dmt_spoketothem);
};

func void dia_lobart_dmt_frauheilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//Czemu nie zabierzesz �ony do uzdrawiacza?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//Powinni�my p�j�� do miasta i zobaczy� si� z Vatrasem, ale nie mog� si� st�d ruszy�, dop�ki to ca�e zamieszanie si� nie sko�czy.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"�ona Lobarta, Hilda, zachorowa�a. Vatras ma lekarstwo, kt�re mo�e j� wyleczy�.");
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_lobart_dmt_back()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void dia_lobart_dmt_spoketothem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Rozmawia�e� z tymi odzianymi na czarno m�czyznami?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//Jasne. Nie mia�em zreszt� wyboru.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//Chyba kogo� szukaj�.
};

func void dia_lobart_dmt_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//Czemu nic nie zrobisz z tymi zakapturzonymi postaciami?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//Bardzo bym chcia�, ale si� boj�. Widzia�em, jak spalili jednego cz�owieka �ywcem. Tak po prostu.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//Czemu mia�bym ryzykowa� �yciem?
};

func void dia_lobart_dmt_vinowas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//W czym mia� im pom�c Vino?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//Nie powiedzieli. Po prostu go zabrali.
};

func void dia_lobart_dmt_vinowohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Dok�d go zaci�gn�li?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//Poszli przez to wzg�rze.
};


instance DIA_LOBART_VINOTOT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 32;
	condition = dia_lobart_vinotot_condition;
	information = dia_lobart_vinotot_info;
	description = "Vino ju� nie wr�ci.";
};


func int dia_lobart_vinotot_condition()
{
	if((Npc_IsDead(vino) || (NPCOBSESSEDBYDMT_VINO == TRUE)) && Npc_KnowsInfo(other,dia_lobart_dmt) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lobart_vinotot_info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Vino ju� nie wr�ci.
	if(Npc_IsDead(vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Nie �yje.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//Doprowadzili go do szale�stwa.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//Na Innosa. Mam nadziej�, �e ten koszmar wkr�tce si� sko�czy.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LOBART_PERM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 80;
	condition = dia_lobart_perm_condition;
	information = dia_lobart_perm_info;
	permanent = TRUE;
	description = "Uwa�aj na swoj� farm�!";
};


func int dia_lobart_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_dmt) && (KAPITEL >= 3) && (Npc_IsDead(orcwarrior_lobart1) && Npc_IsDead(orcwarrior_lobart2) && Npc_IsDead(orcwarrior_lobart3) && Npc_IsDead(orcwarrior_lobart4) && Npc_IsDead(orcwarrior_lobart5) && Npc_IsDead(orcwarrior_lobart6)))
	{
		return TRUE;
	};
};

func void dia_lobart_perm_info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//Uwa�aj na swoj� farm�!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//Postaram si�.
};


instance DIA_LOBART_KAP4_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap4_exit_condition;
	information = dia_lobart_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lobart_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKPROBLEM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 41;
	condition = dia_lobart_orkproblem_condition;
	information = dia_lobart_orkproblem_info;
	description = "Masz tu k�opot z orkami.";
};


func int dia_lobart_orkproblem_condition()
{
	if(((Npc_IsDead(orcwarrior_lobart1) == FALSE) || (Npc_IsDead(orcwarrior_lobart2) == FALSE) || (Npc_IsDead(orcwarrior_lobart3) == FALSE) || (Npc_IsDead(orcwarrior_lobart4) == FALSE) || (Npc_IsDead(orcwarrior_lobart5) == FALSE) || (Npc_IsDead(orcwarrior_lobart6) == FALSE)) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,dia_lobart_dmt))
	{
		return TRUE;
	};
};

func void dia_lobart_orkproblem_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//Masz tu k�opot z orkami.
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//Niech to szlag! Czy te problemy nigdy si� nie sko�cz�?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//Je�li tak dalej p�jdzie, wkr�tce warto�� ca�ej mojej farmy nie b�dzie przekracza� trzech monet!
	Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
	b_logentry(TOPIC_LOBARTSORKPROBLEM,"Orkowie zaj�li farm� Lobarta, kt�ry poprosi� mnie, abym si� ich pozby�.");
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKSWEG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 42;
	condition = dia_lobart_orksweg_condition;
	information = dia_lobart_orksweg_info;
	description = "Pozby�em si� ork�w.";
};


func int dia_lobart_orksweg_condition()
{
	if((Npc_IsDead(orcwarrior_lobart1) == TRUE) && (Npc_IsDead(orcwarrior_lobart2) == TRUE) && (Npc_IsDead(orcwarrior_lobart3) == TRUE) && (Npc_IsDead(orcwarrior_lobart4) == TRUE) && (Npc_IsDead(orcwarrior_lobart5) == TRUE) && (Npc_IsDead(orcwarrior_lobart6) == TRUE) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lobart_orksweg_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//Pozby�em si� ork�w.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//I niech ludzie nie gadaj�, �e paladyni nic nie robi� dla farmer�w.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//Chwa�a Innosowi. Nie mog� ci zaoferowa� �adnej warto�ciowej nagrody, ale mam nadziej�, �e docenisz ten gest.
	b_startotherroutine(vino,"Start");
	b_startotherroutine(lobartsbauer1,"Start");
	b_startotherroutine(lobartsbauer2,"Start");
	TOPIC_END_LOBARTSORKPROBLEM = TRUE;
	b_giveplayerxp(XP_KILLEDLOBARTORKS);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_LOBART_KAP5_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap5_exit_condition;
	information = dia_lobart_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lobart_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_KAP6_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap6_exit_condition;
	information = dia_lobart_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lobart_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_PICKPOCKET(C_INFO)
{
	npc = bau_950_lobart;
	nr = 900;
	condition = dia_lobart_pickpocket_condition;
	information = dia_lobart_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_lobart_pickpocket_condition()
{
	return c_beklauen(65,80);
};

func void dia_lobart_pickpocket_info()
{
	Info_ClearChoices(dia_lobart_pickpocket);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_BACK,dia_lobart_pickpocket_back);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_PICKPOCKET,dia_lobart_pickpocket_doit);
};

func void dia_lobart_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lobart_pickpocket);
};

func void dia_lobart_pickpocket_back()
{
	Info_ClearChoices(dia_lobart_pickpocket);
};


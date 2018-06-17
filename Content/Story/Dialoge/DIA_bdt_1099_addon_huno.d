
instance DIA_ADDON_HUNO_EXIT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 999;
	condition = dia_addon_huno_exit_condition;
	information = dia_addon_huno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_huno_exit_condition()
{
	return TRUE;
};

func void dia_addon_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 900;
	condition = dia_addon_huno_pickpocket_condition;
	information = dia_addon_huno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_huno_pickpocket_condition()
{
	return c_beklauen(85,102);
};

func void dia_addon_huno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_BACK,dia_addon_huno_pickpocket_back);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_PICKPOCKET,dia_addon_huno_pickpocket_doit);
};

func void dia_addon_huno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_huno_pickpocket);
};

func void dia_addon_huno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
};


instance DIA_ADDON_HUNO_ABWIMMELN(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_abwimmeln_condition;
	information = dia_addon_huno_abwimmeln_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_huno_abwimmeln_condition()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		return TRUE;
	};
	if((HUNO_ZUSNAF == TRUE) && !Npc_KnowsInfo(other,dia_addon_fisk_meeting) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_huno_abwimmeln_info()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Czego jeszcze chcesz? Spadaj!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Na co czekasz? Id� si� napi�!
	};
	AI_StopProcessInfos(self);
};


var int knows_flucht;
var int huno_angepisst;

instance DIA_ADDON_HUNO_HI(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_hi_condition;
	information = dia_addon_huno_hi_info;
	permanent = FALSE;
	description = "Od razu wida�, �e znasz si� na swoim fachu.";
};


func int dia_addon_huno_hi_condition()
{
	return TRUE;
};

func void dia_addon_huno_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Od razu wida�, �e znasz si� na swoim fachu.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//Ju� to kiedy� s�ysza�em... przynosisz stal?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Stal? Nie, chyba mnie z kim� pomyli�e�....
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hmm... wygl�dasz znajomo. Spotkali�my si� wcze�niej?
	Info_ClearChoices(dia_addon_huno_hi);
	Info_AddChoice(dia_addon_huno_hi,"Oczywi�cie, w Starym Obozie.",dia_addon_huno_hi_ja);
	Info_AddChoice(dia_addon_huno_hi,"Nie pami�tam tego.",dia_addon_huno_hi_no);
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Huno handluje wyrobami kowalskimi.");
};

func void dia_addon_huno_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Oczywi�cie, w Starym Obozie.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//W Starym Obozie... racja... to ty jeste� tym w�cibskim go�ciem... my�la�em, �e nie �yjesz.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//C�, wszyscy tak s�dzili. Kto jeszcze prze�y�?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//Paru ludzi. Niekt�rzy uciekli z Krukiem, tak jak ja. Wielu zgin�o w obozie.
	Info_ClearChoices(dia_addon_huno_hi);
	KNOWS_FLUCHT = TRUE;
};

func void dia_addon_huno_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Nie pami�tam tego.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hmm... Sam mam w g�owie m�tlik... Szlag by to trafi�...
	Info_ClearChoices(dia_addon_huno_hi);
};


instance DIA_ADDON_HUNO_BLITZ(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 2;
	condition = dia_addon_huno_blitz_condition;
	information = dia_addon_huno_blitz_info;
	permanent = FALSE;
	description = "Opowiedz mi o ucieczce.";
};


func int dia_addon_huno_blitz_condition()
{
	if((KNOWS_FLUCHT == TRUE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_blitz_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//Opowiedz mi o ucieczce.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//Kiedy przesta�a istnie� bariera, zapanowa� chaos.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//Niekt�rzy si� ukryli � inni uciekli, a wszystko zosta�o spl�drowane.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//Co zrobi�e�?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Pr�bowa�em uciec z obozu, gdy nagle zrobi�o si� strasznie jasno i poczu�em straszliwy b�l.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//Trafi� mnie cholerny piorun! Ci�gle mi si� zdaje, �e go s�ysz�...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//P�niej dowiedzia�em si�, �e znalaz� mnie Thorus i zabra� ze sob�.
};


var int huno_armorperm;

instance DIA_ADDON_HUNO_ARMOR(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_armor_condition;
	information = dia_addon_huno_armor_info;
	permanent = TRUE;
	description = "Potrzebuj� lepszej zbroi.";
};


func int dia_addon_huno_armor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_hi) && (HUNO_ARMORPERM == FALSE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_armor_info()
{
	Info_ClearChoices(dia_addon_huno_armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Potrzebuj� lepszej zbroi.
	if(HUNO_ARMORCHEAP == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//C� � mo�esz j� mie�. To, �e jest taka droga, to wina Estebana.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Ten parszywy pies �ci�ga haracz z ka�dej sprzedanej przeze mnie zbroi.
		BDT_ARMOR_H_VALUE = 2100;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Kup ci�k� zbroj� bandyt�w. Ochrona (bro� i strza�y) 45, 2100 sztuk z�ota.",dia_addon_huno_armor_buy);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Fisk powiedzia�, �e sprzedasz mi j� po dobrej cenie.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Fisk, powiadasz... Hmm, dobrze, jestem mu winien przys�ug�.
		BDT_ARMOR_H_VALUE = 1400;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Kup ci�k� zbroj� bandyt�w. Ochrona (bro� i strza�y) 45, 1400 sztuk z�ota.",dia_addon_huno_armor_buy);
	};
};

func void dia_addon_huno_armor_back()
{
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Dobra, bior� zbroj�.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_H_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Wygl�da nie�le.
		b_giveinvitems(self,other,itar_bdt_h,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Nie ma z�ota, nie ma zbroi.
	};
	if(BDT_ARMOR_H_VALUE < 2100)
	{
		HUNO_ARMORPERM = TRUE;
	};
	Info_ClearChoices(dia_addon_huno_armor);
};


instance DIA_ADDON_HUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_attentat_condition;
	information = dia_addon_huno_attentat_info;
	permanent = FALSE;
	description = "A co do pr�by zab�jstwa Estebana...";
};


func int dia_addon_huno_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_huno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//Czego ode mnie chcesz?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Szukam osoby, kt�ra zleci�a zab�jstwo...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//I przyszed�e� z tym do mnie?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//My�la�em, �e mo�esz co� wiedzie� na ten temat.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Ale nie wiem!
};


var int huno_nochmal;
var int huno_somethings_perm;
var int huno_counter;

func void b_addon_huno_stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//A teraz s�uchaj! Zabieraj st�d sw�j ty�ek, zanim przestan� nad sob� panowa�!
	HUNO_ANGEPISST = TRUE;
};


instance DIA_ADDON_HUNO_SOMETHINGS(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_somethings_condition;
	information = dia_addon_huno_somethings_info;
	permanent = TRUE;
	description = "S�ysza�em troch� ciekawych rzeczy na tw�j temat...";
};


func int dia_addon_huno_somethings_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_attentat) && (HUNO_SOMETHINGS_PERM == FALSE) && ((FINN_TELLALL == TRUE) || (PAUL_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_huno_somethings_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//S�ysza�em troch� ciekawych rzeczy na tw�j temat...
	if(HUNO_NOCHMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//H�?
		HUNO_NOCHMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Znowu zaczynasz? Mam nadziej�, �e tym razem to co� wa�nego...
	};
	HUNO_COUNTER = 0;
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Podobno w momencie zamachu nie by�o ci� na stanowisku!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//Tak?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(PAUL_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul powiedzia�, �e nienawidzisz Estebana.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//Czy�by? Co� jeszcze?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(EMILIO_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio zdradzi� twoje imi�! Na pewno wiesz co� na temat pr�by zab�jstwa!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//A wi�c porozmawia�e� sobie ze starym Emiliem, co?
		if(HUNO_COUNTER > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//Nie tylko on ciebie podejrzewa.
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//Jak to?
			HUNO_SOMETHINGS_PERM = TRUE;
			Info_ClearChoices(dia_addon_huno_somethings);
			Info_AddChoice(dia_addon_huno_somethings,"Chc� si� dogada� ze zleceniodawc� zab�jstwa!",dia_addon_huno_somethings_contra);
			Info_AddChoice(dia_addon_huno_somethings,"Je�li stoisz za t� pr�b� zab�jstwa, to zap�acisz za to!",dia_addon_huno_somethings_pro);
			b_logentry(TOPIC_ADDON_ESTEBAN,"Wygl�da na to, �e trzymam Huna w szachu.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//Mo�e te� powinienem z nim porozmawia�. Jestem pewien, �e to pomo�e mu zmieni� zdanie!
			b_addon_huno_stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nic wi�cej...
		b_addon_huno_stress();
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_huno_somethings_pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Je�li stoisz za t� pr�b� zab�jstwa, to zap�acisz za to!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//Jeste� idiot�! Naprawd� zamierzasz podlizywa� si� Estebanowi?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//Spadaj st�d!
	HUNO_MEGA_ANGEPISST = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Chc� si� dogada� ze zleceniodawc� zab�jstwa!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//Wyst�pisz przeciwko Estebanowi? Naprawd�? Wi�c to udowodnij!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//Zbyt d�ugo ju� czekam na dostaw� stali od pirat�w.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Domy�lam si�, �e przej�� j� Esteban. Chce sprzeda� mi stal po wy�szej cenie.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Oczywi�cie sam nie brudzi sobie tym r�k. Ma na us�ugach paru bandyt�w z bagna.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Sk�d o tym wiesz?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Pijani bandyci du�o m�wi�...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Ten gadatliwy bandyta ma jakie� imi�?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//Nie powinno ci� to obchodzi�. Ale go��, kt�rego SZUKASZ, nazywa si� Juan. Jednak od dawna nie widzia�em go w obozie.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//B�dziesz musia� poszuka� go na bagnie.
	MIS_HUNO_STAHL = LOG_RUNNING;
	HUNO_ANGEPISST = FALSE;
	Log_CreateTopic(TOPIC_ADDON_HUNO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HUNO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HUNO,"Huno czeka na dostaw� stali od pirat�w. S�dzi, �e na rozkaz Estebana przechwyci� j� niejaki Juan, kt�ry ukrywa si� gdzie� na bagnie.");
	Info_ClearChoices(dia_addon_huno_somethings);
	Info_AddChoice(dia_addon_huno_somethings,"Najpierw powiesz mi, kto zleci� zab�jstwo!",dia_addon_huno_somethings_tellmenow);
	Info_AddChoice(dia_addon_huno_somethings,"W porz�dku, zrobi� to dla ciebie!",dia_addon_huno_somethings_mission);
};

func void dia_addon_huno_somethings_mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//W porz�dku, zrobi� to dla ciebie!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Dobrze. Zobaczymy, czy mog� ci zaufa�.
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_tellmenow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Najpierw powiesz mi, kto zleci� zab�jstwo!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Nie. Nie ufam ci.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//Uwa�aj. Nast�pn� rozmow� odb�d� albo z nim, albo z Estebanem.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//To zale�y od ciebie.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//W takim razie dobrze! Zaaran�uj� twoje spotkanie ze zleceniodawc�. Ale na moich zasadach, zrozumiano?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Id� do knajpy i porozmawiaj z ober�yst�. On powie ci, co robi� dalej.
	HUNO_ZUSNAF = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno powiedzia� mi, �ebym zamieni� s��wko ze Snafem.");
};


instance DIA_ADDON_HUNO_PAKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_paket_condition;
	information = dia_addon_huno_paket_info;
	permanent = FALSE;
	description = "Mam stal.";
};


func int dia_addon_huno_paket_condition()
{
	if((MIS_HUNO_STAHL == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_steel_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_huno_paket_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//Mam stal.
	b_giveinvitems(other,self,itmi_addon_steel_paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//I co? Juan te� tam by�?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Tak.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//Wiedzia�em! Za wszystkim sta� ten szczur, Esteban.
	if(HUNO_ZUSNAF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//Jeste� w porz�dku. Je�li mam by� szczery, nie spodziewa�em si� tego.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Prosz�, oto twoja nagroda.
		b_giveinvitems(self,other,itmi_gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//Co b�dzie teraz z nasz� umow�?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Cz�owiek, kt�rego szukasz, czeka na ciebie w knajpie. Porozmawiaj z ober�yst�.
		HUNO_ZUSNAF = TRUE;
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno powiedzia� mi, �ebym zamieni� s��wko ze Snafem.");
	MIS_HUNO_STAHL = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HUNOSTAHL);
};


instance DIA_ADDON_HUNO_TRADE(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 888;
	condition = dia_addon_huno_trade_condition;
	information = dia_addon_huno_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_huno_trade_condition()
{
	if(HUNO_ANGEPISST == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_huno_trade_info()
{
	b_say(other,self,"$TRADE_3");
	b_givetradeinv(self);
};


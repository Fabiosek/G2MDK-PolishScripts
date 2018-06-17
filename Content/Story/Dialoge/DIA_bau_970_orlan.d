
instance DIA_ORLAN_EXIT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 999;
	condition = dia_orlan_exit_condition;
	information = dia_orlan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orlan_exit_condition()
{
	return TRUE;
};

func void dia_orlan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORLAN_WEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_wein_condition;
	information = dia_orlan_wein_info;
	permanent = FALSE;
	description = "Przynosz� wino z klasztoru.";
};


func int dia_orlan_wein_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) >= 12))
	{
		return TRUE;
	};
};

func void dia_orlan_wein_info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Przynosz� wino z klasztoru.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Doskonale, w�a�nie na nie czeka�em.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Ustali�em ju� cen� z Mistrzem Goraxem. Zap�ac� ci od r�ki 100 sztuk z�ota.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"W porz�dku, daj to z�oto.",dia_orlan_wein_ja);
	Info_AddChoice(dia_orlan_wein,"My�lisz, �e trafi�e� na idiot�?",dia_orlan_wein_nein);
};

func void dia_orlan_wein_ja()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//W porz�dku, daj to z�oto.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Oto ono. Interesy z tob� to prawdziwa przyjemno��.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_nein()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//My�lisz, �e trafi�e� na idiot�? Cena wynosi 240 sztuk z�ota.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Widz�, �e Gorax ostrzeg� ci� przede mn�, co? Dobra, pos�uchaj, mo�e ubiliby�my ma�y interesik. Zap�ac� ci 100 sztuk z�ota za wino.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Ty powiesz Goraxowi, �e ci� oszuka�em, a ja dam ci CZTERY magiczne zwoje.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Hej, po prostu dawaj 240 sztuk z�ota!",dia_orlan_wein_nie);
	Info_AddChoice(dia_orlan_wein,"Brzmi nie�le. Daj mi te magiczne zwoje.",dia_orlan_wein_okay);
	Info_AddChoice(dia_orlan_wein,"Co to za zwoje?",dia_orlan_wein_was);
};

func void dia_orlan_wein_nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hej, po prostu dawaj 240 sztuk z�ota!
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//Nie interesuje ci� wsp�praca, h�? Niech b�dzie, oto twoje z�oto.
	b_giveinvitems(self,other,itmi_gold,240);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ITEMSERHALTEN);
	PrintScreen(text,-1,-1,FONT_SCREENSMALL,2);
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Brzmi nie�le. Daj mi te magiczne zwoje.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Oto zwoje i z�oto.
	b_giveinvitems(other,self,itfo_wine,12);
	CreateInvItems(hero,itsc_light,2);
	CreateInvItems(hero,itsc_lightheal,1);
	CreateInvItems(hero,itsc_sumgobskel,1);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//Co to za zwoje?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Nie mam poj�cia. Jeden z go�ci po prostu... po prostu je tutaj zostawi�, taak.
};


instance DIA_ORLAN_WERBISTDU(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_orlan_werbistdu_condition;
	information = dia_orlan_werbistdu_info;
	description = "Kim jeste�?";
};


func int dia_orlan_werbistdu_condition()
{
	return TRUE;
};

func void dia_orlan_werbistdu_info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Mam na imi� Orlan, jestem w�a�cicielem tej mi�ej gospody.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Czego ci potrzeba, w�drowcze? Szukasz mo�e miecza albo przyzwoitej zbroi?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Jakiej� odmiany po rozmowach z tymi wiejskimi sztywniakami, a mo�e po prostu informacji?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Je�li si�gniesz po sakiewk�, dam ci to, a mo�e i wi�cej.
};


instance DIA_ADDON_ORLAN_GREG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_greg_condition;
	information = dia_addon_orlan_greg_info;
	description = "Znasz go�cia z zas�oni�tym okiem?";
};


func int dia_addon_orlan_greg_condition()
{
	if((SC_SAWGREGINTAVERNE == TRUE) && (KAPITEL <= 3) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Znasz go�cia z zas�oni�tym okiem?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//Widzia�em go ju� kiedy�. Twardziel.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Wynajmowa� kiedy� u mnie pok�j przez jaki� czas. Mia� ze sob� olbrzymi kufer...
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//Gdybym go ci�gle nie m�czy�, pewnie w og�le by mi za ten pok�j nie p�aci�. I tak specjalnie si� z tym nie spieszy�.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//A pewnego dnia nagle znikn�� razem ze swoim kufrem. Nie chc� mie� nic wsp�lnego z takimi jak on.
};


instance DIA_ADDON_ORLAN_RANGER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_ranger_condition;
	information = dia_addon_orlan_ranger_info;
	description = "Hmm... Odnosz� wra�enie, �e gapisz si� na m�j pier�cie�.";
};


func int dia_addon_orlan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (SCISWEARINGRANGERRING == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//Hmm... Odnosz� wra�enie, �e gapisz si� na m�j pier�cie�.
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Nie wiem do ko�ca, co o nim s�dzi�.
	ORLAN_KNOWSSCASRANGER = TRUE;
	Info_ClearChoices(dia_addon_orlan_ranger);
	Info_AddChoice(dia_addon_orlan_ranger,"Stary! Ale jazda! Nale�� do Wodnego Kr�gu!",dia_addon_orlan_ranger_idiot);
	Info_AddChoice(dia_addon_orlan_ranger,"To akwamaryn. Znasz ten kamie�?",dia_addon_orlan_ranger_aqua);
};

func void dia_addon_orlan_ranger_aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//To akwamaryn. Znasz ten kamie�?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Owszem. Witaj w kwaterze g��wnej, bracie pier�cienia.
	if(Npc_KnowsInfo(other,dia_addon_orlan_nomeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//...cho� inteligencj�, jak si� wydaje, nie grzeszysz.
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Czym mog� s�u�y�?
	Info_ClearChoices(dia_addon_orlan_ranger);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_orlan_ranger_idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//Stary! Ale jazda! Nale�� do Wodnego Kr�gu!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Rozumiem. Taaaak... Ale sobie znale�li os�a...
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Czego chcesz?
	Info_ClearChoices(dia_addon_orlan_ranger);
};


instance DIA_ADDON_ORLAN_TELEPORTSTEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_teleportstein_condition;
	information = dia_addon_orlan_teleportstein_info;
	description = "Zdarzy�o ci si� kiedy� korzysta� z kamienia teleportacyjnego?";
};


func int dia_addon_orlan_teleportstein_condition()
{
	if((ORLAN_KNOWSSCASRANGER == TRUE) && (SCUSED_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_teleportstein_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//Zdarzy�o ci si� kiedy� korzysta� z kamienia teleportacyjnego?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//A tobie zamieni� z kretynem na m�zgi?! Dop�ki Mag Wody nie powie, �e to ustrojstwo jest niegro�ne, nawet si� do niego nie zbli��!
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Przydzielono mnie do pilnowania jednego z takich kamieni - to mi w zupe�no�ci wystarczy.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_orlan_teleportstein);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Mo�na rzuci� okiem na ten kamie� teleportacyjny?",dia_addon_orlan_teleportstein_sehen);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Gdzie znajd� kamie� teleportacyjny?",dia_addon_orlan_teleportstein_wo);
};

func void dia_addon_orlan_teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//Mo�na rzuci� okiem na ten kamie� teleportacyjny?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Jasne, a co mi tam... Masz, oto klucz. Wej�cie zabarykadowa�em.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	b_giveinvitems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Orlan ukry� kamie� teleportacyjny w jaskini, na po�udniowy zach�d od swojej gospody.");
};

func void dia_addon_orlan_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Gdzie znajd� kamie� teleportacyjny?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Niedaleko na po�udnie od mojej gospody znajduje si� jaskinia, w kt�rej Magowie Wody odnale�li taki kamie�.
};


instance DIA_ADDON_ORLAN_NOMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_nomeeting_condition;
	information = dia_addon_orlan_nomeeting_info;
	description = "Mam tu wst�pi� do Wodnego Kr�gu!";
};


func int dia_addon_orlan_nomeeting_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && !Npc_KnowsInfo(other,dia_addon_orlan_ranger) && (SCISWEARINGRANGERRING == FALSE) && (MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_nomeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//Mam tu wst�pi� do Wodnego Kr�gu!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//Nie widz� u ciebie �adnego pier�cienia. Napijesz si� czego�?
};


instance DIA_ADDON_ORLAN_WHENRANGERMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_whenrangermeeting_condition;
	information = dia_addon_orlan_whenrangermeeting_info;
	description = "Chodz� s�uchy o spotkaniu Kr�gu w twojej gospodzie.";
};


func int dia_addon_orlan_whenrangermeeting_condition()
{
	if((MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_orlan_ranger))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_whenrangermeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Chodz� s�uchy o spotkaniu Kr�gu w twojej gospodzie.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//Zgadza si�... Powinno si� ju� by�o zacz��.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Ciekawi mnie, co ich wstrzymuje.
	b_giveplayerxp(XP_AMBIENT);
	b_addon_orlan_rangersreadyforcoming();
	self.flags = 0;
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"Z pewno�ci� wkr�tce si� pojawi�.",dia_addon_orlan_whenrangermeeting_theycome);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"Spotkanie zaplanowano na dzi�?",dia_addon_orlan_whenrangermeeting_today);
};

func void dia_addon_orlan_whenrangermeeting_today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Spotkanie zaplanowano na dzi�?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//O ile dobrze pami�tam...
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Mam nadziej�, �e nie przeci�gnie si� jak zwykle.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(DALEJ)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_theycome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Z pewno�ci� wkr�tce si� pojawi�.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Zobaczymy...
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(DALEJ)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_los()
{
	AI_StopProcessInfos(self);
	b_addon_orlan_comingranger();
};


instance DIA_ORLAN_RUESTUNG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_orlan_ruestung_condition;
	information = dia_orlan_ruestung_info;
	permanent = TRUE;
	description = "Jakie zbroje mo�esz mi zaoferowa�?";
};


var int dia_orlan_ruestung_noperm;

func int dia_orlan_ruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (DIA_ORLAN_RUESTUNG_NOPERM == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_orlan_ruestung_info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Jakie zbroje mo�esz mi zaoferowa�?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//Mam tu jedn�, kt�ra na pewno ci si� spodoba.
	Info_ClearChoices(dia_orlan_ruestung);
	Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
	Info_AddChoice(dia_orlan_ruestung,"Sk�rzany pancerz. Ochrona: bro� 25, strza�y 20, ogie� 5. (250 sztuk z�ota)",dia_orlan_ruestung_buy);
};

func void dia_orlan_ruestung_buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Kupi� ten sk�rzany pancerz.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_ITAR_LEATHER_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//M�dra decyzja.
		CreateInvItems(self,itar_leather_l,1);
		b_giveinvitems(self,other,itar_leather_l,1);
		AI_EquipBestArmor(other);
		DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Przykro mi. Dop�ki nie masz czym zap�aci�, z interesu nici.
	};
	Info_ClearChoices(dia_orlan_ruestung);
};

func void dia_orlan_ruestung_back()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Pomy�l� o tym.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Jak chcesz. Ale nie zastanawiaj si� zbyt d�ugo.
	Info_ClearChoices(dia_orlan_ruestung);
};


instance DIA_ORLAN_TRADE(C_INFO)
{
	npc = bau_970_orlan;
	nr = 70;
	condition = dia_orlan_trade_condition;
	information = dia_orlan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_orlan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_trade_info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Poka� mi swoje towary.
	b_givetradeinv(self);
	if((SC_ISRANGER == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Oczywi�cie, bracie pier�cienia.
		ORLAN_KNOWSSCASRANGER = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Oczywi�cie. To dla mnie zaszczyt, go�ci� tu kogo� takiego.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Oczywi�cie, Panie.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Je�li mo�esz zap�aci�.
	};
};


instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 6;
	condition = dia_orlan_hotelzimmer_condition;
	information = dia_orlan_hotelzimmer_info;
	permanent = TRUE;
	description = "Ile bierzesz za pok�j?";
};


var int orlan_scgothotelzimmer;
var int orlan_scgothotelzimmerday;

func int dia_orlan_hotelzimmer_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (ORLAN_SCGOTHOTELZIMMER == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_hotelzimmer_info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Ile bierzesz za pok�j?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
	{
		if((SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Dla brata pier�cienia? Zupe�nie nic.
			ORLAN_RANGERHELPZIMMER = TRUE;
			ORLAN_KNOWSSCASRANGER = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Dla rycerzy Kr�la zawsze znajdzie si� jaki� pok�j, oczywi�cie za darmo.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Nie �mia�bym wzi�� op�aty za pok�j od ziemskiego przedstawiciela Innosa.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Oto klucz od pokoi na pi�trze. Wybierz, kt�ry zechcesz.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMER = TRUE;
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Je�li zap�acisz 50 sztuk z�ota, b�dziesz m�g� mieszka� w wybranym pokoju przez nast�pny tydzie�.
		Info_ClearChoices(dia_orlan_hotelzimmer);
		Info_AddChoice(dia_orlan_hotelzimmer,"Drogie to jak cholera...",dia_orlan_hotelzimmer_nein);
		Info_AddChoice(dia_orlan_hotelzimmer,"W porz�dku, oto pieni�dze.",dia_orlan_hotelzimmer_ja);
	};
};

func void dia_orlan_hotelzimmer_ja()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//W porz�dku, oto pieni�dze.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Oto klucz. Pokoje s� na pi�trze, tylko pami�taj - staraj si� wszystkiego nie zapaskudzi� i p�a� regularnie czynsz.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		ORLAN_SCGOTHOTELZIMMER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//Nie masz 50 sztuk z�ota. Najpierw pieni�dze, potem przyjemno��.
	};
	Info_ClearChoices(dia_orlan_hotelzimmer);
};

func void dia_orlan_hotelzimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Cholernie drogo.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//W takim razie, przyjacielu, poszukaj gdzie indziej.
	Info_ClearChoices(dia_orlan_hotelzimmer);
};


var int orlan_angriffwegenmiete;

instance DIA_ORLAN_MIETEFAELLIG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 10;
	condition = dia_orlan_mietefaellig_condition;
	information = dia_orlan_mietefaellig_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_orlan_mietefaellig_nomore;

func int dia_orlan_mietefaellig_condition()
{
	if((SC_ISRANGER == TRUE) || (ORLAN_RANGERHELPZIMMER == TRUE))
	{
		return FALSE;
	};
	if((ORLAN_ANGRIFFWEGENMIETE == TRUE) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
			ORLAN_ANGRIFFWEGENMIETE = FALSE;
			return FALSE;
		};
	};
	if((ORLAN_SCGOTHOTELZIMMER == TRUE) && (ORLAN_SCGOTHOTELZIMMERDAY <= (Wld_GetDay() - 7)) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_mietefaellig_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//Twa wizyta bardzo mnie raduje, prosz�, zosta�, jak d�ugo zechcesz.
		DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Kiedy w ko�cu dostan� m�j czynsz?
		Info_ClearChoices(dia_orlan_mietefaellig);
		Info_AddChoice(dia_orlan_mietefaellig,"Daruj sobie. Nie dostaniesz nic wi�cej.",dia_orlan_mietefaellig_nein);
		Info_AddChoice(dia_orlan_mietefaellig,"Oto twoje 50 sztuk z�ota.",dia_orlan_mietefaellig_ja);
	};
};


var int dia_orlan_mietefaellig_onetime;

func void dia_orlan_mietefaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Oto twoje 50 sztuk z�ota.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Ach... Czas najwy�szy.
		if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Gdzie� ty si� podziewasz ca�ymi dniami?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Nie chcesz wiedzie�.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. C�, to nie moja sprawa.
			DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
		};
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		Info_ClearChoices(dia_orlan_mietefaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//S�uchaj no, pr�bujesz zrobi� ze mnie idiot�? Nie sta� ci� nawet, �eby zap�aci� za jedzenie. Ju� ja ci poka�� ty, ty...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_orlan_mietefaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Daruj sobie. Ju� nic wi�cej nie dostaniesz.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Ju� ja ci� naucz�, ty �a�osny oszu�cie.
	ORLAN_ANGRIFFWEGENMIETE = TRUE;
	Info_ClearChoices(dia_orlan_mietefaellig);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ORLAN_WETTKAMPFLAEUFT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 7;
	condition = dia_orlan_wettkampflaeuft_condition;
	information = dia_orlan_wettkampflaeuft_info;
	important = TRUE;
};


func int dia_orlan_wettkampflaeuft_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF_DAY <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void dia_orlan_wettkampflaeuft_info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//No, jeste� nareszcie. Czeka�em na ciebie.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Konkurs picia w�a�nie si� zako�czy�.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Kto wygra�?
	if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//Tym razem zwyci�y� Randolph. Rukhar chyba mia� z�y dzie�.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Rukhar po raz kolejny nie da� Randolphowi szans. Mo�na si� by�o tego spodziewa�.
		RUKHAR_WON_WETTKAMPF = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Mam nadziej�, �e to ju� ostatni raz. Nie chc� tu wi�cej takich podejrzanych zabaw.
	};
	b_giveplayerxp(XP_RUKHAR_WETTKAMPFVORBEI);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(randolph,"Start");
	if(Hlp_IsValidNpc(rukhar))
	{
		if(RUKHAR_WON_WETTKAMPF == TRUE)
		{
			b_startotherroutine(rukhar,"WettkampfRukharWon");
		}
		else
		{
			b_startotherroutine(rukhar,"WettkampfRukharLost");
		};
	};
	MIS_RUKHAR_WETTKAMPF = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_EINGEBROCKT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 8;
	condition = dia_orlan_eingebrockt_condition;
	information = dia_orlan_eingebrockt_info;
	important = TRUE;
};


func int dia_orlan_eingebrockt_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_orlan_eingebrockt_info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Nie�le� mnie urz�dzi�. B�d� musia� dalej uwa�a� na Rukhara.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Jak to?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Lepiej, �eby nikt si� nie dowiedzia� o jego ma�ym konkursie. To �le wp�ywa na interesy.
};


instance DIA_ORLAN_PERM(C_INFO)
{
	npc = bau_970_orlan;
	nr = 99;
	condition = dia_orlan_perm_condition;
	information = dia_orlan_perm_info;
	permanent = TRUE;
	description = "Jak id� interesy?";
};


func int dia_orlan_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_perm_info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Jak id� interesy?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Wiesz, bywa�o lepiej.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Ludzie niezbyt ochoczo wydaj� teraz pieni�dze.
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Mam nadziej�, �e czarni magowie wkr�tce si� st�d wynios�, inaczej b�d� musia� zamkn�� gospod�.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Ludzie boj� si� tu przychodzi�.
	};
};


instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_minenanteil_condition;
	information = dia_orlan_minenanteil_info;
	description = "Sprzedajesz udzia�y w kopalni?";
};


func int dia_orlan_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_minenanteil_info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Sprzedajesz udzia�y w kopalni?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Jasne. U mnie dostaniesz wszystko, czego dusza zapragnie.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_PICKPOCKET(C_INFO)
{
	npc = bau_970_orlan;
	nr = 900;
	condition = dia_orlan_pickpocket_condition;
	information = dia_orlan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_orlan_pickpocket_condition()
{
	return c_beklauen(89,260);
};

func void dia_orlan_pickpocket_info()
{
	Info_ClearChoices(dia_orlan_pickpocket);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_BACK,dia_orlan_pickpocket_back);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_PICKPOCKET,dia_orlan_pickpocket_doit);
};

func void dia_orlan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_orlan_pickpocket);
};

func void dia_orlan_pickpocket_back()
{
	Info_ClearChoices(dia_orlan_pickpocket);
};


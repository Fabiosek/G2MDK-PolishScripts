
instance DIA_HANNA_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_exit_condition;
	information = dia_hanna_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_hanna_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_HELLO(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_hello_condition;
	information = dia_hanna_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_hello_condition()
{
	return TRUE;
};

func void dia_hanna_hello_info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Ach, klient - co mog� dla ciebie zrobi�?
};


instance DIA_HANNA_ROOM(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 2;
	condition = dia_hanna_room_condition;
	information = dia_hanna_room_info;
	permanent = FALSE;
	description = "Szukam pokoju.";
};


func int dia_hanna_room_condition()
{
	return TRUE;
};

func void dia_hanna_room_info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Szukam pokoju.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//A wi�c trafi�e� we w�a�ciwe miejsce.
	if(Npc_KnowsInfo(other,dia_lothar_schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Jeden z paladyn�w powiedzia� mi, �e mog� tu sp�dzi� noc za darmo...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Ile kosztuje nocleg?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Absolutnie nic.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Paladyni op�acaj� noclegi dla wszystkich przyjezdnych.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//A wi�c mog� tutaj nocowa� za darmo?
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Tak.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Id� na g�r�.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Wci�� jeszcze mamy tu kilka wolnych ��ek.
};


instance DIA_HANNA_WHYPAY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 3;
	condition = dia_hanna_whypay_condition;
	information = dia_hanna_whypay_info;
	permanent = FALSE;
	description = "Czemu paladyni op�acaj� noclegi?";
};


func int dia_hanna_whypay_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_whypay_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//Czemu paladyni op�acaj� noclegi?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Ja te� tego nie rozumiem.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//Mo�e chodzi im o to, �eby oczy�ci� ulice z biedoty, kt�ra, jak wiadomo, pope�nia wiele przest�pstw.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//Poza tym, pewnie chc� si� przypodoba� w�drownym kupcom.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Odk�d ch�opi zacz�li si� buntowa�, to oni s� naszym jedynym �r�d�em zaopatrzenia.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//A poza tym, chyba chc� za�agodzi� panuj�ce w mie�cie nastroje.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Lord Andre zorganizowa� nawet darmowe piwo. Rozdaje je na placu wisielc�w.
};


instance DIA_HANNA_WERHIER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 4;
	condition = dia_hanna_werhier_condition;
	information = dia_hanna_werhier_info;
	permanent = TRUE;
	description = "Kto tu teraz mieszka?";
};


func int dia_hanna_werhier_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_werhier_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Kto tu teraz mieszka?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//Praktycznie wszyscy moi klienci to w�drowni handlarze.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Aha.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//Tylko nie pr�buj ich okrada�! Nie chc� tutaj �adnych problem�w!
};


instance DIA_HANNA_CITY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 5;
	condition = dia_hanna_city_condition;
	information = dia_hanna_city_info;
	permanent = TRUE;
	description = "Mam par� pyta� dotycz�cych miasta...";
};


func int dia_hanna_city_condition()
{
	return TRUE;
};

func void dia_hanna_city_info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//Mam par� pyta� dotycz�cych miasta...
	Info_ClearChoices(dia_hanna_city);
	Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
	Info_AddChoice(dia_hanna_city,"Gdzie mog� tu co� kupi�?",dia_hanna_city_buy);
	Info_AddChoice(dia_hanna_city,"Opowiedz mi o mie�cie.",dia_hanna_city_city);
};

func void dia_hanna_city_back()
{
	Info_ClearChoices(dia_hanna_city);
};

func void dia_hanna_city_buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Gdzie mog� tu co� kupi�?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//Targ znajduje si� dok�adnie naprzeciwko drzwi frontowych. Znajdziesz tam wszelkie mo�liwe towary.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Po drugiej stronie miasta jest jeszcze kilka sklep�w i zak�ad�w rzemie�lniczych. Wi�kszo�� z nich znajduje si� przy bramie.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//Ryby mo�esz kupi� w dzielnicy portowej. Sklep rybny znajdziesz tam bez trudu.
};

func void dia_hanna_city_city()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Opowiedz mi o mie�cie.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Khorinis to jedno z najbogatszych miast w kr�lestwie, cho� mo�e w tym momencie trudno w to uwierzy�.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Odk�d zacz�a si� wojna z orkami, handel przesta� przynosi� zyski. Kr�l za��da�, �eby wszystkie statki handlowe zosta�y skonfiskowane na u�ytek armii.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//Wi�c rzadko przyp�ywaj� tutaj jakiekolwiek jednostki, co z kolei oznacza marne zaopatrzenie. Wielu mieszka�c�w martwi taki stan rzeczy.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Nikt nie mo�e przewidzie�, co przyniesie przysz�o��. Mo�emy tylko z pokor� czeka� na to, co ma nast�pi�. Chyba nie mamy �adnego wp�ywu na przysz�e wydarzenia.
};


instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_kap3_exit_condition;
	information = dia_hanna_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hanna_priceforletter;

instance DIA_HANNA_ANYNEWS(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_anynews_condition;
	information = dia_hanna_anynews_info;
	permanent = FALSE;
	description = "Co s�ycha�?";
};


func int dia_hanna_anynews_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_anynews_info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Jak ci idzie?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Nie wygl�dasz na osob�, kt�ra przejmuje si� cudzymi zmartwieniami.
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Jasne, oczywi�cie.",dia_hanna_anynews_yes);
	Info_AddChoice(dia_hanna_anynews,"To zale�y.",dia_hanna_anynews_depends);
	Info_AddChoice(dia_hanna_anynews,"Nie.",dia_hanna_anynews_no);
};

func void dia_hanna_anynews_no()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Niezupe�nie.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//No widzisz, o tym w�a�nie m�wi�. Ka�dy teraz my�li tylko o sobie. Czego chcesz?
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//To zale�y.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//To zale�y, ile mo�na na tym zarobi�, to chcesz powiedzie�.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Nie znosz� takich jak ty.
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Tak, pewnie. Nie ma problemu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Wiesz, �ycie jest pe�ne niespodzianek. Ostatnio robi�am porz�dek w moich rzeczach i znalaz�am par� starych map, kt�re sprzeda�am kartografowi Brahimowi z portu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Niestety, nied�ugo potem zauwa�y�am, �e brakuje mi pewnego dokumentu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Przypuszczam, �e jakim� cudem dosta� si� pomi�dzy mapy.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Czy m�g�by� go dla mnie odzyska�?
	MIS_HANNARETRIEVELETTER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
	b_logentry(TOPIC_HANNARETRIEVELETTER,"Hanna zgubi�a pewien dokument. Najprawdopodobniej znajduje si� on w dzielnicy portowej, gdzie mie�ci si� siedziba kartografa Brahima.");
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Nie jestem ch�opcem na posy�ki.",dia_hanna_anynews_yes_footboy);
	Info_AddChoice(dia_hanna_anynews,"A co JA b�d� z tego mia�?",dia_hanna_anynews_yes_reward);
	Info_AddChoice(dia_hanna_anynews,"Zobacz�, co da si� zrobi�.",dia_hanna_anynews_yes_willsee);
};

func void dia_hanna_anynews_yes_footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Nie jestem ch�opcem na posy�ki.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Rozumiem - problemy prostej kobiety nic dla ciebie nie znacz�. Widz�, �e sama b�d� musia�a si� tym zaj��.
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//A co z tego b�d� mia�?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Aha, wiedzia�am. Niczym si� nie r�nisz od tej ho�oty mieszkaj�cej w porcie.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Wi�c czego chcesz ode mnie, biednej kobiety?
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Niewa�ne.",dia_hanna_anynews_yes_reward_ok);
	Info_AddChoice(dia_hanna_anynews,"Mog�aby� by� dla mnie nieco milsza...",dia_hanna_anynews_yes_reward_benice);
	Info_AddChoice(dia_hanna_anynews,"Z�ota.",dia_hanna_anynews_yes_reward_gold);
};

func void dia_hanna_anynews_yes_reward_ok()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//Niewa�ne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Widz�, �e jednak pozosta�a ci krztyna przyzwoito�ci. Je�li odzyskasz ten dokument, dostaniesz ode mnie 75 sztuk z�ota.
	HANNA_PRICEFORLETTER = 75;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward_benice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Mog�aby� by� dla mnie nieco milsza...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//To oburzaj�ce. Wy...wyno� si� st�d! Ty wieprzu!
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void dia_hanna_anynews_yes_reward_gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Z�ota.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Mog� ci za to da� 50 sztuk z�ota, nie wi�cej.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Je�li zdo�asz odzyska� dokument, dostaniesz ode mnie 50 sztuk z�ota.
	HANNA_PRICEFORLETTER = 50;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_willsee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Zobacz�, co da si� zrobi�.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//Jeste� taki s�odki. Powodzenia!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Je�li przyniesiesz mi ten dokument, dostaniesz ode mnie nagrod�.
	HANNA_PRICEFORLETTER = 200;
	Info_ClearChoices(dia_hanna_anynews);
};


instance DIA_HANNA_THISLETTER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_thisletter_condition;
	information = dia_hanna_thisletter_info;
	permanent = FALSE;
	description = "Czy chodzi�o o ten dokument?";
};


func int dia_hanna_thisletter_condition()
{
	if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_thisletter_info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Czy chodzi�o o ten dokument?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Tak, w�a�nie o ten. Dzi�kuj� ci.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//Gdzie moja nagroda?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Nie tak szybko. Oto twoje pieni�dze.
	CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
	MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
	b_giveplayerxp(XP_HANNARETRIEVELETTER);
};


instance DIA_HANNA_PICKPOCKET(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 900;
	condition = dia_hanna_pickpocket_condition;
	information = dia_hanna_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_hanna_pickpocket_condition()
{
	return c_beklauen(45,25);
};

func void dia_hanna_pickpocket_info()
{
	Info_ClearChoices(dia_hanna_pickpocket);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};

func void dia_hanna_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hanna_pickpocket);
};

func void dia_hanna_pickpocket_back()
{
	Info_ClearChoices(dia_hanna_pickpocket);
};


instance DIA_HANNA_AUSKELLER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 11;
	condition = dia_hanna_auskeller_condition;
	information = dia_hanna_auskeller_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_auskeller_condition()
{
	if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_auskeller_info()
{
	if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Sk�d... wracasz?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//Znalaz�em ciekaw� rzecz w twojej piwnicy...
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//Co robi�e� w mojej piwnicy?!
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//Dobrze wiesz!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//Nie mam poj�cia, o czym m�wisz...
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//Sp�jrz tylko na siebie! Gdzie by�e�? Hm?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//Ja...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//Ju� wiem!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//Nie musisz nic m�wi�. Domy�li�am si� wszystkiego.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//Nawet nie my�l o tym, �eby co� st�d ukra��, jasne?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//Nie mo�emy sobie pozwoli� na �aden skandal.
	};
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_schuldenbuch_condition;
	information = dia_hanna_schuldenbuch_info;
	permanent = FALSE;
	description = "Zobacz, jak� ksi��k� znalaz�em!";
};


func int dia_hanna_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Zobacz, jak� ksi��k� znalaz�em!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//To ksi�ga rachunkowa Lehmara. Sk�d j� masz?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//No...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//To dobrze, �e Lehmar ju� jej nie ma. Jednak czu�abym si� lepiej, gdybym mog�a j� zatrzyma�.
};


instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_giveschuldenbuch_condition;
	information = dia_hanna_giveschuldenbuch_info;
	permanent = FALSE;
	description = "Prosz� - we� t� ksi�g�.";
};


func int dia_hanna_giveschuldenbuch_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_giveschuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Prosz� - we� t� ksi�g�.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Dzi�kuj�.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Przyjmij to w nagrod�.
	b_giveinvitems(self,other,itse_hannasbeutel,1);
	b_giveplayerxp(XP_SCHULDENBUCH);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Co to jest?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//To klucz do bram bogactwa.
};

func void hanna_blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//Wszystko w porz�dku w kryj�wce?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//Nie by�am tam ju� od d�u�szego czasu.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//Kiedy tylko nadarzy si� okazja, zejd� na d� i sprawdz�, czy wszystko w porz�dku.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Tak. Ale lepiej o tym tak g�o�no nie m�wi�.
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//Wiedzia�a� o z�odziejskiej kryj�wce?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//Nie mam poj�cia, o czym m�wisz...
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//By�a tutaj stra�... Kto� powiedzia� im o kryj�wce!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Nie mogli mi nic udowodni�, ale Cassia i jej ludzie nie �yj�!
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Jestem pewna, �e to TWOJA sprawka...
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Kupi�am to specjalnie dla ciebie.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//Kosztowa�o mnie to mas� pieni�dzy, ale op�aca�o si�, ty �winio...
};



instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//Dziwne... Wydajesz mi si� znajomy, podr�niku.
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//C�... Niezbadane s� tajniki czasu i przestrzeni... Wybacz mi brak grzeczno�ci, synu cierpliwo�ci - nie zosta�e� nawet jeszcze powitany...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Witaj, przyjacielu. Usi�d� na mym dywanie i zaci�gnij si� dymem z fajki.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "Kim jeste�?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Nazywam si� Abuyin ibn Djadir ibn Omar Kalid ben Hadji al Sharidi. Jestem m�drcem i wr�bit�, astrologiem i znawc� tytoniu.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "Jaki tyto� proponujesz?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Jaki tyto� proponujesz?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Moje fajki nabite s� ostrym, orze�wiaj�cym tytoniem jab�kowym.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Spr�buj, czego tylko zapragniesz, Synu Przygody.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "Czy masz jeszcze jaki� inny tyto�?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//Czy masz jeszcze jaki� inny tyto�?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//U�ywam tylko najlepszego tytoniu. Ta mieszanka o aromacie jab�oni pochodzi z mojej ojczyzny, z Wysp Po�udniowych.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Ale, oczywi�cie, zawsze ch�tnie spr�buj� nowej mieszanki - je�li komu� uda�oby si� przyrz�dzi� naprawd� dobr�.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//Jak to si� robi?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//We� na przyk�ad moje jab�kowe ziele. A potem spr�buj zmiesza� je z innymi sk�adnikami.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Mo�esz to zrobi� na stole alchemicznym, je�li oczywi�cie znasz podstawy alchemii.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "Gdzie mog� kupi� tyto� jab�kowy?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Gdzie mog� kupi� tyto� jab�kowy?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Dam ci dwie porcje. Od twojej m�dro�ci zale�y, jak je wykorzystasz.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Je�li pragniesz wi�cej, udaj si� do Zurisa, Mistrza Mikstur. On robi ten tyto� i go sprzedaje.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Daj mi spr�bowa� twego tytoniu.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Nie, ta mieszanka mi nie odpowiada. Ale mo�e kto� doceni ten... eee... przysmak.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "Mam now� mieszank� tytoniu...";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Mam now� mieszank� tytoniu...
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_KRAUT,dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_PILZ,dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_DOPPEL,dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_HONIG,dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Daj mi spr�bowa�.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//C� za cudowny smak! Nigdy nie pali�em nic r�wnie dobrego!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Jak przygotowa�e� t� mieszank�?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Zmiesza�em tyto� z miodem.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//Dobrze si� sprawi�e�, Ojcze Sztuki Fajkowej. By�bym zachwycony, mog�c nabi� me niegodne fajki tym arcydzie�em.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//A zatem nabij sobie.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Dzi�ki ci, Synu Szczodro�ci. �aden inny tyto� nie mo�e si� z tym r�wna�. Kupi� od ciebie ka�de �dziebe�ko, jakie mi dostarczysz.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "Mam dla ciebie troch� miodowego tytoniu.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Mam dla ciebie troch� miodowego tytoniu.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Interesy z tob� to czysta przyjemno��.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "Mo�e zainteresuje ci� ta paczuszka zi�?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Mo�e zainteresuje ci� ta paczuszka zi�?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Czy to bagienne ziele? Och, zabierz to st�d, Synu Nieopatrzno�ci.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Gdyby z�apa�a mnie z tym stra� miejska, wyl�dowa�bym za kratami - i ty tak�e!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Je�li chcesz to sprzedawa�, to co� ci poradz� - wyjed� szybko z miasta.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Wyrzu� to lepiej za murami miasta. Tutaj sprowadzi to na ciebie tylko mn�stwo k�opot�w.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "Czy mo�esz dla mnie powr�y�?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Czy mo�esz mi powr�y�?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Moje talenty s� na twoje us�ugi za skromn� op�at�, o Ojcze Szczodro�ci.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Ile chcesz?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 25 monet.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Ale pami�taj - przysz�o�� zawsze jest niepewna. Mog� tylko ujrze� przelotnie niekt�re chwile.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz�o�� (zap�a� 25 sztuk z�ota).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Opowiedz mi o przysz�o�ci.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Dobrze, Poszukiwaczu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"Jestem got�w!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 25 sztuk z�ota.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//...Orkowie... pilnuj� wej�cia... stary tunel... G�rnicza Dolina...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//...Ludzie w l�ni�cych zbrojach... Mag... tw�j przyjaciel jest z nimi... czeka na ciebie...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//...Ogie�! Atak... pot�na istota... p�omienie... wielu... zginie...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//C� to? Miasto... Ruiny... Quarhodron w Jarkendarze...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//On... Zwie si�... Quarhodron w Jarkendarze!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//...Przykro mi. Wizja si� sko�czy�a. Nie widz� nic wi�cej.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "Czy mo�esz przygotowa� dla mnie jeszcze jedn� wr�b�?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Czy mo�esz przygotowa� dla mnie jeszcze jedn� wr�b�?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//Och, Synu Tajemniczej Przysz�o�ci, nie w mojej mocy jest uchylenie zas�ony, kt�ra spowija tajemnice czasu.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Dopiero kiedy czas ze�le mi kolejny omen, zn�w b�d� m�g� spojrze� w przysz�o�� dla ciebie.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//To znaczy kiedy?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//Kiedy przysz�o�� stanie si� tera�niejszo�ci� i minie kolejny etep twojej w�dr�wki.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Czy mo�esz mi powr�y�?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Tak, czas min��, wi�c przygotuj� dla ciebie wr�b� w zamian za kilka monet.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Ile?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "Czy mo�esz dla mnie powr�y�?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 100 monet.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz�o�� (zap�a� 100 sztuk z�ota).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Opowiedz mi o przysz�o�ci.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Dobrze, Synu Odwagi. Teraz wejd� w trans. Czy jeste� gotowy?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"Jestem got�w!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 100 sztuk z�ota.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//...Najemnik... on ci� b�dzie potrzebowa�... straszne morderstwo... Oko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//...z�owrodzy sprzymierze�cy... nadchodz�... szukaj� ci�... stra�nik zostanie pokonany...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//...ale tr�jka si� zjednoczy... dopiero wtedy otrzymasz co twoje...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//To wszystko. Nie widz� nic wi�cej.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "Czy mo�esz dla mnie powr�y�?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 250 monet.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz�o�� (zap�a� 250 sztuk z�ota).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Opowiedz mi o przysz�o�ci.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Dobrze, Synu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"Jestem got�w!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 250 sztuk z�ota.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//...wymusisz... swoje w�asne przeznaczenie...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//...przez ogie� i �nieg... przez l�d i p�omienie...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//...Ludzie w obcych zbrojach... bagno... jaszczury... oczekuj� ci�...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//To wszystko. Nie widz� nic wi�cej.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "Czy mo�esz dla mnie powr�y�?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 500 monet.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz�o�� (zap�a� 500 sztuk z�ota).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Opowiedz mi o przysz�o�ci.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Dobrze, Synu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"Jestem got�w!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 500 sztuk z�ota.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//...miejsce wiedzy... obcy kraj... ciemne miejsce daleko st�d...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//...dzielni towarzysze... sam dokonasz wyboru...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//...�wi�tynia... stoi samotnie w kr�lestwie Adanosa... ukryta we mgle...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//To wszystko. Nie widz� nic wi�cej.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "Czy mo�esz dla mnie powr�y�?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//Dla ciebie zaryzykuj� spojrzenie przez czas za marne 1000 monet.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz�o�� (zap�a� 1000 sztuk z�ota).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Opowiedz mi o przysz�o�ci.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Dobrze, Synu Wiedzy. Teraz wejd� w trans. Czy jeste� gotowy?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"Jestem got�w!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz�o�� prosz� ci� o 1000 sztuk z�ota.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//...Ciemno�� przenika ziemie... z�o zatryumfuje...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//...Kr�l przegra wojn� z orkami...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//...ty powr�cisz, ale nie zaznasz spokoju...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//To wszystko. Nie widz� nic wi�cej.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};


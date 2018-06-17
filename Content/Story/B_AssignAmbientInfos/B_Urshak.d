
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//KHROTOK JABARTH!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//St�j! Ciebie zna�! Ty przyjaciel-cz�owiek, z �agodny g�os.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Przyjaciel co zabi� demon KRUSHAK!
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"Odnalaz�em mego starego orkowego przyjaciela, Ur-Shaka.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"Co tu porabiasz?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"Gadaj�cy ork?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Gadaj�cy ork?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Zapomnia� Ur-Shak? Ur-Shak smutny.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Du�o dni wcze�niej Ur-Shak pom�g� zdoby� ULU-MULU, �eby przyjaciel poszed� do wioski. Wtedy orki go nie zabi�.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Przyjaciel by� w �wi�tynia ork�w i pokona� demon. Du�o dni wcze�niej! Nie pami�ta?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//Szkoda, �e okoliczno�ci nie s� bardziej sprzyjaj�ce. O ma�o ci� nie zabi�em. Co tu robisz?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ur-Shak idzie, �eby zobaczy�, co si� sta�o z jego bracia.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "Dlaczego orkowie atakuj� ludzi?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Dlaczego orkowie atakuj� ludzi?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ur-Shak zawsze m�wi�, �e ludzie nie z�e, �e tam te� przyjaciele.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Ale szaman nie s�ucha� Ur-Shak, a bracia ci�gle nie lubi� Ur-Shak.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Ur-Shak nie wie, czemu wielka wojna z ludzie.
	b_logentry(TOPIC_URSHAK,"Wci�� nie przekona� swego ludu do wys�uchania jego racji. Ci�gle jest wygna�cem.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "Sk�d si� was tu tylu wzi�o?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Sk�d si� was tu tylu wzi�o?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Jedne orki id� z g�r, a inne ze statk�w. Wszystkie robi� wielkie ogrodzenie.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "Co si� kryje za palisad� ork�w na wschodzie?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Co si� kryje za palisad� ork�w na wschodzie?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//U ork�w zawsze du�y pali-sada. Tam wojenny ob�z.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Pali-sada dobry na wojn�. Nie wida� ilu orki, a orki bezpieczne.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "Co zamierzasz teraz zrobi�?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Co zamierzasz teraz zrobi�?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ur-Shak poczeka, a� zwiadowcy zaprowadzi� go do Hosh-Pak.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Kim jest ten Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Bardzo du�y szaman. Wielki wp�yw ma na wojownicy. Wielki plan ma dla ork�w.
	b_logentry(TOPIC_URSHAK,"Ur-Shak planuje spotka� si� z orkowym szamanem, Hosh-Pakiem. Chce otrzyma� pozwolenie na ponowne do��czenie do Rady Szaman�w.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"Gdzie znajd� tego Hosh-Paka?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"Wi�c dlaczego sam do niego nie p�jdziesz?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Wi�c dlaczego sam do niego nie p�jdziesz?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ur-Shak pr�bowa� i pr�bowa� oddosta� honor, i by� zn�w w rada szaman�w.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Ale Hosh-Pak nie chcia� s�ucha�. Bez zwiadowc�w orki zabij� Ur-Shak. Ur-Shak musi porozmawia� z Hosh-Pak.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Mo�e dzisiaj uda�.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Gdzie znajd� tego Hosh-Paka?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//On ma miejsce, gdzie widzi wojownicy - nad fortec�, przy ognista g�ra. Tam Hosh-Pak dowodzi wojownicy.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "Hosh-Pak nie �yje.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Hosh-Pak nie �yje.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Hosh-Pak nie �yje? RUSHTASOK!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Moje serce smutne. Ur-Shak nie zapomni wielki ork, kt�ry zrobi� go szamanem.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Rozumiem. Hosh-Pak by� twoim nauczycielem, tak?
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ur-Shak musi nie�� sw�j smutek. Musi pogrzeba� Hosh-Pak. Ur-Shak musi ju� i��.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Przyjaciel lepiej i�� na prze��cz. Tu niebezpiecznie.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ur-Shak bardzo smutny, je�li przyjaciel-cz�owiek te� zgin��.
	b_logentry(TOPIC_URSHAK,"Hosh-Pak nie �yje. M�j orkowy przyjaciel zmierza do jego namiot�w, pogr��ony w �a�obie po swoim mentorze. Nie powinienem mu przeszkadza�.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//Przyjaciel lepiej i�� przez prze��cz.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//KHROTOK! Ja wiem, �e ty by�, gdzie zabili Hosh-Pak. Du�y b��d, obcy cz�owiek!
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//Widz�, �e zaj��e� tu jego miejsce. Od pocz�tku mn� manipulowa�e�.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Twoja pozycja w�r�d ork�w jest wy�sza, ni� sk�onny by�e� przyzna�. Teraz jeste� niczym wi�cej jak narz�dziem w r�kach z�a.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Obcy dobrze m�wi. Ur-Shak zna teraz tylko nienawi�� i zemsta.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ur-Shak zobaczy� b��d, �e zaufa� cz�owiek. Ur-Shak �a�uje, �e pom�g� z�y cz�owiek i m�wi� mu przyjaciel.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Obcy i�� ju� z doliny i przez prze��cz. Ur-Shak nie mo�e zabi� obcy. Honor szamana nie pozwala teraz zabi�.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Nast�pnym razem b�dziemy wrogi. Ty ju� lepiej i��.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"Rada orkowych szaman�w ponownie przyj�a w swe szeregi Ur-Shaka. Walczy on teraz po stronie wroga... Nie wiem, jak zareaguje na m�j widok. Nie powinienem mu chyba wchodzi� w drog�, dop�ki nie rozstrzygn� moich spraw z orkami - do tego czasu powinien si� ju� uspokoi�.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Ty i��. Nie rozmawia� z obcy.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};


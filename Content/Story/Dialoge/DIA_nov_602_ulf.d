
instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Co tu porabiasz?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Staram si� jak najlepiej wykona� zadania zlecone mi przez klasztor.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Jestem nowicjuszem w klasztorze. Wykonuj� zlecenia mag�w i pladyn�w.
		AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//W�a�nie dostarczy�em trzem karczmarzom w mie�cie wino z klasztoru.
	};
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "Kim s� w�a�ciciele trzech knajp?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Kim s� ci trzej karczmarze?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Jednym z nich jest ten mi�y cz�owiek za barem.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Drugim jest Caragon, prowadz�cy tawern� na placu �wi�tynnym, trzecim za� Kardif, w�a�ciciel knajpy w dzielnicy portowej.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o klasztorze?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Co mo�esz mi powiedzie� o klasztorze?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//My, nowicjusze, poszukujemy o�wiecenia w modlitwie do Innosa, pod nadzorem mag�w przyswajamy te� podstawy wiary.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//S�u�ymy im, by oni mogli s�u�y� Innosowi. No i przygotowujemy si� do zjednoczenia z Ogniem.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "Zabierz mnie do klasztoru.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Zabierz mnie do klasztoru.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Nie ma szans. Nie wiesz chyba, z iloma stworzeniami musia�em sobie poradzi�, zanim tutaj dotar�em.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Kiedy pomy�l� o tych wszystkich krwiopijcach, wilkach i goblinach, to si� ciesz�, �e nie musz� si� st�d rusza�.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Poza tym i tak nie wszed�by� do klasztoru.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Dlaczego?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Wej�� tam mog� jedynie magowie, paladyni i nowicjusze.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "Jak mog� zosta� nowicjuszem?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//Jak mog� zosta� nowicjuszem?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Kiedy cz�owiek czuje g��bok� wewn�trzn� potrzeb�...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Hej - powiedz mi tylko, jakie musz� spe�ni� warunki!
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Potrzebujesz dar�w. Owcy i...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"Aby zosta� nowicjuszem w klasztorze Innosa, b�d� potrzebowa� owcy i 1000 sztuk z�ota.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "Sk�d mam wzi�� tyle z�ota?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Sk�d mam wzi�� tyle z�ota?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Jak mniemam, nie znasz nikogo, kto by za ciebie zap�aci�. Zatem b�dziesz je musia� zarobi�.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "Sk�d mog� wzi�� owc�?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Sk�d mog� wzi�� owc�?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//Od farmer�w, oczywi�cie. Nie dostaniesz jej jednak za darmo.
	b_logentry(TOPIC_KLOSTER,"Owc� mog� zdoby� u farmer�w.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Hej, nie zgadniesz, co si� sta�o.
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Zosta�e� wybra�cem.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//Dok�adnie. W�a�nie mia�em napi� si� zimnego piwa, kiedy zjawi� si� Daron i oznajmi�, �e zosta�em wybra�cem.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Kto by pomy�la�? Niezbadana jest wola Innosa. Co ci� tu sprowadza?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Za��da�em Pr�by Ognia.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//Niemo�liwe?! Cz�owieku, nie brak ci odwagi. Czy to oznacza, �e ty r�wnie� poszukujesz 'tego, co wierny znajdzie na ko�cu �cie�ki'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Na to wygl�da.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "I co, znalaz�e� ju� co�?";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//I co, znalaz�e� ju� co�?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//C�, �ledzi�em Agona - ale w pewnym momencie znikn�� mi z oczu.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//Czekaj... Co oni tam jeszcze m�wili? Pod��aj za znakami Innosa. Nie rozumiem tylko tej cz�ci o �cie�kach...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//C� wi�c mi pozostaje, ci�gle szukam.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "Hej, czy ty mnie �ledzisz?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Hej, czy ty mnie �ledzisz?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Nonsens. Zmierzam po prostu w tym samym kierunku.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "Przesta� za mn� �azi�.";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Przesta� za mn� �azi�.
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//Nie �a�� za tob�. Ale prosz�, je�li to ma ci� uspokoi�, p�jd� inn� �cie�k�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Wi�c znowu si� spotykamy. Ostatnio sporo rozmy�la�em. Odczuwam siln� ch�� zostania magiem.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Cz�owieku - nie r�b tego...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//Nie mam wyboru. �ycie nowicjusza - to nie dla mnie.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Musz� zosta� magiem. Wtedy wszystko zacznie si� uk�ada�. Teraz za� odbior� to, co mi si� nale�y.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Masz jakie� ostatnie �yczenie?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"Daj spok�j, nie chc� ci� zabija�.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"Koniec gadania - musz� wraca� do klasztoru.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"Masz co� do palenia?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Daj spok�j, nie chc� ci� zabija�.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Gadaj zdr�w. Zdajesz sobie chyba spraw� z tego, �e nie masz ze mn� szans.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Koniec gadania - musz� wraca� do klasztoru.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//Nigdzie nie p�jdziesz!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//Masz co� do palenia?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//Masz szcz�cie. Tak si� sk�ada, �e akurat mam co� przy sobie.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Miejmy to ju� za sob�.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Hej, jeste� pewien, �e idziemy we w�a�ciwym kierunku? Podobno gdzie� tam mieszka troll.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Chyba lepiej uda� si� w innym kierunku.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};


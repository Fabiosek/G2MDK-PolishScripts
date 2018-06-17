
instance DIA_GEROLD_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_exit_condition;
	information = dia_gerold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_gerold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_HALLO(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_hallo_condition;
	information = dia_gerold_hallo_info;
	permanent = FALSE;
	description = "Kogo pilnujesz?";
};


func int dia_gerold_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gerold_hallo_info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//Kogo pilnujesz?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//Wi�ni�w.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//A kogo dok�adniej?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//Kilku skaza�c�w i najemnika Gorna. To twardziel - silny niczym w�.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//Ledwo obezw�adni�o go czterech m�czyzn.
};


instance DIA_GEROLD_JAIL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_jail_condition;
	information = dia_gerold_jail_info;
	permanent = FALSE;
	description = "Czy mo�esz mnie wpu�ci� do lochu?";
};


func int dia_gerold_jail_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_gerold_hallo) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_jail_info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Czy mo�esz mnie wpu�ci� do lochu?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//Nie. NIKT nie wejdzie do lochu. Dotyczy to KA�DEGO: ciebie, Miltena i ca�ej reszty.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//To nie jest knajpa, gdzie mo�na wchodzi� i wychodzi�, kiedy ci si� tylko spodoba. Zapami�taj to sobie.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_GEROLD_AUSNAHME(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_ausnahme_condition;
	information = dia_gerold_ausnahme_info;
	permanent = FALSE;
	description = "Nie zrobisz dla mnie wyj�tku?";
};


func int dia_gerold_ausnahme_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_jail) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_ausnahme_info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//Nie zrobisz dla mnie wyj�tku?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Nie.
};


instance DIA_GEROLD_GOLD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_gold_condition;
	information = dia_gerold_gold_info;
	permanent = FALSE;
	description = "A je�li ci zap�ac�?";
};


func int dia_gerold_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_ausnahme) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_gold_info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//A je�li ci zap�ac�?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//...hm...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//Nie.
};


instance DIA_GEROLD_DEAL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_deal_condition;
	information = dia_gerold_deal_info;
	permanent = FALSE;
	description = "Mam tu list dla jednego z wi�ni�w.";
};


func int dia_gerold_deal_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_deal_info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//Mam tu list dla jednego z wi�ni�w. M�g�by� go przekaza�?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Hm... w zasadzie nie widz� �adnych przeciwwskaza�. Dla kogo jest ta wiadomo��?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//Dla Gorna.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//To bardzo wa�ny wi�zie�. Nie s�dz�, �eby Garond si� na to zgodzi�. Ale je�li to dla ciebie takie wa�ne, chyba dojdziemy jako� do porozumienia.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//Czego chcesz?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Nasze racje �ywno�ciowe staj� si� coraz mniejsze. Chcia�bym dla odmiany naje�� si� do syta.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//Mam ochot� na smaczn� kie�bas� i bochenek �wie�ego chleba. I troch� miodu.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//I butelk� wina... Tak, to wystarczy. Nie powiniene� mie� problem�w ze zdobyciem tych artyku��w. Wr��, kiedy b�dziesz ju� mia� jedzenie.
	b_logentry(TOPIC_RESCUEGORN,"Je�li przynios� Geroldowi kie�bas�, chleb, wino i mi�d, przeka�e Gornowi wiadomo��.");
};


instance DIA_GEROLD_STUFF(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_stuff_condition;
	information = dia_gerold_stuff_info;
	permanent = TRUE;
	description = "Mam co� dla ciebie...";
};


var int dia_gerold_stuff_permanent;

func int dia_gerold_stuff_condition()
{
	if((Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && Npc_KnowsInfo(other,dia_gerold_deal) && (KAPITEL == 2) && (DIA_GEROLD_STUFF_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_stuff_info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//Mam co� dla ciebie. Oto jedzenie.
	if((Npc_HasItems(other,itfo_honey) >= 1) && (Npc_HasItems(other,itfo_bread) >= 1) && (Npc_HasItems(other,itfo_wine) >= 1) && (Npc_HasItems(other,itfo_sausage) >= 1))
	{
		AI_PrintScreen("Odda�e� mi�d",-1,34,FONT_SCREENSMALL,2);
		AI_PrintScreen("Odda�e� chleb",-1,37,FONT_SCREENSMALL,2);
		AI_PrintScreen("Odda�e� wino",-1,40,FONT_SCREENSMALL,2);
		AI_PrintScreen("Odda�e� kie�bas�",-1,43,FONT_SCREENSMALL,2);
		Npc_RemoveInvItems(other,itfo_honey,1);
		Npc_RemoveInvItems(other,itfo_bread,1);
		Npc_RemoveInvItems(other,itfo_wine,1);
		Npc_RemoveInvItems(other,itfo_sausage,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Dobrze, dawaj �arcie. Masz t� wiadomo��?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Tak, prosz�. Pami�taj, to dla Gorna.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Wr�� jutro, do tej pory odbierze ju� tw�j list.
		b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
		DAYCONTACTGORN = Wld_GetDay();
		DIA_GEROLD_STUFF_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gerold dosta� wszystko, czego sobie za�yczy�, i obieca� przekaza� wiadomo��.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Wr��, kiedy zdob�dziesz jedzenie.
	};
};


instance DIA_GEROLD_ANTWORT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_antwort_condition;
	information = dia_gerold_antwort_info;
	permanent = TRUE;
	description = "Czy Gorn dosta� wiadomo��?";
};


var int dia_gerold_antwort_permanent;

func int dia_gerold_antwort_condition()
{
	if((DIA_GEROLD_STUFF_PERMANENT == TRUE) && (KAPITEL == 2) && (DIA_GEROLD_ANTWORT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_antwort_info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Czy Gorn dosta� wiadomo��?
	if(DAYCONTACTGORN < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Tak, mam ci przekaza� jego odpowied�.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//Jak ona brzmi?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//Przy po�udniowej bramie.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//Czy powiedzia� co� jeszcze?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//Nie. Nie mam poj�cia, co to znaczy. A ty?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//By� mo�e. Nie zastanawiaj si� nad tym.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Tak, mo�e tak b�dzie lepiej.
		GORNSTREASURE = TRUE;
		DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gorn twierdzi, �e ukry� swoje z�oto przy po�udniowej bramie.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//Nie, jeszcze nie. Wr�� p�niej.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_SETGORNFREE(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_setgornfree_condition;
	information = dia_gerold_setgornfree_info;
	permanent = FALSE;
	description = "Uwolnij Gorna.";
};


func int dia_gerold_setgornfree_condition()
{
	if((GAROND_KERKERAUF == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gerold_setgornfree_info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//Uwolnij Gorna. To rozkaz kapitana Garonda.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//Ju� przekazano mi tak� wiadomo��. Prosz�, oto klucz. Mo�esz wej�� do �rodka.
	CreateInvItems(self,itke_prisonkey_mis,1);
	b_giveinvitems(self,other,itke_prisonkey_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Gerold da� mi klucz do wi�zienia.");
};


instance DIA_GEROLD_PERM(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_perm_condition;
	information = dia_gerold_perm_info;
	permanent = TRUE;
	description = "Czy ty nigdy nie sypiasz?";
};


func int dia_gerold_perm_condition()
{
	if((KAPITEL < 4) && Npc_KnowsInfo(other,dia_gerold_gold))
	{
		return TRUE;
	};
};

func void dia_gerold_perm_info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//Czy ty nigdy nie sypiasz?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//Nie. Dzi�ki �asce Innosa nie potrzebuj� snu.
};


instance DIA_GEROLD_KAP4_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap4_exit_condition;
	information = dia_gerold_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP4_ALLESRUHIG(C_INFO)
{
	npc = pal_261_gerold;
	nr = 30;
	condition = dia_gerold_kap4_allesruhig_condition;
	information = dia_gerold_kap4_allesruhig_info;
	description = "Wszystko w porz�dku?";
};


func int dia_gerold_kap4_allesruhig_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_allesruhig_info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//Tak, w porz�dku...
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//Ale?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//Kiszki graj� mi marsza. Garond znowu kaza� zmniejszy� racje �ywno�ciowe.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//Je�li szybko nie dostan� czego� porz�dnego do zjedzenia, chyba odgryz� Garondowi jego t�ust� dup�.
	Info_ClearChoices(dia_gerold_kap4_allesruhig);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"To nie m�j problem.",dia_gerold_kap4_allesruhig_nein);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"Mo�e co� ci przynios�.",dia_gerold_kap4_allesruhig_geben);
};

func void dia_gerold_kap4_allesruhig_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Mo�e co� ci przynios�.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Oszala�e�? Na pewno nie tutaj. Je�li kto� zauwa�y, �e mam jedzenie, zaraz otocz� mnie dziesi�tki nowych przyjaci�, je�li wiesz, co mam na my�li.
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//Znajdziesz mnie w �wi�tyni maga, kiedy nikogo ju� tam nie b�dzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Szybko, chod� ze mn� do �wi�tyni maga, zanim reszta wype�znie ze swoich dziur. Nie chc� czeka� do jutra.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//O tej porze w �wi�tyni prawie nikogo nie ma. Zaczekam tam na ciebie.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//Tylko nie przynie� mi suchego chleba albo jakiego� och�apu, jasne?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
	b_logentry(TOPIC_GEROLDGIVEFOOD,"Garond znowu zmniejszy� racje �ywno�ciowe. Lepiej znajd� Geroldowi co� do jedzenia, zanim g��d popchnie go do jakiego� g�upiego czynu. Mam si� z nim spotka� w siedzibie mag�w na zamku, kiedy wszyscy b�d� spa�.");
	MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};

func void dia_gerold_kap4_allesruhig_nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//To nie m�j problem.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//Pewnie... Garond nie obetnie wam racji �ywno�ciowych.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//Chocia� nie chce si� do tego przyzna�, jest �miertelnie wystraszony, a wy jeste�cie jego jedyn� szans�.
	AI_StopProcessInfos(self);
};


var int gerold_foodcounter;

instance DIA_GEROLD_FOOD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 31;
	condition = dia_gerold_food_condition;
	information = dia_gerold_food_info;
	important = TRUE;
};


func int dia_gerold_food_condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_gerold_morefood()
{
	Info_ClearChoices(dia_gerold_food);
	if(GEROLD_FOODCOUNTER > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//Do��, do��. To wystarczy na jaki� czas.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Prosz�, we� moje z�oto. I tak mi si� tutaj do niczego nie przyda.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//Lepiej ju� p�jd�, zanim kto� nas zobaczy.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GEROLDGIVEFOOD = LOG_SUCCESS;
		b_giveplayerxp(XP_GEROLDGIVEFOOD);
		CreateInvItems(self,itmi_gold,450);
		b_giveinvitems(self,other,itmi_gold,450);
	}
	else
	{
		if(GEROLD_FOODCOUNTER == 0)
		{
			Info_AddChoice(dia_gerold_food,"Nie mam akurat nic przy sobie.",dia_gerold_food_nichts);
		}
		else
		{
			Info_AddChoice(dia_gerold_food,"To wszystko, co mam.",dia_gerold_food_kaese_nichtmehr);
			if(GEROLD_FOODCOUNTER < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Pewnie. Daj to tutaj. Masz co� jeszcze?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Tak! Jeszcze, jeszcze!
			};
		};
		if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj zup�)",dia_gerold_food_suppe);
		};
		if(Npc_HasItems(other,itfomutton))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj mi�so)",dia_gerold_food_fleisch);
		};
		if(Npc_HasItems(other,itfo_bacon))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj szynk�)",dia_gerold_food_schinken);
		};
		if(Npc_HasItems(other,itfo_cheese))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj ser)",dia_gerold_food_kaese);
		};
		if(Npc_HasItems(other,itfo_sausage))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj kie�bas�)",dia_gerold_food_wurst);
		};
		GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
	};
};

func void dia_gerold_food_info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//Jeste�! A wi�c - o co chodzi? Przynios�e� mi co� do jedzenia?
	dia_gerold_morefood();
};

func void dia_gerold_food_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//Nie mam akurat nic przy sobie.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//Najpierw robisz wok� tego takie zamieszanie, a teraz chcesz mnie wykiwa�?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_gerold_food_kaese_nichtmehr()
{
	var int xp_geroldgivefoodlow;
	var int teiler;
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//To wszystko, co mam.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//I ja mam w to uwierzy�? Dobrze, lepsze to ni� nic. Prosz�, we� to z�oto.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//Musz� wr�ci� na posterunek.
	AI_StopProcessInfos(self);
	if(GEROLD_FOODCOUNTER < 4)
	{
		teiler = 3;
	}
	else
	{
		teiler = 2;
	};
	xp_geroldgivefoodlow = XP_GEROLDGIVEFOOD / teiler;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_OBSOLETE;
	b_giveplayerxp(xp_geroldgivefoodlow);
};

func void dia_gerold_food_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//A co powiesz na kawa� soczystego sera?
	b_giveinvitems(other,self,itfo_cheese,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//Kawa�ek kie�basy?
	b_giveinvitems(other,self,itfo_sausage,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//M�g�bym ci da� t� szynk�.
	b_giveinvitems(other,self,itfo_bacon,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//Kawa�ek mi�sa?
	b_giveinvitems(other,self,itfomutton,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Zjad�by� troch� dobrej zupy, prawda?
	if(b_giveinvitems(other,self,itfo_fishsoup,1))
	{
	}
	else
	{
		b_giveinvitems(other,self,itfo_stew,1);
	};
	dia_gerold_morefood();
};


instance DIA_GEROLD_PERM4(C_INFO)
{
	npc = pal_261_gerold;
	nr = 41;
	condition = dia_gerold_perm4_condition;
	information = dia_gerold_perm4_info;
	permanent = TRUE;
	description = "Wci�� g�odny?";
};


func int dia_gerold_perm4_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_kap4_allesruhig))
	{
		return TRUE;
	};
};

func void dia_gerold_perm4_info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Wci�� g�odny?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//Je�li orkowie znowu zaatakuj�, nawet pe�en brzuch mi nie pomo�e.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//Chyba �artujesz. Nic ju� nie prze�kn�. Dzi�kuj� jeszcze raz.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Tak. Ale dzi�kuj� za pomoc.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//W porz�dku, Mistrzu.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Spadaj st�d!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP5_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap5_exit_condition;
	information = dia_gerold_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gerold_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP6_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap6_exit_condition;
	information = dia_gerold_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_gerold_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_PICKPOCKET(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_pickpocket_condition;
	information = dia_gerold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_gerold_pickpocket_condition()
{
	return c_beklauen(71,170);
};

func void dia_gerold_pickpocket_info()
{
	Info_ClearChoices(dia_gerold_pickpocket);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_BACK,dia_gerold_pickpocket_back);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_PICKPOCKET,dia_gerold_pickpocket_doit);
};

func void dia_gerold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gerold_pickpocket);
};

func void dia_gerold_pickpocket_back()
{
	Info_ClearChoices(dia_gerold_pickpocket);
};


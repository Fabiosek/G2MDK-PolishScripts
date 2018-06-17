
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
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//WiêŸniów.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//A kogo dok³adniej?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//Kilku skazañców i najemnika Gorna. To twardziel - silny niczym wó³.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//Ledwo obezw³adni³o go czterech mê¿czyzn.
};


instance DIA_GEROLD_JAIL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_jail_condition;
	information = dia_gerold_jail_info;
	permanent = FALSE;
	description = "Czy mo¿esz mnie wpuœciæ do lochu?";
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
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Czy mo¿esz mnie wpuœciæ do lochu?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//Nie. NIKT nie wejdzie do lochu. Dotyczy to KA¯DEGO: ciebie, Miltena i ca³ej reszty.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//To nie jest knajpa, gdzie mo¿na wchodziæ i wychodziæ, kiedy ci siê tylko spodoba. Zapamiêtaj to sobie.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_GEROLD_AUSNAHME(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_ausnahme_condition;
	information = dia_gerold_ausnahme_info;
	permanent = FALSE;
	description = "Nie zrobisz dla mnie wyj¹tku?";
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
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//Nie zrobisz dla mnie wyj¹tku?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Nie.
};


instance DIA_GEROLD_GOLD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_gold_condition;
	information = dia_gerold_gold_info;
	permanent = FALSE;
	description = "A jeœli ci zap³acê?";
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
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//A jeœli ci zap³acê?
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
	description = "Mam tu list dla jednego z wiêŸniów.";
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
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//Mam tu list dla jednego z wiêŸniów. Móg³byœ go przekazaæ?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Hm... w zasadzie nie widzê ¿adnych przeciwwskazañ. Dla kogo jest ta wiadomoœæ?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//Dla Gorna.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//To bardzo wa¿ny wiêzieñ. Nie s¹dzê, ¿eby Garond siê na to zgodzi³. Ale jeœli to dla ciebie takie wa¿ne, chyba dojdziemy jakoœ do porozumienia.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//Czego chcesz?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Nasze racje ¿ywnoœciowe staj¹ siê coraz mniejsze. Chcia³bym dla odmiany najeœæ siê do syta.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//Mam ochotê na smaczn¹ kie³basê i bochenek œwie¿ego chleba. I trochê miodu.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//I butelkê wina... Tak, to wystarczy. Nie powinieneœ mieæ problemów ze zdobyciem tych artyku³ów. Wróæ, kiedy bêdziesz ju¿ mia³ jedzenie.
	b_logentry(TOPIC_RESCUEGORN,"Jeœli przyniosê Geroldowi kie³basê, chleb, wino i miód, przeka¿e Gornowi wiadomoœæ.");
};


instance DIA_GEROLD_STUFF(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_stuff_condition;
	information = dia_gerold_stuff_info;
	permanent = TRUE;
	description = "Mam coœ dla ciebie...";
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
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//Mam coœ dla ciebie. Oto jedzenie.
	if((Npc_HasItems(other,itfo_honey) >= 1) && (Npc_HasItems(other,itfo_bread) >= 1) && (Npc_HasItems(other,itfo_wine) >= 1) && (Npc_HasItems(other,itfo_sausage) >= 1))
	{
		AI_PrintScreen("Odda³eœ miód",-1,34,FONT_SCREENSMALL,2);
		AI_PrintScreen("Odda³eœ chleb",-1,37,FONT_SCREENSMALL,2);
		AI_PrintScreen("Odda³eœ wino",-1,40,FONT_SCREENSMALL,2);
		AI_PrintScreen("Odda³eœ kie³basê",-1,43,FONT_SCREENSMALL,2);
		Npc_RemoveInvItems(other,itfo_honey,1);
		Npc_RemoveInvItems(other,itfo_bread,1);
		Npc_RemoveInvItems(other,itfo_wine,1);
		Npc_RemoveInvItems(other,itfo_sausage,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Dobrze, dawaj ¿arcie. Masz tê wiadomoœæ?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Tak, proszê. Pamiêtaj, to dla Gorna.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Wróæ jutro, do tej pory odbierze ju¿ twój list.
		b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
		DAYCONTACTGORN = Wld_GetDay();
		DIA_GEROLD_STUFF_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gerold dosta³ wszystko, czego sobie za¿yczy³, i obieca³ przekazaæ wiadomoœæ.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Wróæ, kiedy zdobêdziesz jedzenie.
	};
};


instance DIA_GEROLD_ANTWORT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_antwort_condition;
	information = dia_gerold_antwort_info;
	permanent = TRUE;
	description = "Czy Gorn dosta³ wiadomoœæ?";
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
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Czy Gorn dosta³ wiadomoœæ?
	if(DAYCONTACTGORN < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Tak, mam ci przekazaæ jego odpowiedŸ.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//Jak ona brzmi?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//Przy po³udniowej bramie.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//Czy powiedzia³ coœ jeszcze?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//Nie. Nie mam pojêcia, co to znaczy. A ty?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//Byæ mo¿e. Nie zastanawiaj siê nad tym.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Tak, mo¿e tak bêdzie lepiej.
		GORNSTREASURE = TRUE;
		DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gorn twierdzi, ¿e ukry³ swoje z³oto przy po³udniowej bramie.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//Nie, jeszcze nie. Wróæ póŸniej.
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
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//Ju¿ przekazano mi tak¹ wiadomoœæ. Proszê, oto klucz. Mo¿esz wejœæ do œrodka.
	CreateInvItems(self,itke_prisonkey_mis,1);
	b_giveinvitems(self,other,itke_prisonkey_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Gerold da³ mi klucz do wiêzienia.");
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
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//Nie. Dziêki ³asce Innosa nie potrzebujê snu.
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
	description = "Wszystko w porz¹dku?";
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
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//Tak, w porz¹dku...
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//Ale?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//Kiszki graj¹ mi marsza. Garond znowu kaza³ zmniejszyæ racje ¿ywnoœciowe.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//Jeœli szybko nie dostanê czegoœ porz¹dnego do zjedzenia, chyba odgryzê Garondowi jego t³ust¹ dupê.
	Info_ClearChoices(dia_gerold_kap4_allesruhig);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"To nie mój problem.",dia_gerold_kap4_allesruhig_nein);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"Mo¿e coœ ci przyniosê.",dia_gerold_kap4_allesruhig_geben);
};

func void dia_gerold_kap4_allesruhig_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Mo¿e coœ ci przyniosê.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Oszala³eœ? Na pewno nie tutaj. Jeœli ktoœ zauwa¿y, ¿e mam jedzenie, zaraz otocz¹ mnie dziesi¹tki nowych przyjació³, jeœli wiesz, co mam na myœli.
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//Znajdziesz mnie w œwi¹tyni maga, kiedy nikogo ju¿ tam nie bêdzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Szybko, chodŸ ze mn¹ do œwi¹tyni maga, zanim reszta wype³znie ze swoich dziur. Nie chcê czekaæ do jutra.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//O tej porze w œwi¹tyni prawie nikogo nie ma. Zaczekam tam na ciebie.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//Tylko nie przynieœ mi suchego chleba albo jakiegoœ och³apu, jasne?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
	b_logentry(TOPIC_GEROLDGIVEFOOD,"Garond znowu zmniejszy³ racje ¿ywnoœciowe. Lepiej znajdê Geroldowi coœ do jedzenia, zanim g³ód popchnie go do jakiegoœ g³upiego czynu. Mam siê z nim spotkaæ w siedzibie magów na zamku, kiedy wszyscy bêd¹ spaæ.");
	MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};

func void dia_gerold_kap4_allesruhig_nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//To nie mój problem.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//Pewnie... Garond nie obetnie wam racji ¿ywnoœciowych.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//Chocia¿ nie chce siê do tego przyznaæ, jest œmiertelnie wystraszony, a wy jesteœcie jego jedyn¹ szans¹.
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
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//Doœæ, doœæ. To wystarczy na jakiœ czas.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Proszê, weŸ moje z³oto. I tak mi siê tutaj do niczego nie przyda.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//Lepiej ju¿ pójdê, zanim ktoœ nas zobaczy.
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
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Pewnie. Daj to tutaj. Masz coœ jeszcze?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Tak! Jeszcze, jeszcze!
			};
		};
		if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj zupê)",dia_gerold_food_suppe);
		};
		if(Npc_HasItems(other,itfomutton))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj miêso)",dia_gerold_food_fleisch);
		};
		if(Npc_HasItems(other,itfo_bacon))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj szynkê)",dia_gerold_food_schinken);
		};
		if(Npc_HasItems(other,itfo_cheese))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj ser)",dia_gerold_food_kaese);
		};
		if(Npc_HasItems(other,itfo_sausage))
		{
			Info_AddChoice(dia_gerold_food,"(Oddaj kie³basê)",dia_gerold_food_wurst);
		};
		GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
	};
};

func void dia_gerold_food_info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//Jesteœ! A wiêc - o co chodzi? Przynios³eœ mi coœ do jedzenia?
	dia_gerold_morefood();
};

func void dia_gerold_food_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//Nie mam akurat nic przy sobie.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//Najpierw robisz wokó³ tego takie zamieszanie, a teraz chcesz mnie wykiwaæ?
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
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//I ja mam w to uwierzyæ? Dobrze, lepsze to ni¿ nic. Proszê, weŸ to z³oto.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//Muszê wróciæ na posterunek.
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
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//A co powiesz na kawa³ soczystego sera?
	b_giveinvitems(other,self,itfo_cheese,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//Kawa³ek kie³basy?
	b_giveinvitems(other,self,itfo_sausage,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//Móg³bym ci daæ tê szynkê.
	b_giveinvitems(other,self,itfo_bacon,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//Kawa³ek miêsa?
	b_giveinvitems(other,self,itfomutton,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Zjad³byœ trochê dobrej zupy, prawda?
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
	description = "Wci¹¿ g³odny?";
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
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Wci¹¿ g³odny?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//Jeœli orkowie znowu zaatakuj¹, nawet pe³en brzuch mi nie pomo¿e.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//Chyba ¿artujesz. Nic ju¿ nie prze³knê. Dziêkujê jeszcze raz.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Tak. Ale dziêkujê za pomoc.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//W porz¹dku, Mistrzu.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Spadaj st¹d!
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


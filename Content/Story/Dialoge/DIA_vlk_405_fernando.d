
instance DIA_FERNANDO_EXIT(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 999;
	condition = dia_fernando_exit_condition;
	information = dia_fernando_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fernando_exit_condition()
{
	return TRUE;
};

func void dia_fernando_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_FERNANDO_PICKPOCKET(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 900;
	condition = dia_fernando_pickpocket_condition;
	information = dia_fernando_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego mieszka b�dzie ryzykownym zadaniem)";
};


func int dia_fernando_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_pickpocket_info()
{
	Info_ClearChoices(dia_fernando_pickpocket);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_BACK,dia_fernando_pickpocket_back);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_PICKPOCKET,dia_fernando_pickpocket_doit);
};

func void dia_fernando_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_fernando_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_fernando_pickpocket_back()
{
	Info_ClearChoices(dia_fernando_pickpocket);
};


instance DIA_FERNANDO_HELLO(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_hello_condition;
	information = dia_fernando_hello_info;
	permanent = FALSE;
	description = "Jak idzie interes?";
};


func int dia_fernando_hello_condition()
{
	if(NPCOBSESSEDBYDMT_FERNANDO == FALSE)
	{
		return TRUE;
	};
};

func void dia_fernando_hello_info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Jak interesy?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nie za dobrze. Wszystko by�o du�o �atwiejsze, zanim znikn�a Bariera.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Wi�niowie wydobywali z kopalni ca�e tony rudy, kt�re moje statki przewozi�y na kontynent.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//W drodze powrotnej przywozi�y jedzenie i inne towary.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Niestety, te czasy min�y. Zostali�my odci�ci od kontynentu, wi�c musimy zadowala� si� jedynie tym, co dostarczaj� nam nasi ch�opi.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "Z czego si� teraz utrzymujesz?";
};


func int dia_fernando_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_perm_info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z czego si� teraz utrzymujesz?
	if(FERNANDO_IMKNAST == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if(FERNANDO_HATSZUGEGEBEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Nie wiem. Na pewno nie b�d� ju� robi� szemranych interes�w.
	}
	else if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Na razie �yj� z oszcz�dno�ci. Jednak je�li nie uda mi si� szybko stan�� na nogi, wkr�tce b�d� mia� powa�ne problemy finansowe.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Jestem zrujnowany. Powinienem by� pos�ucha� ojca, kiedy mnie ostrzega�, �ebym trzyma� si� z daleka od g�rnictwa.
	};
};


instance DIA_FERNANDO_MINENTAL(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 2;
	condition = dia_fernando_minental_condition;
	information = dia_fernando_minental_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fernando_minental_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2) && (ENTEROW_KAPITEL2 == FALSE) && (FERNANDO_HATSZUGEGEBEN == FALSE) && (FERNANDO_IMKNAST == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_minental_info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Ej, ty - zaczekaj chwil�. Podr�ujesz do G�rniczej Doliny, prawda?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//Co w zwi�zku z tym?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Zawrzyjmy umow�. Powiesz mi, co si� dzieje z rud�, a ja w zamian za to podaruj� ci...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//...kamie� runiczny.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//...pier�cie�, kt�ry podniesie twoj� energi� �yciow�.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Zobacz�, co da si� zrobi�.
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"Kupiec Fernando chce wiedzie�, co dzieje si� z rud� w G�rniczej Dolinie.");
};


instance DIA_ADDON_FERNANDO_BANDITTRADER(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_addon_fernando_bandittrader_condition;
	information = dia_addon_fernando_bandittrader_info;
	description = "Sprzedajesz bro� bandytom!";
};


func int dia_addon_fernando_bandittrader_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))))
	{
		return TRUE;
	};
};

func void dia_addon_fernando_bandittrader_info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Sprzedajesz bro� bandytom!
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//Eee? Sk�d ten pomys�?
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Fernando, zamorski kupiec, przyzna�, �e dostarcza� bro� bandytom.");
	b_giveplayerxp(XP_ADDON_FERNANDO_HATSZUGEGEBEN);
	FERNANDO_HATSZUGEGEBEN = TRUE;
	if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//Oto lista towar�w, kt�r� uda�o mi si� u nich znale��. Widnieje na niej tw�j podpis.
	};
	if(Npc_HasItems(other,itri_addon_bandittrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Mam te� pier�cie� gildii kupc�w zamorskich Araxos - a ty jeste� przecie� kupcem zamorskim, prawda?
		if(Npc_HasItems(other,itmw_addon_bandittrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//Nie m�wi�c ju� o tym, �e bandyckie miecze s� oznaczone twoimi inicja�ami.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//Miecze, kt�rych u�ywali bandyci, by�y oznaczone twoimi inicja�ami.
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nie pr�buj zaprzecza� - przejrza�em twoje machlojki.
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Wi�c to ty... To ty mnie zdradzi�e�! Zap�acisz mi za to.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Najpierw musieliby ci� st�d wypu�ci�, a jako� nie s�dz�, aby do tego dosz�o.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//Nadejdzie jeszcze pora zemsty...
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//Musisz mi uwierzy�! Nie chcia�em tego!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//Na pocz�tku chcieli tylko �ywno�ci! Interes szed� s�abo, wi�c si� zgodzi�em.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//Z czasem chcieli coraz wi�cej... Zagrozili, �e mnie zabij�, je�li nie dostarcz� im mieczy!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//Nie mo�esz mnie obwinia�! To ja jestem tutaj ofiar�!
		if(FERNANDO_IMKNAST == FALSE)
		{
			Info_ClearChoices(dia_addon_fernando_bandittrader);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Ile mi zap�acisz, je�li nie b�d� ci przeszkadza� w ucieczce?",dia_addon_fernando_bandittrader_preis);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Zajmie si� tob� stra�.",dia_addon_fernando_bandittrader_mil);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Jaka to smutna historia.",dia_addon_fernando_bandittrader_uptown);
		};
	};
};

func void dia_addon_fernando_bandittrader_uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Jaka to smutna historia... Jak na kogo� �yj�cego w g�rnym mie�cie jeste� wyj�tkowo odra�aj�cy.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Sprzeda� dusz� za kilka uncji z�ota... Ech.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Musz� zarobi� na �ycie! Je�li nie b�dzie mnie sta� na pokrycie koszt�w, to wyrzuc� mnie z powrotem do portu! Mi�dzy tych obdartus�w!
};

func void dia_addon_fernando_bandittrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Zajmie si� tob� stra�.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Tak nie mo�na!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Ale� oczywi�cie, �e mo�na.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Na Innosa... Jestem zrujnowany.
	b_npcclearobsessionbydmt(self);
};

func void dia_addon_fernando_bandittrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Ile mi zap�acisz, je�li nie b�d� ci przeszkadza� w ucieczce?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Znasz moj� sytuacj�. Zbyt wiele nie mam.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Mo�e 200 sztuk z�ota i cenny pier�cie�?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//Wi�cej nie mog� da�... Dostan� teraz dowody?
	Info_ClearChoices(dia_addon_fernando_bandittrader);
	Info_AddChoice(dia_addon_fernando_bandittrader,"Nie, tego ci nie dam.",dia_addon_fernando_bandittrader_nein);
	Info_AddChoice(dia_addon_fernando_bandittrader,"Dobra, umowa stoi.",dia_addon_fernando_bandittrader_ja);
};

func void dia_addon_fernando_bandittrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Dobra, umowa stoi.
	b_giveplayerxp(XP_AMBIENT);
	Npc_RemoveInvItems(hero,itmw_addon_bandittrader,Npc_HasItems(other,itmw_addon_bandittrader));
	Npc_RemoveInvItem(hero,itri_addon_bandittrader);
	Npc_RemoveInvItem(hero,itwr_addon_bandittrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//�wietnie - oto z�oto.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//Jeszcze pier�cie� i jeste�my kwita.
	CreateInvItems(self,itri_prot_point_01,1);
	b_giveinvitems(self,other,itri_prot_point_01,1);
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};

func void dia_addon_fernando_bandittrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Nie, tego ci nie dam.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobra. Tylko nie wa� si� mnie zdradzi�!
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "By�em w G�rniczej Dolinie.";
};


func int dia_fernando_success_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (KAPITEL >= 3) && Npc_KnowsInfo(other,dia_fernando_minental))
	{
		return TRUE;
	};
};

func void dia_fernando_success_info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//By�em w G�rniczej Dolinie.
	if(FERNANDO_IMKNAST == FALSE)
	{
		FERNANDO_ERZ = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//I co? Jak wygl�da sytuacja?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Z�o�a si� wyczerpa�y, nie warto prowadzi� prac dla kilku skrzy� rudy.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To niemo�liwe! A wi�c jestem zrujnowany...
		if(FERNANDO_HATSZUGEGEBEN == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co z nasz� umow�?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//A teraz s��wko o twojej nagrodzie...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Prosz�, we� ten kamie� runiczny.
				b_giveinvitems(self,other,itmi_runeblank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Prosz�, we� ten pier�cie�.
				b_giveinvitems(self,other,itri_hp_02,1);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_FERNANDO,LOG_OBSOLETE);
		b_logentry(TOPIC_FERNANDO,"Fernando nie chce kolejnych informacji. A ja nie chc� kolejnej zap�aty.");
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Wszystko w porz�dku?";
};


func int dia_fernando_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_FERNANDO_HEILUNG(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 55;
	condition = dia_fernando_heilung_condition;
	information = dia_fernando_heilung_info;
	permanent = TRUE;
	description = "Jeste� op�tany!";
};


func int dia_fernando_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_heilung_info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Jeste� op�tany!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Id�. No id� wreszcie!
	b_npcclearobsessionbydmt(self);
};


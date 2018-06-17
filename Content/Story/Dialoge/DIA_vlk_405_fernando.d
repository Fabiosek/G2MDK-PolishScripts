
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
	description = "(Kradzie¿ tego mieszka bêdzie ryzykownym zadaniem)";
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
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Nie za dobrze. Wszystko by³o du¿o ³atwiejsze, zanim zniknê³a Bariera.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//WiêŸniowie wydobywali z kopalni ca³e tony rudy, które moje statki przewozi³y na kontynent.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//W drodze powrotnej przywozi³y jedzenie i inne towary.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Niestety, te czasy minê³y. Zostaliœmy odciêci od kontynentu, wiêc musimy zadowalaæ siê jedynie tym, co dostarczaj¹ nam nasi ch³opi.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "Z czego siê teraz utrzymujesz?";
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
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//Z czego siê teraz utrzymujesz?
	if(FERNANDO_IMKNAST == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if(FERNANDO_HATSZUGEGEBEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Nie wiem. Na pewno nie bêdê ju¿ robiæ szemranych interesów.
	}
	else if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Na razie ¿yjê z oszczêdnoœci. Jednak jeœli nie uda mi siê szybko stan¹æ na nogi, wkrótce bêdê mia³ powa¿ne problemy finansowe.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Jestem zrujnowany. Powinienem by³ pos³uchaæ ojca, kiedy mnie ostrzega³, ¿ebym trzyma³ siê z daleka od górnictwa.
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
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Ej, ty - zaczekaj chwilê. Podró¿ujesz do Górniczej Doliny, prawda?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//Co w zwi¹zku z tym?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Zawrzyjmy umowê. Powiesz mi, co siê dzieje z rud¹, a ja w zamian za to podarujê ci...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//...kamieñ runiczny.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//...pierœcieñ, który podniesie twoj¹ energiê ¿yciow¹.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Zobaczê, co da siê zrobiæ.
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"Kupiec Fernando chce wiedzieæ, co dzieje siê z rud¹ w Górniczej Dolinie.");
};


instance DIA_ADDON_FERNANDO_BANDITTRADER(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_addon_fernando_bandittrader_condition;
	information = dia_addon_fernando_bandittrader_info;
	description = "Sprzedajesz broñ bandytom!";
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
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Sprzedajesz broñ bandytom!
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//Eee? Sk¹d ten pomys³?
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Fernando, zamorski kupiec, przyzna³, ¿e dostarcza³ broñ bandytom.");
	b_giveplayerxp(XP_ADDON_FERNANDO_HATSZUGEGEBEN);
	FERNANDO_HATSZUGEGEBEN = TRUE;
	if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//Oto lista towarów, któr¹ uda³o mi siê u nich znaleŸæ. Widnieje na niej twój podpis.
	};
	if(Npc_HasItems(other,itri_addon_bandittrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//Mam te¿ pierœcieñ gildii kupców zamorskich Araxos - a ty jesteœ przecie¿ kupcem zamorskim, prawda?
		if(Npc_HasItems(other,itmw_addon_bandittrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//Nie mówi¹c ju¿ o tym, ¿e bandyckie miecze s¹ oznaczone twoimi inicja³ami.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//Miecze, których u¿ywali bandyci, by³y oznaczone twoimi inicja³ami.
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Nie próbuj zaprzeczaæ - przejrza³em twoje machlojki.
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Wiêc to ty... To ty mnie zdradzi³eœ! Zap³acisz mi za to.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Najpierw musieliby ciê st¹d wypuœciæ, a jakoœ nie s¹dzê, aby do tego dosz³o.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//Nadejdzie jeszcze pora zemsty...
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//Musisz mi uwierzyæ! Nie chcia³em tego!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//Na pocz¹tku chcieli tylko ¿ywnoœci! Interes szed³ s³abo, wiêc siê zgodzi³em.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//Z czasem chcieli coraz wiêcej... Zagrozili, ¿e mnie zabij¹, jeœli nie dostarczê im mieczy!
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//Nie mo¿esz mnie obwiniaæ! To ja jestem tutaj ofiar¹!
		if(FERNANDO_IMKNAST == FALSE)
		{
			Info_ClearChoices(dia_addon_fernando_bandittrader);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Ile mi zap³acisz, jeœli nie bêdê ci przeszkadzaæ w ucieczce?",dia_addon_fernando_bandittrader_preis);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Zajmie siê tob¹ stra¿.",dia_addon_fernando_bandittrader_mil);
			Info_AddChoice(dia_addon_fernando_bandittrader,"Jaka to smutna historia.",dia_addon_fernando_bandittrader_uptown);
		};
	};
};

func void dia_addon_fernando_bandittrader_uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Jaka to smutna historia... Jak na kogoœ ¿yj¹cego w górnym mieœcie jesteœ wyj¹tkowo odra¿aj¹cy.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//Sprzedaæ duszê za kilka uncji z³ota... Ech.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Muszê zarobiæ na ¿ycie! Jeœli nie bêdzie mnie staæ na pokrycie kosztów, to wyrzuc¹ mnie z powrotem do portu! Miêdzy tych obdartusów!
};

func void dia_addon_fernando_bandittrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//Zajmie siê tob¹ stra¿.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Tak nie mo¿na!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Ale¿ oczywiœcie, ¿e mo¿na.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//Na Innosa... Jestem zrujnowany.
	b_npcclearobsessionbydmt(self);
};

func void dia_addon_fernando_bandittrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Ile mi zap³acisz, jeœli nie bêdê ci przeszkadzaæ w ucieczce?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Znasz moj¹ sytuacjê. Zbyt wiele nie mam.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Mo¿e 200 sztuk z³ota i cenny pierœcieñ?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//Wiêcej nie mogê daæ... Dostanê teraz dowody?
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
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Œwietnie - oto z³oto.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//Jeszcze pierœcieñ i jesteœmy kwita.
	CreateInvItems(self,itri_prot_point_01,1);
	b_giveinvitems(self,other,itri_prot_point_01,1);
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};

func void dia_addon_fernando_bandittrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Nie, tego ci nie dam.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Dobra. Tylko nie wa¿ siê mnie zdradziæ!
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "By³em w Górniczej Dolinie.";
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
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//By³em w Górniczej Dolinie.
	if(FERNANDO_IMKNAST == FALSE)
	{
		FERNANDO_ERZ = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//I co? Jak wygl¹da sytuacja?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Z³o¿a siê wyczerpa³y, nie warto prowadziæ prac dla kilku skrzyñ rudy.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To niemo¿liwe! A wiêc jestem zrujnowany...
		if(FERNANDO_HATSZUGEGEBEN == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Co z nasz¹ umow¹?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//A teraz s³ówko o twojej nagrodzie...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Proszê, weŸ ten kamieñ runiczny.
				b_giveinvitems(self,other,itmi_runeblank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Proszê, weŸ ten pierœcieñ.
				b_giveinvitems(self,other,itri_hp_02,1);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_FERNANDO,LOG_OBSOLETE);
		b_logentry(TOPIC_FERNANDO,"Fernando nie chce kolejnych informacji. A ja nie chcê kolejnej zap³aty.");
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Wszystko w porz¹dku?";
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
	description = "Jesteœ opêtany!";
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
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Jesteœ opêtany!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//IdŸ. No idŸ wreszcie!
	b_npcclearobsessionbydmt(self);
};


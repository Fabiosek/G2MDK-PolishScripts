
instance DIA_RANDOLPH_EXIT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 999;
	condition = dia_randolph_exit_condition;
	information = dia_randolph_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_randolph_exit_condition()
{
	return TRUE;
};

func void dia_randolph_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SCHWERELUFT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_schwereluft_condition;
	information = dia_randolph_schwereluft_info;
	permanent = FALSE;
	description = "Wszystko w porz¹dku?";
};


func int dia_randolph_schwereluft_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_schwereluft_info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Hmmm... Jedno z³e s³owo, a rozpêta siê tu prawdziwe piek³o... Uwa¿aj, bo bêdzie jatka.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Czy przy³¹czysz siê do walki?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Nie bêdê sta³ jak idiota i przygl¹da³ siê, ale te¿ nie zamierzam nikogo prowokowaæ.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Farmie Akila zagra¿aj¹ najemnicy.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "Wszystko w porz¹dku?";
};


func int dia_randolph_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_hallo_info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Wszystko w porz¹dku?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Skoro Kati i Akil udali siê do œwiata Innosa, teraz ja bêdê zajmowa³ siê farm¹.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Tak, w porz¹dku. Ten Alvares ostatnio pozwala³ sobie na zbyt wiele. Na szczêœcie ju¿ po wszystkim.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//Przyda³oby siê porz¹dnie przep³ukaæ gard³o w gospodzie.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "Baltram mnie przys³a³...";
};


func int dia_randolph_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && Npc_IsDead(akil) && Npc_IsDead(kati) && (LIEFERUNG_GEHOLT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_baltram_info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Przysy³a mnie Baltram, mam odebraæ dla niego dostawê.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Œwietnie. Wszystko ju¿ przygotowa³em. Oto paczka dla ciebie.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_RANDOLPH_GESCHICHTE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_geschichte_condition;
	information = dia_randolph_geschichte_info;
	permanent = FALSE;
	description = "Nie jesteœ st¹d, prawda?";
};


func int dia_randolph_geschichte_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_geschichte_info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Nie jesteœ st¹d, prawda?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Przybywam z po³udniowych wysp. Swego czasu Khorinis potrzebowa³o ludzi do wydobywania magicznej rudy.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Kiedy jednak przyby³em na miejsce, okaza³o siê, ¿e maj¹ tu wielk¹, magiczn¹ Barierê. Nie mia³em zamiaru jej przekraczaæ. Znalaz³em wiêc pracê w porcie.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//Kiedy port przesta³ przyjmowaæ statki, postanowi³em zmieniæ pracê. Tak trafi³em do Akila. Prawdê powiedziawszy, ima³em siê ju¿ gorszych zajêæ.
};


instance DIA_RANDOLPH_TAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_taverne_condition;
	information = dia_randolph_taverne_info;
	description = "Bywasz w gospodzie?";
};


func int dia_randolph_taverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_taverne_info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//Bywasz w gospodzie?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//To prawda. Choæ ostatnio coraz rzadziej.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//Nie staæ mnie na przesiadywanie tam.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "Co tak dok³adnie dzieje siê w gospodzie?";
};


func int dia_randolph_wasistintaverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_taverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasistintaverne_info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//Co tak dok³adnie dzieje siê w gospodzie?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Najproœciej mówi¹c, kwitnie tam hazard.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Dwóch goœci konkuruje w piciu piwa. Wygrywa ten, który d³u¿ej utrzyma siê na nogach.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//Przegra³em w tej konkurencji. Zanim tam wrócê, muszê trochê zarobiæ.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"W gospodzie s¹ przyjmowane zak³ady.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "Kto by³ twoim przeciwnikiem?";
};


func int dia_randolph_gegenwen_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasistintaverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_gegenwen_info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//Kto by³ twoim przeciwnikiem?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//Ten stary hultaj - Rukhar. Jak dot¹d nie uda³o mi siê go pokonaæ.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Coœ mi siê jednak zdaje, ¿e ten œmierdz¹cy patafian za ka¿dym razem doprawia³ moje piwo ginem.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Wydaje mi siê, ¿e ta brudna kanalia trzyma gin w tym swoim kufrze!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Ktoœ powinien podmieniæ gin na wodê. Wtedy mo¿e sobie doprawiaæ moje piwo, jak d³ugo zechce.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Gdybym tylko mia³ trochê z³ota, by raz jeszcze stan¹æ z nim do pojedynku...
	b_logentry(TOPIC_WETTSAUFEN,"Randolph opowiedzia³ mi o Rukharze i konkursie picia. Randolph nie ma ju¿ pieniêdzy, aby stan¹æ przeciwko Rukharowi.");
	b_logentry(TOPIC_WETTSAUFEN,"Randolph podejrzewa, ¿e Rukhar oszukuje podczas zawodów w piciu. Prosi mnie, abym zamieni³ butelkê ginu, któr¹ Rukhar trzyma w swoim kufrze, na butelkê wody.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "Ile pieniêdzy potrzebujesz, by wzi¹æ udzia³ w konkursie?";
};


func int dia_randolph_wasbrauchstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasbrauchstdu_info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Ile pieniêdzy potrzebujesz, by wzi¹æ udzia³ w konkursie?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 sztuk z³ota.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "Dam ci pieni¹dze, byœ móg³ stan¹æ w szranki z Rukharem.";
};


var int dia_randolph_ichgebedirgeld_noperm;

func int dia_randolph_ichgebedirgeld_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasbrauchstdu) && (DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_ichgebedirgeld_info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//Dam ci pieni¹dze, byœ móg³ stan¹æ w szranki z Rukharem.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//Naprawdê? Serdecznie dziêkujê. Wkrótce je oddam.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Jeœli wygram, dorzucê nawet coœ ekstra.
		b_logentry(TOPIC_WETTSAUFEN,"Powinienem wybraæ siê na zawody w piciu piwa.");
		b_giveplayerxp(XP_RANDOLPH_WETTKAMPFSTART);
		DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM = TRUE;
		b_npcclearobsessionbydmt(self);
		MIS_RUKHAR_WETTKAMPF_DAY = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		b_startotherroutine(orlan,"Wettkampf");
		b_startotherroutine(rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//Nie trzeba, sam ledwie wi¹¿esz koniec z koñcem.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_WETTKAMPFZUENDE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 10;
	condition = dia_randolph_wettkampfzuende_condition;
	information = dia_randolph_wettkampfzuende_info;
	permanent = TRUE;
	description = "Mamy kaca?";
};


func int dia_randolph_wettkampfzuende_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (KAPITEL < 4))
	{
		return TRUE;
	};
};


var int dia_randolph_wettkampfzuende_onetime;

func void dia_randolph_wettkampfzuende_info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Mamy kaca?
	if(RUKHAR_WON_WETTKAMPF == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//Chyba nawet parê kaców na raz... Ju¿ nigdy nie dotknê alkoholu.
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Twoje pieni¹dze przepad³y. Przykro mi.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Nie. Czujê siê œwietnie.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//W koñcu siê uda³o. Wielkie dziêki za po¿yczkê. Proszê, przyjmij to w podziêce.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Wygl¹da na to, ¿e Rukhar d³uugo jeszcze bêdzie trzeŸwia³.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PERM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 30;
	condition = dia_randolph_perm_condition;
	information = dia_randolph_perm_info;
	permanent = TRUE;
	description = "Oszala³eœ?";
};


func int dia_randolph_perm_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_RANDOLPH == FALSE))
	{
		return TRUE;
	};
};


var int dia_randolph_perm_gotmoney;

func void dia_randolph_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Wszystko w porz¹dku?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Wysy³asz mnie bez grosza przy duszy i nawet nie raczysz uprzedziæ, ¿e to cholerstwo tyle kosztuje?
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Sagitta ¿¹da ode mnie 300 sztuk z³ota.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Nie dam ci wiêcej ni¿ 150 sztuk z³ota. Proszê, musisz mi pomóc, b³agam.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Czujê siê potwornie. Od kiedy przesta³em piæ, wszystko mnie boli. Naprawê potrzebujê pomocy.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Jest pewne lekarstwo, które powinno pomóc.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Sagitta, stara zielarka, zwykle je dla mnie przygotowuje. Ale nie mogê ryzykowaæ wyprawy do niej, kiedy bandy orków grasuj¹ po okolicy.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"Randolph twierdzi, ¿e przesta³ piæ alkohol, i prosi mnie o przyniesienie od zielarki Sagitty jakichœ zió³, które pomog¹ mu przetrwaæ pierwsze ciê¿kie dni trzeŸwoœci.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Ci¹gle jeszcze krêci mi siê w g³owie, ale ogólnie jest o wiele lepiej.
		};
	};
};


instance DIA_RANDOLPH_HEILUNG(C_INFO)
{
	npc = bau_942_randolph;
	nr = 55;
	condition = dia_randolph_heilung_condition;
	information = dia_randolph_heilung_info;
	permanent = TRUE;
	description = "Alkohol uderzy³ do g³ówki, co?";
};


func int dia_randolph_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_RANDOLPH == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_randolph_heilung_info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Alkohol uderzy³ do g³ówki, co?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//Ju¿ nigdy ani kropelki. Nigdy w ¿yciu. S³owo honoru.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "Proszê, to powinno z³agodziæ objawy odstawienia trunków.";
};


func int dia_randolph_sagittaheal_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && Npc_HasItems(other,itpo_healrandolph_mis))
	{
		return TRUE;
	};
};

func void dia_randolph_sagittaheal_info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Proszê, to powinno z³agodziæ objawy odstawienia trunków.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Och! Dziêki, stary. Nareszcie trochê odpocznê.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Jak ja ci siê odwdziêczê?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//Te kilka monet to niewiele, wiem. Ale to ostatnie pieni¹dze, jakie mi zosta³y.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Zap³aci³em za ciebie kupê kasy, a ty dajesz mi kilka œmierdz¹cych monet? To nawet nie pokryje moich wydatków.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Mogê siê chyba uznaæ za szczêœliwca. Nieczêsto spotyka siê tak pomocnych paladynów. Nie s¹dzisz?
	};
	MIS_HEALRANDOLPH = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALRANDOLPH);
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PICKPOCKET(C_INFO)
{
	npc = bau_942_randolph;
	nr = 900;
	condition = dia_randolph_pickpocket_condition;
	information = dia_randolph_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_randolph_pickpocket_condition()
{
	return c_beklauen(58,2);
};

func void dia_randolph_pickpocket_info()
{
	Info_ClearChoices(dia_randolph_pickpocket);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_BACK,dia_randolph_pickpocket_back);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_PICKPOCKET,dia_randolph_pickpocket_doit);
};

func void dia_randolph_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_randolph_pickpocket);
};

func void dia_randolph_pickpocket_back()
{
	Info_ClearChoices(dia_randolph_pickpocket);
};


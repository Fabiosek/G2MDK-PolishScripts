
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
	description = "Wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Hmmm... Jedno z�e s�owo, a rozp�ta si� tu prawdziwe piek�o... Uwa�aj, bo b�dzie jatka.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Czy przy��czysz si� do walki?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Nie b�d� sta� jak idiota i przygl�da� si�, ale te� nie zamierzam nikogo prowokowa�.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Farmie Akila zagra�aj� najemnicy.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "Wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Wszystko w porz�dku?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Skoro Kati i Akil udali si� do �wiata Innosa, teraz ja b�d� zajmowa� si� farm�.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Tak, w porz�dku. Ten Alvares ostatnio pozwala� sobie na zbyt wiele. Na szcz�cie ju� po wszystkim.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//Przyda�oby si� porz�dnie przep�uka� gard�o w gospodzie.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "Baltram mnie przys�a�...";
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
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Przysy�a mnie Baltram, mam odebra� dla niego dostaw�.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//�wietnie. Wszystko ju� przygotowa�em. Oto paczka dla ciebie.
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
	description = "Nie jeste� st�d, prawda?";
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
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Nie jeste� st�d, prawda?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Przybywam z po�udniowych wysp. Swego czasu Khorinis potrzebowa�o ludzi do wydobywania magicznej rudy.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Kiedy jednak przyby�em na miejsce, okaza�o si�, �e maj� tu wielk�, magiczn� Barier�. Nie mia�em zamiaru jej przekracza�. Znalaz�em wi�c prac� w porcie.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//Kiedy port przesta� przyjmowa� statki, postanowi�em zmieni� prac�. Tak trafi�em do Akila. Prawd� powiedziawszy, ima�em si� ju� gorszych zaj��.
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
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//To prawda. Cho� ostatnio coraz rzadziej.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//Nie sta� mnie na przesiadywanie tam.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "Co tak dok�adnie dzieje si� w gospodzie?";
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
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//Co tak dok�adnie dzieje si� w gospodzie?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Najpro�ciej m�wi�c, kwitnie tam hazard.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Dw�ch go�ci konkuruje w piciu piwa. Wygrywa ten, kt�ry d�u�ej utrzyma si� na nogach.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//Przegra�em w tej konkurencji. Zanim tam wr�c�, musz� troch� zarobi�.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"W gospodzie s� przyjmowane zak�ady.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "Kto by� twoim przeciwnikiem?";
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
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//Kto by� twoim przeciwnikiem?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//Ten stary hultaj - Rukhar. Jak dot�d nie uda�o mi si� go pokona�.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Co� mi si� jednak zdaje, �e ten �mierdz�cy patafian za ka�dym razem doprawia� moje piwo ginem.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Wydaje mi si�, �e ta brudna kanalia trzyma gin w tym swoim kufrze!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Kto� powinien podmieni� gin na wod�. Wtedy mo�e sobie doprawia� moje piwo, jak d�ugo zechce.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Gdybym tylko mia� troch� z�ota, by raz jeszcze stan�� z nim do pojedynku...
	b_logentry(TOPIC_WETTSAUFEN,"Randolph opowiedzia� mi o Rukharze i konkursie picia. Randolph nie ma ju� pieni�dzy, aby stan�� przeciwko Rukharowi.");
	b_logentry(TOPIC_WETTSAUFEN,"Randolph podejrzewa, �e Rukhar oszukuje podczas zawod�w w piciu. Prosi mnie, abym zamieni� butelk� ginu, kt�r� Rukhar trzyma w swoim kufrze, na butelk� wody.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "Ile pieni�dzy potrzebujesz, by wzi�� udzia� w konkursie?";
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
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Ile pieni�dzy potrzebujesz, by wzi�� udzia� w konkursie?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 sztuk z�ota.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "Dam ci pieni�dze, by� m�g� stan�� w szranki z Rukharem.";
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
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//Dam ci pieni�dze, by� m�g� stan�� w szranki z Rukharem.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//Naprawd�? Serdecznie dzi�kuj�. Wkr�tce je oddam.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Je�li wygram, dorzuc� nawet co� ekstra.
		b_logentry(TOPIC_WETTSAUFEN,"Powinienem wybra� si� na zawody w piciu piwa.");
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
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//Nie trzeba, sam ledwie wi��esz koniec z ko�cem.
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
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//Chyba nawet par� kac�w na raz... Ju� nigdy nie dotkn� alkoholu.
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Twoje pieni�dze przepad�y. Przykro mi.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Nie. Czuj� si� �wietnie.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//W ko�cu si� uda�o. Wielkie dzi�ki za po�yczk�. Prosz�, przyjmij to w podzi�ce.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Wygl�da na to, �e Rukhar d�uugo jeszcze b�dzie trze�wia�.
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
	description = "Oszala�e�?";
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
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Wszystko w porz�dku?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Wysy�asz mnie bez grosza przy duszy i nawet nie raczysz uprzedzi�, �e to cholerstwo tyle kosztuje?
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Sagitta ��da ode mnie 300 sztuk z�ota.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Nie dam ci wi�cej ni� 150 sztuk z�ota. Prosz�, musisz mi pom�c, b�agam.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Czuj� si� potwornie. Od kiedy przesta�em pi�, wszystko mnie boli. Napraw� potrzebuj� pomocy.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Jest pewne lekarstwo, kt�re powinno pom�c.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Sagitta, stara zielarka, zwykle je dla mnie przygotowuje. Ale nie mog� ryzykowa� wyprawy do niej, kiedy bandy ork�w grasuj� po okolicy.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"Randolph twierdzi, �e przesta� pi� alkohol, i prosi mnie o przyniesienie od zielarki Sagitty jakich� zi�, kt�re pomog� mu przetrwa� pierwsze ci�kie dni trze�wo�ci.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Ci�gle jeszcze kr�ci mi si� w g�owie, ale og�lnie jest o wiele lepiej.
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
	description = "Alkohol uderzy� do g��wki, co?";
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
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Alkohol uderzy� do g��wki, co?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//Ju� nigdy ani kropelki. Nigdy w �yciu. S�owo honoru.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "Prosz�, to powinno z�agodzi� objawy odstawienia trunk�w.";
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
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Prosz�, to powinno z�agodzi� objawy odstawienia trunk�w.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Och! Dzi�ki, stary. Nareszcie troch� odpoczn�.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Jak ja ci si� odwdzi�cz�?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//Te kilka monet to niewiele, wiem. Ale to ostatnie pieni�dze, jakie mi zosta�y.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Zap�aci�em za ciebie kup� kasy, a ty dajesz mi kilka �mierdz�cych monet? To nawet nie pokryje moich wydatk�w.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Mog� si� chyba uzna� za szcz�liwca. Niecz�sto spotyka si� tak pomocnych paladyn�w. Nie s�dzisz?
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


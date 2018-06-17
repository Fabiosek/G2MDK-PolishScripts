
instance DIA_BALTRAM_EXIT(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 999;
	condition = dia_baltram_exit_condition;
	information = dia_baltram_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_baltram_exit_condition()
{
	return TRUE;
};

func void dia_baltram_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_HALLO(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_hallo_condition;
	information = dia_baltram_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_NAGUR_BOTE == FALSE))
	{
		return TRUE;
	};
};

func void dia_baltram_hallo_info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Witaj, przybyszu. Nazywam siê Baltram. Przyszed³eœ uzupe³niæ zapasy jedzenia?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Niestety, muszê ciê rozczarowaæ. W tej chwili nie mam zbyt wielu zapasów.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale wkrótce dostanê now¹ dostawê.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Jeœli przyszed³eœ, ¿eby kupiæ jedzenie, to mo¿esz ju¿ odejœæ.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Wy, najemnicy, nic mnie nie obchodzicie! Mam przez was tylko k³opoty.
	};
};


instance DIA_ADDON_BALTRAM_LARESABLOESE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 1;
	condition = dia_addon_baltram_laresabloese_condition;
	information = dia_addon_baltram_laresabloese_info;
	important = TRUE;
};


func int dia_addon_baltram_laresabloese_condition()
{
	if(Npc_IsInState(self,zs_talk) && (SCISWEARINGRANGERRING == TRUE) && (MIS_LARES_BRINGRANGERTOME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_laresabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Sk¹d ten sceptycyzm?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//Widzê u ciebie znak Wodnego Krêgu.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//Jesteœ jego cz³onkiem?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//A jeœli tak?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//To wiedz, ¿e Laresowi marzy siê zmiana pracy i odwo³anie z placówki w porcie.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Zobaczê, czy uda mi siê znaleŸæ kogoœ, kto zechcia³by go zast¹piæ.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//Rozumiem.
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Baltram, kupiec z targowiska, zajmie siê zorganizowaniem zastêpcy dla Laresa. Mo¿e Lares NARESZCIE opuœci port.");
	SC_KNOWSBALTRAMASRANGER = TRUE;
	BALTRAM_EXCHANGE4LARES = TRUE;
};


instance DIA_BALTRAM_JOB(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 3;
	condition = dia_baltram_job_condition;
	information = dia_baltram_job_info;
	permanent = FALSE;
	description = "Masz dla mnie jak¹œ robotê?";
};


func int dia_baltram_job_condition()
{
	if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baltram_job_info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Masz dla mnie jak¹œ pracê?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Nie, mam ju¿ ch³opca na posy³ki. Porozmawiaj z innymi kupcami.
};


instance DIA_BALTRAM_TRICK(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_trick_condition;
	information = dia_baltram_trick_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_trick_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_baltram_trick_info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Szukasz pracy?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasne, a o co chodzi?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//Mój ch³opiec na posy³ki nie wróci³, a czekam na dostawê od farmera Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A ile na tym zarobiê?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Dam ci 50 sztuk z³ota.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Œwietnie, zajmê siê tym.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//W porz¹dku, powiedz Akilowi, ¿e ja ciê przys³a³em. Dostaniesz od niego paczkê. Przynieœ j¹ do mnie.
	MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
	b_logentry(TOPIC_NAGUR,"Baltram zatrudni³ mnie jako ch³opca na posy³ki. Mam przynieœæ przesy³kê z farmy Akila.");
	Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
	b_logentry(TOPIC_BALTRAM,"Jeœli przyniosê Baltramowi przesy³kê, zap³aci mi 50 sztuk z³ota.");
};


var int baltram_tradelog;

instance DIA_BALTRAM_WAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_warez_condition;
	information = dia_baltram_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje towary.";
};


func int dia_baltram_warez_condition()
{
	return TRUE;
};

func void dia_baltram_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Poka¿ mi swoje towary.
	if(BALTRAM_TRADELOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Baltram sprzedaje na targowisku ¿ywnoœæ.");
		BALTRAM_TRADELOG = TRUE;
	};
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Nie powinni byli do tego dopuœciæ. No i jeden z najemników zamordowa³ paladyna.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Coœ siê musia³o w koñcu staæ!
	};
	if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Tacy jak ty nic ode mnie nie dostan¹.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Najpierw podjudzasz wieœniaków, a potem udajesz, ¿e nic siê nie sta³o.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//A teraz zje¿d¿aj, odstraszasz mi klientów.
		MIS_BALTRAMTRADE = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_BALTRAM_SKIP(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skip_condition;
	information = dia_addon_baltram_skip_info;
	description = "Handlujesz z piratami?";
};


func int dia_addon_baltram_skip_condition()
{
	if(SCKNOWSBALTRAMASPIRATETRADER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skip_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//Handlujesz z piratami?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//Co? Kto tak mówi?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//Jeden z nich... Chyba czeka na ciebie w swojej zatoczce.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//A co mia³em zrobiæ? Czasy s¹ ciê¿kie, jakoœ trzeba zarobiæ na chleb.
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"A nie boisz siê schwytania na gor¹cym uczynku?",dia_addon_baltram_skip_erwischen);
	Info_AddChoice(dia_addon_baltram_skip,"A pomyœla³eœ o konsekwencjach?",dia_addon_baltram_skip_mil);
};

func void dia_addon_baltram_skip_back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//Tylko tyle chcia³em wiedzieæ.
	Info_ClearChoices(dia_addon_baltram_skip);
};

func void dia_addon_baltram_skip_mil()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//A pomyœla³eœ o konsekwencjach?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Powiem ci wszystko, co wiem, a ty mnie nie zakapujesz. Umowa stoi?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Czym z nimi handlujesz?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"Co wiesz o piratach?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//A nie boisz siê schwytania na gor¹cym uczynku?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//To mo¿liwe - w koñcu tobie uda³o siê o tym dowiedzieæ...
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//Ale nikomu nie powiesz, prawda?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Czym z nimi handlujesz?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"Co wiesz o piratach?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//Czym z nimi handlujesz?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//Z regu³y dostarczam im ¿ywnoœæ.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//W zamian otrzymujê najlepszy rum, jaki trafia do Khorinis.
	Info_AddChoice(dia_addon_baltram_skip,"Tylko tyle chcia³em wiedzieæ.",dia_addon_baltram_skip_back);
	Info_AddChoice(dia_addon_baltram_skip,"Mogê ci pomóc w interesach.",dia_addon_baltram_skip_ich);
};

func void dia_addon_baltram_skip_ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//Mogê ci pomóc w interesach.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//Niez³y pomys³ - ja nie mogê na razie opuszczaæ Khorinis.
	CreateInvItems(self,itmi_packet_baltram4skip_addon,1);
	b_giveinvitems(self,other,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//WeŸ tê paczkê i powiedz Skipowi, ¿eby tym razem nie ¿a³owa³ rumu.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//Oczekujê co najmniej trzech butli.
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Baltram da³ mi przesy³kê. Powinienem j¹ zanieœæ Skipowi.");
	MIS_ADDON_BALTRAM_PAKET4SKIP = LOG_RUNNING;
};

func void dia_addon_baltram_skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//Co wiesz o piratach?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//Zamieszkuj¹ ukryt¹ czêœæ wyspy.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//O ile mi wiadomo, mo¿na tam dotrzeæ jedynie statkiem.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//Mieszkañcy Khorinis obawiaj¹ siê piratów - i s³usznie. To banda œmierdz¹cych rzezimieszków...
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Choæ moim zdaniem i tak piraci s¹ lepsi od bandytów.
};


instance DIA_ADDON_BALTRAM_SKIPSRUM(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skipsrum_condition;
	information = dia_addon_baltram_skipsrum_info;
	description = "Mam rum, tylko ¿e Skip da³ mi jedynie dwie butle.";
};


func int dia_addon_baltram_skipsrum_condition()
{
	if((SKIP_RUM4BALTRAM == TRUE) && (MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && (Npc_HasItems(other,itfo_addon_rum) >= 2))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skipsrum_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//Mam rum, tylko ¿e Skip da³ mi jedynie dwie butle.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//Drogo, bardzo drogo... Za kogo siê ten Skip uwa¿a? No nic, dawaj.
	b_giveinvitems(other,self,itfo_addon_rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//Nie mogê daæ ci zbyt wiele w zamian. To wszystko.
	CreateInvItems(self,itmi_gold,10);
	b_giveinvitems(self,other,itmi_gold,10);
	TOPIC_END_BALTRAMSKIPTRADE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_akilshof_condition;
	information = dia_baltram_akilshof_info;
	permanent = FALSE;
	description = "Jak trafiæ do gospodarstwa Akila?";
};


func int dia_baltram_akilshof_condition()
{
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_baltram_akilshof_info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Jak trafiæ do gospodarstwa Akila?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//WyjdŸ st¹d przez wschodni¹ bramê i idŸ drog¹ na po³udniowy wschód.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chwili dojdziesz do kamiennych schodów. WejdŸ po nich i zobaczysz gospodarstwo Akila.
};


instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_baltram_lieferung_condition;
	information = dia_baltram_lieferung_info;
	permanent = FALSE;
	description = "Mam przesy³kê od Akila.";
};


func int dia_baltram_lieferung_condition()
{
	if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_baltram_lieferung_info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Mam przesy³kê od Akila.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Doskonale. Znowu mogê oferowaæ œwie¿y towar. Oto twoje 50 sztuk z³ota.
	b_giveinvitems(other,self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
	MIS_NAGUR_BOTE = LOG_FAILED;
	b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
	Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	CreateInvItems(self,itfo_cheese,5);
	CreateInvItems(self,itfo_apple,10);
	CreateInvItems(self,itfo_beer,5);
	CreateInvItems(self,itfo_bacon,5);
	CreateInvItems(self,itfo_sausage,5);
};


instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_letustrade_condition;
	information = dia_baltram_letustrade_info;
	permanent = FALSE;
	description = "Nie mo¿emy mimo wszystko robiæ wspólnie interesów?";
};


func int dia_baltram_letustrade_condition()
{
	if(MIS_BALTRAMTRADE == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baltram_letustrade_info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Nie mo¿emy mimo wszystko robiæ wspólnie interesów?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//S³uchaj, jeœli dostarczysz mi 10 szynek i 10 butelek wina, to znowu ubijemy interes.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Zobaczê, co siê da zrobiæ.
	MIS_BALTRAMTRADE = LOG_RUNNING;
};


var int baltramenoughbacon;
var int baltramenoughwine;

instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_haveyourwarez_condition;
	information = dia_baltram_haveyourwarez_info;
	permanent = TRUE;
	description = "Mam to, czego chcia³eœ.";
};


func int dia_baltram_haveyourwarez_condition()
{
	if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baltram_haveyourwarez_info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Mam to, czego chcia³eœ.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Poka¿.
	if(Npc_HasItems(other,itfo_bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Umówiliœmy siê na 10 szynek. PrzyjdŸ do mnie, jak bêdziesz tyle mia³.
		BALTRAMENOUGHBACON = FALSE;
	}
	else
	{
		BALTRAMENOUGHBACON = TRUE;
	};
	if(Npc_HasItems(other,itfo_wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co z 10 butelkami wina? Zapomnia³eœ?
		BALTRAMENOUGHWINE = FALSE;
	}
	else
	{
		BALTRAMENOUGHWINE = TRUE;
	};
	if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmmm, nie jest najlepsze, ale w dzisiejszych czasach nie mo¿na byæ zbyt wybrednym.
		b_giveinvitems(other,self,itfo_bacon,10);
		b_giveinvitems(other,self,itfo_wine,10);
		MIS_BALTRAMTRADE = LOG_SUCCESS;
		b_giveplayerxp(XP_BALTRAMTRADE);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//No, teraz mo¿emy przejœæ do interesów.
	};
};


instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 900;
	condition = dia_baltram_pickpocket_condition;
	information = dia_baltram_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_baltram_pickpocket_condition()
{
	return c_beklauen(76,175);
};

func void dia_baltram_pickpocket_info()
{
	Info_ClearChoices(dia_baltram_pickpocket);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};

func void dia_baltram_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_baltram_pickpocket);
};

func void dia_baltram_pickpocket_back()
{
	Info_ClearChoices(dia_baltram_pickpocket);
};


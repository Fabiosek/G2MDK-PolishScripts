
instance DIA_WOLF_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_exit_condition;
	information = dia_wolf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_wolf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_HALLO(C_INFO)
{
	npc = sld_811_wolf;
	nr = 4;
	condition = dia_wolf_hallo_condition;
	information = dia_wolf_hallo_info;
	permanent = FALSE;
	description = "Wszystko w porz¹dku?";
};


func int dia_wolf_hallo_condition()
{
	return TRUE;
};

func void dia_wolf_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, ja ciê znam! By³eœ w Kolonii!
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Czego tu szukasz?
};


instance DIA_WOLF_WANNAJOIN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 5;
	condition = dia_wolf_wannajoin_condition;
	information = dia_wolf_wannajoin_info;
	permanent = FALSE;
	description = "Chcê siê do was przy³¹czyæ.";
};


func int dia_wolf_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_wolf_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//Chcê siê do was przy³¹czyæ.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Czemu nie. Nie mam nic przeciwko tobie. W koñcu pomog³eœ nam wtedy odbiæ kopalniê z r¹k stra¿ników.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Tylko nie myœl, ¿e z pozosta³ymi pójdzie ci równie ³atwo.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Do³¹czy³o do nas wielu nowych, a niektórzy ze starej bandy mog¹ ciê ju¿ nie pamiêtaæ.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//Nawet ja ledwo ciê pozna³em. Nie wygl¹dasz najlepiej.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Po upadku Bariery ledwo uszed³em z ¿yciem.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//No to i tak mia³eœ szczêœcie.
	b_logentry(TOPIC_SLDRESPEKT,"Wilk nie sprzeciwia siê mojemu wst¹pieniu w szeregi najemników.");
};


instance DIA_WOLF_WANNABUY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 6;
	condition = dia_wolf_wannabuy_condition;
	information = dia_wolf_wannabuy_info;
	permanent = FALSE;
	description = "Masz coœ do sprzedania?";
};


func int dia_wolf_wannabuy_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_wannabuy_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Masz coœ do sprzedania?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Nawet nie pytaj.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//Naszym orê¿em i pancerzami zajmuje siê teraz jeden z nowych - Bennet.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//W Kolonii odpowiada³em za ca³¹ zbrojowniê Lee, a tutaj proszê: pojawia siê zawodowy kowal i rach-ciach - straci³em robotê.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Potrzebujê jakiejœ ciekawej pracy, choæby nawet przy pilnowaniu farm.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Byle tylko nie siedzieæ tutaj z za³o¿onymi rêkami.
};


instance DIA_WOLF_WANNALEARN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 7;
	condition = dia_wolf_wannalearn_condition;
	information = dia_wolf_wannalearn_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_wolf_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_wannalearn_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Jeœli chcesz, mogê ci pokazaæ, jak sprawniej pos³ugiwaæ siê ³ukiem. I tak nie mam teraz nic lepszego do roboty.
	WOLF_TEACHBOW = TRUE;
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Wilk mo¿e mnie nauczyæ, jak pos³ugiwaæ siê ³ukiem.");
};


var int wolf_merke_bow;

instance DIA_WOLF_TEACH(C_INFO)
{
	npc = sld_811_wolf;
	nr = 8;
	condition = dia_wolf_teach_condition;
	information = dia_wolf_teach_info;
	permanent = TRUE;
	description = "Chcê siê nauczyæ czegoœ o ³ucznictwie.";
};


func int dia_wolf_teach_condition()
{
	if(WOLF_TEACHBOW == TRUE)
	{
		return TRUE;
	};
};

func void dia_wolf_teach_info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Chcê siê nauczyæ czegoœ o ³ucznictwie.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Czego mogê ciê nauczyæ?
	WOLF_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};

func void dia_wolf_teach_back()
{
	if(WOLF_MERKE_BOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//No i proszê. Od razu poprawi³a siê twoja celnoœæ.
	};
	Info_ClearChoices(dia_wolf_teach);
};

func void dia_wolf_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};

func void dia_wolf_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};


instance DIA_WOLF_PERM(C_INFO)
{
	npc = sld_811_wolf;
	nr = 9;
	condition = dia_wolf_perm_condition;
	information = dia_wolf_perm_info;
	permanent = TRUE;
	description = "Co s³ychaæ? Znalaz³eœ ju¿ jak¹œ pracê?";
};


func int dia_wolf_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_wannabuy) && (MIS_BENGARSHELPINGSLD == 0) && (WOLF_ISONBOARD != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_wolf_perm_info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Co s³ychaæ? Znalaz³eœ ju¿ jak¹œ pracê?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Jeszcze nie. Daj mi znaæ, gdybyœ mia³ dla mnie jak¹œ robotê.
};


instance DIA_WOLF_STADT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 10;
	condition = dia_wolf_stadt_condition;
	information = dia_wolf_stadt_info;
	permanent = FALSE;
	description = "Próbowa³eœ szukaæ pracy w mieœcie?";
};


func int dia_wolf_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_wannabuy) && (MIS_BENGARSHELPINGSLD == 0) && (WOLF_ISONBOARD != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_wolf_stadt_info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Próbowa³eœ szukaæ pracy w mieœcie?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//W mieœcie? Musia³byœ mnie tam koñmi zaci¹gn¹æ.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//A co, mo¿e myœlisz, ¿e chcia³bym pracowaæ w stra¿y? Taaa... ju¿ sobie wyobra¿am: ja w mundurze stra¿nika!
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//I jeszcze te ci¹g³e rozkazy. Nie, nie ma mowy. Mo¿e i na farmie nie jest za du¿o roboty, ale przynajmniej nikt mn¹ nie pomiata.
};


var int mis_wolf_bringcrawlerplates;
var int wolf_makearmor;
var int player_gotcrawlerarmor;

instance DIA_WOLF_ABOUTCRAWLER(C_INFO)
{
	npc = sld_811_wolf;
	nr = 1;
	condition = dia_wolf_aboutcrawler_condition;
	information = dia_wolf_aboutcrawler_info;
	permanent = FALSE;
	description = "Podobno umiesz sporz¹dzaæ zbroje z pancerzy pe³zaczy?";
};


func int dia_wolf_aboutcrawler_condition()
{
	if((KAPITEL >= 2) && (WOLF_PRODUCECRAWLERARMOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_aboutcrawler_info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Podobno umiesz sporz¹dzaæ zbroje z pancerzy pe³zaczy?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//Tak, to prawda. Sk¹d wiesz?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//Powiedzia³ mi o tym myœliwy imieniem Gestath.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Móg³byœ zrobiæ tak¹ zbrojê dla mnie?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Jasne. Przynieœ mi tylko 10 pancerzy pe³zaczy.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//Ile to bêdzie kosztowaæ?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Nie ma o czym mówiæ. Nie wezmê pieniêdzy od starego druha.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_RUNNING);
	b_logentry(TOPIC_WOLF_BRINGCRAWLERPLATES,"Wilk mo¿e zrobiæ dla mnie zbrojê z 10 pancerzy pe³zacza.");
};


instance DIA_WOLF_TEACHCRAWLERPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_teachcrawlerplates_condition;
	information = dia_wolf_teachcrawlerplates_info;
	permanent = TRUE;
	description = b_buildlearnstring("Naucz mnie zdzierania p³yt pancerza z pe³zaczy!",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE));
};


func int dia_wolf_teachcrawlerplates_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_aboutcrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_teachcrawlerplates_info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Naucz mnie zdejmowaæ pancerze z martwych pe³zaczy.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To proste. Pancerze przylegaj¹ do cia³a tylko na krawêdziach. WeŸ po prostu ostry nó¿ i wytnij je wzd³u¿ brzegów.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Zapamiêta³eœ?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//To nic trudnego.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//W rzeczy samej.
	};
};


instance DIA_WOLF_BRINGPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 3;
	condition = dia_wolf_bringplates_condition;
	information = dia_wolf_bringplates_info;
	permanent = TRUE;
	description = "Mam dla ciebie pancerze pe³zaczy na zbrojê.";
};


func int dia_wolf_bringplates_condition()
{
	if((MIS_WOLF_BRINGCRAWLERPLATES == LOG_RUNNING) && (Npc_HasItems(other,itat_crawlerplate) >= 10))
	{
		return TRUE;
	};
};

func void dia_wolf_bringplates_info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Mam dla ciebie pancerze pe³zaczy na zbrojê.
	b_giveinvitems(other,self,itat_crawlerplate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Œwietnie! Poka¿.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_SUCCESS;
};


var int wolf_armor_day;

instance DIA_WOLF_ARMORREADY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 4;
	condition = dia_wolf_armorready_condition;
	information = dia_wolf_armorready_info;
	permanent = TRUE;
	description = "I co z t¹ zbroj¹?";
};


func int dia_wolf_armorready_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_aboutcrawler) && (PLAYER_GOTCRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_armorready_info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//I co z t¹ zbroj¹?
	if(Npc_HasItems(self,itat_crawlerplate) >= 10)
	{
		if(WOLF_MAKEARMOR == FALSE)
		{
			WOLF_ARMOR_DAY = Wld_GetDay() + 1;
			WOLF_MAKEARMOR = TRUE;
		};
		if((WOLF_MAKEARMOR == TRUE) && (WOLF_ARMOR_DAY > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Bez obaw, zrobiê j¹ dla ciebie. Bêdzie gotowa na jutro.
		}
		else
		{
			CreateInvItems(self,itar_djg_crawler,1);
			Npc_RemoveInvItems(self,itat_crawlerplate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Ju¿ skoñczona. Proszê.
			b_giveinvitems(self,other,itar_djg_crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Moim zdaniem wygl¹da ca³kiem nieŸle.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Dziêki!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Nie ma sprawy.
			PLAYER_GOTCRAWLERARMOR = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//¯arty siê ciebie trzymaj¹? A gdzie masz pancerze pe³zaczy?
		WOLF_MAKEARMOR = FALSE;
		MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	};
};


instance DIA_WOLF_KAP3_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap3_exit_condition;
	information = dia_wolf_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_wolf_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_BENGAR(C_INFO)
{
	npc = sld_811_wolf;
	nr = 31;
	condition = dia_wolf_bengar_condition;
	information = dia_wolf_bengar_info;
	permanent = TRUE;
	description = "Chyba znalaz³em na farmie Bengara pracê w sam raz dla ciebie.";
};


func int dia_wolf_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo) && (MIS_BENGARSHELPINGSLD == LOG_RUNNING) && (KAPITEL >= 3) && (WOLF_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_wolf_bengar_onetime;
var int wolf_bengar_geld;

func void dia_wolf_bengar_info()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Chyba znalaz³em na farmie Bengara pracê w sam raz dla ciebie.
	if(DIA_WOLF_BENGAR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//S³ucham.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Prze³êcz do Górniczej Doliny koñczy siê tu¿ przy farmie Bengara. Biedak ma wiêc mnóstwo problemów z ró¿nymi bestiami, które schodz¹ z gór.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Przyda³by mu siê ktoœ o obrony farmy.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//To rzeczywiœcie niez³a propozycja. Przynajmniej nie musia³bym tu siedzieæ i gapiæ siê têsknym wzrokiem na kuŸniê.
		DIA_WOLF_BENGAR_ONETIME = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//W porz¹dku. Jako ¿e jesteœ jednym z nas, z³o¿ê ci specjaln¹ ofertê. Daj mi 300 sztuk z³ota i mogê ruszaæ w drogê.
		WOLF_BENGAR_GELD = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//W porz¹dku. To bêdzie kosztowa³o... 800 sztuk z³ota.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To du¿o pieniêdzy.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//Có¿, dla jednego z nas zrobi³bym to za po³owê ceny. Ale dla ciebie...
		WOLF_BENGAR_GELD = 800;
	};
	Info_ClearChoices(dia_wolf_bengar);
	Info_AddChoice(dia_wolf_bengar,"Muszê siê zastanowiæ.",dia_wolf_bengar_nochnicht);
	Info_AddChoice(dia_wolf_bengar,"Oto twoje z³oto.",dia_wolf_bengar_geld);
};

func void dia_wolf_bengar_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Oto twoje z³oto.
	if(b_giveinvitems(other,self,itmi_gold,WOLF_BENGAR_GELD))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Œwietnie. Nim wyruszê na farmê Bengara, zastanowiê siê, kogo móg³bym zabraæ ze sob¹.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Do zobaczenia!
		MIS_BENGARSHELPINGSLD = LOG_SUCCESS;
		b_giveplayerxp(XP_BENGARSHELPINGSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		b_startotherroutine(sld_815_soeldner,"BengarsFarm");
		b_startotherroutine(sld_817_soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//Có¿, gdybyœ mia³ pieni¹dze, móg³bym od razu ruszaæ w drogê.
	};
	Info_ClearChoices(dia_wolf_bengar);
};

func void dia_wolf_bengar_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Zastanowiê siê jeszcze.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Jak chcesz. Tylko mnie nie zawiedŸ!
	Info_ClearChoices(dia_wolf_bengar);
};


instance DIA_WOLF_PERMKAP3(C_INFO)
{
	npc = sld_811_wolf;
	nr = 80;
	condition = dia_wolf_permkap3_condition;
	information = dia_wolf_permkap3_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_wolf_permkap3_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (WOLF_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_wolf_permkap3_onetime;

func void dia_wolf_permkap3_info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Wszystko w porz¹dku?
	if(Npc_IsDead(bengar) && (DIA_WOLF_PERMKAP3_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//Mój pracodawca nie ¿yje. Ale co robiæ? Zawsze chcia³em mieæ w³asn¹ farmê.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_WOLF_PERMKAP3_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//Tak, cisza i spokój.
	};
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_KAP4_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap4_exit_condition;
	information = dia_wolf_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_wolf_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_KAP5_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap5_exit_condition;
	information = dia_wolf_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_wolf_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


var int wolf_saidno;

instance DIA_WOLF_SHIP(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_ship_condition;
	information = dia_wolf_ship_info;
	description = "Masz mo¿e ochotê wyrwaæ siê st¹d na pok³adzie okrêtu?";
};


func int dia_wolf_ship_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_ship_info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Nie chcia³byœ wyp³yn¹æ ze mn¹ w morze?
	if((MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && !Npc_IsDead(bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Nie, ju¿ nie. Znalaz³em dla siebie odpowiednie miejsce. Mo¿e innym razem.
		WOLF_SAIDNO = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//Jasne, czemu nie. Chêtnie siê st¹d wyniosê. Mogê równie dobrze broniæ twojego statku. Dok¹d p³yniemy?
		MIS_BENGARSHELPINGSLD = LOG_OBSOLETE;
		Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
		b_logentry(TOPIC_CREW,"Wilk ma ju¿ doœæ tej wyspy i gotów jest zrobiæ wszystko, ¿eby siê st¹d wydostaæ. Jest dobrym wojownikiem.");
	};
};


instance DIA_WOLF_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_knowwhereenemy_condition;
	information = dia_wolf_knowwhereenemy_info;
	permanent = TRUE;
	description = "Niedaleko. Na poblisk¹ wyspê.";
};


func int dia_wolf_knowwhereenemy_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_ship) && (WOLF_SAIDNO == FALSE) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (WOLF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Niedaleko. Na poblisk¹ wyspê.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No to na co czekamy? Podczas podró¿y mogê ciê jeszcze poduczyæ ³ucznictwa i strzelania z kuszy.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Przypomnia³em sobie, ¿e jednak mam ju¿ doœæ ludzi.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//A wiêc to tak?! Najpierw obiecujesz z³ote góry, a potem ka¿esz mi spadaæ, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Sp³ywaj! Mam nadziejê, ¿e ta twoja balia utonie w pó³ drogi.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(dia_wolf_knowwhereenemy);
		Info_AddChoice(dia_wolf_knowwhereenemy,"Muszê siê nad tym jeszcze zastanowiæ.",dia_wolf_knowwhereenemy_no);
		Info_AddChoice(dia_wolf_knowwhereenemy,"Witamy na pok³adzie!",dia_wolf_knowwhereenemy_yes);
	};
};

func void dia_wolf_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Witamy na pok³adzie!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//ZejdŸ na przystañ. Wkrótce odp³ywamy.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Ju¿ idê.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	WOLF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void dia_wolf_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Muszê siê nad tym jeszcze zastanowiæ.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Wiesz co? Nie wierzê ju¿ w ani jedno twoje s³owo. ZejdŸ mi z oczu.
	WOLF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_wolf_knowwhereenemy);
};


instance DIA_WOLF_LEAVEMYSHIP(C_INFO)
{
	npc = sld_811_wolf;
	nr = 55;
	condition = dia_wolf_leavemyship_condition;
	information = dia_wolf_leavemyship_info;
	permanent = TRUE;
	description = "Jednak mi siê nie przydasz.";
};


func int dia_wolf_leavemyship_condition()
{
	if((WOLF_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_leavemyship_info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Jednak mi siê nie przydasz.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Najpierw dajesz mi nadziejê, a potem ka¿esz spadaæ? Jesteœ draniem, jakich ma³o. Zap³acisz mi za to.
	WOLF_ISONBOARD = LOG_FAILED;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_WOLF_SHIPOFF(C_INFO)
{
	npc = sld_811_wolf;
	nr = 56;
	condition = dia_wolf_shipoff_condition;
	information = dia_wolf_shipoff_info;
	permanent = TRUE;
	description = "S³uchaj.";
};


func int dia_wolf_shipoff_condition()
{
	if(WOLF_ISONBOARD == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_wolf_shipoff_info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//S³uchaj.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Odwal siê, sukinsynu.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_WOLF_KAP6_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap6_exit_condition;
	information = dia_wolf_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_wolf_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_PICKPOCKET(C_INFO)
{
	npc = sld_811_wolf;
	nr = 900;
	condition = dia_wolf_pickpocket_condition;
	information = dia_wolf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_wolf_pickpocket_condition()
{
	return c_beklauen(32,35);
};

func void dia_wolf_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_pickpocket);
	Info_AddChoice(dia_wolf_pickpocket,DIALOG_BACK,dia_wolf_pickpocket_back);
	Info_AddChoice(dia_wolf_pickpocket,DIALOG_PICKPOCKET,dia_wolf_pickpocket_doit);
};

func void dia_wolf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wolf_pickpocket);
};

func void dia_wolf_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_pickpocket);
};



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
	description = "Wszystko w porz�dku?";
};


func int dia_wolf_hallo_condition()
{
	return TRUE;
};

func void dia_wolf_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hej, ja ci� znam! By�e� w Kolonii!
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Czego tu szukasz?
};


instance DIA_WOLF_WANNAJOIN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 5;
	condition = dia_wolf_wannajoin_condition;
	information = dia_wolf_wannajoin_info;
	permanent = FALSE;
	description = "Chc� si� do was przy��czy�.";
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
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//Chc� si� do was przy��czy�.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Czemu nie. Nie mam nic przeciwko tobie. W ko�cu pomog�e� nam wtedy odbi� kopalni� z r�k stra�nik�w.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Tylko nie my�l, �e z pozosta�ymi p�jdzie ci r�wnie �atwo.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Do��czy�o do nas wielu nowych, a niekt�rzy ze starej bandy mog� ci� ju� nie pami�ta�.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//Nawet ja ledwo ci� pozna�em. Nie wygl�dasz najlepiej.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Po upadku Bariery ledwo uszed�em z �yciem.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//No to i tak mia�e� szcz�cie.
	b_logentry(TOPIC_SLDRESPEKT,"Wilk nie sprzeciwia si� mojemu wst�pieniu w szeregi najemnik�w.");
};


instance DIA_WOLF_WANNABUY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 6;
	condition = dia_wolf_wannabuy_condition;
	information = dia_wolf_wannabuy_info;
	permanent = FALSE;
	description = "Masz co� do sprzedania?";
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
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Masz co� do sprzedania?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Nawet nie pytaj.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//Naszym or�em i pancerzami zajmuje si� teraz jeden z nowych - Bennet.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//W Kolonii odpowiada�em za ca�� zbrojowni� Lee, a tutaj prosz�: pojawia si� zawodowy kowal i rach-ciach - straci�em robot�.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Potrzebuj� jakiej� ciekawej pracy, cho�by nawet przy pilnowaniu farm.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Byle tylko nie siedzie� tutaj z za�o�onymi r�kami.
};


instance DIA_WOLF_WANNALEARN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 7;
	condition = dia_wolf_wannalearn_condition;
	information = dia_wolf_wannalearn_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Je�li chcesz, mog� ci pokaza�, jak sprawniej pos�ugiwa� si� �ukiem. I tak nie mam teraz nic lepszego do roboty.
	WOLF_TEACHBOW = TRUE;
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Wilk mo�e mnie nauczy�, jak pos�ugiwa� si� �ukiem.");
};


var int wolf_merke_bow;

instance DIA_WOLF_TEACH(C_INFO)
{
	npc = sld_811_wolf;
	nr = 8;
	condition = dia_wolf_teach_condition;
	information = dia_wolf_teach_info;
	permanent = TRUE;
	description = "Chc� si� nauczy� czego� o �ucznictwie.";
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
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Chc� si� nauczy� czego� o �ucznictwie.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Czego mog� ci� nauczy�?
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
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//No i prosz�. Od razu poprawi�a si� twoja celno��.
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
	description = "Co s�ycha�? Znalaz�e� ju� jak�� prac�?";
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
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Co s�ycha�? Znalaz�e� ju� jak�� prac�?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Jeszcze nie. Daj mi zna�, gdyby� mia� dla mnie jak�� robot�.
};


instance DIA_WOLF_STADT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 10;
	condition = dia_wolf_stadt_condition;
	information = dia_wolf_stadt_info;
	permanent = FALSE;
	description = "Pr�bowa�e� szuka� pracy w mie�cie?";
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
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Pr�bowa�e� szuka� pracy w mie�cie?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//W mie�cie? Musia�by� mnie tam ko�mi zaci�gn��.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//A co, mo�e my�lisz, �e chcia�bym pracowa� w stra�y? Taaa... ju� sobie wyobra�am: ja w mundurze stra�nika!
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//I jeszcze te ci�g�e rozkazy. Nie, nie ma mowy. Mo�e i na farmie nie jest za du�o roboty, ale przynajmniej nikt mn� nie pomiata.
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
	description = "Podobno umiesz sporz�dza� zbroje z pancerzy pe�zaczy?";
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
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Podobno umiesz sporz�dza� zbroje z pancerzy pe�zaczy?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//Tak, to prawda. Sk�d wiesz?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//Powiedzia� mi o tym my�liwy imieniem Gestath.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//M�g�by� zrobi� tak� zbroj� dla mnie?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Jasne. Przynie� mi tylko 10 pancerzy pe�zaczy.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//Ile to b�dzie kosztowa�?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Nie ma o czym m�wi�. Nie wezm� pieni�dzy od starego druha.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_RUNNING);
	b_logentry(TOPIC_WOLF_BRINGCRAWLERPLATES,"Wilk mo�e zrobi� dla mnie zbroj� z 10 pancerzy pe�zacza.");
};


instance DIA_WOLF_TEACHCRAWLERPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_teachcrawlerplates_condition;
	information = dia_wolf_teachcrawlerplates_info;
	permanent = TRUE;
	description = b_buildlearnstring("Naucz mnie zdzierania p�yt pancerza z pe�zaczy!",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE));
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
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Naucz mnie zdejmowa� pancerze z martwych pe�zaczy.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//To proste. Pancerze przylegaj� do cia�a tylko na kraw�dziach. We� po prostu ostry n� i wytnij je wzd�u� brzeg�w.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Zapami�ta�e�?
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
	description = "Mam dla ciebie pancerze pe�zaczy na zbroj�.";
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
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Mam dla ciebie pancerze pe�zaczy na zbroj�.
	b_giveinvitems(other,self,itat_crawlerplate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//�wietnie! Poka�.
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
	description = "I co z t� zbroj�?";
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
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//I co z t� zbroj�?
	if(Npc_HasItems(self,itat_crawlerplate) >= 10)
	{
		if(WOLF_MAKEARMOR == FALSE)
		{
			WOLF_ARMOR_DAY = Wld_GetDay() + 1;
			WOLF_MAKEARMOR = TRUE;
		};
		if((WOLF_MAKEARMOR == TRUE) && (WOLF_ARMOR_DAY > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Bez obaw, zrobi� j� dla ciebie. B�dzie gotowa na jutro.
		}
		else
		{
			CreateInvItems(self,itar_djg_crawler,1);
			Npc_RemoveInvItems(self,itat_crawlerplate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Ju� sko�czona. Prosz�.
			b_giveinvitems(self,other,itar_djg_crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Moim zdaniem wygl�da ca�kiem nie�le.
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Dzi�ki!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Nie ma sprawy.
			PLAYER_GOTCRAWLERARMOR = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//�arty si� ciebie trzymaj�? A gdzie masz pancerze pe�zaczy?
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
	description = "Chyba znalaz�em na farmie Bengara prac� w sam raz dla ciebie.";
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
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Chyba znalaz�em na farmie Bengara prac� w sam raz dla ciebie.
	if(DIA_WOLF_BENGAR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//S�ucham.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Prze��cz do G�rniczej Doliny ko�czy si� tu� przy farmie Bengara. Biedak ma wi�c mn�stwo problem�w z r�nymi bestiami, kt�re schodz� z g�r.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Przyda�by mu si� kto� o obrony farmy.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//To rzeczywi�cie niez�a propozycja. Przynajmniej nie musia�bym tu siedzie� i gapi� si� t�sknym wzrokiem na ku�ni�.
		DIA_WOLF_BENGAR_ONETIME = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//W porz�dku. Jako �e jeste� jednym z nas, z�o�� ci specjaln� ofert�. Daj mi 300 sztuk z�ota i mog� rusza� w drog�.
		WOLF_BENGAR_GELD = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//W porz�dku. To b�dzie kosztowa�o... 800 sztuk z�ota.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//To du�o pieni�dzy.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//C�, dla jednego z nas zrobi�bym to za po�ow� ceny. Ale dla ciebie...
		WOLF_BENGAR_GELD = 800;
	};
	Info_ClearChoices(dia_wolf_bengar);
	Info_AddChoice(dia_wolf_bengar,"Musz� si� zastanowi�.",dia_wolf_bengar_nochnicht);
	Info_AddChoice(dia_wolf_bengar,"Oto twoje z�oto.",dia_wolf_bengar_geld);
};

func void dia_wolf_bengar_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Oto twoje z�oto.
	if(b_giveinvitems(other,self,itmi_gold,WOLF_BENGAR_GELD))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//�wietnie. Nim wyrusz� na farm� Bengara, zastanowi� si�, kogo m�g�bym zabra� ze sob�.
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
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//C�, gdyby� mia� pieni�dze, m�g�bym od razu rusza� w drog�.
	};
	Info_ClearChoices(dia_wolf_bengar);
};

func void dia_wolf_bengar_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Zastanowi� si� jeszcze.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Jak chcesz. Tylko mnie nie zawied�!
	Info_ClearChoices(dia_wolf_bengar);
};


instance DIA_WOLF_PERMKAP3(C_INFO)
{
	npc = sld_811_wolf;
	nr = 80;
	condition = dia_wolf_permkap3_condition;
	information = dia_wolf_permkap3_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Wszystko w porz�dku?
	if(Npc_IsDead(bengar) && (DIA_WOLF_PERMKAP3_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//M�j pracodawca nie �yje. Ale co robi�? Zawsze chcia�em mie� w�asn� farm�.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_WOLF_PERMKAP3_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//Tak, cisza i spok�j.
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
	description = "Masz mo�e ochot� wyrwa� si� st�d na pok�adzie okr�tu?";
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
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Nie chcia�by� wyp�yn�� ze mn� w morze?
	if((MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && !Npc_IsDead(bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Nie, ju� nie. Znalaz�em dla siebie odpowiednie miejsce. Mo�e innym razem.
		WOLF_SAIDNO = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//Jasne, czemu nie. Ch�tnie si� st�d wynios�. Mog� r�wnie dobrze broni� twojego statku. Dok�d p�yniemy?
		MIS_BENGARSHELPINGSLD = LOG_OBSOLETE;
		Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
		b_logentry(TOPIC_CREW,"Wilk ma ju� do�� tej wyspy i got�w jest zrobi� wszystko, �eby si� st�d wydosta�. Jest dobrym wojownikiem.");
	};
};


instance DIA_WOLF_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_knowwhereenemy_condition;
	information = dia_wolf_knowwhereenemy_info;
	permanent = TRUE;
	description = "Niedaleko. Na poblisk� wysp�.";
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
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Niedaleko. Na poblisk� wysp�.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//No to na co czekamy? Podczas podr�y mog� ci� jeszcze poduczy� �ucznictwa i strzelania z kuszy.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Przypomnia�em sobie, �e jednak mam ju� do�� ludzi.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//A wi�c to tak?! Najpierw obiecujesz z�ote g�ry, a potem ka�esz mi spada�, co?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Sp�ywaj! Mam nadziej�, �e ta twoja balia utonie w p� drogi.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(dia_wolf_knowwhereenemy);
		Info_AddChoice(dia_wolf_knowwhereenemy,"Musz� si� nad tym jeszcze zastanowi�.",dia_wolf_knowwhereenemy_no);
		Info_AddChoice(dia_wolf_knowwhereenemy,"Witamy na pok�adzie!",dia_wolf_knowwhereenemy_yes);
	};
};

func void dia_wolf_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Witamy na pok�adzie!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//Zejd� na przysta�. Wkr�tce odp�ywamy.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Ju� id�.
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
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Musz� si� nad tym jeszcze zastanowi�.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Wiesz co? Nie wierz� ju� w ani jedno twoje s�owo. Zejd� mi z oczu.
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
	description = "Jednak mi si� nie przydasz.";
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
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Jednak mi si� nie przydasz.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Najpierw dajesz mi nadziej�, a potem ka�esz spada�? Jeste� draniem, jakich ma�o. Zap�acisz mi za to.
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
	description = "S�uchaj.";
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
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//S�uchaj.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Odwal si�, sukinsynu.
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


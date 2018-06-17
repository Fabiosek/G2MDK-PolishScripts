
instance DIA_SAGITTA_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_exit_condition;
	information = dia_sagitta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HALLO(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 4;
	condition = dia_sagitta_hallo_condition;
	information = dia_sagitta_hallo_info;
	description = "Nie czujesz siê trochê samotna?";
};


func int dia_sagitta_hallo_condition()
{
	return TRUE;
};

func void dia_sagitta_hallo_info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Nie czujesz siê trochê samotna?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Gadaj, co masz powiedzieæ i spadaj. Jestem zajêta.
	Info_ClearChoices(dia_sagitta_hallo);
	Info_AddChoice(dia_sagitta_hallo,DIALOG_BACK,dia_sagitta_hallo_ende);
	Info_AddChoice(dia_sagitta_hallo,"Mo¿esz mnie uzdrowiæ?",dia_sagitta_hallo_heil);
	Info_AddChoice(dia_sagitta_hallo,"Co tutaj robisz?",dia_sagitta_hallo_was);
	Info_AddChoice(dia_sagitta_hallo,"Kim jesteœ?",dia_sagitta_hallo_wer);
};

func void dia_sagitta_hallo_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Widzê, ¿eœ o mnie nie s³ysza³?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Nazywaj¹ mnie zielark¹, szarlatanem w spódnicy.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Jednak kiedy poczuj¹ siê gorzej, od razu przypominaj¹ sobie o starej, dobrej Sagicie i jej leczniczych zio³ach.
};

func void dia_sagitta_hallo_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Czym siê zajmujesz?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//Mieszkam tu i hodujê zio³a, odk¹d tylko pamiêtam.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Las jest moim przyjacielem. Wœród jego darów znajdujê wszystko, co jest mi potrzebne.
};

func void dia_sagitta_hallo_heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Czy mog³abyœ mnie uzdrowiæ?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//Po to w³aœnie przyszed³eœ, prawda? Daj mi znaæ, je¿eli bêdziesz potrzebowa³ pomocy.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Sagitta sprzedaje swoje towary za farm¹ Sekoba.");
};

func void dia_sagitta_hallo_ende()
{
	Info_ClearChoices(dia_sagitta_hallo);
};


instance DIA_SAGITTA_TEACHALCHEMYREQUEST(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 6;
	condition = dia_sagitta_teachalchemyrequest_condition;
	information = dia_sagitta_teachalchemyrequest_info;
	permanent = TRUE;
	description = "Czy mog³abyœ przekazaæ mi sw¹ wiedzê o zio³ach?";
};


func int dia_sagitta_teachalchemyrequest_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo) && (MIS_SAGITTA_HERB == FALSE))
	{
		return TRUE;
	};
};


var int dia_sagitta_teachalchemyrequest_onetime;

func void dia_sagitta_teachalchemyrequest_info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Czy mog³abyœ przekazaæ mi swoj¹ wiedzê o zio³ach?
	if(DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Interesuj¹ce. Ludzie nieczêsto mnie o to prosz¹.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Chcesz wiêc zostaæ moim uczniem? Jeœli tak, bêdziesz musia³ dowieœæ uczciwoœci swoich intencji.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Od jakiegoœ czasu pracujê nad bardzo rzadk¹ mikstur¹ z unikalnych zió³ i soków.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Jeœli zdobêdziesz dla mnie brakuj¹cy sk³adnik mikstury, zostanê twoj¹ nauczycielk¹.
		DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//Ju¿ przecie¿ mówi³am: tak, jednak najpierw musisz mi przynieœæ brakuj¹cy sk³adnik.
	};
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Przykro mi, nie jestem zainteresowany.",dia_sagitta_teachalchemyrequest_nein);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Gdzie mogê znaleŸæ ten sk³adnik?",dia_sagitta_teachalchemyrequest_wo);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Co to za sk³adnik?",dia_sagitta_teachalchemyrequest_was);
};

func void dia_sagitta_teachalchemyrequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//Co to za sk³adnik?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//To niebywale rzadka roœlina - ziele, zwane s³onecznym aloesem. Poznasz je po intensywnym zapachu migda³ów.
};

func void dia_sagitta_teachalchemyrequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//Gdzie mogê znaleŸæ ten sk³adnik?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Ziele, o którym mówiê, mo¿na znaleŸæ tylko tam, gdzie s¹ odpowiednie warunki.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Odpowiednie gleby powstaj¹ jedynie na bazie odchodów czarnych trolli.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//Dlatego w³aœnie zdobycie tego sk³adnika jest dla mnie tak trudne, rozumiesz chyba?
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"W tej sytuacji nie pozostaje mi nic innego, jak siê za nim rozejrzeæ.",dia_sagitta_teachalchemyrequest_wo_ja);
};

func void dia_sagitta_teachalchemyrequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//W tej sytuacji nie pozostaje mi nic innego, jak siê za nim rozejrzeæ.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Có¿, ¿yczê powodzenia w poszukiwaniach.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	MIS_SAGITTA_HERB = LOG_RUNNING;
	Log_CreateTopic(TOPIC_SAGITTAHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SAGITTAHERB,LOG_RUNNING);
	b_logentry(TOPIC_SAGITTAHERB,"Sagitta prosi³a mnie o dziwne ziele, zwane s³onecznym aloesem. Roœnie ono tylko na odchodach czarnego trolla.");
};

func void dia_sagitta_teachalchemyrequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Przykro mi, nie jestem zainteresowany.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Nie marnuj wiêc mojego cennego czasu.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
};


instance DIA_SAGITTA_SAGITTA_HERB(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_sagitta_herb_condition;
	information = dia_sagitta_sagitta_herb_info;
	description = "Znalaz³em s³oneczny aloes.";
};


func int dia_sagitta_sagitta_herb_condition()
{
	if(Npc_HasItems(other,itpl_sagitta_herb_mis) && (MIS_SAGITTA_HERB == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_sagitta_herb_info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Znalaz³em s³oneczny aloes.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Dziêkujê. Mo¿esz mnie pytaæ, o co tylko zechcesz.
	b_giveinvitems(other,self,itpl_sagitta_herb_mis,1);
	SAGITTA_TEACHALCHEMY = TRUE;
	MIS_SAGITTA_HERB = LOG_SUCCESS;
	b_giveplayerxp(XP_SAGITTA_SONNENALOE);
};


instance DIA_SAGITTA_TEACH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 2;
	condition = dia_sagitta_teach_condition;
	information = dia_sagitta_teach_info;
	permanent = TRUE;
	description = "Jakie mikstury mo¿esz mnie nauczyæ przyrz¹dzaæ?";
};


var int dia_sagitta_teach_permanent;

func int dia_sagitta_teach_condition()
{
	if((DIA_SAGITTA_TEACH_PERMANENT == FALSE) && (SAGITTA_TEACHALCHEMY == TRUE) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Jakie mikstury mo¿esz mnie nauczyæ przyrz¹dzaæ?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE))
	{
		Info_ClearChoices(dia_sagitta_teach);
		Info_AddChoice(dia_sagitta_teach,DIALOG_BACK,dia_sagitta_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_sagitta_teach_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Ekstrakt leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_sagitta_teach_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_sagitta_teach_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Ekstrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_sagitta_teach_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Eliksir many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_sagitta_teach_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Eliksir ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_sagitta_teach_perm_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Eliksir zrêcznoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_sagitta_teach_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Nim nauczê ciê trudnej sztuki alchemii, powiem ci, co jest potrzebne do sporz¹dzania mikstur.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//Stó³ alchemika s³u¿y jako swego rodzaju kuchnia dla sporz¹dzania mikstur. Bêdziesz tak¿e potrzebowa³ pustego flakonu, by przechowywaæ w nim gotow¹ miksturê.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Nastêpnie wystarczy po³¹czyæ odpowiednie sk³adniki i mikstura gotowa.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Tej wiedzy nauczysz siê jedynie ode mnie.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//O której z mikstur chcesz pos³uchaæ?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//Wiesz ju¿ wszystko, czego mog³abym ciê nauczyæ.
		DIA_SAGITTA_TEACH_PERMANENT = TRUE;
	};
};

func void dia_sagitta_teach_back()
{
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_sagitta_teach);
};


instance DIA_SAGITTA_HEAL(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 99;
	condition = dia_sagitta_heal_condition;
	information = dia_sagitta_heal_info;
	permanent = TRUE;
	description = "Ulecz moje rany.";
};


func int dia_sagitta_heal_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_heal_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Wylecz mnie.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Chwileczkê. Mmm. Moja maœæ powinna wyleczyæ najgorsze z twoich ran.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//W tej chwili nie potrzebujesz leczenia.
	};
};


instance DIA_SAGITTA_TRADE(C_INFO)
{
	npc = bau_980_sagitta;
	condition = dia_sagitta_trade_condition;
	information = dia_sagitta_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mo¿esz mi zaoferowaæ?";
};


func int dia_sagitta_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_trade_info()
{
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//Jakie towary masz do zaoferowania?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Powiedz, co ciê interesuje.
};


instance DIA_SAGITTA_KAP3_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap3_exit_condition;
	information = dia_sagitta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_OBSESSION(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_obsession_condition;
	information = dia_sagitta_obsession_info;
	description = "Chyba mam dreszcze.";
};


func int dia_sagitta_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_obsession_info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Od jakiegoœ czasu cierpiê na dziwaczne drgawki. Potrzebujê pomocy.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Widzê, ¿e w twoim przypadku sen nie bêdzie wystarczaj¹cym lekarstwem. Narazi³eœ siê na czarne spojrzenie Poszukiwaczy.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Udaj siê do Pyrokara, do klasztoru. Moje skromne leki nie wystarcz¹.
};


instance DIA_SAGITTA_THEKLA(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_thekla_condition;
	information = dia_sagitta_thekla_info;
	description = "Thekla przysy³a mnie po odbiór przesy³ki.";
};


func int dia_sagitta_thekla_condition()
{
	if((MIS_THEKLA_PAKET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_thekla_info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Thekla przysy³a mnie po odbiór przesy³ki.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ach, tak. W³aœciwie spodziewa³am siê jej ju¿ kilka dni temu.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Oto paczka, dbaj o ni¹!
	b_giveplayerxp(XP_AMBIENTKAP3);
	b_giveinvitems(self,other,itmi_theklaspaket,1);
};


instance DIA_SAGITTA_KAP4_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap4_exit_condition;
	information = dia_sagitta_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HEALRANDOLPH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_healrandolph_condition;
	information = dia_sagitta_healrandolph_info;
	permanent = TRUE;
	description = "Randolph cierpi na syndrom odstawienia alkoholu.";
};


var int dia_sagitta_healrandolph_gotone;
var int dia_sagitta_healrandolph_knowsprice;

func int dia_sagitta_healrandolph_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && (Npc_HasItems(other,itpo_healrandolph_mis) == 0) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_healrandolph_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//Randolph Ÿle siê czuje, odk¹d przesta³ piæ.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//Kiedy ten cz³owiek w koñcu zm¹drzeje?
		DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE = TRUE;
	};
	if(DIA_SAGITTA_HEALRANDOLPH_GOTONE == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//Da³am ci ju¿ odpowiedni¹ dawkê dla niego. Lepiej b¹dŸ ostro¿ny.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//Dam ci pewne remedium. W ci¹gu kilu dni powinno go postawiæ na nogi.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//Bêdzie ciê to kosztowaæ 300 sztuk z³ota.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Ile?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Jedyna rzecz, jak¹ mo¿esz dostaæ za darmo, to œmieræ.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
	Info_AddChoice(dia_sagitta_healrandolph,"Nie za tak¹ bzdurê.",dia_sagitta_healrandolph_no);
	Info_AddChoice(dia_sagitta_healrandolph,"Oto twoje pieni¹dze.",dia_sagitta_healrandolph_geld);
};

func void dia_sagitta_healrandolph_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Oto twoje pieni¹dze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Doskonale. Zawsze mo¿esz poprosiæ go o ich zwrot.
		CreateInvItems(self,itpo_healrandolph_mis,1);
		b_giveinvitems(self,other,itpo_healrandolph_mis,1);
		DIA_SAGITTA_HEALRANDOLPH_GOTONE = TRUE;
		b_logentry(TOPIC_HEALRANDOLPH,"Sagitta da³a mi lekarstwo dla Randolpha.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Dopóki nie bêdziesz mia³ pieniêdzy - nici z interesów.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
};

func void dia_sagitta_healrandolph_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Nie za tak¹ bzdurê.
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//Nie da³ ci pieniêdzy? To ca³y Randolph!
	Info_ClearChoices(dia_sagitta_healrandolph);
};


instance DIA_SAGITTA_KAP5_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap5_exit_condition;
	information = dia_sagitta_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_KAP6_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap6_exit_condition;
	information = dia_sagitta_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_PICKPOCKET(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 900;
	condition = dia_sagitta_pickpocket_condition;
	information = dia_sagitta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120_FEMALE;
};


func int dia_sagitta_pickpocket_condition()
{
	return c_beklauen(103,360);
};

func void dia_sagitta_pickpocket_info()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_BACK,dia_sagitta_pickpocket_back);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_PICKPOCKET,dia_sagitta_pickpocket_doit);
};

func void dia_sagitta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sagitta_pickpocket);
};

func void dia_sagitta_pickpocket_back()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
};


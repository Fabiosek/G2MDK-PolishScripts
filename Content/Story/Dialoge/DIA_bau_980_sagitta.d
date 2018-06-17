
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
	description = "Nie czujesz si� troch� samotna?";
};


func int dia_sagitta_hallo_condition()
{
	return TRUE;
};

func void dia_sagitta_hallo_info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Nie czujesz si� troch� samotna?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Gadaj, co masz powiedzie� i spadaj. Jestem zaj�ta.
	Info_ClearChoices(dia_sagitta_hallo);
	Info_AddChoice(dia_sagitta_hallo,DIALOG_BACK,dia_sagitta_hallo_ende);
	Info_AddChoice(dia_sagitta_hallo,"Mo�esz mnie uzdrowi�?",dia_sagitta_hallo_heil);
	Info_AddChoice(dia_sagitta_hallo,"Co tutaj robisz?",dia_sagitta_hallo_was);
	Info_AddChoice(dia_sagitta_hallo,"Kim jeste�?",dia_sagitta_hallo_wer);
};

func void dia_sagitta_hallo_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Widz�, �e� o mnie nie s�ysza�?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Nazywaj� mnie zielark�, szarlatanem w sp�dnicy.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Jednak kiedy poczuj� si� gorzej, od razu przypominaj� sobie o starej, dobrej Sagicie i jej leczniczych zio�ach.
};

func void dia_sagitta_hallo_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Czym si� zajmujesz?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//Mieszkam tu i hoduj� zio�a, odk�d tylko pami�tam.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Las jest moim przyjacielem. W�r�d jego dar�w znajduj� wszystko, co jest mi potrzebne.
};

func void dia_sagitta_hallo_heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Czy mog�aby� mnie uzdrowi�?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//Po to w�a�nie przyszed�e�, prawda? Daj mi zna�, je�eli b�dziesz potrzebowa� pomocy.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Sagitta sprzedaje swoje towary za farm� Sekoba.");
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
	description = "Czy mog�aby� przekaza� mi sw� wiedz� o zio�ach?";
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
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Czy mog�aby� przekaza� mi swoj� wiedz� o zio�ach?
	if(DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Interesuj�ce. Ludzie niecz�sto mnie o to prosz�.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Chcesz wi�c zosta� moim uczniem? Je�li tak, b�dziesz musia� dowie�� uczciwo�ci swoich intencji.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Od jakiego� czasu pracuj� nad bardzo rzadk� mikstur� z unikalnych zi� i sok�w.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Je�li zdob�dziesz dla mnie brakuj�cy sk�adnik mikstury, zostan� twoj� nauczycielk�.
		DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//Ju� przecie� m�wi�am: tak, jednak najpierw musisz mi przynie�� brakuj�cy sk�adnik.
	};
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Przykro mi, nie jestem zainteresowany.",dia_sagitta_teachalchemyrequest_nein);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Gdzie mog� znale�� ten sk�adnik?",dia_sagitta_teachalchemyrequest_wo);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Co to za sk�adnik?",dia_sagitta_teachalchemyrequest_was);
};

func void dia_sagitta_teachalchemyrequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//Co to za sk�adnik?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//To niebywale rzadka ro�lina - ziele, zwane s�onecznym aloesem. Poznasz je po intensywnym zapachu migda��w.
};

func void dia_sagitta_teachalchemyrequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//Gdzie mog� znale�� ten sk�adnik?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Ziele, o kt�rym m�wi�, mo�na znale�� tylko tam, gdzie s� odpowiednie warunki.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Odpowiednie gleby powstaj� jedynie na bazie odchod�w czarnych trolli.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//Dlatego w�a�nie zdobycie tego sk�adnika jest dla mnie tak trudne, rozumiesz chyba?
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"W tej sytuacji nie pozostaje mi nic innego, jak si� za nim rozejrze�.",dia_sagitta_teachalchemyrequest_wo_ja);
};

func void dia_sagitta_teachalchemyrequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//W tej sytuacji nie pozostaje mi nic innego, jak si� za nim rozejrze�.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//C�, �ycz� powodzenia w poszukiwaniach.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	MIS_SAGITTA_HERB = LOG_RUNNING;
	Log_CreateTopic(TOPIC_SAGITTAHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SAGITTAHERB,LOG_RUNNING);
	b_logentry(TOPIC_SAGITTAHERB,"Sagitta prosi�a mnie o dziwne ziele, zwane s�onecznym aloesem. Ro�nie ono tylko na odchodach czarnego trolla.");
};

func void dia_sagitta_teachalchemyrequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Przykro mi, nie jestem zainteresowany.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Nie marnuj wi�c mojego cennego czasu.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
};


instance DIA_SAGITTA_SAGITTA_HERB(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_sagitta_herb_condition;
	information = dia_sagitta_sagitta_herb_info;
	description = "Znalaz�em s�oneczny aloes.";
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
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Znalaz�em s�oneczny aloes.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Dzi�kuj�. Mo�esz mnie pyta�, o co tylko zechcesz.
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
	description = "Jakie mikstury mo�esz mnie nauczy� przyrz�dza�?";
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
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Jakie mikstury mo�esz mnie nauczy� przyrz�dza�?
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
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Eliksir zr�czno�ci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_sagitta_teach_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Nim naucz� ci� trudnej sztuki alchemii, powiem ci, co jest potrzebne do sporz�dzania mikstur.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//St� alchemika s�u�y jako swego rodzaju kuchnia dla sporz�dzania mikstur. B�dziesz tak�e potrzebowa� pustego flakonu, by przechowywa� w nim gotow� mikstur�.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Nast�pnie wystarczy po��czy� odpowiednie sk�adniki i mikstura gotowa.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Tej wiedzy nauczysz si� jedynie ode mnie.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//O kt�rej z mikstur chcesz pos�ucha�?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//Wiesz ju� wszystko, czego mog�abym ci� nauczy�.
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
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Chwileczk�. Mmm. Moja ma�� powinna wyleczy� najgorsze z twoich ran.
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
	description = "Co mo�esz mi zaoferowa�?";
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
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Powiedz, co ci� interesuje.
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
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Od jakiego� czasu cierpi� na dziwaczne drgawki. Potrzebuj� pomocy.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Widz�, �e w twoim przypadku sen nie b�dzie wystarczaj�cym lekarstwem. Narazi�e� si� na czarne spojrzenie Poszukiwaczy.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Udaj si� do Pyrokara, do klasztoru. Moje skromne leki nie wystarcz�.
};


instance DIA_SAGITTA_THEKLA(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_thekla_condition;
	information = dia_sagitta_thekla_info;
	description = "Thekla przysy�a mnie po odbi�r przesy�ki.";
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
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Thekla przysy�a mnie po odbi�r przesy�ki.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ach, tak. W�a�ciwie spodziewa�am si� jej ju� kilka dni temu.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Oto paczka, dbaj o ni�!
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
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//Randolph �le si� czuje, odk�d przesta� pi�.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//Kiedy ten cz�owiek w ko�cu zm�drzeje?
		DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE = TRUE;
	};
	if(DIA_SAGITTA_HEALRANDOLPH_GOTONE == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//Da�am ci ju� odpowiedni� dawk� dla niego. Lepiej b�d� ostro�ny.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//Dam ci pewne remedium. W ci�gu kilu dni powinno go postawi� na nogi.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//B�dzie ci� to kosztowa� 300 sztuk z�ota.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Ile?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Jedyna rzecz, jak� mo�esz dosta� za darmo, to �mier�.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
	Info_AddChoice(dia_sagitta_healrandolph,"Nie za tak� bzdur�.",dia_sagitta_healrandolph_no);
	Info_AddChoice(dia_sagitta_healrandolph,"Oto twoje pieni�dze.",dia_sagitta_healrandolph_geld);
};

func void dia_sagitta_healrandolph_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Oto twoje pieni�dze.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Doskonale. Zawsze mo�esz poprosi� go o ich zwrot.
		CreateInvItems(self,itpo_healrandolph_mis,1);
		b_giveinvitems(self,other,itpo_healrandolph_mis,1);
		DIA_SAGITTA_HEALRANDOLPH_GOTONE = TRUE;
		b_logentry(TOPIC_HEALRANDOLPH,"Sagitta da�a mi lekarstwo dla Randolpha.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Dop�ki nie b�dziesz mia� pieni�dzy - nici z interes�w.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
};

func void dia_sagitta_healrandolph_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Nie za tak� bzdur�.
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//Nie da� ci pieni�dzy? To ca�y Randolph!
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


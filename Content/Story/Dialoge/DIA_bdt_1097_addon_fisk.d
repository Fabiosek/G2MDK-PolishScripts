
instance DIA_ADDON_FISK_EXIT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 999;
	condition = dia_addon_fisk_exit_condition;
	information = dia_addon_fisk_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fisk_exit_condition()
{
	return TRUE;
};

func void dia_addon_fisk_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FISK_PICKPOCKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 900;
	condition = dia_addon_fisk_pickpocket_condition;
	information = dia_addon_fisk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_fisk_pickpocket_condition()
{
	return c_beklauen(118,300);
};

func void dia_addon_fisk_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_BACK,dia_addon_fisk_pickpocket_back);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_PICKPOCKET,dia_addon_fisk_pickpocket_doit);
};

func void dia_addon_fisk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};

func void dia_addon_fisk_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};


instance DIA_ADDON_FISK_HI(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 1;
	condition = dia_addon_fisk_hi_condition;
	information = dia_addon_fisk_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_fisk_hi_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hej, jeœli szukasz uczciwego kupca, to w³aœnie go znalaz³eœ.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Moja chata stoi zaraz za domem Estebana, wiêc jak bêdziesz czegoœ potrzebowaæ, to wpadnij.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Fisk handluje orê¿em wszelkiego rodzaju.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_FISK_TRADE(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 888;
	condition = dia_addon_fisk_trade_condition;
	information = dia_addon_fisk_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_fisk_trade_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_trade_info()
{
	b_say(other,self,"$TRADE_2");
	b_givetradeinv(self);
	if(Npc_HasItems(self,itrw_bolt) < 50)
	{
		CreateInvItems(self,itrw_bolt,50 - Npc_HasItems(self,itrw_bolt));
	};
	if(Npc_HasItems(self,itrw_arrow) < 50)
	{
		CreateInvItems(self,itrw_arrow,50 - Npc_HasItems(self,itrw_arrow));
	};
};


instance DIA_ADDON_FISK_ATTENTAT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_attentat_condition;
	information = dia_addon_fisk_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fisk_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//S³uchaj uwa¿nie – chcê, ¿eby coœ z tym zrobiæ. Jasne?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//Mam w³asne problemy. Sam jestem poszkodowany.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Jak to?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//S³ono zap³aci³em za moj¹ ostatni¹ przesy³kê.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Ale nigdy do mnie nie dotar³a! Jakaœ œwinia j¹ zabra³a!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//Ktoœ mi j¹ ukrad³. I to jeden z naszych!
};


instance DIA_ADDON_FISK_LIEFERUNG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 3;
	condition = dia_addon_fisk_lieferung_condition;
	information = dia_addon_fisk_lieferung_info;
	permanent = FALSE;
	description = "Co to za przesy³ka?";
};


func int dia_addon_fisk_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_lieferung_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Co to za przesy³ka?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Paczka pe³na wytrychów. Mia³a zostaæ odebrana od piratów.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Ale przechwyci³ j¹ goœæ imieniem Juan. A tyle z³ota za ni¹ da³em.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Ten sukinsyn ukrywa siê gdzieœ na bagnie...
	MIS_LENNAR_LOCKPICK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_FISK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FISK,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Jakiœ Juan by³ zamieszany w handel z bandytami. Podobno ma kryjówkê gdzieœ na bagnie.");
	b_logentry(TOPIC_ADDON_FISK,"Jakiœ Juan zwêdzi³ przesy³kê dla Fiska (paczkê wytrychów). Ukrywa siê gdzieœ na bagnie.");
};

func void b_addon_fisk_aboutjuan()
{
	if(Npc_IsDead(juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Nie ¿yje.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Dobrze, nie bêdzie mnie ju¿ wkurzaæ!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Jeszcze ¿yje...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Pozostawi³eœ tê œwiniê przy ¿yciu?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Nie by³ sam....
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Niewa¿ne – tych goœci te¿ siê pozbêdê...
	};
};

func void b_addon_fisk_belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//A co do ciebie...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//Dobrze znam Huno.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Dziêki mnie dostaniesz zni¿kê na broñ.
	HUNO_ARMORCHEAP = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Dosta³em ten kamieñ od Corristo.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//To jedyna rzecz, która ocala³a, gdy wyrwa³em siê z kolonii. S¹dzê, ¿e tobie bardziej siê przyda.
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//Dam ci jeszcze jedn¹ z moich broni.
		if(other.hitchance[NPC_TALENT_2H] > other.hitchance[NPC_TALENT_1H])
		{
			b_giveinvitems(self,other,itmw_streitaxt1,1);
		}
		else
		{
			b_giveinvitems(self,other,itmw_bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//Rêka rêkê myje – nic siê nie zmieni³o.
};


instance DIA_ADDON_FISK_GIVEPAKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 4;
	condition = dia_addon_fisk_givepaket_condition;
	information = dia_addon_fisk_givepaket_info;
	permanent = FALSE;
	description = "Mam twoj¹ paczkê.";
};


func int dia_addon_fisk_givepaket_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_lennar_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepaket_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Mam twoj¹ paczkê.
	b_giveinvitems(other,self,itmi_addon_lennar_paket,1);
	MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LENNARPAKET);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//Naprawdê? A co z Juanem?
	b_addon_fisk_aboutjuan();
	b_addon_fisk_belohnung();
};


instance DIA_ADDON_FISK_PAKETOPEN(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 5;
	condition = dia_addon_fisk_paketopen_condition;
	information = dia_addon_fisk_paketopen_info;
	permanent = FALSE;
	description = "Otworzy³em twoj¹ paczkê!";
};


func int dia_addon_fisk_paketopen_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (LENNARPAKET_OPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_paketopen_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Otworzy³em twoj¹ paczkê!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//Mog³em siê tego spodziewaæ! Nie mog³eœ siê doczekaæ, co?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Masz przynajmniej wytrychy?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//A co wa¿niejsze – co siê sta³o z Juanem?
	b_addon_fisk_aboutjuan();
};


instance DIA_ADDON_FISK_GIVEPICKS(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 6;
	condition = dia_addon_fisk_givepicks_condition;
	information = dia_addon_fisk_givepicks_info;
	permanent = TRUE;
	description = "Masz tu tuzin wytrychów...";
};


func int dia_addon_fisk_givepicks_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_paketopen) && (MIS_LENNAR_LOCKPICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepicks_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Masz tu tuzin wytrychów...
	if(b_giveinvitems(other,self,itke_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Bardzo dobrze. Ludzie czekaj¹ na dostawê.
		b_addon_fisk_belohnung();
		MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_LENNARPAKET);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//To za ma³o! Chyba nie chcesz zatrzymaæ sobie reszty?
	};
};


instance DIA_ADDON_FISK_INSPEKTOR(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 7;
	condition = dia_addon_fisk_inspektor_condition;
	information = dia_addon_fisk_inspektor_info;
	permanent = FALSE;
	description = "Juan pracowa³ dla Estebana!";
};


func int dia_addon_fisk_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_lieferung) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan pracowa³ dla Estebana!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Nie udawaj! Wiedzia³eœ o tym!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//Masz racjê. Ale chyba rozumiesz, czemu ci o tym nie powiedzia³em.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Ka¿dy w obozie wie, ¿e pracujesz dla Estebana.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//Nie mam zamiaru siê w to wpl¹taæ tylko dlatego, ¿e chcesz ten swój czerwony kamieñ.
	Info_ClearChoices(dia_addon_fisk_inspektor);
	Info_AddChoice(dia_addon_fisk_inspektor,"Tak naprawdê to nie pracujê dla Estebana...",dia_addon_fisk_inspektor_antiesteban);
	Info_AddChoice(dia_addon_fisk_inspektor,"Nie wierzê ci.",dia_addon_fisk_inspektor_dontbelieve);
	Info_AddChoice(dia_addon_fisk_inspektor,"Rozumiem.",dia_addon_fisk_inspektor_isee);
};

func void dia_addon_fisk_inspektor_isee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Rozumiem.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Dobrze, nie krzycz! Ktoœ mo¿e nas pods³uchiwaæ.
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_dontbelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Nie wierzê ci.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//A wierz sobie, w co chcesz! Ale ostrzegam ciê – jeœli nagadasz Estebanowi na mój temat, skopiê ci ty³ek!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_antiesteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Tak naprawdê to nie pracujê dla Estebana...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Aha! Chcesz oszukaæ starego g³upca?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//W takim razie dam ci dobr¹ radê – lepiej siê tym nie chwal.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Jeœli chodzi o Estebana, to nie powinieneœ wierzyæ nikomu – nawet mi, jasne?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Dobra, doœæ tego, bo jeszcze ktoœ nas us³yszy!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};


instance DIA_ADDON_FISK_MEETING(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_meeting_condition;
	information = dia_addon_fisk_meeting_info;
	permanent = FALSE;
	description = "To TY stoisz za t¹ prób¹ zabójstwa!";
};


func int dia_addon_fisk_meeting_condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,zs_talk) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_meeting_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//To TY stoisz za t¹ prób¹ zabójstwa!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Tak. Esteban mi zawadza.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Nie pozwala wejœæ do kopalni moim ludziom. Chce mieæ pewnoœæ, ¿e wszyscy pracuj¹ dla niego – TYLKO dla niego.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Œci¹ga haracz z handlu i tak kontroluje ca³y obóz.
	Info_ClearChoices(dia_addon_fisk_meeting);
	Info_AddChoice(dia_addon_fisk_meeting,"Co chcesz zrobiæ?",dia_addon_fisk_meeting_now);
	Info_AddChoice(dia_addon_fisk_meeting,"Chcesz zaj¹æ jego miejsce?",dia_addon_fisk_meeting_you);
	if(!Npc_IsDead(esteban))
	{
		Info_AddChoice(dia_addon_fisk_meeting,"Móg³bym ciê wydaæ Estebanowi...",dia_addon_fisk_meeting_sell);
	};
};

func void dia_addon_fisk_meeting_you()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Chcesz zaj¹æ jego miejsce?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Nie, jestem tylko kupcem – po prostu nie chcê, ¿eby ktoœ mi siê tu miesza³ do interesu.
};

func void dia_addon_fisk_meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Móg³bym ciê wydaæ Estebanowi...
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//Pomyœla³eœ, co by siê sta³o potem? Myœlisz, ¿e dosta³byœ to, co chcesz?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Zapomnij o tym – mam lepszy pomys³.
};

func void dia_addon_fisk_meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Co chcesz zrobiæ?
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Pozbêdziemy siê Estebana. Znaczy siê, zabijesz go i zajmiesz jego miejsce.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Nic z tego, dopóki otaczaj¹ go jego ludzie.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//A wiêc bêdziemy musieli siê nimi zaj¹æ. Powiemy prawdê.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Jak¹ prawdê?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Wykona³eœ swoje zadanie i wiesz, ¿e to ja sta³em za prób¹ zabójstwa.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Powiedz o tym Estebanowi, a wyœle swoich zbirów, ¿eby mnie zabili. Bêdê tu na nich czekaæ.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Ty bêdziesz móg³ za³atwiæ tego sukinsyna, a ja zajmê siê stra¿nikami.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban nie ¿yje. Znów bêdê móg³ zaj¹æ siê handlem...
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Proszê, to dla ciebie...
		b_giveinvitems(self,other,itmi_gold,500);
	};
	Info_ClearChoices(dia_addon_fisk_meeting);
	MIS_JUDAS = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	b_logentry(TOPIC_ADDON_ESTEBAN,"Fisk zleci³ zabójstwo Estebana.");
};


instance DIA_ADDON_FISK_SIEG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_sieg_condition;
	information = dia_addon_fisk_sieg_info;
	permanent = FALSE;
	description = "Esteban nie bêdzie ju¿ sprawia³ k³opotów.";
};


func int dia_addon_fisk_sieg_condition()
{
	if((MIS_JUDAS == LOG_SUCCESS) && Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban nie bêdzie ju¿ sprawia³ k³opotów.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//D³ugo na to czeka³em.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Masz chyba doœæ du¿o roboty, a ja muszê znowu zaj¹æ siê prowadzeniem mojego interesu.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//Jeœli bêdziesz czegoœ potrzebowaæ, wiesz, gdzie mnie szukaæ.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};


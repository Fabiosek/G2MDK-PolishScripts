
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
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hej, je�li szukasz uczciwego kupca, to w�a�nie go znalaz�e�.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Moja chata stoi zaraz za domem Estebana, wi�c jak b�dziesz czego� potrzebowa�, to wpadnij.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Fisk handluje or�em wszelkiego rodzaju.");
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
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//S�uchaj uwa�nie � chc�, �eby co� z tym zrobi�. Jasne?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//Mam w�asne problemy. Sam jestem poszkodowany.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Jak to?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//S�ono zap�aci�em za moj� ostatni� przesy�k�.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Ale nigdy do mnie nie dotar�a! Jaka� �winia j� zabra�a!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//Kto� mi j� ukrad�. I to jeden z naszych!
};


instance DIA_ADDON_FISK_LIEFERUNG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 3;
	condition = dia_addon_fisk_lieferung_condition;
	information = dia_addon_fisk_lieferung_info;
	permanent = FALSE;
	description = "Co to za przesy�ka?";
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
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Co to za przesy�ka?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Paczka pe�na wytrych�w. Mia�a zosta� odebrana od pirat�w.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Ale przechwyci� j� go�� imieniem Juan. A tyle z�ota za ni� da�em.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Ten sukinsyn ukrywa si� gdzie� na bagnie...
	MIS_LENNAR_LOCKPICK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_FISK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FISK,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Jaki� Juan by� zamieszany w handel z bandytami. Podobno ma kryj�wk� gdzie� na bagnie.");
	b_logentry(TOPIC_ADDON_FISK,"Jaki� Juan zw�dzi� przesy�k� dla Fiska (paczk� wytrych�w). Ukrywa si� gdzie� na bagnie.");
};

func void b_addon_fisk_aboutjuan()
{
	if(Npc_IsDead(juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Nie �yje.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Dobrze, nie b�dzie mnie ju� wkurza�!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Jeszcze �yje...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Pozostawi�e� t� �wini� przy �yciu?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Nie by� sam....
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Niewa�ne � tych go�ci te� si� pozb�d�...
	};
};

func void b_addon_fisk_belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//A co do ciebie...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//Dobrze znam Huno.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Dzi�ki mnie dostaniesz zni�k� na bro�.
	HUNO_ARMORCHEAP = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Dosta�em ten kamie� od Corristo.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//To jedyna rzecz, kt�ra ocala�a, gdy wyrwa�em si� z kolonii. S�dz�, �e tobie bardziej si� przyda.
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//Dam ci jeszcze jedn� z moich broni.
		if(other.hitchance[NPC_TALENT_2H] > other.hitchance[NPC_TALENT_1H])
		{
			b_giveinvitems(self,other,itmw_streitaxt1,1);
		}
		else
		{
			b_giveinvitems(self,other,itmw_bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//R�ka r�k� myje � nic si� nie zmieni�o.
};


instance DIA_ADDON_FISK_GIVEPAKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 4;
	condition = dia_addon_fisk_givepaket_condition;
	information = dia_addon_fisk_givepaket_info;
	permanent = FALSE;
	description = "Mam twoj� paczk�.";
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
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Mam twoj� paczk�.
	b_giveinvitems(other,self,itmi_addon_lennar_paket,1);
	MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LENNARPAKET);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//Naprawd�? A co z Juanem?
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
	description = "Otworzy�em twoj� paczk�!";
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
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Otworzy�em twoj� paczk�!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//Mog�em si� tego spodziewa�! Nie mog�e� si� doczeka�, co?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Masz przynajmniej wytrychy?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//A co wa�niejsze � co si� sta�o z Juanem?
	b_addon_fisk_aboutjuan();
};


instance DIA_ADDON_FISK_GIVEPICKS(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 6;
	condition = dia_addon_fisk_givepicks_condition;
	information = dia_addon_fisk_givepicks_info;
	permanent = TRUE;
	description = "Masz tu tuzin wytrych�w...";
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
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Masz tu tuzin wytrych�w...
	if(b_giveinvitems(other,self,itke_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Bardzo dobrze. Ludzie czekaj� na dostaw�.
		b_addon_fisk_belohnung();
		MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_LENNARPAKET);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//To za ma�o! Chyba nie chcesz zatrzyma� sobie reszty?
	};
};


instance DIA_ADDON_FISK_INSPEKTOR(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 7;
	condition = dia_addon_fisk_inspektor_condition;
	information = dia_addon_fisk_inspektor_info;
	permanent = FALSE;
	description = "Juan pracowa� dla Estebana!";
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
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan pracowa� dla Estebana!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Nie udawaj! Wiedzia�e� o tym!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//Masz racj�. Ale chyba rozumiesz, czemu ci o tym nie powiedzia�em.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Ka�dy w obozie wie, �e pracujesz dla Estebana.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//Nie mam zamiaru si� w to wpl�ta� tylko dlatego, �e chcesz ten sw�j czerwony kamie�.
	Info_ClearChoices(dia_addon_fisk_inspektor);
	Info_AddChoice(dia_addon_fisk_inspektor,"Tak naprawd� to nie pracuj� dla Estebana...",dia_addon_fisk_inspektor_antiesteban);
	Info_AddChoice(dia_addon_fisk_inspektor,"Nie wierz� ci.",dia_addon_fisk_inspektor_dontbelieve);
	Info_AddChoice(dia_addon_fisk_inspektor,"Rozumiem.",dia_addon_fisk_inspektor_isee);
};

func void dia_addon_fisk_inspektor_isee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Rozumiem.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Dobrze, nie krzycz! Kto� mo�e nas pods�uchiwa�.
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_dontbelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Nie wierz� ci.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//A wierz sobie, w co chcesz! Ale ostrzegam ci� � je�li nagadasz Estebanowi na m�j temat, skopi� ci ty�ek!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_antiesteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Tak naprawd� to nie pracuj� dla Estebana...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Aha! Chcesz oszuka� starego g�upca?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//W takim razie dam ci dobr� rad� � lepiej si� tym nie chwal.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Je�li chodzi o Estebana, to nie powiniene� wierzy� nikomu � nawet mi, jasne?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Dobra, do�� tego, bo jeszcze kto� nas us�yszy!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};


instance DIA_ADDON_FISK_MEETING(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_meeting_condition;
	information = dia_addon_fisk_meeting_info;
	permanent = FALSE;
	description = "To TY stoisz za t� pr�b� zab�jstwa!";
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
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//To TY stoisz za t� pr�b� zab�jstwa!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Tak. Esteban mi zawadza.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Nie pozwala wej�� do kopalni moim ludziom. Chce mie� pewno��, �e wszyscy pracuj� dla niego � TYLKO dla niego.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//�ci�ga haracz z handlu i tak kontroluje ca�y ob�z.
	Info_ClearChoices(dia_addon_fisk_meeting);
	Info_AddChoice(dia_addon_fisk_meeting,"Co chcesz zrobi�?",dia_addon_fisk_meeting_now);
	Info_AddChoice(dia_addon_fisk_meeting,"Chcesz zaj�� jego miejsce?",dia_addon_fisk_meeting_you);
	if(!Npc_IsDead(esteban))
	{
		Info_AddChoice(dia_addon_fisk_meeting,"M�g�bym ci� wyda� Estebanowi...",dia_addon_fisk_meeting_sell);
	};
};

func void dia_addon_fisk_meeting_you()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Chcesz zaj�� jego miejsce?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Nie, jestem tylko kupcem � po prostu nie chc�, �eby kto� mi si� tu miesza� do interesu.
};

func void dia_addon_fisk_meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//M�g�bym ci� wyda� Estebanowi...
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//Pomy�la�e�, co by si� sta�o potem? My�lisz, �e dosta�by� to, co chcesz?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Zapomnij o tym � mam lepszy pomys�.
};

func void dia_addon_fisk_meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Co chcesz zrobi�?
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Pozb�dziemy si� Estebana. Znaczy si�, zabijesz go i zajmiesz jego miejsce.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Nic z tego, dop�ki otaczaj� go jego ludzie.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//A wi�c b�dziemy musieli si� nimi zaj��. Powiemy prawd�.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Jak� prawd�?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Wykona�e� swoje zadanie i wiesz, �e to ja sta�em za pr�b� zab�jstwa.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Powiedz o tym Estebanowi, a wy�le swoich zbir�w, �eby mnie zabili. B�d� tu na nich czeka�.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Ty b�dziesz m�g� za�atwi� tego sukinsyna, a ja zajm� si� stra�nikami.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban nie �yje. Zn�w b�d� m�g� zaj�� si� handlem...
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Prosz�, to dla ciebie...
		b_giveinvitems(self,other,itmi_gold,500);
	};
	Info_ClearChoices(dia_addon_fisk_meeting);
	MIS_JUDAS = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	b_logentry(TOPIC_ADDON_ESTEBAN,"Fisk zleci� zab�jstwo Estebana.");
};


instance DIA_ADDON_FISK_SIEG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_sieg_condition;
	information = dia_addon_fisk_sieg_info;
	permanent = FALSE;
	description = "Esteban nie b�dzie ju� sprawia� k�opot�w.";
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
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban nie b�dzie ju� sprawia� k�opot�w.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//D�ugo na to czeka�em.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Masz chyba do�� du�o roboty, a ja musz� znowu zaj�� si� prowadzeniem mojego interesu.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//Je�li b�dziesz czego� potrzebowa�, wiesz, gdzie mnie szuka�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};


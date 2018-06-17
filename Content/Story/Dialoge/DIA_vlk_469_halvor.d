
instance DIA_HALVOR_EXIT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 999;
	condition = dia_halvor_exit_condition;
	information = dia_halvor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_halvor_exit_condition()
{
	return TRUE;
};

func void dia_halvor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HALVOR_PICKPOCKET(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 900;
	condition = dia_halvor_pickpocket_condition;
	information = dia_halvor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_halvor_pickpocket_condition()
{
	return c_beklauen(78,150);
};

func void dia_halvor_pickpocket_info()
{
	Info_ClearChoices(dia_halvor_pickpocket);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_BACK,dia_halvor_pickpocket_back);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_PICKPOCKET,dia_halvor_pickpocket_doit);
};

func void dia_halvor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_halvor_pickpocket);
};

func void dia_halvor_pickpocket_back()
{
	Info_ClearChoices(dia_halvor_pickpocket);
};


instance DIA_HALVOR_HALLO(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hallo_condition;
	information = dia_halvor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void dia_halvor_hallo_info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hej, chcesz rybê? Kupujcie ryby, ryby, œwie¿e ryby prosto z morza!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Halvor sprzedaje ryby w porcie.");
};


instance DIA_HALVOR_TRADE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_trade_condition;
	information = dia_halvor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Poka¿ mi swoje ryby.";
};


func int dia_halvor_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_halvor_hallo) && Wld_IsTime(5,0,20,0) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Poka¿ mi swoje ryby.
};


instance DIA_HALVOR_NIGHT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_night_condition;
	information = dia_halvor_night_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_halvor_night_condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,zs_talk) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_night_info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hej, jeœli chcesz kupiæ rybê, przyjdŸ tutaj jutro, dobrze?
};


instance DIA_ADDON_HALVOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 5;
	condition = dia_addon_halvor_missingpeople_condition;
	information = dia_addon_halvor_missingpeople_info;
	description = "Wiesz coœ o zaginionych?";
};


func int dia_addon_halvor_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_halvor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Wiesz coœ o zaginionych?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Zaginieni? To jest port - takie rzeczy zdarzaj¹ siê tu od czasu do czasu.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Morze to groŸna bestia - czasami ktoœ nie wraca.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Wiêkszoœæ kapitanów du¿ych jednostek najmuje za³ogi w miastach takich jak Khorinis.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//Jeœli zaœ jest za ma³o ochotników, to czasem zmuszaj¹ ludzi do s³u¿by...
	Info_ClearChoices(dia_addon_halvor_missingpeople);
	Info_AddChoice(dia_addon_halvor_missingpeople,DIALOG_BACK,dia_addon_halvor_missingpeople_back);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Du¿ych jednostek?",dia_addon_halvor_missingpeople_schiff);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Znasz jakichœ zaginionych?",dia_addon_halvor_missingpeople_wer);
	Info_AddChoice(dia_addon_halvor_missingpeople,"A tobie nikt nie zagin¹³?",dia_addon_halvor_missingpeople_you);
};

func void dia_addon_halvor_missingpeople_back()
{
	Info_ClearChoices(dia_addon_halvor_missingpeople);
};

func void dia_addon_halvor_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Znasz jakichœ zaginionych?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Nie. Pomów ze szkutnikami.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Handlarz rybami, Halvor, poradzi³ mi jedynie, bym porozmawia³ z rybakami w porcie.");
};

func void dia_addon_halvor_missingpeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Du¿ych jednostek?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Fakt, zbyt du¿o statków tu ostatnio nie zawija.
};

func void dia_addon_halvor_missingpeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//A tobie nikt nie zagin¹³?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//Mi? Nie.
};


instance DIA_HALVOR_MESSAGE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_message_condition;
	information = dia_halvor_message_info;
	permanent = FALSE;
	description = "Wydaje mi siê, ¿e ten kawa³ek papieru nale¿y do ciebie...";
	trade = FALSE;
};


func int dia_halvor_message_condition()
{
	if(KNOWS_HALVOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_halvor_message_info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//Wydaje mi siê, ¿e ten kawa³ek papieru nale¿y do ciebie...
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Co...? Poka¿ go.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//Ale przecie¿ nie trzeba iœæ z tym od razu do stra¿y miejskiej, prawda? Z pewnoœci¹ uda nam siê dojœæ do porozumienia, co?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//Ale przecie¿ nie trzeba iœæ z tym od razu do stra¿y miejskiej, prawda? Z pewnoœci¹ uda siê nam dojœæ do porozumienia, co?
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Czekam na twoj¹ ofertê.",dia_halvor_message_offer);
	Info_AddChoice(dia_halvor_message,"Wygl¹da na to, ze pójdziesz siedzieæ.",dia_halvor_message_prison);
};

func void dia_halvor_message_offer()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Czekam na twoj¹ ofertê.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Dobrze. Powiem ci coœ. Mogê ci sprzedaæ coœ wiêcej ni¿ tylko ryby.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Jeœli oddasz mi ten papier i, hm, zapomnisz o ca³ej sprawie, mo¿emy zostaæ najlepszymi partnerami handlowymi.
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Dobra, umowa stoi.",dia_halvor_message_okay);
	Info_AddChoice(dia_halvor_message,"Wygl¹da na to, ze pójdziesz siedzieæ.",dia_halvor_message_prison);
	Info_AddChoice(dia_halvor_message,"Doprawdy? A jakie jeszcze towary rozprowadzasz?",dia_halvor_message_deal);
};

func void dia_halvor_message_prison()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Wygl¹da na to, ze pójdziesz siedzieæ.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Nie, zaczekaj, nie rób tego! W koñcu jestem tylko... No wiesz... Ma³¹ p³otk¹...
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//Powinieneœ by³ o tym pomyœleæ wczeœniej. Teraz jest ju¿ za póŸno - Lord Andre dowie siê, co zrobi³eœ.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Po¿a³ujesz tego.
	BETRAYAL_HALVOR = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_halvor_message_deal()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Doprawdy? A jakie jeszcze towary rozprowadzasz?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Móg³bym ci na przyk³ad zaoferowaæ... specjaln¹ rybê. Nie tak¹ zwyk³¹ rybê do jedzenia.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//Masz na myœli tak¹ rybê z niespodziank¹, jak ta, która zawiera³a sekretn¹ wiadomoœæ?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Dok³adnie. Mam kilka takich... ryb.
};

func void dia_halvor_message_okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Dobrze, umowa stoi. A zatem ca³a sprawa pozostanie tylko miêdzy nami.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Dziêkujê ci. Zajrzyj do mnie, jeœli kiedyœ bêdziesz w s¹siedztwie. Na pewno znajdzie siê dla ciebie coœ ciekawego.
	b_giveinvitems(other,self,itwr_halvormessage,1);
	Npc_RemoveInvItems(self,itwr_halvormessage,1);
	HALVOR_DEAL = TRUE;
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
	CreateInvItems(self,itse_erzfisch,1);
	CreateInvItems(self,itse_goldfisch,1);
	CreateInvItems(self,itse_ringfisch,1);
	CreateInvItems(self,itse_lockpickfisch,1);
	Info_ClearChoices(dia_halvor_message);
};


instance DIA_HALVOR_ZEICHEN(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_zeichen_condition;
	information = dia_halvor_zeichen_info;
	permanent = FALSE;
	description = "(Poka¿ z³odziejski gest)";
};


func int dia_halvor_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//Rozumiem. Nie przyszed³eœ tylko po rybê.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//Mam dla ciebie propozycjê. Jeœli masz jakieœ srebrne talerze lub kielichy, odkupiê je od ciebie za dobr¹ cenê.
	CreateInvItems(self,itke_lockpick,20);
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Halvor zap³aci mi za srebrne kielichy i talerze wiêcej ni¿ jakikolwiek inny kupiec.");
};


instance DIA_HALVOR_HEHLEREI(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hehlerei_condition;
	information = dia_halvor_hehlerei_info;
	permanent = TRUE;
	description = "(Sprzeda¿ starych talerzy i kielichów)";
};


func int dia_halvor_hehlerei_condition()
{
	if(Npc_KnowsInfo(other,dia_halvor_zeichen) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_hehlerei_info()
{
	HALVOR_SCORE = 0;
	if(HALVOR_DAY != Wld_GetDay())
	{
		if((Npc_HasItems(other,itmi_silverplate) >= 1) || (Npc_HasItems(other,itmi_silvercup) >= 1))
		{
			HALVOR_SCORE = (Npc_HasItems(other,itmi_silverplate) * (VALUE_SILVERPLATE / 2)) + (Npc_HasItems(other,itmi_silvercup) * (VALUE_SILVERCUP / 2));
			if(HALVOR_SCORE <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//Za to wszystko, mogê ci daæ...
				b_say_gold(self,other,HALVOR_SCORE);
				Info_ClearChoices(dia_halvor_hehlerei);
				Info_AddChoice(dia_halvor_hehlerei,"Sprzedano.",dia_halvor_hehlerei_annehmen);
				Info_AddChoice(dia_halvor_hehlerei,"Muszê siê zastanowiæ.",dia_halvor_hehlerei_ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//Przynios³eœ za du¿o - nie zdo³am sprzedaæ naraz tego wszystkiego.
				Info_ClearChoices(dia_halvor_hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Wróæ, kiedy bêdziesz mia³ jeszcze jakieœ talerze albo kielichy na sprzeda¿.
			Info_ClearChoices(dia_halvor_hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//Kupiê od ciebie te srebra, ale dopiero jutro. Dzisiaj jest jeszcze za wczeœnie.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Przykro mi, dzisiaj nie robiê ju¿ ¿adnych interesów. Wróæ jutro, dobrze?
	};
};

func void dia_halvor_hehlerei_annehmen()
{
	var int amount;
	var string concattext;
	amount = Npc_HasItems(other,itmi_silverplate) + Npc_HasItems(other,itmi_silvercup);
	concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
	AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itmi_silvercup,Npc_HasItems(other,itmi_silvercup));
	Npc_RemoveInvItems(other,itmi_silverplate,Npc_HasItems(other,itmi_silverplate));
	b_giveinvitems(self,other,itmi_gold,HALVOR_SCORE);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Sprzedano.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Ubiliœmy ostatnio parê dobrych interesów. Lepiej ju¿ dziœ nie wracaj, bo ktoœ mo¿e nabraæ podejrzeñ.
	HALVOR_DAY = Wld_GetDay();
	Info_ClearChoices(dia_halvor_hehlerei);
};

func void dia_halvor_hehlerei_ablehnen()
{
	Info_ClearChoices(dia_halvor_hehlerei);
};


instance DIA_HALVOR_CREW(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 51;
	condition = dia_halvor_crew_condition;
	information = dia_halvor_crew_info;
	permanent = FALSE;
	description = "Szukam za³ogi.";
};


func int dia_halvor_crew_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_crew_info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Szukam za³ogi.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//A jak zamierzasz st¹d wyp³yn¹æ?
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,"To ju¿ moje zmartwienie.",dia_halvor_crew_mything);
	Info_AddChoice(dia_halvor_crew,"Zamierzam przej¹æ statek.",dia_halvor_crew_stealship);
};

func void dia_halvor_crew_mything()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//To ju¿ moje zmartwienie.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Oczywiœcie. To naprawdê nie moja sprawa.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Chcesz siê ze mn¹ zabraæ?",dia_halvor_crew_joinme);
	Info_AddChoice(dia_halvor_crew,"Mo¿esz mi pomóc?",dia_halvor_crew_helpme);
};

func void dia_halvor_crew_stealship()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Zamierzam przej¹æ statek.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Jasne. Mówisz powa¿nie? Jeœli z³api¹ ciê paladyni, nie bêd¹ siê z tob¹ cackaæ.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Bardzo proszê - w koñcu to nie ja stracê ¿ycie.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Chcesz siê ze mn¹ zabraæ?",dia_halvor_crew_joinme);
	if(Npc_IsDead(jack) == FALSE)
	{
		Info_AddChoice(dia_halvor_crew,"Mo¿esz mi pomóc?",dia_halvor_crew_helpme);
	};
};

func void dia_halvor_crew_joinme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Chcesz siê ze mn¹ zabraæ?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Nie, chyba nie. Mam tu du¿o roboty i mówi¹c szczerze, nie marzy mi siê spotkanie galery pe³nej orków.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Ale ¿yczê ci powodzenia.
};

func void dia_halvor_crew_helpme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Mo¿esz mi pomóc?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//Nie jestem chyba odpowiedni¹ osob¹. IdŸ pogadaæ z Jackiem, powinien byæ gdzieœ w porcie. On bêdzie wiedzia³ najlepiej, czego ci potrzeba.
};

func void dia_halvor_crew_back()
{
	Info_ClearChoices(dia_halvor_crew);
};


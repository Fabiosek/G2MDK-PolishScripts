
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
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hej, chcesz ryb�? Kupujcie ryby, ryby, �wie�e ryby prosto z morza!
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
	description = "Poka� mi swoje ryby.";
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
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Poka� mi swoje ryby.
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
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hej, je�li chcesz kupi� ryb�, przyjd� tutaj jutro, dobrze?
};


instance DIA_ADDON_HALVOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 5;
	condition = dia_addon_halvor_missingpeople_condition;
	information = dia_addon_halvor_missingpeople_info;
	description = "Wiesz co� o zaginionych?";
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
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Wiesz co� o zaginionych?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Zaginieni? To jest port - takie rzeczy zdarzaj� si� tu od czasu do czasu.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Morze to gro�na bestia - czasami kto� nie wraca.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Wi�kszo�� kapitan�w du�ych jednostek najmuje za�ogi w miastach takich jak Khorinis.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//Je�li za� jest za ma�o ochotnik�w, to czasem zmuszaj� ludzi do s�u�by...
	Info_ClearChoices(dia_addon_halvor_missingpeople);
	Info_AddChoice(dia_addon_halvor_missingpeople,DIALOG_BACK,dia_addon_halvor_missingpeople_back);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Du�ych jednostek?",dia_addon_halvor_missingpeople_schiff);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Znasz jakich� zaginionych?",dia_addon_halvor_missingpeople_wer);
	Info_AddChoice(dia_addon_halvor_missingpeople,"A tobie nikt nie zagin��?",dia_addon_halvor_missingpeople_you);
};

func void dia_addon_halvor_missingpeople_back()
{
	Info_ClearChoices(dia_addon_halvor_missingpeople);
};

func void dia_addon_halvor_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Znasz jakich� zaginionych?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Nie. Pom�w ze szkutnikami.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Handlarz rybami, Halvor, poradzi� mi jedynie, bym porozmawia� z rybakami w porcie.");
};

func void dia_addon_halvor_missingpeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Du�ych jednostek?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Fakt, zbyt du�o statk�w tu ostatnio nie zawija.
};

func void dia_addon_halvor_missingpeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//A tobie nikt nie zagin��?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//Mi? Nie.
};


instance DIA_HALVOR_MESSAGE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_message_condition;
	information = dia_halvor_message_info;
	permanent = FALSE;
	description = "Wydaje mi si�, �e ten kawa�ek papieru nale�y do ciebie...";
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
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//Wydaje mi si�, �e ten kawa�ek papieru nale�y do ciebie...
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Co...? Poka� go.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//Ale przecie� nie trzeba i�� z tym od razu do stra�y miejskiej, prawda? Z pewno�ci� uda nam si� doj�� do porozumienia, co?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//Ale przecie� nie trzeba i�� z tym od razu do stra�y miejskiej, prawda? Z pewno�ci� uda si� nam doj�� do porozumienia, co?
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Czekam na twoj� ofert�.",dia_halvor_message_offer);
	Info_AddChoice(dia_halvor_message,"Wygl�da na to, ze p�jdziesz siedzie�.",dia_halvor_message_prison);
};

func void dia_halvor_message_offer()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Czekam na twoj� ofert�.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Dobrze. Powiem ci co�. Mog� ci sprzeda� co� wi�cej ni� tylko ryby.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Je�li oddasz mi ten papier i, hm, zapomnisz o ca�ej sprawie, mo�emy zosta� najlepszymi partnerami handlowymi.
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Dobra, umowa stoi.",dia_halvor_message_okay);
	Info_AddChoice(dia_halvor_message,"Wygl�da na to, ze p�jdziesz siedzie�.",dia_halvor_message_prison);
	Info_AddChoice(dia_halvor_message,"Doprawdy? A jakie jeszcze towary rozprowadzasz?",dia_halvor_message_deal);
};

func void dia_halvor_message_prison()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Wygl�da na to, ze p�jdziesz siedzie�.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Nie, zaczekaj, nie r�b tego! W ko�cu jestem tylko... No wiesz... Ma�� p�otk�...
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//Powiniene� by� o tym pomy�le� wcze�niej. Teraz jest ju� za p�no - Lord Andre dowie si�, co zrobi�e�.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Po�a�ujesz tego.
	BETRAYAL_HALVOR = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_halvor_message_deal()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Doprawdy? A jakie jeszcze towary rozprowadzasz?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//M�g�bym ci na przyk�ad zaoferowa�... specjaln� ryb�. Nie tak� zwyk�� ryb� do jedzenia.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//Masz na my�li tak� ryb� z niespodziank�, jak ta, kt�ra zawiera�a sekretn� wiadomo��?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Dok�adnie. Mam kilka takich... ryb.
};

func void dia_halvor_message_okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Dobrze, umowa stoi. A zatem ca�a sprawa pozostanie tylko mi�dzy nami.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Dzi�kuj� ci. Zajrzyj do mnie, je�li kiedy� b�dziesz w s�siedztwie. Na pewno znajdzie si� dla ciebie co� ciekawego.
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
	description = "(Poka� z�odziejski gest)";
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
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//Rozumiem. Nie przyszed�e� tylko po ryb�.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//Mam dla ciebie propozycj�. Je�li masz jakie� srebrne talerze lub kielichy, odkupi� je od ciebie za dobr� cen�.
	CreateInvItems(self,itke_lockpick,20);
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Halvor zap�aci mi za srebrne kielichy i talerze wi�cej ni� jakikolwiek inny kupiec.");
};


instance DIA_HALVOR_HEHLEREI(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hehlerei_condition;
	information = dia_halvor_hehlerei_info;
	permanent = TRUE;
	description = "(Sprzeda� starych talerzy i kielich�w)";
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
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//Za to wszystko, mog� ci da�...
				b_say_gold(self,other,HALVOR_SCORE);
				Info_ClearChoices(dia_halvor_hehlerei);
				Info_AddChoice(dia_halvor_hehlerei,"Sprzedano.",dia_halvor_hehlerei_annehmen);
				Info_AddChoice(dia_halvor_hehlerei,"Musz� si� zastanowi�.",dia_halvor_hehlerei_ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//Przynios�e� za du�o - nie zdo�am sprzeda� naraz tego wszystkiego.
				Info_ClearChoices(dia_halvor_hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Wr��, kiedy b�dziesz mia� jeszcze jakie� talerze albo kielichy na sprzeda�.
			Info_ClearChoices(dia_halvor_hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//Kupi� od ciebie te srebra, ale dopiero jutro. Dzisiaj jest jeszcze za wcze�nie.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Przykro mi, dzisiaj nie robi� ju� �adnych interes�w. Wr�� jutro, dobrze?
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
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Ubili�my ostatnio par� dobrych interes�w. Lepiej ju� dzi� nie wracaj, bo kto� mo�e nabra� podejrze�.
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
	description = "Szukam za�ogi.";
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
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Szukam za�ogi.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//A jak zamierzasz st�d wyp�yn��?
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,"To ju� moje zmartwienie.",dia_halvor_crew_mything);
	Info_AddChoice(dia_halvor_crew,"Zamierzam przej�� statek.",dia_halvor_crew_stealship);
};

func void dia_halvor_crew_mything()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//To ju� moje zmartwienie.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Oczywi�cie. To naprawd� nie moja sprawa.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Chcesz si� ze mn� zabra�?",dia_halvor_crew_joinme);
	Info_AddChoice(dia_halvor_crew,"Mo�esz mi pom�c?",dia_halvor_crew_helpme);
};

func void dia_halvor_crew_stealship()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Zamierzam przej�� statek.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Jasne. M�wisz powa�nie? Je�li z�api� ci� paladyni, nie b�d� si� z tob� cacka�.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Bardzo prosz� - w ko�cu to nie ja strac� �ycie.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Chcesz si� ze mn� zabra�?",dia_halvor_crew_joinme);
	if(Npc_IsDead(jack) == FALSE)
	{
		Info_AddChoice(dia_halvor_crew,"Mo�esz mi pom�c?",dia_halvor_crew_helpme);
	};
};

func void dia_halvor_crew_joinme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Chcesz si� ze mn� zabra�?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Nie, chyba nie. Mam tu du�o roboty i m�wi�c szczerze, nie marzy mi si� spotkanie galery pe�nej ork�w.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Ale �ycz� ci powodzenia.
};

func void dia_halvor_crew_helpme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//Nie jestem chyba odpowiedni� osob�. Id� pogada� z Jackiem, powinien by� gdzie� w porcie. On b�dzie wiedzia� najlepiej, czego ci potrzeba.
};

func void dia_halvor_crew_back()
{
	Info_ClearChoices(dia_halvor_crew);
};



instance DIA_ADDON_QUARHODRON_EXIT(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 999;
	condition = dia_addon_quarhodron_exit_condition;
	information = dia_addon_quarhodron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_quarhodron_exit_condition()
{
	return TRUE;
};

func void dia_addon_quarhodron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_QUARHODRON_HELLO(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_hello_condition;
	information = dia_addon_quarhodron_hello_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_quarhodron_hello_noperm;

func int dia_addon_quarhodron_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_QUARHODRON_HELLO_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_quarhodron_hello_info()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Dlaczego zak��casz m�j spok�j, stra�niku?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//Powiedz mi, z czym do mnie przychodzisz?
		Info_ClearChoices(dia_addon_quarhodron_hello);
		Info_AddChoice(dia_addon_quarhodron_hello,"Co znajduje si� w �wi�tyni Adanosa?",dia_addon_quarhodron_hello_schwert);
		Info_AddChoice(dia_addon_quarhodron_hello,"Kto� dosta� si� do �wi�tyni Adanosa.",dia_addon_quarhodron_hello_raven);
		Info_AddChoice(dia_addon_quarhodron_hello,"Pozw�l mi wej�� do �wi�tyni Adanosa.",dia_addon_quarhodron_hello_tempel);
		Info_AddChoice(dia_addon_quarhodron_hello,"Kraj rozdzieraj� trz�sienia ziemi. ",dia_addon_quarhodron_hello_erdbeben);
		DIA_ADDON_QUARHODRON_HELLO_NOPERM = TRUE;
		Npc_RemoveInvItems(hero,itwr_addon_summonancientghost,1);
		SC_TALKEDTOGHOST = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//Bengla anthani?
		AI_StopProcessInfos(self);
	};
};


var int dia_addon_quarhodron_hello_choicecounter;
var int b_quarhodron_hello_kommzumpunkt_onetime;

func void b_quarhodron_hello_kommzumpunkt()
{
	if((DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER >= 3) && (b_quarhodron_hello_kommzumpunkt_onetime == FALSE))
	{
		Info_AddChoice(dia_addon_quarhodron_hello,"Wielka m�dro�� staro�ytnych musi ci� przyt�acza�.",dia_addon_quarhodron_hello_frech);
		b_quarhodron_hello_kommzumpunkt_onetime = TRUE;
	};
};

func void dia_addon_quarhodron_hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Kraj rozdzieraj� trz�sienia ziemi. Je�li czego� nie zrobimy, ca�a wyspa zostanie zatopiona.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Nic ju� nie mo�emy zrobi�.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Na Jarkendar spad� gniew Adanosa, kt�ry zniszczy wszystkich niewiernych.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Kto� dosta� si� do �wi�tyni Adanosa.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Niemo�liwe. Sam zablokowa�em bram�. Nie mo�na jej sforsowa�.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Czy�by?
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Pozw�l mi wej�� do �wi�tyni Adanosa.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//�wi�tynia ma pozosta� zamkni�ta na ca�� wieczno��. Tak zdecydowa�a rada.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co znajduje si� w �wi�tyni Adanosa?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//Moje najwi�ksze nieszcz�cie, moje najwi�ksze rozczarowanie.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//Wielka m�dro�� staro�ytnych musi ci� przyt�acza�.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Cz�owiek twojej pozycji nie mo�e si� tak do mnie zwraca�.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nie mog� oprze� si� wra�eniu, �e nie jeste� tym, za kogo si� podajesz.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Je�li naprawd� potrzebujesz mej pomocy, b�dziesz musia� udowodni� swe intencje.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpowiedz na moje pytania, abym mia� pewno��, �e nie wyjawi� tajemnic obcemu.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron pomo�e mi tylko pod warunkiem, �e udowodni� swoj� warto��. Zada� mi kilka trudnych pyta�. Musz� na nie odpowiedzie�!");
	Info_ClearChoices(dia_addon_quarhodron_hello);
};


instance DIA_ADDON_QUARHODRON_FRAGEN(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_fragen_condition;
	information = dia_addon_quarhodron_fragen_info;
	permanent = TRUE;
	description = "Zadawaj swe pytania.";
};


func int dia_addon_quarhodron_fragen_condition()
{
	if(QUARHODRONISTZUFRIEDEN == FALSE)
	{
		return TRUE;
	};
};


var int quarhodrons_nextquestion;
var int quarhodronistzufrieden;
var int quarhodrons_richtigeantworten;
const int QUARHODRON_ALLEFRAGENGESTELLT = 100;
var int b_quarhodron_fragen_choicesonetime;

func void b_quarhodron_testfailed()
{
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Twoje odpowiedzi s� tak z�e, jak twoje intencje.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nie pomog� ci.
	AI_StopProcessInfos(self);
};

func void b_quarhodron_fragen_choices()
{
	Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- PYTANIA QUARHODRONA ---");
	if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else if((QUARHODRONS_NEXTQUESTION == 1) && (QUARHODRONS_RICHTIGEANTWORTEN == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nie wierz� ci.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Lepiej wr��, kiedy zdecydujesz si� m�wi� prawd�.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(QUARHODRONS_NEXTQUESTION == 1)
		{
			if(b_quarhodron_fragen_choicesonetime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//Zdolno�ci stra�nika umar�ych pozwoli�y ci mnie obudzi�, to prawda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Je�li naprawd� jeste� tym, za kogo si� podajesz, zdo�asz odpowiedzie� na wszystkie moje pytania.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Za wyj�tkiem jednego...
				b_quarhodron_fragen_choicesonetime = TRUE;
			};
			QUARHODRONS_NEXTQUESTION = 2;
		};
		if(QUARHODRONS_NEXTQUESTION == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kto zamkn�� portal, by uchroni� ludzi przed z�em?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto zamkn�� portal, by uchroni� ludzi przed z�em? ---");
			QUARHODRONS_NEXTQUESTION = QUARHODRON_ALLEFRAGENGESTELLT;
		}
		else if(QUARHODRONS_NEXTQUESTION == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kto �agodzi cierpienia i opiekuje si� chorymi?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto �agodzi cierpienia i opiekuje si� chorymi? ---");
			QUARHODRONS_NEXTQUESTION = 7;
		}
		else if(QUARHODRONS_NEXTQUESTION == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kto ma decyduj�cy g�os w radzie pi�ciu?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto ma decyduj�cy g�os w radzie pi�ciu? ---");
			QUARHODRONS_NEXTQUESTION = 6;
		}
		else if(QUARHODRONS_NEXTQUESTION == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kto jest odpowiedzialny za z�o, kt�re na nas spad�o?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto jest odpowiedzialny za z�o, kt�re na nas spad�o? ---");
			QUARHODRONS_NEXTQUESTION = 5;
		}
		else if(QUARHODRONS_NEXTQUESTION == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kto mo�e wyda� mi bezpo�redni rozkaz?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto mo�e wyda� mi bezpo�redni rozkaz? ---");
			QUARHODRONS_NEXTQUESTION = 4;
		}
		else if(QUARHODRONS_NEXTQUESTION == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kto niegdy� broni� mieszka�c�w Jarkendaru przed wrogimi atakami?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto niegdy� broni� mieszka�c�w Jarkendaru przed wrogimi atakami? ---");
			QUARHODRONS_NEXTQUESTION = 3;
		};
		Info_ClearChoices(dia_addon_quarhodron_fragen);
		if(QUARHODRONS_NEXTQUESTION >= QUARHODRON_ALLEFRAGENGESTELLT)
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"Sk�d mam to wiedzie�?",dia_addon_quarhodron_fragen_noplan);
		}
		else
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"Nie wiem.",dia_addon_quarhodron_fragen_noplan);
		};
		Info_AddChoice(dia_addon_quarhodron_fragen,"Uczeni.",dia_addon_quarhodron_fragen_gele);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Stra�nicy Umar�ych.",dia_addon_quarhodron_fragen_totenw);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Kap�ani.",dia_addon_quarhodron_fragen_prie);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Kasta Wojownik�w.",dia_addon_quarhodron_fragen_warr);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Uzdrowiciele.",dia_addon_quarhodron_fragen_heiler);
	};
};


var int dia_addon_quarhodron_fragen_info_onetime;

func void dia_addon_quarhodron_fragen_info()
{
	QUARHODRONS_NEXTQUESTION = 0;
	QUARHODRONS_RICHTIGEANTWORTEN = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Zadawaj swe pytania.
	if(dia_addon_quarhodron_fragen_info_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//Jestem Quarhodron, dawny genera� Jarkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Przebudzi�e� mnie.
		dia_addon_quarhodron_fragen_info_onetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Do kt�rej kasty nale�ysz?
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Kasta wojownik�w.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 3)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 5)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Kap�ani.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 4)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_gele()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//Uczeni.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 6)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_totenw()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//Stra�nicy umar�ych.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_heiler()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//Uzdrowiciele.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 7)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_noplan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Nie wiem.
	if((QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT) && (QUARHODRONS_RICHTIGEANTWORTEN >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dobrze. Ufam ci i udziel� pomocy.
		QUARHODRONISTZUFRIEDEN = TRUE;
		Info_ClearChoices(dia_addon_quarhodron_fragen);
	}
	else if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Wi�c nie marnuj mego czasu.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_QUARHODRON_GIBMIRKEY(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_gibmirkey_condition;
	information = dia_addon_quarhodron_gibmirkey_info;
	description = "(Za��daj klucza od �wi�tyni)";
};


func int dia_addon_quarhodron_gibmirkey_condition()
{
	if(QUARHODRONISTZUFRIEDEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_quarhodron_gibmirkey_info()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Jaki� parszywy dra� dosta� si� do �wi�tyni Adanosa!
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Je�li natychmiast nie wpu�cisz mnie do �wi�tyni, rozp�ta si� tu piek�o.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//Niemo�liwe! Najwy�szy kap�an Khardimon i ja jeste�my jedynymi w Jarkendarze, kt�rzy wiedz�, jak otworzy� portal w �wi�tyni Adanosa.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//C�. Wygl�da na to, �e ten Khardimon si� wygada�.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//Powtarzam, brama zosta�a otwarta. Widzia�em to na w�asne oczy.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobrze. S�ysz� prawd� w twoim g�osie. Nie b�d� ju� w�tpi� w twe s�owa.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Mam nadziej�.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//We� zatem s�owo, kt�re otworzy ci przej�cie. Zapisane jest na tej kamiennej tablicy. Wypowiedz je przy zamkni�tej bramie �wi�tyni, a stanie ona otworem.
	CreateInvItems(self,itmi_tempeltorkey,1);
	b_giveinvitems(self,other,itmi_tempeltorkey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//M�j czas dobiega ko�ca. Nie mog� ci wi�cej pom�c.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//Ale strze� si�. Pami�taj o komnatach Adanosa. Albo spotka ci� pewna �mier�....
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Zaczekaj. O co chodzi z tymi komnatami?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//Gasn� me si�y. �egnaj. Spotkamy si� ponownie w krainie umar�ych...
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron da� mi kamienn� tablic�, kt�ra otwiera przej�cie do �wi�tyni Adanosa.");
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,"Quarhodron wspomnia� o 'Komnatach Adanosa' i ostrzeg�, bym mia� si� na baczno�ci. Je�li nie chc� zgin�� w �wi�tyni Adanosa, musz� si� dowiedzie�, o co mu chodzi�o.");
	GHOST_SCKNOWSHOW2GETINADANOSTEMPEL = TRUE;
};


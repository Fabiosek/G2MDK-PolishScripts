
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
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Dlaczego zak³ócasz mój spokój, stra¿niku?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//Powiedz mi, z czym do mnie przychodzisz?
		Info_ClearChoices(dia_addon_quarhodron_hello);
		Info_AddChoice(dia_addon_quarhodron_hello,"Co znajduje siê w œwi¹tyni Adanosa?",dia_addon_quarhodron_hello_schwert);
		Info_AddChoice(dia_addon_quarhodron_hello,"Ktoœ dosta³ siê do œwi¹tyni Adanosa.",dia_addon_quarhodron_hello_raven);
		Info_AddChoice(dia_addon_quarhodron_hello,"Pozwól mi wejœæ do œwi¹tyni Adanosa.",dia_addon_quarhodron_hello_tempel);
		Info_AddChoice(dia_addon_quarhodron_hello,"Kraj rozdzieraj¹ trzêsienia ziemi. ",dia_addon_quarhodron_hello_erdbeben);
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
		Info_AddChoice(dia_addon_quarhodron_hello,"Wielka m¹droœæ staro¿ytnych musi ciê przyt³aczaæ.",dia_addon_quarhodron_hello_frech);
		b_quarhodron_hello_kommzumpunkt_onetime = TRUE;
	};
};

func void dia_addon_quarhodron_hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Kraj rozdzieraj¹ trzêsienia ziemi. Jeœli czegoœ nie zrobimy, ca³a wyspa zostanie zatopiona.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Nic ju¿ nie mo¿emy zrobiæ.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Na Jarkendar spad³ gniew Adanosa, który zniszczy wszystkich niewiernych.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Ktoœ dosta³ siê do œwi¹tyni Adanosa.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Niemo¿liwe. Sam zablokowa³em bramê. Nie mo¿na jej sforsowaæ.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Czy¿by?
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Pozwól mi wejœæ do œwi¹tyni Adanosa.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Œwi¹tynia ma pozostaæ zamkniêta na ca³¹ wiecznoœæ. Tak zdecydowa³a rada.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co znajduje siê w œwi¹tyni Adanosa?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//Moje najwiêksze nieszczêœcie, moje najwiêksze rozczarowanie.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//Wielka m¹droœæ staro¿ytnych musi ciê przyt³aczaæ.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Cz³owiek twojej pozycji nie mo¿e siê tak do mnie zwracaæ.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nie mogê oprzeæ siê wra¿eniu, ¿e nie jesteœ tym, za kogo siê podajesz.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Jeœli naprawdê potrzebujesz mej pomocy, bêdziesz musia³ udowodniæ swe intencje.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpowiedz na moje pytania, abym mia³ pewnoœæ, ¿e nie wyjawiê tajemnic obcemu.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron pomo¿e mi tylko pod warunkiem, ¿e udowodniê swoj¹ wartoœæ. Zada³ mi kilka trudnych pytañ. Muszê na nie odpowiedzieæ!");
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
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Twoje odpowiedzi s¹ tak z³e, jak twoje intencje.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nie pomogê ci.
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
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nie wierzê ci.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Lepiej wróæ, kiedy zdecydujesz siê mówiæ prawdê.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(QUARHODRONS_NEXTQUESTION == 1)
		{
			if(b_quarhodron_fragen_choicesonetime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//Zdolnoœci stra¿nika umar³ych pozwoli³y ci mnie obudziæ, to prawda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Jeœli naprawdê jesteœ tym, za kogo siê podajesz, zdo³asz odpowiedzieæ na wszystkie moje pytania.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Za wyj¹tkiem jednego...
				b_quarhodron_fragen_choicesonetime = TRUE;
			};
			QUARHODRONS_NEXTQUESTION = 2;
		};
		if(QUARHODRONS_NEXTQUESTION == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kto zamkn¹³ portal, by uchroniæ ludzi przed z³em?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto zamkn¹³ portal, by uchroniæ ludzi przed z³em? ---");
			QUARHODRONS_NEXTQUESTION = QUARHODRON_ALLEFRAGENGESTELLT;
		}
		else if(QUARHODRONS_NEXTQUESTION == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kto ³agodzi cierpienia i opiekuje siê chorymi?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto ³agodzi cierpienia i opiekuje siê chorymi? ---");
			QUARHODRONS_NEXTQUESTION = 7;
		}
		else if(QUARHODRONS_NEXTQUESTION == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kto ma decyduj¹cy g³os w radzie piêciu?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto ma decyduj¹cy g³os w radzie piêciu? ---");
			QUARHODRONS_NEXTQUESTION = 6;
		}
		else if(QUARHODRONS_NEXTQUESTION == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kto jest odpowiedzialny za z³o, które na nas spad³o?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto jest odpowiedzialny za z³o, które na nas spad³o? ---");
			QUARHODRONS_NEXTQUESTION = 5;
		}
		else if(QUARHODRONS_NEXTQUESTION == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kto mo¿e wydaæ mi bezpoœredni rozkaz?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto mo¿e wydaæ mi bezpoœredni rozkaz? ---");
			QUARHODRONS_NEXTQUESTION = 4;
		}
		else if(QUARHODRONS_NEXTQUESTION == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kto niegdyœ broni³ mieszkañców Jarkendaru przed wrogimi atakami?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Kto niegdyœ broni³ mieszkañców Jarkendaru przed wrogimi atakami? ---");
			QUARHODRONS_NEXTQUESTION = 3;
		};
		Info_ClearChoices(dia_addon_quarhodron_fragen);
		if(QUARHODRONS_NEXTQUESTION >= QUARHODRON_ALLEFRAGENGESTELLT)
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"Sk¹d mam to wiedzieæ?",dia_addon_quarhodron_fragen_noplan);
		}
		else
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"Nie wiem.",dia_addon_quarhodron_fragen_noplan);
		};
		Info_AddChoice(dia_addon_quarhodron_fragen,"Uczeni.",dia_addon_quarhodron_fragen_gele);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Stra¿nicy Umar³ych.",dia_addon_quarhodron_fragen_totenw);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Kap³ani.",dia_addon_quarhodron_fragen_prie);
		Info_AddChoice(dia_addon_quarhodron_fragen,"Kasta Wojowników.",dia_addon_quarhodron_fragen_warr);
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
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//Jestem Quarhodron, dawny genera³ Jarkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Przebudzi³eœ mnie.
		dia_addon_quarhodron_fragen_info_onetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Do której kasty nale¿ysz?
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Kasta wojowników.
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Kap³ani.
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//Stra¿nicy umar³ych.
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
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dobrze. Ufam ci i udzielê pomocy.
		QUARHODRONISTZUFRIEDEN = TRUE;
		Info_ClearChoices(dia_addon_quarhodron_fragen);
	}
	else if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Wiêc nie marnuj mego czasu.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_QUARHODRON_GIBMIRKEY(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_gibmirkey_condition;
	information = dia_addon_quarhodron_gibmirkey_info;
	description = "(Za¿¹daj klucza od œwi¹tyni)";
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
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Jakiœ parszywy drañ dosta³ siê do œwi¹tyni Adanosa!
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Jeœli natychmiast nie wpuœcisz mnie do œwi¹tyni, rozpêta siê tu piek³o.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//Niemo¿liwe! Najwy¿szy kap³an Khardimon i ja jesteœmy jedynymi w Jarkendarze, którzy wiedz¹, jak otworzyæ portal w œwi¹tyni Adanosa.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Có¿. Wygl¹da na to, ¿e ten Khardimon siê wygada³.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//Powtarzam, brama zosta³a otwarta. Widzia³em to na w³asne oczy.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobrze. S³yszê prawdê w twoim g³osie. Nie bêdê ju¿ w¹tpiæ w twe s³owa.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Mam nadziejê.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//WeŸ zatem s³owo, które otworzy ci przejœcie. Zapisane jest na tej kamiennej tablicy. Wypowiedz je przy zamkniêtej bramie œwi¹tyni, a stanie ona otworem.
	CreateInvItems(self,itmi_tempeltorkey,1);
	b_giveinvitems(self,other,itmi_tempeltorkey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//Mój czas dobiega koñca. Nie mogê ci wiêcej pomóc.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//Ale strze¿ siê. Pamiêtaj o komnatach Adanosa. Albo spotka ciê pewna œmieræ....
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Zaczekaj. O co chodzi z tymi komnatami?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//Gasn¹ me si³y. ¯egnaj. Spotkamy siê ponownie w krainie umar³ych...
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron da³ mi kamienn¹ tablicê, która otwiera przejœcie do œwi¹tyni Adanosa.");
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,"Quarhodron wspomnia³ o 'Komnatach Adanosa' i ostrzeg³, bym mia³ siê na bacznoœci. Jeœli nie chcê zgin¹æ w œwi¹tyni Adanosa, muszê siê dowiedzieæ, o co mu chodzi³o.");
	GHOST_SCKNOWSHOW2GETINADANOSTEMPEL = TRUE;
};



instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Co tu porabiasz?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Staram siê jak najlepiej wykonaæ zadania zlecone mi przez klasztor.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Jestem nowicjuszem w klasztorze. Wykonujê zlecenia magów i pladynów.
		AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//W³aœnie dostarczy³em trzem karczmarzom w mieœcie wino z klasztoru.
	};
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "Kim s¹ w³aœciciele trzech knajp?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Kim s¹ ci trzej karczmarze?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Jednym z nich jest ten mi³y cz³owiek za barem.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Drugim jest Caragon, prowadz¹cy tawernê na placu œwi¹tynnym, trzecim zaœ Kardif, w³aœciciel knajpy w dzielnicy portowej.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o klasztorze?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Co mo¿esz mi powiedzieæ o klasztorze?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//My, nowicjusze, poszukujemy oœwiecenia w modlitwie do Innosa, pod nadzorem magów przyswajamy te¿ podstawy wiary.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//S³u¿ymy im, by oni mogli s³u¿yæ Innosowi. No i przygotowujemy siê do zjednoczenia z Ogniem.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "Zabierz mnie do klasztoru.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Zabierz mnie do klasztoru.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Nie ma szans. Nie wiesz chyba, z iloma stworzeniami musia³em sobie poradziæ, zanim tutaj dotar³em.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Kiedy pomyœlê o tych wszystkich krwiopijcach, wilkach i goblinach, to siê cieszê, ¿e nie muszê siê st¹d ruszaæ.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Poza tym i tak nie wszed³byœ do klasztoru.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Dlaczego?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Wejœæ tam mog¹ jedynie magowie, paladyni i nowicjusze.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "Jak mogê zostaæ nowicjuszem?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//Jak mogê zostaæ nowicjuszem?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Kiedy cz³owiek czuje g³êbok¹ wewnêtrzn¹ potrzebê...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Hej - powiedz mi tylko, jakie muszê spe³niæ warunki!
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Potrzebujesz darów. Owcy i...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"Aby zostaæ nowicjuszem w klasztorze Innosa, bêdê potrzebowa³ owcy i 1000 sztuk z³ota.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "Sk¹d mam wzi¹æ tyle z³ota?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Sk¹d mam wzi¹æ tyle z³ota?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Jak mniemam, nie znasz nikogo, kto by za ciebie zap³aci³. Zatem bêdziesz je musia³ zarobiæ.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "Sk¹d mogê wzi¹æ owcê?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Sk¹d mogê wzi¹æ owcê?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//Od farmerów, oczywiœcie. Nie dostaniesz jej jednak za darmo.
	b_logentry(TOPIC_KLOSTER,"Owcê mogê zdobyæ u farmerów.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Hej, nie zgadniesz, co siê sta³o.
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Zosta³eœ wybrañcem.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//Dok³adnie. W³aœnie mia³em napiæ siê zimnego piwa, kiedy zjawi³ siê Daron i oznajmi³, ¿e zosta³em wybrañcem.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Kto by pomyœla³? Niezbadana jest wola Innosa. Co ciê tu sprowadza?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Za¿¹da³em Próby Ognia.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//Niemo¿liwe?! Cz³owieku, nie brak ci odwagi. Czy to oznacza, ¿e ty równie¿ poszukujesz 'tego, co wierny znajdzie na koñcu œcie¿ki'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Na to wygl¹da.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "I co, znalaz³eœ ju¿ coœ?";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//I co, znalaz³eœ ju¿ coœ?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//Có¿, œledzi³em Agona - ale w pewnym momencie znikn¹³ mi z oczu.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//Czekaj... Co oni tam jeszcze mówili? Pod¹¿aj za znakami Innosa. Nie rozumiem tylko tej czêœci o œcie¿kach...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//Có¿ wiêc mi pozostaje, ci¹gle szukam.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "Hej, czy ty mnie œledzisz?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Hej, czy ty mnie œledzisz?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Nonsens. Zmierzam po prostu w tym samym kierunku.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "Przestañ za mn¹ ³aziæ.";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Przestañ za mn¹ ³aziæ.
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//Nie ³a¿ê za tob¹. Ale proszê, jeœli to ma ciê uspokoiæ, pójdê inn¹ œcie¿k¹.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Wiêc znowu siê spotykamy. Ostatnio sporo rozmyœla³em. Odczuwam siln¹ chêæ zostania magiem.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Cz³owieku - nie rób tego...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//Nie mam wyboru. ¯ycie nowicjusza - to nie dla mnie.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Muszê zostaæ magiem. Wtedy wszystko zacznie siê uk³adaæ. Teraz zaœ odbiorê to, co mi siê nale¿y.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Masz jakieœ ostatnie ¿yczenie?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"Daj spokój, nie chcê ciê zabijaæ.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"Koniec gadania - muszê wracaæ do klasztoru.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"Masz coœ do palenia?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Daj spokój, nie chcê ciê zabijaæ.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Gadaj zdrów. Zdajesz sobie chyba sprawê z tego, ¿e nie masz ze mn¹ szans.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Koniec gadania - muszê wracaæ do klasztoru.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//Nigdzie nie pójdziesz!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//Masz coœ do palenia?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//Masz szczêœcie. Tak siê sk³ada, ¿e akurat mam coœ przy sobie.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Miejmy to ju¿ za sob¹.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Hej, jesteœ pewien, ¿e idziemy we w³aœciwym kierunku? Podobno gdzieœ tam mieszka troll.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Chyba lepiej udaæ siê w innym kierunku.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};


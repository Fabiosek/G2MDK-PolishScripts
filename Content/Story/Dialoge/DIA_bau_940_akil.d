
instance DIA_AKIL_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_exit_condition;
	information = dia_akil_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_akil_exit_info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Muszê ju¿ iœæ.
	if(AKIL_SAUER == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Nie zmuszaj mnie, ¿ebym ciê zatrzyma³.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Powodzenia. Naprawdê chcia³bym zrobiæ dla ciebie coœ wiêcej.
	};
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_HALLO(C_INFO)
{
	npc = bau_940_akil;
	nr = 4;
	condition = dia_akil_hallo_condition;
	information = dia_akil_hallo_info;
	permanent = FALSE;
	description = "Masz jakieœ k³opoty?";
};


func int dia_akil_hallo_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_hallo_info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Masz jakieœ k³opoty?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//...Ech... nie, nie... wszystko w porz¹dku. Chyba... bêdzie lepiej, jak ju¿ sobie pójdziesz.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Na pewno?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Ech... Tak, tak... wszystko w porz¹dku. Ty... ech... ja... ja... nie mogê teraz z tob¹ rozmawiaæ.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Farmie Akila zagra¿aj¹ najemnicy.");
	AKILS_SLDSTILLTHERE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NICHTJETZT(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_nichtjetzt_condition;
	information = dia_akil_nichtjetzt_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_akil_nichtjetzt_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_KnowsInfo(other,dia_akil_hallo))
	{
		return TRUE;
	};
};

func void dia_akil_nichtjetzt_info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Ech... Nie teraz, teraz nie mogê z tob¹ rozmawiaæ.
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NACHKAMPF(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_akil_nachkampf_condition;
	information = dia_akil_nachkampf_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_akil_nachkampf_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_nachkampf_info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Dziêki Innosowi. Myœla³em, ¿e mój czas dobieg³ koñca.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Nazywam siê Akil. Uprawiam ten skromny skrawek ziemi.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Kim byli ci ludzie?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Powinieneœ ich rozpoznaæ. To byli najemnicy z gospodarstwa Onara. Tacy jak ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//To byli najemnicy z gospodarstwa Onara. Ci dranie znaj¹ siê tylko na grabie¿ach i mordach.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Ba³em siê najgorszego...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//...có¿, dziêki Innosowi, ¿e do tego nie dosz³o. Powiedz mi, co mogê dla ciebie zrobiæ?
	Info_ClearChoices(dia_akil_nachkampf);
	Info_AddChoice(dia_akil_nachkampf,"Nic. Pod warunkiem, ¿e wszystko jest w porz¹dku.",dia_akil_nachkampf_ehre);
	Info_AddChoice(dia_akil_nachkampf,"Mo¿e parê sztuk z³ota?",dia_akil_nachkampf_gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(kati) && !Npc_IsDead(kati))
	{
		Npc_ExchangeRoutine(kati,"Start");
		AI_ContinueRoutine(kati);
		kati.flags = 0;
	};
	if(Hlp_IsValidNpc(randolph) && !Npc_IsDead(randolph))
	{
		Npc_ExchangeRoutine(randolph,"Start");
		AI_ContinueRoutine(randolph);
		randolph.flags = 0;
	};
	TOPIC_END_AKILSSLDSTILLTHERE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_akil_nachkampf_ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Nic. Pod warunkiem, ¿e wszystko jest w porz¹dku.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Jesteœ wyj¹tkowym cz³owiekiem. Niech ciê Innos ma w swej opiece.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
	Info_ClearChoices(dia_akil_nachkampf);
};

func void dia_akil_nachkampf_gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Mo¿e parê sztuk z³ota?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Obawiam siê, ¿e ciê rozczarujê - jesteœmy biedakami. Wystarcza nam na proste ¿ycie.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Mogê ci tylko zaproponowaæ posi³ek. IdŸ do Kati, ona siê tob¹ zajmie.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOF);
	Info_ClearChoices(dia_akil_nachkampf);
	KATI_MAHLZEIT = TRUE;
};


instance DIA_AKIL_SOELDNER(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_soeldner_condition;
	information = dia_akil_soeldner_info;
	permanent = FALSE;
	description = "Czego chcieli od ciebie ci najemnicy?";
};


func int dia_akil_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf))
	{
		return TRUE;
	};
};

func void dia_akil_soeldner_info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Czego chcieli od ciebie ci najemnicy?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Nabierasz mnie. Ci najemnicy chcieli zebraæ pieni¹dze za czynsz.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Nie wiesz? Wynaj¹³ ich zarz¹dca Onar. Broni¹ jego gospodarstwa i zbieraj¹ dla niego czynsz.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//To znaczy chodz¹ od domu do domu i zabieraj¹ co chc¹. A kto nie mo¿e zap³aciæ, poznaje smak stali.
	};
};


instance DIA_ADDON_AKIL_MISSINGPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_missingpeople_condition;
	information = dia_addon_akil_missingpeople_info;
	description = "S³ysza³eœ coœ o zaginionych mieszkañcach miasta?";
};


func int dia_addon_akil_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_akil_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//S³ysza³eœ coœ o zaginionych mieszkañcach miasta?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//A to paradne! Czy s³ysza³em? Kilku moich parobków te¿ gdzieœ przepad³o.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Choæby Tonak i Tabor, którzy pracowali na polu. Trzy dni temu przepadli. Jak kamieñ w wodê.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//Wiem, ¿e nie opuœciliby farmy bez s³owa. W koñcu nie trzyma³em ich tu si³¹.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Po prostu zniknêli i, co gorsza, nikt nie potrafi powiedzieæ, co siê z nimi sta³o.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Jeœli ich spotkasz, dasz mi znaæ, dobra?
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Zaginêli robotnicy farmera Akila: Tonak i Telbor.");
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_RUNNING;
};


instance DIA_ADDON_AKIL_RETURNPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_returnpeople_condition;
	information = dia_addon_akil_returnpeople_info;
	permanent = FALSE;
	description = "Jeœli chodzi o twoich parobków...";
};


func int dia_addon_akil_returnpeople_condition()
{
	if((MIS_AKIL_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (MISSINGPEOPLERETURNEDHOME == TRUE) && ((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_akil_returnpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//Jeœli chodzi o twoich parobków...
	if((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Dziêki tobie wrócili. Jesteœ odwa¿nym cz³owiekiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Przynajmniej jeden z nich prze¿y³.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Proszê, weŸ to z³oto. Zas³u¿y³eœ na nie.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveplayerxp(XP_AMBIENT);
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_SUCCESS;
};


instance DIA_AKIL_LIEFERUNG(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_lieferung_condition;
	information = dia_akil_lieferung_info;
	permanent = FALSE;
	description = "Baltram mnie przys³a³...";
};


func int dia_akil_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_akil_lieferung_info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Baltram mnie przys³a³. Mam dla niego zabraæ dostawê.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//A wiêc jesteœ jego nowym pos³añcem. W porz¹dku, mam ju¿ gotow¹ paczkê.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
	b_logentry(TOPIC_BALTRAM,"Mam przesy³kê. Mogê j¹ teraz zabraæ do Baltrama...");
	b_logentry(TOPIC_NAGUR,"Mam przesy³kê. Mogê j¹ teraz zabraæ do Nagura...");
};


instance DIA_AKIL_GEGEND(C_INFO)
{
	npc = bau_940_akil;
	nr = 90;
	condition = dia_akil_gegend_condition;
	information = dia_akil_gegend_info;
	permanent = FALSE;
	description = "Znasz mo¿e trochê okolicê?";
};


func int dia_akil_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int knows_taverne;

func void dia_akil_gegend_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Znasz mo¿e trochê okolicê?
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Jasne, co chcesz wiedzieæ?
};


instance DIA_AKIL_HOF(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_hof_condition;
	information = dia_akil_hof_info;
	permanent = FALSE;
	description = "Gdzie znajdê gospodarstwo Onara?";
};


func int dia_akil_hof_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_hof_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Gdzie znajdê gospodarstwo Onara?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Cofnij siê do kamiennych schodów i idŸ drog¹ na wschód.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Tak dojdziesz do tawerny. Stamt¹d idŸ dalej na wschód, dopóki nie dojdziesz do wielkich pól. Tam siê krêc¹ najemnicy.
	KNOWS_TAVERNE = TRUE;
};


instance DIA_AKIL_TAVERNE(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_taverne_condition;
	information = dia_akil_taverne_info;
	permanent = FALSE;
	description = "Co to za gospoda, ta na wschodzie?";
};


func int dia_akil_taverne_condition()
{
	if(KNOWS_TAVERNE == TRUE)
	{
		return TRUE;
	};
};

func void dia_akil_taverne_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Co to za gospoda, ta na wschodzie?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Zapytaj Randolfa. On wie na ten temat wiêcej. By³ tam kilka razy.
};


instance DIA_AKIL_WALD(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_wald_condition;
	information = dia_akil_wald_info;
	permanent = FALSE;
	description = "Co jest w lasach za twoim gospodarstwem?";
};


func int dia_akil_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_wald_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//Co jest w lasach za twoim gospodarstwem?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Tam jest pe³no potworów, a wilki nie s¹ z nich najgroŸniejsze.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Podobno gdzieœ tam, w pieczarach, ukrywaj¹ siê te¿ bandyci. Ale jak na razie, zostawiaj¹ moje gospodarstwo w spokoju.
};


instance DIA_AKIL_PERM(C_INFO)
{
	npc = bau_940_akil;
	nr = 32;
	condition = dia_akil_perm_condition;
	information = dia_akil_perm_info;
	permanent = TRUE;
	description = "Czy coœ jeszcze siê dzia³o?";
};


func int dia_akil_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_akil_perm_info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Czy coœ jeszcze siê dzia³o?
	if(KAPITEL == 3)
	{
		if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Nie. Mam nadziejê, ¿e owce pozostan¹ tam, gdzie teraz s¹.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Ci¹gle znikaj¹ mi owce. Nied³ugo nie bêdê móg³ nas wykarmiæ.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Wszêdzie pojawili siê orkowie. Ktoœ nawet wspomina³ o ich g³ównej kwaterze. Zapytaj o to farmera Lobarta.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Widziano te¿ w okolicy jaszczuroludzi. Na twoim miejscu nie szed³bym do jaskiñ.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Szukaj¹ ciê ludzie w czarnych kapturach.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//O, to temat na ca³¹ powieœæ.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//W porz¹dku. Tak sobie tylko pomyœla³em, ¿e o tym wspomnê.
		};
	};
};


instance DIA_AKIL_KAP3_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap3_exit_condition;
	information = dia_akil_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_akil_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_SCHAFDIEB(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdieb_condition;
	information = dia_akil_schafdieb_info;
	description = "O, to temat na ca³¹ powieœæ.";
};


func int dia_akil_schafdieb_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_akil_schafdieb_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Czy wydarzy³o siê jeszcze coœ nowego?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Ostatnio ktoœ kradnie mi owce. Nie mogê spaæ spokojnie.
	Info_ClearChoices(dia_akil_schafdieb);
	Info_AddChoice(dia_akil_schafdieb,"To nie mój problem.",dia_akil_schafdieb_nein);
	Info_AddChoice(dia_akil_schafdieb,"Ile owiec ci zginê³o?",dia_akil_schafdieb_wieviel);
	Info_AddChoice(dia_akil_schafdieb,"Kto móg³ to zrobiæ?",dia_akil_schafdieb_wer);
	MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSCHAFDIEBE,"Akilowi gin¹ kolejne owce. Podejrzewa, ¿e to sprawka bandytów ukrywaj¹cych siê w pobliskiej leœnej jaskini.");
};

func void dia_akil_schafdieb_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Kto móg³ to zrobiæ?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Mam pewne podejrzenia.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//W jaskiniach w lesie ukrywaj¹ siê jacyœ paskudni osobnicy.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Jakoœ trudno mi uwierzyæ, ¿e ¿ywi¹ siê jagódkami. Jestem prawie pewien, ¿e to przez nich znikaj¹ moje owce.
	Info_ClearChoices(dia_akil_schafdieb);
};

func void dia_akil_schafdieb_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Ile owiec ci zginê³o?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Do tej pory straci³em co najmniej trzy.
};

func void dia_akil_schafdieb_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//To nie mój problem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Rozumiem. Masz inne sprawy na g³owie.
	Info_ClearChoices(dia_akil_schafdieb);
};


instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdiebeplatt_condition;
	information = dia_akil_schafdiebeplatt_info;
	description = "Znalaz³em z³odziei owiec.";
};


func int dia_akil_schafdiebeplatt_condition()
{
	if((KAPITEL >= 3) && (MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && Npc_IsDead(bdt_1025_bandit_h) && Npc_IsDead(bdt_1026_bandit_h) && Npc_IsDead(bdt_1027_bandit_h))
	{
		return TRUE;
	};
};

func void dia_akil_schafdiebeplatt_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Znalaz³em z³odziei owiec.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Mia³eœ racjê. To ci ludzie z lasu. Ju¿ nigdy ciê nie okradn¹.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Dziêkujê, szlachetny s³ugo Innosa.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Dziêki. A wiêc stra¿ naprawdê dba o nas, prostych ch³opów.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Dziêki. Dziwny z ciebie najemnik. Nie taki jak ci, których zna³em do tej pory.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//WeŸ to jako ma³y wyraz mojej wdziêcznoœci za tw¹ bezinteresown¹ pomoc.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_AKIL_SCHAFDIEBE = LOG_SUCCESS;
	b_giveplayerxp(XP_AKIL_SCHAFDIEBE);
};


instance DIA_AKIL_AKILSSCHAF(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_akilsschaf_condition;
	information = dia_akil_akilsschaf_info;
	description = "(Oddaj owce Akila)";
};


func int dia_akil_akilsschaf_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToNpc(self,follow_sheep_akil) < 1000) && (MIS_AKIL_SCHAFDIEBE != 0))
	{
		return TRUE;
	};
};

func void dia_akil_akilsschaf_info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Bardzo dobrze. Tu masz kilka monet. Mam nadziejê, ¿e to wystarczy.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	follow_sheep_akil.aivar[AIV_PARTYMEMBER] = FALSE;
	follow_sheep_akil.wp = "NW_FARM2_OUT_02";
	follow_sheep_akil.start_aistate = zs_mm_allscheduler;
	b_giveplayerxp(XP_AKILSSCHAF);
};


instance DIA_AKIL_KAP4_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap4_exit_condition;
	information = dia_akil_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_akil_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP5_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap5_exit_condition;
	information = dia_akil_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_akil_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP6_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap6_exit_condition;
	information = dia_akil_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_akil_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_PICKPOCKET(C_INFO)
{
	npc = bau_940_akil;
	nr = 900;
	condition = dia_akil_pickpocket_condition;
	information = dia_akil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_akil_pickpocket_condition()
{
	return c_beklauen(37,30);
};

func void dia_akil_pickpocket_info()
{
	Info_ClearChoices(dia_akil_pickpocket);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_BACK,dia_akil_pickpocket_back);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_PICKPOCKET,dia_akil_pickpocket_doit);
};

func void dia_akil_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_akil_pickpocket);
};

func void dia_akil_pickpocket_back()
{
	Info_ClearChoices(dia_akil_pickpocket);
};


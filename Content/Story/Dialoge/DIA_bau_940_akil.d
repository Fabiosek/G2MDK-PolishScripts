
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
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Musz� ju� i��.
	if(AKIL_SAUER == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Nie zmuszaj mnie, �ebym ci� zatrzyma�.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Powodzenia. Naprawd� chcia�bym zrobi� dla ciebie co� wi�cej.
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
	description = "Masz jakie� k�opoty?";
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
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Masz jakie� k�opoty?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//...Ech... nie, nie... wszystko w porz�dku. Chyba... b�dzie lepiej, jak ju� sobie p�jdziesz.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Na pewno?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Ech... Tak, tak... wszystko w porz�dku. Ty... ech... ja... ja... nie mog� teraz z tob� rozmawia�.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Farmie Akila zagra�aj� najemnicy.");
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
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Ech... Nie teraz, teraz nie mog� z tob� rozmawia�.
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
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Dzi�ki Innosowi. My�la�em, �e m�j czas dobieg� ko�ca.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Nazywam si� Akil. Uprawiam ten skromny skrawek ziemi.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Kim byli ci ludzie?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Powiniene� ich rozpozna�. To byli najemnicy z gospodarstwa Onara. Tacy jak ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//To byli najemnicy z gospodarstwa Onara. Ci dranie znaj� si� tylko na grabie�ach i mordach.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Ba�em si� najgorszego...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//...c�, dzi�ki Innosowi, �e do tego nie dosz�o. Powiedz mi, co mog� dla ciebie zrobi�?
	Info_ClearChoices(dia_akil_nachkampf);
	Info_AddChoice(dia_akil_nachkampf,"Nic. Pod warunkiem, �e wszystko jest w porz�dku.",dia_akil_nachkampf_ehre);
	Info_AddChoice(dia_akil_nachkampf,"Mo�e par� sztuk z�ota?",dia_akil_nachkampf_gold);
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
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Nic. Pod warunkiem, �e wszystko jest w porz�dku.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Jeste� wyj�tkowym cz�owiekiem. Niech ci� Innos ma w swej opiece.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
	Info_ClearChoices(dia_akil_nachkampf);
};

func void dia_akil_nachkampf_gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Mo�e par� sztuk z�ota?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Obawiam si�, �e ci� rozczaruj� - jeste�my biedakami. Wystarcza nam na proste �ycie.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Mog� ci tylko zaproponowa� posi�ek. Id� do Kati, ona si� tob� zajmie.
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
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Nabierasz mnie. Ci najemnicy chcieli zebra� pieni�dze za czynsz.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Nie wiesz? Wynaj�� ich zarz�dca Onar. Broni� jego gospodarstwa i zbieraj� dla niego czynsz.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//To znaczy chodz� od domu do domu i zabieraj� co chc�. A kto nie mo�e zap�aci�, poznaje smak stali.
	};
};


instance DIA_ADDON_AKIL_MISSINGPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_missingpeople_condition;
	information = dia_addon_akil_missingpeople_info;
	description = "S�ysza�e� co� o zaginionych mieszka�cach miasta?";
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
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//S�ysza�e� co� o zaginionych mieszka�cach miasta?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//A to paradne! Czy s�ysza�em? Kilku moich parobk�w te� gdzie� przepad�o.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Cho�by Tonak i Tabor, kt�rzy pracowali na polu. Trzy dni temu przepadli. Jak kamie� w wod�.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//Wiem, �e nie opu�ciliby farmy bez s�owa. W ko�cu nie trzyma�em ich tu si��.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Po prostu znikn�li i, co gorsza, nikt nie potrafi powiedzie�, co si� z nimi sta�o.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Je�li ich spotkasz, dasz mi zna�, dobra?
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Zagin�li robotnicy farmera Akila: Tonak i Telbor.");
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_RUNNING;
};


instance DIA_ADDON_AKIL_RETURNPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_returnpeople_condition;
	information = dia_addon_akil_returnpeople_info;
	permanent = FALSE;
	description = "Je�li chodzi o twoich parobk�w...";
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
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//Je�li chodzi o twoich parobk�w...
	if((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Dzi�ki tobie wr�cili. Jeste� odwa�nym cz�owiekiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Przynajmniej jeden z nich prze�y�.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Prosz�, we� to z�oto. Zas�u�y�e� na nie.
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
	description = "Baltram mnie przys�a�...";
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
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Baltram mnie przys�a�. Mam dla niego zabra� dostaw�.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//A wi�c jeste� jego nowym pos�a�cem. W porz�dku, mam ju� gotow� paczk�.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
	b_logentry(TOPIC_BALTRAM,"Mam przesy�k�. Mog� j� teraz zabra� do Baltrama...");
	b_logentry(TOPIC_NAGUR,"Mam przesy�k�. Mog� j� teraz zabra� do Nagura...");
};


instance DIA_AKIL_GEGEND(C_INFO)
{
	npc = bau_940_akil;
	nr = 90;
	condition = dia_akil_gegend_condition;
	information = dia_akil_gegend_info;
	permanent = FALSE;
	description = "Znasz mo�e troch� okolic�?";
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
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Znasz mo�e troch� okolic�?
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Jasne, co chcesz wiedzie�?
};


instance DIA_AKIL_HOF(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_hof_condition;
	information = dia_akil_hof_info;
	permanent = FALSE;
	description = "Gdzie znajd� gospodarstwo Onara?";
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
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Gdzie znajd� gospodarstwo Onara?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Cofnij si� do kamiennych schod�w i id� drog� na wsch�d.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Tak dojdziesz do tawerny. Stamt�d id� dalej na wsch�d, dop�ki nie dojdziesz do wielkich p�l. Tam si� kr�c� najemnicy.
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
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Zapytaj Randolfa. On wie na ten temat wi�cej. By� tam kilka razy.
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
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Tam jest pe�no potwor�w, a wilki nie s� z nich najgro�niejsze.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Podobno gdzie� tam, w pieczarach, ukrywaj� si� te� bandyci. Ale jak na razie, zostawiaj� moje gospodarstwo w spokoju.
};


instance DIA_AKIL_PERM(C_INFO)
{
	npc = bau_940_akil;
	nr = 32;
	condition = dia_akil_perm_condition;
	information = dia_akil_perm_info;
	permanent = TRUE;
	description = "Czy co� jeszcze si� dzia�o?";
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
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Czy co� jeszcze si� dzia�o?
	if(KAPITEL == 3)
	{
		if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Nie. Mam nadziej�, �e owce pozostan� tam, gdzie teraz s�.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Ci�gle znikaj� mi owce. Nied�ugo nie b�d� m�g� nas wykarmi�.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Wsz�dzie pojawili si� orkowie. Kto� nawet wspomina� o ich g��wnej kwaterze. Zapytaj o to farmera Lobarta.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Widziano te� w okolicy jaszczuroludzi. Na twoim miejscu nie szed�bym do jaski�.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Szukaj� ci� ludzie w czarnych kapturach.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//O, to temat na ca�� powie��.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//W porz�dku. Tak sobie tylko pomy�la�em, �e o tym wspomn�.
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
	description = "O, to temat na ca�� powie��.";
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
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Czy wydarzy�o si� jeszcze co� nowego?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Ostatnio kto� kradnie mi owce. Nie mog� spa� spokojnie.
	Info_ClearChoices(dia_akil_schafdieb);
	Info_AddChoice(dia_akil_schafdieb,"To nie m�j problem.",dia_akil_schafdieb_nein);
	Info_AddChoice(dia_akil_schafdieb,"Ile owiec ci zgin�o?",dia_akil_schafdieb_wieviel);
	Info_AddChoice(dia_akil_schafdieb,"Kto m�g� to zrobi�?",dia_akil_schafdieb_wer);
	MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSCHAFDIEBE,"Akilowi gin� kolejne owce. Podejrzewa, �e to sprawka bandyt�w ukrywaj�cych si� w pobliskiej le�nej jaskini.");
};

func void dia_akil_schafdieb_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Kto m�g� to zrobi�?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Mam pewne podejrzenia.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//W jaskiniach w lesie ukrywaj� si� jacy� paskudni osobnicy.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Jako� trudno mi uwierzy�, �e �ywi� si� jag�dkami. Jestem prawie pewien, �e to przez nich znikaj� moje owce.
	Info_ClearChoices(dia_akil_schafdieb);
};

func void dia_akil_schafdieb_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Ile owiec ci zgin�o?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Do tej pory straci�em co najmniej trzy.
};

func void dia_akil_schafdieb_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//To nie m�j problem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Rozumiem. Masz inne sprawy na g�owie.
	Info_ClearChoices(dia_akil_schafdieb);
};


instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdiebeplatt_condition;
	information = dia_akil_schafdiebeplatt_info;
	description = "Znalaz�em z�odziei owiec.";
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
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Znalaz�em z�odziei owiec.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Mia�e� racj�. To ci ludzie z lasu. Ju� nigdy ci� nie okradn�.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Dzi�kuj�, szlachetny s�ugo Innosa.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Dzi�ki. A wi�c stra� naprawd� dba o nas, prostych ch�op�w.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Dzi�ki. Dziwny z ciebie najemnik. Nie taki jak ci, kt�rych zna�em do tej pory.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//We� to jako ma�y wyraz mojej wdzi�czno�ci za tw� bezinteresown� pomoc.
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
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Bardzo dobrze. Tu masz kilka monet. Mam nadziej�, �e to wystarczy.
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


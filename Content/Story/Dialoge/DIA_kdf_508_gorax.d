
instance DIA_GORAX_KAP1_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap1_exit_condition;
	information = dia_gorax_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_gorax_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_PICKPOCKET(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 888;
	condition = dia_gorax_pickpocket_condition;
	information = dia_gorax_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie trudnym zadaniem)";
};


func int dia_gorax_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_gorax_pickpocket_info()
{
	Info_ClearChoices(dia_gorax_pickpocket);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_BACK,dia_gorax_pickpocket_back);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_PICKPOCKET,dia_gorax_pickpocket_doit);
};

func void dia_gorax_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itke_klosterschatz,1);
		b_giveinvitems(self,other,itke_klosterschatz,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gorax_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gorax_pickpocket_back()
{
	Info_ClearChoices(dia_gorax_pickpocket);
};


instance DIA_GORAX_HELP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_help_condition;
	information = dia_gorax_help_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_help_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gorax_help_info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Czy mogê ci w czymœ pomóc?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "Przynios³em z³oto.";
};


var int dia_gorax_gold_perm;

func int dia_gorax_gold_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_gold_info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Przynios³em z³oto.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//Rozumiem - chcesz z³o¿yæ Innosowi ofiarê. To bardzo dobrze, mój synu.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Twoja ofiara zostanie wykorzystana na potrzeby klasztoru zgodnie z wol¹ Innosa.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co zrobi³eœ z tym z³otem? Wyda³eœ je? Wróæ, kiedy je odzyskasz!
	};
};


instance DIA_ADDON_GORAX_DARONSSTATUE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_addon_gorax_daronsstatue_condition;
	information = dia_addon_gorax_daronsstatue_info;
	permanent = TRUE;
	description = "Mam tu pos¹¿ek, który za spraw¹ Darona mia³ trafiæ do klasztoru.";
};


func int dia_addon_gorax_daronsstatue_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gorax_daronsstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Mam tu pos¹¿ek, który za spraw¹ Darona mia³ trafiæ do klasztoru.
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//Szkoda, ¿e tak cenny przedmiot przynosi zwyk³y nowicjusz...
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Jest to mimo wszystko œwiadectwo twego oddania sprawie Innosa.
		if(b_giveinvitems(other,self,itmi_lostinnosstatue_daron,1))
		{
			Npc_RemoveInvItems(self,itmi_lostinnosstatue_daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Mo¿esz liczyæ na m¹ wdziêcznoœæ, m³odzieñcze.
		MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_RETURNEDLOSTINNOSSTATUE_DARON);
		DIA_GORAX_GOLD_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Pos¹¿ek? Nie widzê tu ¿adnego pos¹¿ka. Uwierzê ci, gdy go zobaczê.
	};
};


instance DIA_GORAX_SLEEP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 4;
	condition = dia_gorax_sleep_condition;
	information = dia_gorax_sleep_info;
	description = "Szukam noclegu.";
};


func int dia_gorax_sleep_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_gorax_sleep_info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Szukam noclegu.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Tu obok jest puste ³ó¿ko. Pierwsze po prawej stronie, zaraz przy wejœciu. Mo¿esz tam spaæ.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Jeœli chcesz, mo¿esz skorzystaæ z któregoœ z nieu¿ywanych kufrów.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//I pamiêtaj - nie wchodŸ do komnat sypialnych magów. Nie wolno ci równie¿ wchodziæ do biblioteki, chyba ¿e uzyskasz pozwolenie.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "Czy masz dla mnie jakieœ zadanie?";
};


func int dia_gorax_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//Czy masz dla mnie jakieœ zadanie?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Pracowaliœcie ostatnio ciê¿ko, nowicjusze. A kto du¿o pracuje, musi du¿o jeœæ.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Dajê ci klucz do spi¿arni. Znajdziesz tam trochê baraniej kie³basy. Rozdziel j¹ sprawiedliwie pomiêdzy nowicjuszy.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//Wróæ do mnie, kiedy ju¿ to za³atwisz.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"Mistrz Gorax chce, abym wzi¹³ ze spi¿arni barani¹ kie³basê i rozdzieli³ j¹ sprawiedliwie miêdzy nowicjuszy. Poza mn¹ w klasztorze przebywa ich jeszcze trzynastu.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "Rozda³em kie³basê (ukoñczenie zadania).";
};


func int dia_gorax_wurst_condition()
{
	if((MIS_GORAXESSEN == LOG_RUNNING) && (Mob_HasItems("WURSTTRUHE",itfo_schafswurst) == 0))
	{
		return TRUE;
	};
};

func void dia_gorax_wurst_info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Rozda³em kie³basê.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//Doskonale siê spisa³eœ. WeŸ te zwoje leczenia - i wracaj do pracy.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Doprawdy? Chyba nie w³o¿y³eœ w swoj¹ pracê wystarczaj¹co du¿o wysi³ku.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//NajwyraŸniej zjad³eœ tê kie³basê sam albo da³eœ komuœ wiêcej, ni¿ mu siê nale¿a³o.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Pos³uchaj: poniewa¿ jesteœ nowy - tylko i wy³¹cznie dlatego - tym razem ci darujê. Zapamiêtaj to sobie dobrze, nowicjuszu!
		MIS_GORAXESSEN = LOG_FAILED;
	};
};


instance DIA_GORAX_AUFGABE2(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe2_condition;
	information = dia_gorax_aufgabe2_info;
	permanent = FALSE;
	description = "Czy masz dla mnie jeszcze jakieœ zadania?";
};


func int dia_gorax_aufgabe2_condition()
{
	if(((MIS_GORAXESSEN == LOG_SUCCESS) || (MIS_GORAXESSEN == LOG_FAILED)) && (Npc_IsDead(orlan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe2_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//Czy masz dla mnie jeszcze jakieœ zadania?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Tak. Jak zapewne wiesz, wyrabiamy tutaj doskona³e wino. Zajmujemy siê równie¿ jego sprzeda¿¹.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Orlan, w³aœciciel gospody 'Pod Martw¹ Harpi¹', zamówi³ u nas dostawê. Uzgodniliœmy cenê 240 sztuk z³ota.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Zanieœ Orlanowi te butelki - i nie pozwól mu siê wykrêciæ od umówionej kwoty.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"Mistrz Gorax chce, abym zaniós³ Orlanowi, w³aœcicielowi gospody, dwanaœcie butelek wina. Mam za nie dostaæ 240 sztuk z³ota.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "By³em u Orlana.";
};


var int dia_gorax_orlan_permanent;

func int dia_gorax_orlan_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_wein) && (DIA_GORAX_ORLAN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_orlan_info()
{
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//By³em u Orlana.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//I co, dosta³eœ 240 sztuk z³ota?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"Oszuka³ mnie! (oddaj 100 sztuk z³ota)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"Mam z³oto. (oddaj 240 sztuk z³ota)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co zrobi³eœ z tym z³otem? Wyda³eœ je? Wróæ, kiedy je odzyskasz!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Wyrolowa³ mnie.
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Sprzeda³eœ mu towar po ni¿szej cenie? No nie. Dlaczego powierzy³em to zadanie w³aœnie TOBIE?
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Naprawdê jesteœ zupe³nie bezu¿yteczny. ZejdŸ mi z oczu.
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Mam z³oto.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Doskonale. Przyjmij ten zwój leczenia jako swoj¹ zap³atê. A teraz idŸ, znajdŸ sobie jakieœ zajêcie.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Ju¿ zd¹¿y³eœ wydaæ czêœæ tych pieniêdzy, prawda? Do niczego siê nie nadajesz - zejdŸ mi z oczu!
		MIS_GORAXWEIN = LOG_FAILED;
		b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	};
	Info_ClearChoices(dia_gorax_orlan);
};


instance DIA_GORAX_JOB(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 35;
	condition = dia_gorax_job_condition;
	information = dia_gorax_job_info;
	permanent = FALSE;
	description = "Czym siê tu zajmujesz?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//Na czym polega twoja praca?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Och, zajmujê siê ró¿nymi rzeczami. Przede wszystkim pe³niê funkcje zarz¹dcy i skarbnika.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Dogl¹dam równie¿ produkcji wina i zajmujê siê zaopatrzeniem klasztoru w ¿ywnoœæ.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Jeœli bêdziesz czegoœ potrzebowa³, znajdziesz to u mnie - oczywiœcie, za drobn¹ op³at¹.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistrz Gorax zaopatrzy mnie w klasztorze we wszystko, czego bêdê potrzebowa³.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Potrzebujê paru rzeczy...";
};


func int dia_gorax_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorax_job))
	{
		return TRUE;
	};
};

func void dia_gorax_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Potrzebujê paru rzeczy...
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "Potrzebujê miejsca do spania.";
};


func int dia_gorax_kdf_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_gorax_kdf_info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Potrzebujê miejsca do spania.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//Po prawej stronie jest pusta komnata. Proszê, oto klucz. W œrodku znajdziesz wszystko, czego potrzebujesz.
	b_giveinvitems(self,other,itke_kdfplayer,1);
	Wld_InsertItem(itpo_perm_mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_GORAX_KAP2_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap2_exit_condition;
	information = dia_gorax_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gorax_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP3_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap3_exit_condition;
	information = dia_gorax_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_gorax_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KILLPEDRO(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_killpedro_condition;
	information = dia_gorax_killpedro_info;
	important = TRUE;
};


func int dia_gorax_killpedro_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_gorax_killpedro_info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Zaczekaj, najemniku, muszê z tob¹ porozmawiaæ.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Klasztor jest w bardzo trudnej sytuacji.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//Teraz panuje tu atmosfera nieufnoœci. W dodatku ta sprawa z Pedrem, to jest dla nas bardzo...
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//Mam dla ciebie zlecenie. Jesteœ jedyn¹ osoba, która mo¿e nam pomóc, poniewa¿ nie nale¿ysz do Bractwa Ognia.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Muszê ciê jednak ostrzec. Jeœli przyjmiesz moje zlecenie, bêdziesz je musia³ wykonaæ. Kiedy ju¿ dowiesz siê, o co chodzi, nie bêdziesz mia³ wyboru. Czy wszystko jasne?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"Zapomnij. To dla mnie zbyt ryzykowne.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"Powiedz mi, co to za zadanie.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Zapomnij. To dla mnie zbyt ryzykowne.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//Dobrze. Wobec tego, zapomnijmy o ca³ej sprawie.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Powiedz mi, co to za zadanie.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Dobrze. Tylko s³uchaj uwa¿nie, bo drugi raz tego nie powtórzê.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Serpentes chce, ¿ebyœ znalaz³ Pedra i zabi³ go za zdradê.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Zap³atê dostaniesz, jak tylko wykonasz zadanie.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Nigdy tego nie powiedzia³em. A ty te¿ nigdy nic nie s³ysza³eœ, jasne?
	b_logentry(TOPIC_TRAITORPEDRO,"Gorax przekaza³ mi, ¿e Serpentes chce, abym zabi³ zdrajcê Pedra, jeœli gdzieœ go spotkam.");
	b_giveplayerxp(XP_GORAX_KILLPEDRO_GOTMISSION);
	MIS_GORAX_KILLPEDRO = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP4_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap4_exit_condition;
	information = dia_gorax_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gorax_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP5_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap5_exit_condition;
	information = dia_gorax_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gorax_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


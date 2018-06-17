
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
	description = "(Kradzie� tego klucza b�dzie trudnym zadaniem)";
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
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Czy mog� ci w czym� pom�c?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "Przynios�em z�oto.";
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
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Przynios�em z�oto.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//Rozumiem - chcesz z�o�y� Innosowi ofiar�. To bardzo dobrze, m�j synu.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Twoja ofiara zostanie wykorzystana na potrzeby klasztoru zgodnie z wol� Innosa.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co zrobi�e� z tym z�otem? Wyda�e� je? Wr��, kiedy je odzyskasz!
	};
};


instance DIA_ADDON_GORAX_DARONSSTATUE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_addon_gorax_daronsstatue_condition;
	information = dia_addon_gorax_daronsstatue_info;
	permanent = TRUE;
	description = "Mam tu pos��ek, kt�ry za spraw� Darona mia� trafi� do klasztoru.";
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
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Mam tu pos��ek, kt�ry za spraw� Darona mia� trafi� do klasztoru.
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//Szkoda, �e tak cenny przedmiot przynosi zwyk�y nowicjusz...
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Jest to mimo wszystko �wiadectwo twego oddania sprawie Innosa.
		if(b_giveinvitems(other,self,itmi_lostinnosstatue_daron,1))
		{
			Npc_RemoveInvItems(self,itmi_lostinnosstatue_daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Mo�esz liczy� na m� wdzi�czno��, m�odzie�cze.
		MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_RETURNEDLOSTINNOSSTATUE_DARON);
		DIA_GORAX_GOLD_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Pos��ek? Nie widz� tu �adnego pos��ka. Uwierz� ci, gdy go zobacz�.
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
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Tu obok jest puste ��ko. Pierwsze po prawej stronie, zaraz przy wej�ciu. Mo�esz tam spa�.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Je�li chcesz, mo�esz skorzysta� z kt�rego� z nieu�ywanych kufr�w.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//I pami�taj - nie wchod� do komnat sypialnych mag�w. Nie wolno ci r�wnie� wchodzi� do biblioteki, chyba �e uzyskasz pozwolenie.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "Czy masz dla mnie jakie� zadanie?";
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
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//Czy masz dla mnie jakie� zadanie?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Pracowali�cie ostatnio ci�ko, nowicjusze. A kto du�o pracuje, musi du�o je��.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Daj� ci klucz do spi�arni. Znajdziesz tam troch� baraniej kie�basy. Rozdziel j� sprawiedliwie pomi�dzy nowicjuszy.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//Wr�� do mnie, kiedy ju� to za�atwisz.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"Mistrz Gorax chce, abym wzi�� ze spi�arni barani� kie�bas� i rozdzieli� j� sprawiedliwie mi�dzy nowicjuszy. Poza mn� w klasztorze przebywa ich jeszcze trzynastu.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "Rozda�em kie�bas� (uko�czenie zadania).";
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
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Rozda�em kie�bas�.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//Doskonale si� spisa�e�. We� te zwoje leczenia - i wracaj do pracy.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Doprawdy? Chyba nie w�o�y�e� w swoj� prac� wystarczaj�co du�o wysi�ku.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Najwyra�niej zjad�e� t� kie�bas� sam albo da�e� komu� wi�cej, ni� mu si� nale�a�o.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Pos�uchaj: poniewa� jeste� nowy - tylko i wy��cznie dlatego - tym razem ci daruj�. Zapami�taj to sobie dobrze, nowicjuszu!
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
	description = "Czy masz dla mnie jeszcze jakie� zadania?";
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
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//Czy masz dla mnie jeszcze jakie� zadania?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Tak. Jak zapewne wiesz, wyrabiamy tutaj doskona�e wino. Zajmujemy si� r�wnie� jego sprzeda��.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Orlan, w�a�ciciel gospody 'Pod Martw� Harpi�', zam�wi� u nas dostaw�. Uzgodnili�my cen� 240 sztuk z�ota.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Zanie� Orlanowi te butelki - i nie pozw�l mu si� wykr�ci� od um�wionej kwoty.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"Mistrz Gorax chce, abym zani�s� Orlanowi, w�a�cicielowi gospody, dwana�cie butelek wina. Mam za nie dosta� 240 sztuk z�ota.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "By�em u Orlana.";
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
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//By�em u Orlana.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//I co, dosta�e� 240 sztuk z�ota?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"Oszuka� mnie! (oddaj 100 sztuk z�ota)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"Mam z�oto. (oddaj 240 sztuk z�ota)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co zrobi�e� z tym z�otem? Wyda�e� je? Wr��, kiedy je odzyskasz!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Wyrolowa� mnie.
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Sprzeda�e� mu towar po ni�szej cenie? No nie. Dlaczego powierzy�em to zadanie w�a�nie TOBIE?
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Naprawd� jeste� zupe�nie bezu�yteczny. Zejd� mi z oczu.
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Mam z�oto.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Doskonale. Przyjmij ten zw�j leczenia jako swoj� zap�at�. A teraz id�, znajd� sobie jakie� zaj�cie.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Ju� zd��y�e� wyda� cz�� tych pieni�dzy, prawda? Do niczego si� nie nadajesz - zejd� mi z oczu!
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
	description = "Czym si� tu zajmujesz?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//Na czym polega twoja praca?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Och, zajmuj� si� r�nymi rzeczami. Przede wszystkim pe�ni� funkcje zarz�dcy i skarbnika.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Dogl�dam r�wnie� produkcji wina i zajmuj� si� zaopatrzeniem klasztoru w �ywno��.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Je�li b�dziesz czego� potrzebowa�, znajdziesz to u mnie - oczywi�cie, za drobn� op�at�.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Mistrz Gorax zaopatrzy mnie w klasztorze we wszystko, czego b�d� potrzebowa�.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Potrzebuj� paru rzeczy...";
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
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Potrzebuj� paru rzeczy...
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "Potrzebuj� miejsca do spania.";
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
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Potrzebuj� miejsca do spania.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//Po prawej stronie jest pusta komnata. Prosz�, oto klucz. W �rodku znajdziesz wszystko, czego potrzebujesz.
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
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Zaczekaj, najemniku, musz� z tob� porozmawia�.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Klasztor jest w bardzo trudnej sytuacji.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//Teraz panuje tu atmosfera nieufno�ci. W dodatku ta sprawa z Pedrem, to jest dla nas bardzo...
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//Mam dla ciebie zlecenie. Jeste� jedyn� osoba, kt�ra mo�e nam pom�c, poniewa� nie nale�ysz do Bractwa Ognia.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Musz� ci� jednak ostrzec. Je�li przyjmiesz moje zlecenie, b�dziesz je musia� wykona�. Kiedy ju� dowiesz si�, o co chodzi, nie b�dziesz mia� wyboru. Czy wszystko jasne?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"Zapomnij. To dla mnie zbyt ryzykowne.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"Powiedz mi, co to za zadanie.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Zapomnij. To dla mnie zbyt ryzykowne.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//Dobrze. Wobec tego, zapomnijmy o ca�ej sprawie.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Powiedz mi, co to za zadanie.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Dobrze. Tylko s�uchaj uwa�nie, bo drugi raz tego nie powt�rz�.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Serpentes chce, �eby� znalaz� Pedra i zabi� go za zdrad�.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Zap�at� dostaniesz, jak tylko wykonasz zadanie.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Nigdy tego nie powiedzia�em. A ty te� nigdy nic nie s�ysza�e�, jasne?
	b_logentry(TOPIC_TRAITORPEDRO,"Gorax przekaza� mi, �e Serpentes chce, abym zabi� zdrajc� Pedra, je�li gdzie� go spotkam.");
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


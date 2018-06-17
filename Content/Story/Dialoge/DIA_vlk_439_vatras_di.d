
instance DIA_VATRAS_DI_EXIT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 999;
	condition = dia_vatras_di_exit_condition;
	information = dia_vatras_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_di_exit_condition()
{
	return TRUE;
};

func void dia_vatras_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_HEAL(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_heal_condition;
	information = dia_vatras_di_heal_info;
	permanent = TRUE;
	description = "Ulecz moje rany.";
};


func int dia_vatras_di_heal_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Ulecz moje rany.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//Adanosie, pob³ogos³aw to cia³o i uwolnij je od ran, by mog³o przywróciæ równowagê temu œwiatu!
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Nie jesteœ ranny.
	};
};


instance DIA_VATRAS_DI_TRADE(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 12;
	condition = dia_vatras_di_trade_condition;
	information = dia_vatras_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Masz coœ na sprzeda¿?";
};


func int dia_vatras_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_trade_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Masz coœ na sprzeda¿?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//A czego potrzebujesz?
};


instance DIA_VATRAS_DI_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 35;
	condition = dia_vatras_di_obsession_condition;
	information = dia_vatras_di_obsession_info;
	permanent = TRUE;
	description = "Pomó¿ mi! Jestem opêtany!";
};


func int dia_vatras_di_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vatras_di_obsession_info_onetime;

func void dia_vatras_di_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//Pomó¿ mi! Jestem opêtany!
	if(GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2))
	{
		if(dia_vatras_di_obsession_info_onetime <= 1)
		{
			CreateInvItems(self,itpo_healobsession_mis,1);
			dia_vatras_di_obsession_info_onetime = dia_vatras_di_obsession_info_onetime + 1;
		};
		if(Npc_HasItems(self,itpo_healobsession_mis))
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//WeŸ tê Miksturê Wyzwolenia. Pyrokar da³ mi kilka swoich magicznych eliksirów.
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Pamiêtaj jednak, ¿e mogê ci pomóc tylko ograniczon¹ liczbê razy.
			b_giveinvitems(self,other,itpo_healobsession_mis,1);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//Zapasy Pyrokara ju¿ siê wyczerpa³y. Przykro mi, przyjacielu. Nie mogê ci ju¿ pomóc.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//Nie mogê ci podaæ kolejnej dawki po tak krótkim czasie od za¿ycia poprzedniej. Wróæ do mnie póŸniej, przyjacielu.
	};
};


instance DIA_VATRAS_DI_RAT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_rat_condition;
	information = dia_vatras_di_rat_info;
	description = "Masz dla mnie jakieœ rady?";
};


func int dia_vatras_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && (SC_ISOBSESSED == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_rat_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//Masz dla mnie jakieœ rady?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//Trzymaj siê z dala od Poszukiwaczy. Pamiêtaj, ¿e ich spojrzenie mo¿e siê okazaæ zabójcze tak daleko od klasztoru.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//Nie obawiaj siê, mam amulet przywo³ywania dusz.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//Gdyby mimo to coœ ci siê sta³o, wróæ do mnie. Spróbujê ci jakoœ pomóc.
};


instance DIA_VATRAS_DI_PEDROTOT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 3;
	condition = dia_vatras_di_pedrotot_condition;
	information = dia_vatras_di_pedrotot_info;
	description = "Znalaz³em tego zdrajcê, Pedra.";
};


func int dia_vatras_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};


var int dia_vatras_di_pedrotot_vatrassucked;

func void dia_vatras_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//Znalaz³em tego zdrajcê, Pedra.
	b_giveplayerxp(XP_AMBIENT);
	if((MIS_GORAX_KILLPEDRO == LOG_SUCCESS) && Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//Ju¿ nie ¿yje.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//Rozczarowa³eœ mnie. Myœla³em, ¿e jesteœ inny.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//Jak to?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//Wiem o twej niecnej umowie z Serpentesem. Nie zdajesz sobie nawet sprawy, jak straszliwie siê na tobie zawiod³em.
		DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//Zatem przyprowadŸ go tutaj, na statek. Oddamy go w rêce odpowiednich w³adz w Khorinis.
		if(Npc_IsDead(pedro_di))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//Na to ju¿ trochê za póŸno. Nie ¿yje.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//Och, wielka szkoda. Bêdê siê modli³ za jego biedn¹ duszê.
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_VATRAS_DI_VATRASSUCKED(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_vatras_di_vatrassucked_condition;
	information = dia_vatras_di_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vatras_di_vatrassucked_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_vatrassucked_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//ZejdŸ mi z oczu, morderco. Na moj¹ pomoc nie masz co liczyæ.
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_TALENTE(C_INFO)
{
	npc = vlk_439_vatras_di;
	condition = dia_vatras_di_talente_condition;
	information = dia_vatras_di_talente_info;
	permanent = TRUE;
	description = "Naucz mnie tego, co potrafisz.";
};


func int dia_vatras_di_talente_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_talente_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Naucz mnie czegoœ.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Zrobiê, co w mojej mocy.
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_vatras_di_talente,"Krêgi magii",dia_vatras_di_talente_circles);
	};
	Info_AddChoice(dia_vatras_di_talente,"Alchemia - sztuka warzenia mikstur",dia_vatras_di_talente_alchimie);
};

func void dia_vatras_di_talente_circles()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Pierwszy kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,1)),dia_vatras_di_talente_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Drugi kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,2)),dia_vatras_di_talente_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Trzeci kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,3)),dia_vatras_di_talente_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Czwarty kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,4)),dia_vatras_di_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Pi¹ty kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,5)),dia_vatras_di_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Szósty kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,6)),dia_vatras_di_talente_circle_6);
	};
};

func void dia_vatras_di_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_vatras_di_talente_potion_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Ekstrakt leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_vatras_di_talente_potion_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_vatras_di_talente_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_vatras_di_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Ekstrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_vatras_di_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_vatras_di_talente_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Mikstura szybkoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_vatras_di_talente_potion_speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir si³y",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_vatras_di_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir zrêcznoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_vatras_di_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_vatras_di_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir ¿ycia",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_vatras_di_talente_potion_perm_health);
	};
};

func void dia_vatras_di_talente_circle_1()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,1);
};

func void dia_vatras_di_talente_circle_2()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,2);
};

func void dia_vatras_di_talente_circle_3()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,3);
};

func void dia_vatras_di_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,4);
};

func void dia_vatras_di_talente_circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Jesteœ teraz magiem pi¹tego krêgu. Wykorzystuj swoje umiejêtnoœci z nale¿n¹ rozwag¹.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,5);
};

func void dia_vatras_di_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Zyska³eœ dostêp do najwy¿szych tajników magii.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Zachowaj rozs¹dek i zwalczaj swoje ludzkie s³aboœci, by nie przyæmi³y ci prawdy.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,6);
};

func void dia_vatras_di_talente_potion_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_vatras_di_talente_potion_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_vatras_di_talente_potion_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_vatras_di_talente_potion_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_vatras_di_talente_potion_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_vatras_di_talente_potion_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_vatras_di_talente_potion_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
};

func void dia_vatras_di_talente_potion_perm_str()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_STR);
};

func void dia_vatras_di_talente_potion_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
};

func void dia_vatras_di_talente_potion_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};

func void dia_vatras_di_talente_potion_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_vatras_di_talente_back()
{
	Info_ClearChoices(dia_vatras_di_talente);
};


instance DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_dementorobsessionbook_condition;
	information = dia_vatras_di_dementorobsessionbook_info;
	permanent = TRUE;
	description = "Mam tutaj Almanach Opêtanych.";
};


func int dia_vatras_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};


var int dia_vatras_di_dementorobsessionbook_onetime;

func void dia_vatras_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//Mam tutaj almanach opêtanych.
	if(DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//Hmmm... Jeœli siê st¹d wydostaniemy, zabiorê go do klasztoru, do Pyrokara.
		DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//Znalaz³eœ ich wiêcej? Przynieœ mi wszystkie, które zdo³asz znaleŸæ!
	};
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_undeaddragondead_condition;
	information = dia_vatras_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Zwyciê¿y³em!";
};


func int dia_vatras_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_vatras_di_undeaddragondead_onetime;

func void dia_vatras_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//Zwyciê¿y³em!
	if(DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//Wiem, czujê to!
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//Zada³eœ Beliarowi straszliwy cios, po którym szybko siê nie otrz¹œnie.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//Mogê wreszcie odpocz¹æ, czy te¿ wy, magowie, macie dla mnie kolejnego trupa w szafie, którego nale¿y wypêdziæ z tego œwiata?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//Nie zapominaj, ¿e by³ to zaledwie epizod w odwiecznej walce Dobra ze Z³em.
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//Z³o zawsze znajdzie jakiœ sposób, by wkroczyæ do tego œwiata. Ta wojna nigdy siê nie skoñczy.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//Jako orêdownik Dobra powinieneœ o tym wiedzieæ.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//Tylko Adanos stoi miêdzy zwaœnionymi bogami, by zapewniæ równowagê si³.
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//Zamiast tego móg³ mi nieco pomóc.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//Ale¿ tak w³aœnie zrobi³. Mo¿esz byæ tego pewien.
		DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//Powiedz kapitanowi, by podnosi³ kotwicê. Ta cisza i spokój mog¹ byæ tylko z³udne.
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_di_condition;
	information = dia_addon_vatras_pissoffforevver_di_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_di_condition()
{
	if(((VATRASPISSEDOFFFOREVER == TRUE) || ((MADKILLERCOUNT >= 7) && (VATRASMADKILLERCOUNT != MADKILLERCOUNT))) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};


var int dia_addon_vatras_pissoffforevver_di_onetime;

func void dia_addon_vatras_pissoffforevver_di_info()
{
	if(DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI_ONETIME == FALSE)
	{
		b_lastwarningvatras();
		DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI_ONETIME = TRUE;
	};
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
};


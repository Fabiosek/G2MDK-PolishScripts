
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
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//Adanosie, pob�ogos�aw to cia�o i uwolnij je od ran, by mog�o przywr�ci� r�wnowag� temu �wiatu!
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Nie jeste� ranny.
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
	description = "Masz co� na sprzeda�?";
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
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Masz co� na sprzeda�?
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
	description = "Pom� mi! Jestem op�tany!";
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
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//Pom� mi! Jestem op�tany!
	if(GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2))
	{
		if(dia_vatras_di_obsession_info_onetime <= 1)
		{
			CreateInvItems(self,itpo_healobsession_mis,1);
			dia_vatras_di_obsession_info_onetime = dia_vatras_di_obsession_info_onetime + 1;
		};
		if(Npc_HasItems(self,itpo_healobsession_mis))
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//We� t� Mikstur� Wyzwolenia. Pyrokar da� mi kilka swoich magicznych eliksir�w.
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Pami�taj jednak, �e mog� ci pom�c tylko ograniczon� liczb� razy.
			b_giveinvitems(self,other,itpo_healobsession_mis,1);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//Zapasy Pyrokara ju� si� wyczerpa�y. Przykro mi, przyjacielu. Nie mog� ci ju� pom�c.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//Nie mog� ci poda� kolejnej dawki po tak kr�tkim czasie od za�ycia poprzedniej. Wr�� do mnie p�niej, przyjacielu.
	};
};


instance DIA_VATRAS_DI_RAT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_rat_condition;
	information = dia_vatras_di_rat_info;
	description = "Masz dla mnie jakie� rady?";
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
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//Masz dla mnie jakie� rady?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//Trzymaj si� z dala od Poszukiwaczy. Pami�taj, �e ich spojrzenie mo�e si� okaza� zab�jcze tak daleko od klasztoru.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//Nie obawiaj si�, mam amulet przywo�ywania dusz.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//Gdyby mimo to co� ci si� sta�o, wr�� do mnie. Spr�buj� ci jako� pom�c.
};


instance DIA_VATRAS_DI_PEDROTOT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 3;
	condition = dia_vatras_di_pedrotot_condition;
	information = dia_vatras_di_pedrotot_info;
	description = "Znalaz�em tego zdrajc�, Pedra.";
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
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//Znalaz�em tego zdrajc�, Pedra.
	b_giveplayerxp(XP_AMBIENT);
	if((MIS_GORAX_KILLPEDRO == LOG_SUCCESS) && Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//Ju� nie �yje.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//Rozczarowa�e� mnie. My�la�em, �e jeste� inny.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//Jak to?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//Wiem o twej niecnej umowie z Serpentesem. Nie zdajesz sobie nawet sprawy, jak straszliwie si� na tobie zawiod�em.
		DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//Zatem przyprowad� go tutaj, na statek. Oddamy go w r�ce odpowiednich w�adz w Khorinis.
		if(Npc_IsDead(pedro_di))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//Na to ju� troch� za p�no. Nie �yje.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//Och, wielka szkoda. B�d� si� modli� za jego biedn� dusz�.
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
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Zejd� mi z oczu, morderco. Na moj� pomoc nie masz co liczy�.
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
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Naucz mnie czego�.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Zrobi�, co w mojej mocy.
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_vatras_di_talente,"Kr�gi magii",dia_vatras_di_talente_circles);
	};
	Info_AddChoice(dia_vatras_di_talente,"Alchemia - sztuka warzenia mikstur",dia_vatras_di_talente_alchimie);
};

func void dia_vatras_di_talente_circles()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Pierwszy kr�g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,1)),dia_vatras_di_talente_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Drugi kr�g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,2)),dia_vatras_di_talente_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Trzeci kr�g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,3)),dia_vatras_di_talente_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Czwarty kr�g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,4)),dia_vatras_di_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Pi�ty kr�g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,5)),dia_vatras_di_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Sz�sty kr�g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,6)),dia_vatras_di_talente_circle_6);
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
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Mikstura szybko�ci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_vatras_di_talente_potion_speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir si�y",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_vatras_di_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir zr�czno�ci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_vatras_di_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir ducha",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_vatras_di_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Eliksir �ycia",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_vatras_di_talente_potion_perm_health);
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
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Jeste� teraz magiem pi�tego kr�gu. Wykorzystuj swoje umiej�tno�ci z nale�n� rozwag�.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,5);
};

func void dia_vatras_di_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Zyska�e� dost�p do najwy�szych tajnik�w magii.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Zachowaj rozs�dek i zwalczaj swoje ludzkie s�abo�ci, by nie przy�mi�y ci prawdy.
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
	description = "Mam tutaj Almanach Op�tanych.";
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
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//Mam tutaj almanach op�tanych.
	if(DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//Hmmm... Je�li si� st�d wydostaniemy, zabior� go do klasztoru, do Pyrokara.
		DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//Znalaz�e� ich wi�cej? Przynie� mi wszystkie, kt�re zdo�asz znale��!
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
	description = "Zwyci�y�em!";
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
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//Zwyci�y�em!
	if(DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//Wiem, czuj� to!
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//Zada�e� Beliarowi straszliwy cios, po kt�rym szybko si� nie otrz��nie.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//Mog� wreszcie odpocz��, czy te� wy, magowie, macie dla mnie kolejnego trupa w szafie, kt�rego nale�y wyp�dzi� z tego �wiata?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//Nie zapominaj, �e by� to zaledwie epizod w odwiecznej walce Dobra ze Z�em.
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//Z�o zawsze znajdzie jaki� spos�b, by wkroczy� do tego �wiata. Ta wojna nigdy si� nie sko�czy.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//Jako or�downik Dobra powiniene� o tym wiedzie�.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//Tylko Adanos stoi mi�dzy zwa�nionymi bogami, by zapewni� r�wnowag� si�.
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//Zamiast tego m�g� mi nieco pom�c.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//Ale� tak w�a�nie zrobi�. Mo�esz by� tego pewien.
		DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//Powiedz kapitanowi, by podnosi� kotwic�. Ta cisza i spok�j mog� by� tylko z�udne.
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


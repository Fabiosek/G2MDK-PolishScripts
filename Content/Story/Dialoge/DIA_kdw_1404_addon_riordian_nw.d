
instance DIA_ADDON_RIORDIAN_EXIT(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 999;
	condition = dia_addon_riordian_exit_condition;
	information = dia_addon_riordian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HALLO(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_hallo_condition;
	information = dia_addon_riordian_hallo_info;
	description = "Co robisz?";
};


func int dia_addon_riordian_hallo_condition()
{
	return TRUE;
};

func void dia_addon_riordian_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//Co robisz?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//Badam kultur� tego staro�ytnego ludu.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Z inskrypcji wiemy, �e �yli tu bardzo dawno temu.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//Nie wiem dok�adnie, KIEDY powsta�a ta budowla, ale ich cywilizacja by�a bardzo rozwini�ta.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//Zbudowali miasto po drugiej stronie g�r. Oraz �wi�tyni� Adanosa.
};


instance DIA_ADDON_RIORDIAN_ALTER(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 6;
	condition = dia_addon_riordian_alter_condition;
	information = dia_addon_riordian_alter_info;
	description = "Na ile lat oceniasz wiek tego budynku?";
};


func int dia_addon_riordian_alter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_alter_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//Na ile lat oceniasz wiek tego budynku?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//Nie potrafi� powiedzie� dok�adnie, ale na pewno ma ju� kilkaset lat.
};


instance DIA_ADDON_RIORDIAN_ATLANTIS(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 4;
	condition = dia_addon_riordian_atlantis_condition;
	information = dia_addon_riordian_atlantis_info;
	description = "Zaginione miasto na wyspie Khorinis?";
};


func int dia_addon_riordian_atlantis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_atlantis_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//Zaginione miasto na wyspie Khorinis?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Tak. Do tej pory my�leli�my, �e znamy ca�� wysp�.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//S�dzili�my, �e ca�� jej p�nocno-wschodni� cz�� zajmuje ogromny masyw g�rski.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//Ale mylili�my si�.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//Za g�rami le�y dolina. Znajdowa�o si� tam miasto prastarej cywilizacji.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//Ch�tnie bym zobaczy� budynki tego miasta, ale pewnie rozpad�y si� w py� wieki temu...
	b_logentry(TOPIC_ADDON_KDW,"Magowie Wody podejrzewaj�, �e za portalem znajduje si� staro�ytne, zaginione miasto.");
};


instance DIA_ADDON_RIORDIAN_SATURASWANTYOU(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_saturaswantyou_condition;
	information = dia_addon_riordian_saturaswantyou_info;
	description = "Saturas chce ci� widzie�.";
};


func int dia_addon_riordian_saturaswantyou_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo) && (MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_saturaswantyou_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Saturas chce ci� widzie�.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Czy�by posun�� si� naprz�d ze swym dochodzeniem? W takim razie natychmiast si� z nim zobacz�.
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//Je�li chcesz si� dowiedzie� wi�cej o tym miejscu, porozmawiaj z Nefariusem.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//Znajdziesz go w g��bi krypt.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Saturas");
	MIS_ADDON_SATURAS_BRINGRIORDIAN2ME = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


var int riordian_permnews;

instance DIA_ADDON_RIORDIAN_PERM(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 99;
	condition = dia_addon_riordian_perm_condition;
	information = dia_addon_riordian_perm_info;
	permanent = TRUE;
	description = "Dowiedzia�e� si� czego� nowego?";
};


func int dia_addon_riordian_perm_condition()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//Dowiedzia�e� si� czego� nowego?
	if(RIORDIAN_PERMNEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//Wiem, �e ta prastara cywilizacja czci�a Adanosa!
		RIORDIAN_PERMNEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Raczej nie. Wr�� p�niej.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_TEACHPRE(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = "Vatras da� mi Amulet Szukaj�cego Ognika...";
};


func int dia_addon_riordian_teachpre_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Vatras da� mi Amulet Szukaj�cego Ognika...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ach! To rzadki artefakt. Za jego pomoc� mo�esz wyszkoli� ognika.
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Mo�esz mi w tym pom�c?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Oczywi�cie. Przez d�ugi czas zajmowa�em si� tym rodzajem magii.
	RIORDIAN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
};


instance DIA_ADDON_RIORDIAN_TEACH(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 90;
	condition = dia_addon_riordian_teach_condition;
	information = dia_addon_riordian_teach_info;
	permanent = TRUE;
	description = "Poka� mi, jak wyszkoli� mojego ognika.";
};


var int dia_addon_riordian_teach_noperm;

func int dia_addon_riordian_teach_condition()
{
	if((RIORDIAN_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_teach);
		Info_AddChoice(dia_addon_riordian_teach,DIALOG_BACK,dia_addon_riordian_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};


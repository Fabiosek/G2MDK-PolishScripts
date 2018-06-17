
instance DIA_RICHTER_EXIT(C_INFO)
{
	npc = vlk_402_richter;
	nr = 999;
	condition = dia_richter_exit_condition;
	information = dia_richter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_richter_exit_condition()
{
	return TRUE;
};

func void dia_richter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_HELLO(C_INFO)
{
	npc = vlk_402_richter;
	nr = 4;
	condition = dia_richter_hello_condition;
	information = dia_richter_hello_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_richter_hello_condition()
{
	if(MIS_LEE_JUDGERICHTER == 0)
	{
		return TRUE;
	};
};

func void dia_richter_hello_info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Czym si� zajmujesz?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//A jak ci si� wydaje? Kim ty w�a�ciwie jeste�?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Ja, em...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//S�uchaj no, czy ja ci� sk�d� nie znam?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"Nie przypominam sobie.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"Mo�liwe.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Nie przypominam sobie.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To zabawne. M�g�bym przysi�c, �e�my si� ju� spotkali.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Niewa�ne, pewnie jeste� jak�� szumowin� z rynsztoka. Wszyscy wygl�dacie tak samo.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Mo�liwe.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Nie wym�drzaj si�. Nie rozmawiasz z byle kim.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//M�g�by� przynajmniej zwraca� si� do mnie z nale�nym szacunkiem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A teraz, zejd� mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_richter_perm_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER == LOG_RUNNING)) && (SCISTRICHTERSLAKAI == FALSE))
	{
		return TRUE;
	};
};

func void dia_richter_perm_info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//Jak leci?
	if((MIS_LEE_JUDGERICHTER == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Lepiej odejd�, cuchn�cy najemniku, zanim wezw� stra�e.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Uspok�j si�. Nie przyszed�em tu, by ci� okrada�. Szukam pracy.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Ach, wi�c chcesz dla mnie pracowa�. To zupe�nie zmienia posta� rzeczy.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Jest tylko jeden ma�y problem. Nie wiem, czy mog� ci zaufa�. Musisz dowie�� swojej lojalno�ci.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Czy� nie powiedzia�em jasno, �e nie chc� by� niepokojony?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Widocznie co� przeoczy�em.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Mam wi�c nadziej�, �e teraz to do ciebie dotrze.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "Poddaj mnie pr�bie.";
};


func int dia_richter_richterslakai_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER != 0)) && (SCISTRICHTERSLAKAI == TRUE))
	{
		return TRUE;
	};
};

func void dia_richter_richterslakai_info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Poddaj mnie pr�bie.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmm. Dobrze, pos�uchaj. Przynie� mi �wi�ty m�ot Mag�w Ognia. Trzymaj� go gdzie� w klasztornych piwnicach.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Je�li ci si� to uda, zatrudni� ci� jako ochroniarza.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"Mam okra�� mag�w? Czy� ty na g�ow� upad�?",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"W porz�dku.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"S�dzia mi nie ufa. Musz� udowodni� swoj� lojalno��. W tym celu mam ukra�� �wi�ty m�ot z podziemi klasztoru Mag�w Ognia i zanie�� go s�dziemu.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//Mam okra�� mag�w? Czy� ty na g�ow� upad�?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//W takim razie, id� do diab�a i nie marnuj mojego czasu.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Niech b�dzie.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Doskonale. Ale pami�taj - je�li ci� z�api�, nigdy o mnie nie s�ysza�e�.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "Oto �wi�ty m�ot mag�w.";
};


func int dia_richter_killmorgahard_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) && (MIS_RICHTER_BRINGHOLYHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Oto �wi�ty m�ot mag�w.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jestem pod wra�eniem. Wygl�da na to, �e faktycznie ci na tym zale�y. Oto twoja zap�ata.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Dobrze, skoro sprawy tak si� maj�, to przygotowa�em dla ciebie kolejne zadanie.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Przed kilkoma dniami grupa opryszk�w uciek�a z tutejszego wi�zienia.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Te sucze syny zwia�y i schowa�y si� w g�rach. Poszli w kierunku nowej wie�y Xardasa.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Ich przyw�dc� jest Morgahard. Chc�, �eby� go zabi�.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Spiesz si�, nim zd��� uciec zbyt daleko.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"Niekt�rzy wi�niowie zdo�ali uciec s�dziemu. Najprawdopodobniej ukrywaj� si� gdzie� w g�rach, w okolicy nowej wie�y Xardasa. Mam zabi� ich przyw�dc�, Morgaharda. ");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "Morgahard nie �yje.";
};


func int dia_richter_killedmorgahard_condition()
{
	if(Npc_IsDead(morgahard) && (MIS_RICHTER_KILLMORGAHARD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard nie �yje.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Dobry z ciebie ch�opak. Oto twoja nagroda.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"S�dziego najwyra�niej ucieszy�a wiadomo�� o �mierci Morgaharda. To dobrze, ale musz� pami�ta� o zadaniu, kt�re powierzy� mi Lee.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "Czy mog� co� jeszcze dla ciebie zrobi�?";
};


func int dia_richter_killedmorgahardperm_condition()
{
	if((MIS_RICHTER_KILLMORGAHARD == LOG_SUCCESS) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahardperm_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Czy mog� co� jeszcze dla ciebie zrobi�?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//W tej chwili nie. Mo�e p�niej.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "Daj mi przepustk� na statek paladyn�w.";
};


func int dia_richter_permissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_richter_permissionforship_info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Daj mi przepustk� na statek paladyn�w.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//Co mam ci da�? Chyba postrada�e� zmys�y.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Dobrze wiesz, o czym m�wi�. Daj mi przepustk� albo wydam ci� stra�y.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//Nie pozwol� si� szanta�owa�. A ju� na pewno nie komu� takiemu jak ty! Ka�� nakarmi� tob� wilki, ty �a�osna kupo �cierwa!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard zamordowa� gubernatora z twojego rozkazu. Mam dokument, kt�ry jednoznacznie to stwierdza.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//Aaaach.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Po�a�ujesz swoich s��w. Nikt nie b�dzie mnie bezkarnie szanta�owa�.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Oto twoja przepustka. Teraz wyjd�. P�niej si� tob� zajm�.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"Dzi�ki sfa�szowanemu dokumentowi dostanie si� na statek nie powinno stanowi� problemu. Ciekawe, co na to Lee.");
	MIS_RICHTERSPERMISSIONFORSHIP = LOG_SUCCESS;
	b_giveplayerxp(XP_RICHTERSPERMISSIONFORSHIP);
};


instance DIA_RICHTER_PERM2(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_perm2_condition;
	information = dia_richter_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_richter_perm2_condition()
{
	if((MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_richter_perm2_info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Zejd� mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie �atwa)";
};


func int dia_richter_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_richter_pickpocket_info()
{
	Info_ClearChoices(dia_richter_pickpocket);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_BACK,dia_richter_pickpocket_back);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_PICKPOCKET,dia_richter_pickpocket_doit);
};

func void dia_richter_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_richter,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_richter_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_richter_pickpocket_back()
{
	Info_ClearChoices(dia_richter_pickpocket);
};


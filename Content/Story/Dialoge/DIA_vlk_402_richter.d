
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
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//Czym siê zajmujesz?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//A jak ci siê wydaje? Kim ty w³aœciwie jesteœ?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//Ja, em...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//S³uchaj no, czy ja ciê sk¹dœ nie znam?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"Nie przypominam sobie.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"Mo¿liwe.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Nie przypominam sobie.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//To zabawne. Móg³bym przysi¹c, ¿eœmy siê ju¿ spotkali.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Niewa¿ne, pewnie jesteœ jak¹œ szumowin¹ z rynsztoka. Wszyscy wygl¹dacie tak samo.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Mo¿liwe.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Nie wym¹drzaj siê. Nie rozmawiasz z byle kim.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//Móg³byœ przynajmniej zwracaæ siê do mnie z nale¿nym szacunkiem.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//A teraz, zejdŸ mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
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
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//Lepiej odejdŸ, cuchn¹cy najemniku, zanim wezwê stra¿e.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Uspokój siê. Nie przyszed³em tu, by ciê okradaæ. Szukam pracy.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Ach, wiêc chcesz dla mnie pracowaæ. To zupe³nie zmienia postaæ rzeczy.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//Jest tylko jeden ma³y problem. Nie wiem, czy mogê ci zaufaæ. Musisz dowieœæ swojej lojalnoœci.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Czy¿ nie powiedzia³em jasno, ¿e nie chcê byæ niepokojony?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//Widocznie coœ przeoczy³em.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//Mam wiêc nadziejê, ¿e teraz to do ciebie dotrze.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "Poddaj mnie próbie.";
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
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Poddaj mnie próbie.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmm. Dobrze, pos³uchaj. Przynieœ mi œwiêty m³ot Magów Ognia. Trzymaj¹ go gdzieœ w klasztornych piwnicach.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//Jeœli ci siê to uda, zatrudniê ciê jako ochroniarza.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"Mam okraœæ magów? Czyœ ty na g³owê upad³?",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"W porz¹dku.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"Sêdzia mi nie ufa. Muszê udowodniæ swoj¹ lojalnoœæ. W tym celu mam ukraœæ œwiêty m³ot z podziemi klasztoru Magów Ognia i zanieœæ go sêdziemu.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//Mam okraœæ magów? Czyœ ty na g³owê upad³?
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//W takim razie, idŸ do diab³a i nie marnuj mojego czasu.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//Niech bêdzie.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Doskonale. Ale pamiêtaj - jeœli ciê z³api¹, nigdy o mnie nie s³ysza³eœ.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "Oto œwiêty m³ot magów.";
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
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Oto œwiêty m³ot magów.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//Jestem pod wra¿eniem. Wygl¹da na to, ¿e faktycznie ci na tym zale¿y. Oto twoja zap³ata.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Dobrze, skoro sprawy tak siê maj¹, to przygotowa³em dla ciebie kolejne zadanie.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Przed kilkoma dniami grupa opryszków uciek³a z tutejszego wiêzienia.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Te sucze syny zwia³y i schowa³y siê w górach. Poszli w kierunku nowej wie¿y Xardasa.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//Ich przywódc¹ jest Morgahard. Chcê, ¿ebyœ go zabi³.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Spiesz siê, nim zd¹¿¹ uciec zbyt daleko.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"Niektórzy wiêŸniowie zdo³ali uciec sêdziemu. Najprawdopodobniej ukrywaj¹ siê gdzieœ w górach, w okolicy nowej wie¿y Xardasa. Mam zabiæ ich przywódcê, Morgaharda. ");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "Morgahard nie ¿yje.";
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
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard nie ¿yje.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Dobry z ciebie ch³opak. Oto twoja nagroda.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"Sêdziego najwyraŸniej ucieszy³a wiadomoœæ o œmierci Morgaharda. To dobrze, ale muszê pamiêtaæ o zadaniu, które powierzy³ mi Lee.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "Czy mogê coœ jeszcze dla ciebie zrobiæ?";
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
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Czy mogê coœ jeszcze dla ciebie zrobiæ?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//W tej chwili nie. Mo¿e póŸniej.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "Daj mi przepustkê na statek paladynów.";
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
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Daj mi przepustkê na statek paladynów.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//Co mam ci daæ? Chyba postrada³eœ zmys³y.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//Dobrze wiesz, o czym mówiê. Daj mi przepustkê albo wydam ciê stra¿y.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//Nie pozwolê siê szanta¿owaæ. A ju¿ na pewno nie komuœ takiemu jak ty! Ka¿ê nakarmiæ tob¹ wilki, ty ¿a³osna kupo œcierwa!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard zamordowa³ gubernatora z twojego rozkazu. Mam dokument, który jednoznacznie to stwierdza.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//Aaaach.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//Po¿a³ujesz swoich s³ów. Nikt nie bêdzie mnie bezkarnie szanta¿owa³.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Oto twoja przepustka. Teraz wyjdŸ. PóŸniej siê tob¹ zajmê.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"Dziêki sfa³szowanemu dokumentowi dostanie siê na statek nie powinno stanowiæ problemu. Ciekawe, co na to Lee.");
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
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//ZejdŸ mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie ³atwa)";
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


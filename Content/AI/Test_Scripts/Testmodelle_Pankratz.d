
instance J1(C_ITEM)
{
	name = "Wype³nia potworami obszar dodatku";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usejoly_storyhelpletter;
	scemename = "MAP";
	description = name;
};


var int usejoly_storyhelpletter_onetime;

func void usejoly_storyhelpletter()
{
	Wld_InsertNpc(giant_desertrat,"ADW_CANYON_TELEPORT_PATH_03");
	Wld_InsertNpc(giant_desertrat,"ADW_CANYON_TELEPORT_PATH_03");
	Wld_InsertNpc(giant_desertrat,"ADW_CANYON_TELEPORT_PATH_04");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_BANDITS_31");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_MINE2_04");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_MINE2_04");
	Wld_InsertNpc(troll,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(troll,"ADW_CANYON_PATH_TO_MINE2_09");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_MINE2_06");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_26");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_24");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_66");
	Wld_InsertNpc(skeletonmage,"ADW_CANYON_LIBRARY_STONIE_01");
	Wld_InsertNpc(skeleton,"ADW_CANYON_LIBRARY_STONIE_02");
	Wld_InsertNpc(skeleton,"ADW_CANYON_LIBRARY_STONIE_03");
	Wld_InsertNpc(skeleton,"ADW_CANYON_LIBRARY_STONIE_04");
	Wld_InsertNpc(skeleton,"ADW_CANYON_LIBRARY_STONIE_05");
	Wld_InsertNpc(firewaran,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_11");
	Wld_InsertNpc(dragonsnapper,"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc(dragonsnapper,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc(dragonsnapper,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc(swamprat,"ADW_ENTRANCE_PATH2BANDITS_03");
	Wld_InsertNpc(skeletonmage,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(skeleton,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(dragonsnapper,"ADW_ENTRANCE_2_PIRATECAMP_22");
	Wld_InsertNpc(swampshark,"ADW_SWAMP_SHARKSTREET_02");
	Wld_InsertNpc(swampshark,"ADW_SWAMP_SHARKSTREET_07");
	Wld_InsertNpc(swampshark,"ADW_SWAMP_SHARKSTREET_09");
	Wld_InsertNpc(swampshark,"ADW_SWAMP_SHARKSTREET_10");
	Wld_InsertNpc(swampgolem,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc(bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc(swampgolem,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc(bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc(swampgolem,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc(bloodfly,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc(mayazombie01,"ADW_PFUETZE_01");
	Wld_InsertNpc(mayazombie02,"ADW_PFUETZE_02");
	Wld_InsertNpc(mayazombie03,"ADW_PFUETZE_03");
	Wld_InsertNpc(mayazombie04,"ADW_PFUETZE_04");
	Wld_InsertNpc(mayazombie04,"ADW_BANDIT_VP1_07_D");
	Wld_InsertNpc(mayazombie01,"ADW_BANDIT_VP1_07_E");
	Wld_InsertNpc(mayazombie02,"ADW_BANDIT_VP1_07_F");
	Wld_InsertNpc(mayazombie03,"ADW_SWAMP_LITTLE_SEA_03_B");
	Wld_InsertNpc(mayazombie04,"ADW_SWAMP_09_C");
	Wld_InsertNpc(swampgolem,"ADW_SWAMP_10");
	Wld_InsertNpc(swampgolem,"ADW_SWAMP_13");
	Wld_InsertNpc(swampgolem,"ADW_SWAMP_14");
	Wld_InsertNpc(swampshark,"ADW_SWAMP_HOHLWEG_03");
	Wld_InsertNpc(swampshark,"ADW_SWAMP_HOHLWEG_04");
	Wld_InsertNpc(skeleton,"ADW_SENAT_SIDE_01");
	Wld_InsertNpc(skeleton,"ADW_SENAT_SIDE_02");
	Wld_InsertNpc(mayazombie04,"ADW_SENAT_SIDE_03");
	Wld_InsertNpc(skeleton,"ADW_SENAT_GUARDIAN_01");
	Wld_InsertNpc(mayazombie01,"ADW_SENAT_GUARDIAN_02");
	Wld_InsertNpc(swampdrone,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc(swampdrone,"ADW_SWAMP_15");
	Wld_InsertNpc(swamprat,"ADW_HOHLWEG_CENTER");
	Wld_InsertNpc(swampgolem,"FP_ROAM_BF_NEST_26");
	Wld_InsertNpc(swamprat,"ADW_BANDITSCAMP_RAKEPLACE_03");
	Wld_InsertNpc(swampdrone,"ADW_CANYON_PATH_TO_BANDITS_02");
	Wld_InsertNpc(swampdrone,"ADW_PFUETZE_02");
	Wld_InsertNpc(swampdrone,"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc(swampdrone,"ADW_SWAMP_LOCH_06");
	Wld_InsertNpc(demon,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(firewaran,"ADW_PIRATECAMP_LONEBEACH_05");
	Wld_InsertNpc(lurker,"ADW_PIRATECAMP_WATERHOLE_04");
	Wld_InsertNpc(gobbo_warrior_visir,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc(gobbo_warrior,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc(dragonsnapper,"ADW_PIRATECAMP_WAY_07");
	Wld_InsertNpc(warg,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(warg,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(gobbo_warrior_visir,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(gobbo_warrior_visir,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc(gobbo_warrior_visir,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_VALLEY_02A");
	Wld_InsertNpc(gobbo_warrior,"ADW_ENTRANCE_2_VALLEY_02A");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_BIGCAVE_01");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc(dragonsnapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc(scavenger_demon,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc(scavenger_demon,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc(scavenger_demon,"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc(scavenger_demon,"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc(scavenger_demon,"ADW_VALLEY_PATH_038_J");
	Wld_InsertNpc(skeletonmage,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc(shadowbeast_addon_fire,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc(skeletonmage,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(shadowbeast_addon_fire,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc(shadowbeast_addon_fire,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc(skeleton,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_MINE1_05");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_MINE1_05");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_MINE1_01");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_MINE1_01");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_MINE1_01");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc(dragonsnapper,"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc(firewaran,"ADW_CANYON_PATH_TO_BANDITS_55");
	Wld_InsertNpc(firewaran,"ADW_CANYON_PATH_TO_BANDITS_55");
	Wld_InsertNpc(orcbiter,"ADW_CANYON_PATH_TO_BANDITS_52");
	Wld_InsertNpc(orcbiter,"ADW_CANYON_PATH_TO_BANDITS_52");
	Wld_InsertNpc(troll,"ADW_CANYON_PATH_TO_LIBRARY_17");
	Wld_InsertNpc(troll,"ADW_CANYON_PATH_TO_LIBRARY_16A");
	Wld_InsertNpc(orcbiter,"ADW_CANYON_ORCS_09");
	Wld_InsertNpc(orcbiter,"ADW_CANYON_ORCS_09");
	Wld_InsertNpc(firewaran,"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc(firewaran,"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc(blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(blattcrawler,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(dragonsnapper,"ADW_ENTRANCE_PATH2BANDITS_05P");
	Wld_InsertNpc(dragonsnapper,"ADW_ENTRANCE_PATH2BANDITS_05P");
	Wld_InsertNpc(swampgolem,"ADW_ENTRANCE_PATH2BANDITS_05");
	Wld_InsertNpc(troll,"ADW_CANYON_PATH_TO_BANDITS_20");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_21");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_17");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_14");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_62");
	Wld_InsertNpc(minecrawlerwarrior,"ADW_CANYON_PATH_TO_BANDITS_19");
};


instance J2(C_ITEM)
{
	name = "Greg_Taverne";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usejoly2_storyhelpletter;
	scemename = "MAP";
	description = name;
};


func void usejoly2_storyhelpletter()
{
	b_startotherroutine(pir_1300_addon_greg_nw,"Taverne");
	GREGLOCATION = GREG_TAVERNE;
};


instance J3(C_ITEM)
{
	name = "ADW_ADANOSTEMPEL_RemovedFocus";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej3;
	scemename = "MAP";
	description = name;
};


func void usej3()
{
};


instance J4(C_ITEM)
{
	name = "ADW_PIRATES_RemovedFocus und letzte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej4;
	scemename = "MAP";
	description = name;
};


func void usej4()
{
};


instance DJG_INSERTEN(C_ITEM)
{
	name = "JOLY_Storyhelpletter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usedjg_inserten;
	scemename = "MAP";
	description = "JOLY_Storyhelpletter";
};


func void usedjg_inserten()
{
	b_kapitelwechsel(4,OLDWORLD_ZEN);
	b_initnpcglobals();
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	CreateInvItems(hero,itmi_innoseye_mis,1);
	CreateInvItems(hero,itmi_gold,1000);
	Wld_InsertNpc(djg_701_bullco,"OC1");
	Wld_InsertNpc(djg_702_rod,"OC1");
	Wld_InsertNpc(djg_703_cipher,"OC1");
	Wld_InsertNpc(pc_fighter_djg,"OC1");
};


instance SH_OLDWORLD(NPC_DEFAULT)
{
	name[0] = "Storyhelper Oldworld";
	guild = GIL_NONE;
	id = 9998;
	voice = 15;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PLAYER,BODYTEX_PLAYER,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_9998;
};


func void rtn_start_9998()
{
	ta_stand_armscrossed(8,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,8,0,"XXX");
};


instance SH_OLDWORLD_EXIT(C_INFO)
{
	npc = sh_oldworld;
	nr = 999;
	condition = sh_oldworld_exit_condition;
	information = sh_oldworld_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int sh_oldworld_exit_condition()
{
	return 1;
};

func void sh_oldworld_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO1(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info1_condition;
	information = sh_oldworld_info1_info;
	important = 0;
	permanent = 1;
	description = "Rozdzia³ 1";
};


func int sh_oldworld_info1_condition()
{
	return TRUE;
};

func void sh_oldworld_info1_info()
{
	Info_ClearChoices(sh_oldworld_info1);
	Info_AddChoice(sh_oldworld_info1,DIALOG_BACK,sh_oldworld_back1);
	Info_AddChoice(sh_oldworld_info1,"Pocz¹tek rozdzia³u",sh_oldworld_kapitel1anfang);
};

func void sh_oldworld_back1()
{
	Info_ClearChoices(sh_oldworld_info1);
};

func void sh_oldworld_kapitel1anfang()
{
	b_kapitelwechsel(1,OLDWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO2(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info2_condition;
	information = sh_oldworld_info2_info;
	important = 0;
	permanent = 1;
	description = "Rozdzia³ 2";
};


func int sh_oldworld_info2_condition()
{
	return TRUE;
};

func void sh_oldworld_info2_info()
{
	Info_ClearChoices(sh_oldworld_info2);
	Info_AddChoice(sh_oldworld_info2,DIALOG_BACK,sh_oldworld_back2);
	Info_AddChoice(sh_oldworld_info2,"Pocz¹tek rozdzia³u",sh_oldworld_kapitel2anfang);
};

func void sh_oldworld_back2()
{
	Info_ClearChoices(sh_oldworld_info2);
};

func void sh_oldworld_kapitel2anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,OLDWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO3(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info3_condition;
	information = sh_oldworld_info3_info;
	important = 0;
	permanent = 1;
	description = "Rozdzia³ 3";
};


func int sh_oldworld_info3_condition()
{
	return TRUE;
};

func void sh_oldworld_info3_info()
{
	Info_ClearChoices(sh_oldworld_info3);
	Info_AddChoice(sh_oldworld_info3,DIALOG_BACK,sh_oldworld_back3);
	Info_AddChoice(sh_oldworld_info3,"Pocz¹tek rozdzia³u",sh_oldworld_kapitel3anfang);
};

func void sh_oldworld_back3()
{
	Info_ClearChoices(sh_oldworld_info3);
};

func void sh_oldworld_kapitel3anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info3);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO4(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info4_condition;
	information = sh_oldworld_info4_info;
	important = 0;
	permanent = 1;
	description = "Rozdzia³ 4";
};


func int sh_oldworld_info4_condition()
{
	return TRUE;
};

func void sh_oldworld_info4_info()
{
	Info_ClearChoices(sh_oldworld_info4);
	Info_AddChoice(sh_oldworld_info4,DIALOG_BACK,sh_oldworld_back4);
	Info_AddChoice(sh_oldworld_info4,"Pocz¹tek rozdzia³u",sh_oldworld_kapitel4anfang);
};

func void sh_oldworld_back4()
{
	Info_ClearChoices(sh_oldworld_info4);
};

func void sh_oldworld_kapitel4anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,OLDWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	CreateInvItems(self,itmi_innoseye_mis,1);
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(4,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info4);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO5(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info5_condition;
	information = sh_oldworld_info5_info;
	important = 0;
	permanent = 1;
	description = "Rozdzia³ 5";
};


func int sh_oldworld_info5_condition()
{
	return TRUE;
};

func void sh_oldworld_info5_info()
{
	Info_ClearChoices(sh_oldworld_info5);
	Info_AddChoice(sh_oldworld_info5,DIALOG_BACK,sh_oldworld_back5);
	Info_AddChoice(sh_oldworld_info5,"Pocz¹tek rozdzia³u",sh_oldworld_kapitel5anfang);
};

func void sh_oldworld_back5()
{
	Info_ClearChoices(sh_oldworld_info5);
};

func void sh_oldworld_kapitel5anfang()
{
	MIS_OLDWORLD = LOG_RUNNING;
	CreateInvItems(hero,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	MIS_SCOUTMINE = LOG_SUCCESS;
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(3,OLDWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	CreateInvItems(hero,itmi_innoseye_mis,1);
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
	b_kapitelwechsel(4,OLDWORLD_ZEN);
	CreateInvItems(hero,itat_icedragonheart,1);
	MIS_ALLDRAGONSDEAD = TRUE;
	ENTERNW_KAPITEL5 = TRUE;
	b_kapitelwechsel(5,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info5);
	AI_StopProcessInfos(self);
};


instance SH_OLDWORLD_INFO6(C_INFO)
{
	npc = sh_oldworld;
	condition = sh_oldworld_info6_condition;
	information = sh_oldworld_info6_info;
	important = 0;
	permanent = 1;
	description = "Rozdzia³ 6";
};


func int sh_oldworld_info6_condition()
{
	return TRUE;
};

func void sh_oldworld_info6_info()
{
	Info_ClearChoices(sh_oldworld_info6);
	Info_AddChoice(sh_oldworld_info6,DIALOG_BACK,sh_oldworld_back6);
	Info_AddChoice(sh_oldworld_info6,"Pocz¹tek rozdzia³u",sh_oldworld_kapitel6anfang);
};

func void sh_oldworld_back6()
{
	Info_ClearChoices(sh_oldworld_info6);
};

func void sh_oldworld_kapitel6anfang()
{
	b_kapitelwechsel(6,OLDWORLD_ZEN);
	Info_ClearChoices(sh_oldworld_info6);
	AI_StopProcessInfos(self);
};


instance DRAGON_TESTMODELL(MST_DEFAULT_DRAGON_FIRE)
{
	b_setvisuals_dragon_fire();
	Npc_SetToFistMode(self);
};

instance DIA_DRAGON_TESTMODELL_EXIT(C_INFO)
{
	npc = dragon_testmodell;
	nr = 999;
	condition = dia_dragon_testmodell_exit_condition;
	information = dia_dragon_testmodell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_testmodell_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_testmodell_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_TESTMODELL_HELLO(C_INFO)
{
	npc = dragon_testmodell;
	nr = 1;
	condition = dia_dragon_testmodell_hello_condition;
	information = dia_dragon_testmodell_hello_info;
	permanent = TRUE;
	description = "Quatsch mich voll";
};


func int dia_dragon_testmodell_hello_condition()
{
	return 1;
};

func void dia_dragon_testmodell_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//*TEST*
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//*TEST*
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//*TEST*
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//*TEST*
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//*TEST*
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//*TEST*
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


prototype JOLY_ITEM(C_ITEM)
{
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_STONEPLATECOMMON;
	material = MAT_LEATHER;
	on_state[0] = usejoly_item1;
	scemename = "MAP";
	description = name;
	text[2] = "Compiling Visual Dummy item";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STONEPLATECOMMON;
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance JI1(JOLY_ITEM)
{
	name = "ItAt_LurkerSkin";
	visual = "ItAt_LurkerSkin.3ds";
	text[3] = "JI1";
};

instance JI2(JOLY_ITEM)
{
	name = "ADDON_DUNGEON_BROKENSTONE_01";
	visual = "ADDON_DUNGEON_BROKENSTONE_01.3ds";
	text[3] = "JI2";
	on_state[0] = usejoly_item2;
};

instance JI3(JOLY_ITEM)
{
	name = "ADDON_DUNGEON_BROKENSTONE_02";
	visual = "ADDON_DUNGEON_BROKENSTONE_02.3ds";
	text[3] = "JI3";
};

instance JI4(JOLY_ITEM)
{
	name = "ADDON_MISC_HOLZSTUETZEN_01";
	visual = "ADDON_MISC_HOLZSTUETZEN_01.3ds";
	text[3] = "JI4";
};

instance JI5(JOLY_ITEM)
{
	name = "ADDON_MISC_WOODPILLAR_L03";
	visual = "ADDON_MISC_WOODPILLAR_L03.3ds";
	text[3] = "JI5";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance JI6(JOLY_ITEM)
{
	name = "ADDON_PLANTS_BLAETTERDACH_01_94P";
	visual = "ADDON_PLANTS_BLAETTERDACH_01_94P.3ds";
	text[3] = "JI6";
};

instance JI7(JOLY_ITEM)
{
	name = "ADDON_PLANTS_DEADTREE_01_1713P";
	visual = "ADDON_PLANTS_DEADTREE_01_1713P.3ds";
	text[3] = "JI7";
};

instance JI8(JOLY_ITEM)
{
	name = "ADDON_PLANTS_DEADTREE_01_2300P";
	visual = "ADDON_PLANTS_DEADTREE_01_2300P.3ds";
	text[3] = "JI8";
};

instance JI9(JOLY_ITEM)
{
	name = "ADDON_PLANTS_JUNGLETREE_01_1845P";
	visual = "ADDON_PLANTS_JUNGLETREE_01_1845P.3ds";
	text[3] = "JI9";
};

instance JI10(JOLY_ITEM)
{
	name = "ADDON_PLANTS_TREE_02_1713P";
	visual = "ADDON_PLANTS_TREE_02_1713P.3ds";
	text[3] = "JI10";
};

instance JI11(JOLY_ITEM)
{
	name = "ADDON_STONES_CRYSTAL_ROSE_02_228P";
	visual = "ADDON_STONES_CRYSTAL_ROSE_02_228P.3ds";
	text[3] = "JI11";
};

instance JI12(JOLY_ITEM)
{
	name = "EVT_ADDON_MAYA_PARTICEL_GATEDUMMY";
	visual = "EVT_ADDON_MAYA_PARTICEL_GATEDUMMY.3ds";
	text[3] = "JI12";
};

instance JI13(JOLY_ITEM)
{
	name = "EVT_ADDON_MAYA_PARTICEL_VORTEXDUMMY";
	visual = "EVT_ADDON_MAYA_PARTICEL_VORTEXDUMMY.3ds";
	text[3] = "JI13";
};


func void usejoly_item1()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"GOB_BODY2.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Test Bla Glumpsch,");
	Doc_Show(ndocid);
};

func void usejoly_item2()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"GOB_BODY3.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Test Bla Glumpsch,");
	Doc_Show(ndocid);
};


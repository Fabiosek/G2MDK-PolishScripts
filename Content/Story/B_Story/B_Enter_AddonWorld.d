
func void b_enter_addonworld_kapitel_1()
{
	if(RAVENISDEAD == TRUE)
	{
		b_removenpc(kdw_14030_addon_myxir_adw);
	};
	if((SKLAVEN_WEG == TRUE) && (REMOVESKLAVEN == FALSE))
	{
		b_removenpc(strf_1118_addon_patrick);
		b_removenpc(strf_1119_addon_monty);
		b_removenpc(strf_1120_addon_tonak);
		b_removenpc(strf_1121_addon_telbor);
		b_removenpc(strf_1122_addon_pardos);
		REMOVESKLAVEN = TRUE;
	};
};


var int enteradw_kapitel2;

func void b_enter_addonworld_kapitel_2()
{
	if(ENTERADW_KAPITEL2 == FALSE)
	{
		ENTERADW_KAPITEL2 = TRUE;
	};
};


var int enteradw_kapitel3;

func void b_enter_addonworld_kapitel_3()
{
	if(ENTERADW_KAPITEL3 == FALSE)
	{
		ENTERADW_KAPITEL3 = TRUE;
	};
};


var int enteradw_kapitel4;

func void b_enter_addonworld_kapitel_4()
{
	if(ENTERADW_KAPITEL4 == FALSE)
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
		ENTERADW_KAPITEL4 = TRUE;
	};
};


var int enteradw_kapitel5;

func void b_enter_addonworld_kapitel_5()
{
	if(ENTERADW_KAPITEL5 == FALSE)
	{
		ENTERADW_KAPITEL5 = TRUE;
	};
};


var int enteradw_kapitel6;

func void b_enter_addonworld_kapitel_6()
{
	if(ENTERADW_KAPITEL6 == FALSE)
	{
		ENTERADW_KAPITEL6 = TRUE;
	};
};

func void b_enter_addonworld()
{
	b_initnpcglobals();
	if(KAPITEL >= 1)
	{
		b_enter_addonworld_kapitel_1();
	};
	if(KAPITEL >= 2)
	{
		b_enter_addonworld_kapitel_2();
	};
	if(KAPITEL >= 3)
	{
		b_enter_addonworld_kapitel_3();
	};
	if(KAPITEL >= 4)
	{
		b_enter_addonworld_kapitel_4();
	};
	if(KAPITEL >= 5)
	{
		b_enter_addonworld_kapitel_5();
	};
	if(KAPITEL >= 6)
	{
		b_enter_addonworld_kapitel_6();
	};
	CURRENTLEVEL = ADDONWORLD_ZEN;
	b_initnpcglobals();
};



var int cronos_adw_itemsgiven_chapter_1;
var int cronos_adw_itemsgiven_chapter_2;
var int cronos_adw_itemsgiven_chapter_3;
var int cronos_adw_itemsgiven_chapter_4;
var int cronos_adw_itemsgiven_chapter_5;

func void b_givetradeinv_addon_cronos_adw(var C_NPC slf)
{
	if((KAPITEL >= 2) && (CRONOS_ADW_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmw_addon_stab03,1);
		CreateInvItems(slf,itmw_addon_stab05,1);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itmi_quartz,2);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itpo_health_01,7);
		CreateInvItems(slf,itpo_health_02,2);
		CreateInvItems(slf,itpo_mana_01,14);
		CreateInvItems(slf,itpo_health_addon_04,2);
		CreateInvItems(slf,itpo_mana_addon_04,5);
		CreateInvItems(slf,itmi_flask,15);
		CreateInvItems(slf,itwr_map_addonworld,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdf_circ1,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdf_circ2,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdf_circ3,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdf_circ4,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdf_circ5,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdf_circ6,1);
		CreateInvItems(slf,itwr_addon_runemaking_kdw_circ1,1);
		CreateInvItems(slf,itmi_runeblank,2);
		CreateInvItems(slf,itsc_light,5);
		CreateInvItems(slf,itsc_firebolt,5);
		CreateInvItems(slf,itsc_zap,5);
		CreateInvItems(slf,itsc_lightheal,5);
		CreateInvItems(slf,itsc_sumgobskel,2);
		CreateInvItems(slf,itsc_icelance,5);
		CreateInvItems(slf,itsc_whirlwind,1);
		CreateInvItems(slf,itsc_icebolt,3);
		CreateInvItems(slf,itsc_instantfireball,3);
		CreateInvItems(slf,itsc_whirlwind,2);
		CreateInvItems(slf,itsc_geyser,2);
		CreateInvItems(slf,itsc_thunderstorm,2);
		CreateInvItems(slf,itsc_waterfist,1);
		CreateInvItems(slf,itsc_sumwolf,2);
		CRONOS_ADW_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (CRONOS_ADW_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itmi_quartz,2);
		CreateInvItems(slf,itmi_rockcrystal,2);
		CreateInvItems(slf,itmi_coal,2);
		CreateInvItems(slf,itat_waranfiretongue,1);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itpo_health_02,9);
		CreateInvItems(slf,itpo_health_03,6);
		CreateInvItems(slf,itpo_mana_01,30);
		CreateInvItems(slf,itpo_health_addon_04,2);
		CreateInvItems(slf,itpo_mana_addon_04,5);
		CreateInvItems(slf,itsc_mediumheal,5);
		CreateInvItems(slf,itsc_firestorm,4);
		CreateInvItems(slf,itsc_thunderball,2);
		CreateInvItems(slf,itsc_sumskel,3);
		CreateInvItems(slf,itsc_fear,2);
		CreateInvItems(slf,itsc_icecube,3);
		CreateInvItems(slf,itmi_flask,10);
		CreateInvItems(slf,itsc_icelance,2);
		CreateInvItems(slf,itsc_whirlwind,2);
		CreateInvItems(slf,itsc_geyser,2);
		CreateInvItems(slf,itsc_thunderstorm,2);
		CreateInvItems(slf,itsc_waterfist,1);
		CreateInvItems(slf,itmi_runeblank,2);
		CreateInvItems(slf,itsc_trfgiantbug,1);
		CreateInvItems(slf,itsc_trfwolf,1);
		CreateInvItems(slf,itsc_trfsheep,1);
		CreateInvItems(slf,itsc_trfscavenger,1);
		CRONOS_ADW_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (CRONOS_ADW_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_sulfur,5);
		CreateInvItems(slf,itmi_quartz,6);
		CreateInvItems(slf,itmi_rockcrystal,3);
		CreateInvItems(slf,itmi_coal,4);
		CreateInvItems(slf,itmi_aquamarine,2);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itmi_flask,10);
		CreateInvItems(slf,itpo_health_addon_04,5);
		CreateInvItems(slf,itpo_mana_addon_04,10);
		CreateInvItems(slf,itpo_health_02,15);
		CreateInvItems(slf,itpo_health_03,10);
		CreateInvItems(slf,itpo_mana_01,30);
		CreateInvItems(slf,itpo_mana_02,30);
		CreateInvItems(slf,itsc_lightningflash,3);
		CreateInvItems(slf,itsc_sumgol,3);
		CreateInvItems(slf,itsc_harmundead,2);
		CreateInvItems(slf,itsc_chargefireball,3);
		CreateInvItems(slf,itsc_trfsnapper,1);
		CreateInvItems(slf,itsc_trfwarg,1);
		CreateInvItems(slf,itsc_icelance,3);
		CreateInvItems(slf,itsc_whirlwind,3);
		CreateInvItems(slf,itsc_geyser,3);
		CreateInvItems(slf,itsc_thunderstorm,3);
		CreateInvItems(slf,itsc_waterfist,2);
		CRONOS_ADW_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (CRONOS_ADW_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_sulfur,6);
		CreateInvItems(slf,itmi_quartz,4);
		CreateInvItems(slf,itmi_rockcrystal,6);
		CreateInvItems(slf,itmi_coal,3);
		CreateInvItems(slf,itmi_aquamarine,3);
		CreateInvItems(slf,itmi_darkpearl,1);
		CreateInvItems(slf,itmi_holywater,3);
		CreateInvItems(slf,itmi_flask,10);
		CreateInvItems(slf,itpo_health_02,20);
		CreateInvItems(slf,itpo_health_03,15);
		CreateInvItems(slf,itpo_mana_01,50);
		CreateInvItems(slf,itpo_mana_02,40);
		CreateInvItems(slf,itsc_pyrokinesis,5);
		CreateInvItems(slf,itsc_icewave,4);
		CreateInvItems(slf,itsc_sumdemon,2);
		CreateInvItems(slf,itsc_fullheal,3);
		CreateInvItems(slf,itsc_icelance,3);
		CreateInvItems(slf,itsc_whirlwind,3);
		CreateInvItems(slf,itsc_geyser,3);
		CreateInvItems(slf,itsc_thunderstorm,3);
		CreateInvItems(slf,itsc_waterfist,3);
		CreateInvItems(slf,itmi_runeblank,1);
		CreateInvItems(slf,itsc_trflurker,1);
		CreateInvItems(slf,itsc_trfdragonsnapper,1);
		CRONOS_ADW_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


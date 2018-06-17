
var int gorax_itemsgiven_chapter_1;
var int gorax_itemsgiven_chapter_2;
var int gorax_itemsgiven_chapter_3;
var int gorax_itemsgiven_chapter_4;
var int gorax_itemsgiven_chapter_5;

func void b_givetradeinv_gorax(var C_NPC slf)
{
	if((KAPITEL >= 1) && (GORAX_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itke_innos_mis,1);
		CreateInvItems(slf,itsc_sleep,1);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itpo_mana_01,2);
		CreateInvItems(slf,itpo_health_01,3);
		CreateInvItems(slf,itsc_light,5);
		CreateInvItems(slf,itsc_firebolt,5);
		CreateInvItems(slf,itsc_lightheal,5);
		CreateInvItems(slf,itsc_sumgobskel,5);
		CreateInvItems(slf,itsc_windfist,1);
		CreateInvItems(slf,itwr_map_newworld,1);
		CreateInvItems(slf,itsc_zap,5);
		CreateInvItems(slf,itfo_wine,3);
		CreateInvItems(slf,itbe_addon_nov_01,1);
		CreateInvItems(slf,itbe_addon_kdf_01,1);
		CreateInvItems(slf,itmw_addon_stab01,1);
		CreateInvItems(slf,itmw_addon_stab02,1);
		CreateInvItems(slf,itmw_addon_stab04,1);
		CreateInvItems(slf,itri_mana_01,1);
		GORAX_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (GORAX_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itmi_quartz,2);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itsc_icebolt,5);
		CreateInvItems(slf,itpo_health_01,7);
		CreateInvItems(slf,itpo_health_02,2);
		CreateInvItems(slf,itpo_mana_01,14);
		CreateInvItems(slf,itsc_instantfireball,5);
		CreateInvItems(slf,itsc_sumwolf,5);
		CreateInvItems(slf,itsc_windfist,4);
		CreateInvItems(slf,itsc_sleep,2);
		CreateInvItems(slf,itam_prot_edge_01,1);
		CreateInvItems(slf,itmi_runeblank,2);
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_MIL))
		{
			CreateInvItems(slf,itwr_map_shrine_mis,1);
		};
		GORAX_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (GORAX_ITEMSGIVEN_CHAPTER_3 == FALSE))
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
		CreateInvItems(slf,itsc_mediumheal,5);
		CreateInvItems(slf,itsc_firestorm,4);
		CreateInvItems(slf,itsc_thunderball,2);
		CreateInvItems(slf,itsc_sumskel,3);
		CreateInvItems(slf,itsc_fear,2);
		CreateInvItems(slf,itsc_icecube,3);
		CreateInvItems(slf,itmi_runeblank,1);
		CreateInvItems(slf,itsc_trfgiantbug,1);
		CreateInvItems(slf,itsc_trfwolf,1);
		CreateInvItems(slf,itsc_trfsheep,1);
		CreateInvItems(slf,itsc_trfscavenger,1);
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_MIL))
		{
			CreateInvItems(slf,itwr_map_shrine_mis,1);
		};
		CreateInvItems(slf,itbe_addon_prot_magic,1);
		GORAX_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (GORAX_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itmi_sulfur,5);
		CreateInvItems(slf,itmi_quartz,6);
		CreateInvItems(slf,itmi_rockcrystal,3);
		CreateInvItems(slf,itmi_coal,4);
		CreateInvItems(slf,itmi_aquamarine,2);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itpo_health_02,15);
		CreateInvItems(slf,itpo_health_03,10);
		CreateInvItems(slf,itpo_mana_01,30);
		CreateInvItems(slf,itpo_mana_02,30);
		CreateInvItems(slf,itsc_lightningflash,5);
		CreateInvItems(slf,itsc_sumgol,4);
		CreateInvItems(slf,itsc_harmundead,2);
		CreateInvItems(slf,itsc_chargefireball,3);
		CreateInvItems(slf,itsc_sumdemon,2);
		CreateInvItems(slf,itsc_firerain,2);
		CreateInvItems(slf,itsc_trfsnapper,1);
		CreateInvItems(slf,itsc_trfwarg,1);
		GORAX_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (GORAX_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itmi_sulfur,6);
		CreateInvItems(slf,itmi_quartz,4);
		CreateInvItems(slf,itmi_rockcrystal,6);
		CreateInvItems(slf,itmi_coal,3);
		CreateInvItems(slf,itmi_aquamarine,3);
		CreateInvItems(slf,itmi_darkpearl,1);
		CreateInvItems(slf,itmi_holywater,3);
		CreateInvItems(slf,itpo_health_02,20);
		CreateInvItems(slf,itpo_health_03,15);
		CreateInvItems(slf,itpo_mana_01,50);
		CreateInvItems(slf,itpo_mana_02,40);
		CreateInvItems(slf,itsc_pyrokinesis,5);
		CreateInvItems(slf,itsc_icewave,4);
		CreateInvItems(slf,itsc_sumdemon,2);
		CreateInvItems(slf,itsc_fullheal,3);
		CreateInvItems(slf,itmi_runeblank,1);
		CreateInvItems(slf,itsc_trflurker,1);
		CreateInvItems(slf,itsc_trfdragonsnapper,1);
		GORAX_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


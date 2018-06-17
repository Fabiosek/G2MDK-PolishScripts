
var int zuris_itemsgiven_chapter_1;
var int zuris_itemsgiven_chapter_2;
var int zuris_itemsgiven_chapter_3;
var int zuris_itemsgiven_chapter_4;
var int zuris_itemsgiven_chapter_5;

func void b_givetradeinv_zuris(var C_NPC slf)
{
	if((KAPITEL >= 1) && (ZURIS_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_01,10);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_health_addon_04,2);
		CreateInvItems(slf,itpo_mana_addon_04,2);
		CreateInvItems(slf,itmi_apfeltabak,2);
		CreateInvItems(slf,itwr_astronomy_mis,1);
		CreateInvItems(slf,itfo_addon_pfeffer_01,1);
		CreateInvItems(slf,itsc_light,6);
		CreateInvItems(slf,itsc_sleep,1);
		CreateInvItems(slf,itsc_firebolt,20);
		CreateInvItems(slf,itsc_icebolt,8);
		CreateInvItems(slf,itsc_instantfireball,10);
		CreateInvItems(slf,itsc_lightningflash,5);
		CreateInvItems(slf,itsc_harmundead,3);
		CreateInvItems(slf,itsc_firestorm,3);
		CreateInvItems(slf,itsc_icewave,1);
		CreateInvItems(slf,itsc_zap,5);
		CreateInvItems(slf,itsc_icecube,3);
		CreateInvItems(slf,itsc_windfist,3);
		CreateInvItems(slf,itsc_icewave,1);
		CreateInvItems(slf,itsc_firerain,1);
		CreateInvItems(slf,itsc_shrink,1);
		CreateInvItems(slf,itsc_thunderstorm,1);
		CreateInvItems(slf,itsc_sumgobskel,1);
		CreateInvItems(slf,itsc_sumskel,1);
		CreateInvItems(slf,itsc_sumwolf,1);
		CreateInvItems(slf,itsc_sumgol,1);
		CreateInvItems(slf,itsc_sumdemon,1);
		CreateInvItems(slf,itbe_addon_prot_magic,1);
		CreateInvItems(slf,itam_hp_mana_01,1);
		ZURIS_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (ZURIS_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,60);
		CreateInvItems(slf,itpo_health_addon_04,2);
		CreateInvItems(slf,itpo_mana_addon_04,2);
		CreateInvItems(slf,itpo_mana_01,15);
		CreateInvItems(slf,itpo_mana_02,1);
		CreateInvItems(slf,itpo_health_01,15);
		CreateInvItems(slf,itpo_health_02,2);
		CreateInvItems(slf,itmi_apfeltabak,5);
		CreateInvItems(slf,itpo_perm_str,1);
		ZURIS_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (ZURIS_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,120);
		CreateInvItems(slf,itpo_health_addon_04,2);
		CreateInvItems(slf,itpo_mana_addon_04,2);
		CreateInvItems(slf,itpo_mana_01,25);
		CreateInvItems(slf,itpo_mana_02,3);
		CreateInvItems(slf,itpo_health_01,25);
		CreateInvItems(slf,itpo_health_02,15);
		CreateInvItems(slf,itpo_perm_mana,1);
		CreateInvItems(slf,itpo_speed,1);
		ZURIS_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (ZURIS_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,220);
		CreateInvItems(slf,itpo_health_addon_04,3);
		CreateInvItems(slf,itpo_mana_addon_04,3);
		CreateInvItems(slf,itpo_mana_01,35);
		CreateInvItems(slf,itpo_mana_02,15);
		CreateInvItems(slf,itpo_health_01,35);
		CreateInvItems(slf,itpo_health_02,20);
		CreateInvItems(slf,itpo_health_03,10);
		CreateInvItems(slf,itpo_perm_mana,1);
		CreateInvItems(slf,itpo_speed,1);
		ZURIS_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (ZURIS_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,321);
		CreateInvItems(slf,itpo_health_addon_04,5);
		CreateInvItems(slf,itpo_mana_addon_04,5);
		CreateInvItems(slf,itpo_mana_01,55);
		CreateInvItems(slf,itpo_mana_02,35);
		CreateInvItems(slf,itpo_mana_03,15);
		CreateInvItems(slf,itpo_health_01,55);
		CreateInvItems(slf,itpo_health_02,30);
		CreateInvItems(slf,itpo_health_03,20);
		CreateInvItems(slf,itpo_perm_health,1);
		CreateInvItems(slf,itpo_speed,1);
		ZURIS_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


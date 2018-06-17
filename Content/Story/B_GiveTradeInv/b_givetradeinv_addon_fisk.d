
var int fisk_itemsgiven_chapter_1;
var int fisk_itemsgiven_chapter_2;
var int fisk_itemsgiven_chapter_3;
var int fisk_itemsgiven_chapter_4;
var int fisk_itemsgiven_chapter_5;

func void b_givetradeinv_addon_fisk(var C_NPC slf)
{
	if((KAPITEL >= 1) && (FISK_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_goldnugget_addon,2);
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itpl_mana_herb_02,10);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itpl_health_herb_02,10);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpl_beet,3);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_03,3);
		CreateInvItems(slf,itpo_health_03,3);
		CreateInvItems(slf,itpo_mana_addon_04,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itat_sting,5);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		CreateInvItems(slf,itmw_addon_keule_1h_01,1);
		CreateInvItems(slf,itmw_addon_keule_2h_01,1);
		CreateInvItems(slf,itri_prot_edge_02,1);
		FISK_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (FISK_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itpl_mana_herb_02,10);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itpl_health_herb_02,10);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpl_beet,3);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_03,3);
		CreateInvItems(slf,itpo_health_03,3);
		CreateInvItems(slf,itpo_mana_addon_04,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itat_sting,5);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		FISK_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (FISK_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itpl_mana_herb_02,10);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itpl_health_herb_02,10);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpl_beet,3);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_03,3);
		CreateInvItems(slf,itpo_health_03,3);
		CreateInvItems(slf,itpo_mana_addon_04,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itat_sting,5);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		FISK_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (FISK_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itpl_mana_herb_02,10);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itpl_health_herb_02,10);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_03,3);
		CreateInvItems(slf,itpo_health_03,3);
		CreateInvItems(slf,itpo_mana_addon_04,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		FISK_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (FISK_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itpl_mana_herb_02,10);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itpl_health_herb_02,10);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_03,3);
		CreateInvItems(slf,itpo_health_03,3);
		CreateInvItems(slf,itpo_mana_addon_04,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		FISK_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


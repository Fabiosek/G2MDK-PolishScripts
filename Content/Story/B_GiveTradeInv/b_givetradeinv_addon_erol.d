
var int erol_itemsgiven_chapter_1;
var int erol_itemsgiven_chapter_2;
var int erol_itemsgiven_chapter_3;
var int erol_itemsgiven_chapter_4;
var int erol_itemsgiven_chapter_5;

func void b_givetradeinv_addon_erol(var C_NPC slf)
{
	if((KAPITEL >= 1) && (EROL_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_bread,3);
		CreateInvItems(slf,itfo_cheese,2);
		CreateInvItems(slf,itpl_mana_herb_02,1);
		CreateInvItems(slf,itpl_health_herb_02,2);
		CreateInvItems(slf,itpl_temp_herb,1);
		CreateInvItems(slf,itpo_perm_health,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itmw_schwert5,2);
		CreateInvItems(slf,itmw_kriegshammer2,1);
		CreateInvItems(slf,itmw_shortsword5,1);
		CreateInvItems(slf,itmw_zweihaender1,1);
		CreateInvItems(slf,itri_prot_edge_01,1);
		CreateInvItems(slf,itam_strg_01,1);
		EROL_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (EROL_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itfo_water,1);
		CreateInvItems(slf,itfo_bread,2);
		CreateInvItems(slf,itfo_cheese,3);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_health_herb_02,3);
		CreateInvItems(slf,itpl_temp_herb,2);
		EROL_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (EROL_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_cheese,2);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_health_herb_02,3);
		CreateInvItems(slf,itpl_temp_herb,2);
		CreateInvItems(slf,itmiswordraw,5);
		EROL_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (EROL_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itfo_cheese,1);
		CreateInvItems(slf,itfomutton,2);
		CreateInvItems(slf,itfo_stew,3);
		CreateInvItems(slf,itfo_fishsoup,4);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_health_herb_02,3);
		CreateInvItems(slf,itpl_temp_herb,2);
		EROL_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (EROL_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itpl_mana_herb_02,3);
		CreateInvItems(slf,itpl_health_herb_02,3);
		CreateInvItems(slf,itpl_temp_herb,2);
		EROL_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


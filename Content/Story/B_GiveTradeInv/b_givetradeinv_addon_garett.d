
var int garett_itemsgiven_chapter_1;
var int garett_itemsgiven_chapter_2;
var int garett_itemsgiven_chapter_3;
var int garett_itemsgiven_chapter_4;
var int garett_itemsgiven_chapter_5;

func void b_givetradeinv_addon_garett(var C_NPC slf)
{
	if((KAPITEL >= 1) && (GARETT_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,10);
		CreateInvItems(slf,itfo_addon_rum,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itmw_shortsword3,1);
		CreateInvItems(slf,itmw_2h_axe_l_01,1);
		CreateInvItems(slf,itmw_schiffsaxt,1);
		CreateInvItems(slf,itmw_streitaxt1,1);
		CreateInvItems(slf,itmw_zweihaender4,1);
		CreateInvItems(slf,itmw_orkschlaechter,1);
		CreateInvItems(slf,itmw_addon_hacker_1h_01,1);
		CreateInvItems(slf,itmw_addon_hacker_1h_02,1);
		CreateInvItems(slf,itmw_addon_hacker_2h_01,1);
		CreateInvItems(slf,itmw_addon_hacker_2h_02,1);
		CreateInvItems(slf,itrw_crossbow_m_01,1);
		CreateInvItems(slf,itrw_crossbow_h_01,1);
		CreateInvItems(slf,itam_prot_fire_01,1);
		CreateInvItems(slf,itri_prot_mage_02,1);
		GARETT_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (GARETT_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,20);
		CreateInvItems(slf,itmi_joint,1);
		CreateInvItems(slf,itmiswordraw,2);
		CreateInvItems(slf,itmi_darkpearl,1);
		GARETT_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (GARETT_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		GARETT_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (GARETT_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		GARETT_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (GARETT_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		GARETT_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


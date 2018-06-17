
var int bosper_itemsgiven_chapter_1;
var int bosper_itemsgiven_chapter_2;
var int bosper_itemsgiven_chapter_3;
var int bosper_itemsgiven_chapter_4;
var int bosper_itemsgiven_chapter_5;

func void b_givetradeinv_bosper(var C_NPC slf)
{
	if((KAPITEL >= 1) && (BOSPER_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,50);
		CreateInvItems(slf,itrw_arrow,30);
		CreateInvItems(slf,itrw_bow_l_01,1);
		CreateInvItems(slf,itrw_bow_l_02,1);
		CreateInvItems(slf,itrw_bow_l_03,1);
		CreateInvItems(slf,itrw_bow_l_03,1);
		CreateInvItems(slf,itrw_bow_l_04,1);
		CreateInvItems(slf,itbe_addon_leather_01,1);
		CreateInvItems(slf,itri_dex_02,1);
		BOSPER_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (BOSPER_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,50);
		CreateInvItems(slf,itbe_addon_dex_5,1);
		CreateInvItems(slf,itrw_bow_m_01,1);
		CreateInvItems(slf,itrw_bow_m_02,1);
		CreateInvItems(slf,itrw_bow_m_03,1);
		CreateInvItems(slf,itrw_bow_m_04,1);
		BOSPER_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (BOSPER_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		CreateInvItems(slf,itbe_addon_dex_10,1);
		BOSPER_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (BOSPER_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itrw_arrow,180);
		CreateInvItems(slf,itrw_bolt,160);
		CreateInvItems(slf,itrw_bow_h_01,1);
		CreateInvItems(slf,itrw_bow_h_02,1);
		CreateInvItems(slf,itrw_bow_h_03,1);
		CreateInvItems(slf,itrw_bow_h_04,1);
		BOSPER_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (BOSPER_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itrw_arrow,200);
		CreateInvItems(slf,itrw_bolt,170);
		BOSPER_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


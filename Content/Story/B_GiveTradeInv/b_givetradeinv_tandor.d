
var int tandor_itemsgiven_chapter_1;
var int tandor_itemsgiven_chapter_2;
var int tandor_itemsgiven_chapter_3;
var int tandor_itemsgiven_chapter_4;
var int tandor_itemsgiven_chapter_5;

func void b_givetradeinv_tandor(var C_NPC slf)
{
	if((KAPITEL >= 1) && (TANDOR_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,80);
		CreateInvItems(slf,itrw_arrow,25);
		CreateInvItems(slf,itrw_bolt,25);
		CreateInvItems(slf,itmw_stabkeule,1);
		CreateInvItems(slf,itmw_steinbrecher,1);
		CreateInvItems(slf,itmw_schwert2,1);
		CreateInvItems(slf,itmw_morgenstern,1);
		CreateInvItems(slf,itmw_doppelaxt,1);
		CreateInvItems(slf,itmw_streitkolben,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itmw_schwert5,1);
		CreateInvItems(slf,itmw_kriegshammer2,1);
		CreateInvItems(slf,itmw_orkschlaechter,1);
		CreateInvItems(slf,itmw_schlachtaxt,1);
		CreateInvItems(slf,itmw_drachenschneide,1);
		CreateInvItems(slf,itrw_bow_m_03,1);
		CreateInvItems(slf,itrw_crossbow_m_02,1);
		CreateInvItems(slf,itrw_bow_h_02,1);
		CreateInvItems(slf,itrw_crossbow_h_01,1);
		CreateInvItems(slf,itrw_bow_l_03,1);
		CreateInvItems(slf,itrw_bow_l_04,1);
		CreateInvItems(slf,itrw_bow_m_02,1);
		CreateInvItems(slf,itrw_crossbow_m_01,1);
		CreateInvItems(slf,itam_prot_total_01,1);
		TANDOR_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (TANDOR_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		TANDOR_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (TANDOR_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		TANDOR_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (TANDOR_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		TANDOR_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (TANDOR_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		TANDOR_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


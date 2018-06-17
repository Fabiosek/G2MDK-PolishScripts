
var int hakon_itemsgiven_chapter_1;
var int hakon_itemsgiven_chapter_2;
var int hakon_itemsgiven_chapter_3;
var int hakon_itemsgiven_chapter_4;
var int hakon_itemsgiven_chapter_5;

func void b_givetradeinv_hakon(var C_NPC slf)
{
	if((KAPITEL >= 1) && (HAKON_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmw_shortsword3,1);
		CreateInvItems(slf,itmw_shortsword4,1);
		CreateInvItems(slf,itmw_richtstab,1);
		CreateInvItems(slf,itmw_schwert3,1);
		CreateInvItems(slf,itmw_streitkolben,1);
		CreateInvItems(slf,itmw_schiffsaxt,1);
		CreateInvItems(slf,itmiswordraw,5);
		CreateInvItems(slf,itmw_schlachtaxt,1);
		CreateInvItems(slf,itbe_addon_leather_01,1);
		CreateInvItems(slf,itbe_addon_mil_01,1);
		CreateInvItems(slf,itam_prot_edge_01,1);
		HAKON_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (HAKON_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (HAKON_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmw_steinbrecher,1);
		CreateInvItems(slf,itmw_doppelaxt,2);
		CreateInvItems(slf,itmw_streitkolben,1);
		CreateInvItems(slf,itmw_orkschlaechter,2);
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itmiswordraw,5);
		CreateInvItems(slf,itbe_addon_prot_point,1);
		HAKON_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (HAKON_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,150);
		CreateInvItems(slf,itmiswordraw,5);
		CreateInvItems(slf,itbe_addon_prot_edge,1);
		CreateInvItems(slf,itbe_addon_prot_total,1);
		HAKON_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (HAKON_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itmiswordraw,5);
		HAKON_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};



var int huno_itemsgiven_chapter_1;
var int huno_itemsgiven_chapter_2;
var int huno_itemsgiven_chapter_3;
var int huno_itemsgiven_chapter_4;
var int huno_itemsgiven_chapter_5;

func void b_givetradeinv_addon_huno(var C_NPC slf)
{
	if((KAPITEL >= 1) && (HUNO_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,1);
		CreateInvItems(slf,itmw_streitaxt1,1);
		CreateInvItems(slf,itmw_schwert2,1);
		CreateInvItems(slf,itmw_morgenstern,1);
		CreateInvItems(slf,itmw_2h_axe_l_01,5);
		CreateInvItems(slf,itri_str_02,1);
		HUNO_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (HUNO_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,1);
		HUNO_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (HUNO_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,1);
		HUNO_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (HUNO_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,1);
		HUNO_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (HUNO_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmiswordraw,3);
		CreateInvItems(slf,itmi_nugget,1);
		HUNO_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


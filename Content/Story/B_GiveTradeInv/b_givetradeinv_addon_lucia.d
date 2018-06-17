
var int lucia_itemsgiven_chapter_1;
var int lucia_itemsgiven_chapter_2;
var int lucia_itemsgiven_chapter_3;
var int lucia_itemsgiven_chapter_4;
var int lucia_itemsgiven_chapter_5;

func void b_givetradeinv_addon_lucia(var C_NPC slf)
{
	if((KAPITEL >= 1) && (LUCIA_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_addon_rum,10);
		CreateInvItems(slf,itfo_addon_grog,10);
		CreateInvItems(slf,itmi_flask,20);
		CreateInvItems(slf,itri_dex_02,1);
		LUCIA_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (LUCIA_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,10);
		CreateInvItems(slf,itfo_addon_rum,10);
		CreateInvItems(slf,itfo_addon_grog,10);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itmi_flask,20);
		LUCIA_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (LUCIA_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,10);
		CreateInvItems(slf,itfo_addon_rum,10);
		CreateInvItems(slf,itfo_addon_grog,10);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itmi_flask,10);
		LUCIA_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (LUCIA_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,10);
		CreateInvItems(slf,itfo_addon_rum,10);
		CreateInvItems(slf,itfo_addon_grog,10);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itmi_flask,10);
		LUCIA_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (LUCIA_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itfo_booze,10);
		CreateInvItems(slf,itfo_addon_rum,10);
		CreateInvItems(slf,itfo_addon_grog,10);
		CreateInvItems(slf,itfo_beer,4);
		CreateInvItems(slf,itmi_flask,10);
		LUCIA_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


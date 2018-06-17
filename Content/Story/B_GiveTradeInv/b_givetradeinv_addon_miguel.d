
var int miguel_itemsgiven_chapter_1;
var int miguel_itemsgiven_chapter_2;
var int miguel_itemsgiven_chapter_3;
var int miguel_itemsgiven_chapter_4;
var int miguel_itemsgiven_chapter_5;

func void b_givetradeinv_addon_miguel(var C_NPC slf)
{
	if((KAPITEL >= 1) && (MIGUEL_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itpo_mana_01,10);
		CreateInvItems(slf,itpo_health_01,10);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_health_addon_04,1);
		MIGUEL_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (MIGUEL_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		MIGUEL_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (MIGUEL_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,2);
		CreateInvItems(slf,itpo_health_02,2);
		MIGUEL_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (MIGUEL_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		MIGUEL_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (MIGUEL_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		MIGUEL_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


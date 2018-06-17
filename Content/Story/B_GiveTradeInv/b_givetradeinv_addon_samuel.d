
var int samuel_itemsgiven_chapter_1;
var int samuel_itemsgiven_chapter_2;
var int samuel_itemsgiven_chapter_3;
var int samuel_itemsgiven_chapter_4;
var int samuel_itemsgiven_chapter_5;

func void b_givetradeinv_addon_samuel(var C_NPC slf)
{
	if((KAPITEL >= 1) && (SAMUEL_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_addon_rum,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itmi_flask,4);
		CreateInvItems(slf,itpl_swampherb,4);
		CreateInvItems(slf,itmi_joint,1);
		CreateInvItems(slf,RI_PROTFIRE02,1);
		SAMUEL_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (SAMUEL_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_addon_rum,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itmi_flask,4);
		CreateInvItems(slf,itpl_swampherb,4);
		CreateInvItems(slf,itmi_joint,1);
		SAMUEL_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (SAMUEL_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_addon_rum,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itmi_flask,4);
		CreateInvItems(slf,itpl_swampherb,4);
		CreateInvItems(slf,itmi_joint,1);
		SAMUEL_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (SAMUEL_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_addon_rum,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itmi_flask,4);
		CreateInvItems(slf,itpl_swampherb,4);
		CreateInvItems(slf,itmi_joint,1);
		SAMUEL_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (SAMUEL_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itfo_addon_rum,2);
		CreateInvItems(slf,itfo_booze,3);
		CreateInvItems(slf,itfo_beer,6);
		CreateInvItems(slf,itfo_wine,2);
		CreateInvItems(slf,itfo_bacon,2);
		CreateInvItems(slf,itmi_flask,4);
		CreateInvItems(slf,itpl_swampherb,4);
		CreateInvItems(slf,itmi_joint,1);
		SAMUEL_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


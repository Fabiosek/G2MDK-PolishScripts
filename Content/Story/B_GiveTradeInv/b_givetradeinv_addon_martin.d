
var int martin_itemsgiven_chapter_1;
var int martin_itemsgiven_chapter_2;
var int martin_itemsgiven_chapter_3;
var int martin_itemsgiven_chapter_4;
var int martin_itemsgiven_chapter_5;

func void b_givetradeinv_addon_martin(var C_NPC slf)
{
	if((KAPITEL >= 1) && (MARTIN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itsc_palholybolt,2);
		CreateInvItems(slf,itsc_palmediumheal,1);
		CreateInvItems(slf,itsc_pallight,10);
		CreateInvItems(slf,itmi_moleratlubric_mis,1);
		CreateInvItems(slf,itmw_shortsword1,3);
		CreateInvItems(slf,itmw_schwert2,2);
		CreateInvItems(slf,itmw_addon_hacker_1h_01,1);
		CreateInvItems(slf,itmw_addon_hacker_2h_01,1);
		CreateInvItems(slf,itmw_meisterdegen,1);
		CreateInvItems(slf,itmw_shortsword5,1);
		CreateInvItems(slf,itmw_schwert4,1);
		CreateInvItems(slf,itmw_runenschwert,1);
		CreateInvItems(slf,itri_mana_01,1);
		MARTIN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (MARTIN_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itsc_palholybolt,2);
		CreateInvItems(slf,itsc_palmediumheal,1);
		CreateInvItems(slf,itsc_palrepelevil,1);
		CreateInvItems(slf,itsc_palfullheal,1);
		MARTIN_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (MARTIN_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itsc_palholybolt,2);
		CreateInvItems(slf,itsc_palmediumheal,1);
		CreateInvItems(slf,itsc_palrepelevil,1);
		CreateInvItems(slf,itsc_palfullheal,2);
		MARTIN_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (MARTIN_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itsc_palholybolt,2);
		CreateInvItems(slf,itsc_palmediumheal,1);
		CreateInvItems(slf,itmi_nugget,1);
		CreateInvItems(slf,itsc_paldestroyevil,1);
		CreateInvItems(slf,itsc_palrepelevil,2);
		CreateInvItems(slf,itsc_palfullheal,3);
		MARTIN_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (MARTIN_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itsc_palholybolt,2);
		CreateInvItems(slf,itsc_palmediumheal,1);
		CreateInvItems(slf,itsc_paldestroyevil,2);
		CreateInvItems(slf,itsc_palrepelevil,3);
		CreateInvItems(slf,itsc_palfullheal,2);
		MARTIN_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


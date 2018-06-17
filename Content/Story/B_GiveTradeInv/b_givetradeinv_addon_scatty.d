
var int scatty_itemsgiven_chapter_1;
var int scatty_itemsgiven_chapter_2;
var int scatty_itemsgiven_chapter_3;
var int scatty_itemsgiven_chapter_4;
var int scatty_itemsgiven_chapter_5;

func void b_givetradeinv_addon_scatty(var C_NPC slf)
{
	if((KAPITEL >= 1) && (SCATTY_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_goldnugget_addon,7);
		CreateInvItems(slf,itmw_2h_axe_l_01,2);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,50);
		CreateInvItems(slf,itmw_schwert2,1);
		CreateInvItems(slf,itmw_zweihaender1,1);
		CreateInvItems(slf,itrw_crossbow_l_02,1);
		CreateInvItems(slf,itmw_schwert5,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itmw_inquisitor,1);
		SCATTY_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (SCATTY_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmw_2h_axe_l_01,2);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,50);
		SCATTY_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (SCATTY_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmw_2h_axe_l_01,2);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,50);
		SCATTY_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (SCATTY_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmw_2h_axe_l_01,2);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,50);
		SCATTY_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (SCATTY_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmw_2h_axe_l_01,2);
		CreateInvItems(slf,itfo_cheese,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itfo_water,5);
		CreateInvItems(slf,itfo_stew,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itrw_arrow,50);
		CreateInvItems(slf,itrw_bolt,50);
		SCATTY_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};


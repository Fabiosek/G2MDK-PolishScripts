
const int STR_STPLLEVEL1 = 2;
const int STR_STPLLEVEL2 = 4;
const int STR_STPLLEVEL3 = 6;
const int DEX_STPLLEVEL1 = 2;
const int DEX_STPLLEVEL2 = 4;
const int DEX_STPLLEVEL3 = 6;
const int HPMAX_STPLLEVEL1 = 5;
const int HPMAX_STPLLEVEL2 = 10;
const int HPMAX_STPLLEVEL3 = 15;
const int MANAMAX_STPLLEVEL1 = 2;
const int MANAMAX_STPLLEVEL2 = 4;
const int MANAMAX_STPLLEVEL3 = 6;
const int ONEH_STPLLEVEL1 = 2;
const int ONEH_STPLLEVEL2 = 4;
const int ONEH_STPLLEVEL3 = 6;
const int TWOH_STPLLEVEL1 = 2;
const int TWOH_STPLLEVEL2 = 4;
const int TWOH_STPLLEVEL3 = 6;
const int BOW_STPLLEVEL1 = 2;
const int BOW_STPLLEVEL2 = 4;
const int BOW_STPLLEVEL3 = 6;
const int CRSBOW_STPLLEVEL1 = 2;
const int CRSBOW_STPLLEVEL2 = 4;
const int CRSBOW_STPLLEVEL3 = 6;
const int VALUE_STONEPLATEMAGIC = 100;
const int VALUE_STONEPLATECOMMON = 5;
var int stoneplateitem;
var int stoneplatelevel;
const int STRSTONEPLATE = 2;
const int DEXSTONEPLATE = 3;
const int HITPOINTSTONEPLATE = 4;
const int MANASTONEPLATE = 5;
const int ONEHSTONEPLATE = 6;
const int TWOHSTONEPLATE = 7;
const int BOWSTONEPLATE = 8;
const int CRSBOWSTONEPLATE = 9;

const string STPL_MAGICAURATEXT = "Kamienna tablica otoczona jest magiczn¹ aur¹.";
const string STPL_STANDARDTEXT = "";

func int c_schasstplskill()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		return FALSE;
	};
	if(STONEPLATELEVEL == 1)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
		{
			return TRUE;
		};
	}
	else if(STONEPLATELEVEL == 2)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
		{
			return TRUE;
		};
	}
	else if(STONEPLATELEVEL == 3)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
		{
			return TRUE;
		};
	};
};

func void use_stoneplate()
{
	var string concattext;
	if(c_schasstplskill() == FALSE)
	{
		b_say(self,self,"$CANTREADTHIS");
	}
	else
	{
		if(STONEPLATEITEM == STRSTONEPLATE)
		{
			concattext = PRINT_LEARNSTR;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_STRENGTH,STR_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(STR_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_STRENGTH,STR_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(STR_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_STRENGTH,STR_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(STR_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == DEXSTONEPLATE)
		{
			concattext = PRINT_LEARNDEX;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_DEXTERITY,DEX_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(DEX_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_DEXTERITY,DEX_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(DEX_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_DEXTERITY,DEX_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(DEX_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == HITPOINTSTONEPLATE)
		{
			concattext = PRINT_LEARNHITPOINTS_MAX;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_STPLLEVEL1);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(HPMAX_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_STPLLEVEL2);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(HPMAX_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_STPLLEVEL3);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(HPMAX_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == MANASTONEPLATE)
		{
			concattext = PRINT_LEARNMANA_MAX;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_STPLLEVEL1);
				Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(MANAMAX_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_STPLLEVEL2);
				Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(MANAMAX_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_STPLLEVEL3);
				Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(MANAMAX_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == ONEHSTONEPLATE)
		{
			concattext = PRINT_LEARN1H;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_1H,ONEH_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(ONEH_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_1H,ONEH_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(ONEH_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_1H,ONEH_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(ONEH_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == TWOHSTONEPLATE)
		{
			concattext = PRINT_LEARN2H;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_2H,TWOH_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(TWOH_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_2H,TWOH_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(TWOH_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_2H,TWOH_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(TWOH_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == BOWSTONEPLATE)
		{
			concattext = PRINT_LEARNBOW;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_BOW,BOW_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(BOW_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_BOW,BOW_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(BOW_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_BOW,BOW_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(BOW_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == CRSBOWSTONEPLATE)
		{
			concattext = PRINT_LEARNCROSSBOW;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_CROSSBOW,CRSBOW_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(CRSBOW_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_CROSSBOW,CRSBOW_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(CRSBOW_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_CROSSBOW,CRSBOW_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(CRSBOW_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		};
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
	STONEPLATEITEM = 0;
	STONEPLATELEVEL = 0;
};


prototype PROTOTYPE_STONEPLATE(C_ITEM)
{
	name = "Kamienna tablica";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_STONEPLATEMAGIC;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
	material = MAT_STONE;
	scemename = "MAPSEALED";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	text[2] = STPL_MAGICAURATEXT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_STRSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Si³y I";
	on_state[0] = use_strstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void use_strstoneplate1()
{
	STONEPLATEITEM = STRSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_strstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_STRSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Si³y II";
	on_state[0] = use_strstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void use_strstoneplate2()
{
	STONEPLATEITEM = STRSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_strstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_STRSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Si³y III";
	on_state[0] = use_strstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void use_strstoneplate3()
{
	STONEPLATEITEM = STRSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_strstoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_DEXSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Zrêcznoœci I";
	on_state[0] = use_dexstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void use_dexstoneplate1()
{
	STONEPLATEITEM = DEXSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_dexstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_DEXSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Zrêcznoœci II";
	on_state[0] = use_dexstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void use_dexstoneplate2()
{
	STONEPLATEITEM = DEXSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_dexstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_DEXSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Zrêcznoœci III";
	on_state[0] = use_dexstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void use_dexstoneplate3()
{
	STONEPLATEITEM = DEXSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_dexstoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_HITPOINTSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica ¯ycia I";
	on_state[0] = use_hitpointstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_hitpointstoneplate1()
{
	STONEPLATEITEM = HITPOINTSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_hitpointstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_HITPOINTSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica ¯ycia II";
	on_state[0] = use_hitpointstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_hitpointstoneplate2()
{
	STONEPLATEITEM = HITPOINTSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_hitpointstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_HITPOINTSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica ¯ycia III";
	on_state[0] = use_hitpointstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_hitpointstoneplate3()
{
	STONEPLATEITEM = HITPOINTSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_hitpointstoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_MANASTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Magii I";
	on_state[0] = use_manastoneplate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_manastoneplate1()
{
	STONEPLATEITEM = MANASTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_manastoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_MANASTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Magii II";
	on_state[0] = use_manastoneplate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_manastoneplate2()
{
	STONEPLATEITEM = MANASTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_manastoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_MANASTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica Magii III";
	on_state[0] = use_manastoneplate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_manastoneplate3()
{
	STONEPLATEITEM = MANASTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_manastoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_ONEHSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica walki broni¹ jednorêczn¹ I";
	on_state[0] = use_onehstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void use_onehstoneplate1()
{
	STONEPLATEITEM = ONEHSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_onehstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_ONEHSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica walki broni¹ jednorêczn¹ II";
	on_state[0] = use_onehstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void use_onehstoneplate2()
{
	STONEPLATEITEM = ONEHSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_onehstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_ONEHSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica walki broni¹ jednorêczn¹ III";
	on_state[0] = use_onehstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void use_onehstoneplate3()
{
	STONEPLATEITEM = ONEHSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_onehstoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_TWOHSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica walki broni¹ dwurêczn¹ I";
	on_state[0] = use_twohstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void use_twohstoneplate1()
{
	STONEPLATEITEM = TWOHSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_twohstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_TWOHSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica walki broni¹ dwurêczn¹ II";
	on_state[0] = use_twohstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void use_twohstoneplate2()
{
	STONEPLATEITEM = TWOHSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_twohstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_TWOHSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica walki broni¹ dwurêczn¹ III";
	on_state[0] = use_twohstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void use_twohstoneplate3()
{
	STONEPLATEITEM = TWOHSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_twohstoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_BOWSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica ³uczników I";
	on_state[0] = use_bowstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_bowstoneplate1()
{
	STONEPLATEITEM = BOWSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_bowstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_BOWSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica ³uczników II";
	on_state[0] = use_bowstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_bowstoneplate2()
{
	STONEPLATEITEM = BOWSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_bowstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_BOWSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica ³uczników III";
	on_state[0] = use_bowstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void use_bowstoneplate3()
{
	STONEPLATEITEM = BOWSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_bowstoneplate3_addon);
	};
	use_stoneplate();
};


instance ITWR_CRSBOWSTONEPLATE1_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica kuszników I";
	on_state[0] = use_crsbowstoneplate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void use_crsbowstoneplate1()
{
	STONEPLATEITEM = CRSBOWSTONEPLATE;
	STONEPLATELEVEL = 1;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_crsbowstoneplate1_addon);
	};
	use_stoneplate();
};


instance ITWR_CRSBOWSTONEPLATE2_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica kuszników II";
	on_state[0] = use_crsbowstoneplate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void use_crsbowstoneplate2()
{
	STONEPLATEITEM = CRSBOWSTONEPLATE;
	STONEPLATELEVEL = 2;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_crsbowstoneplate2_addon);
	};
	use_stoneplate();
};


instance ITWR_CRSBOWSTONEPLATE3_ADDON(PROTOTYPE_STONEPLATE)
{
	description = "Kamienna tablica kuszników III";
	on_state[0] = use_crsbowstoneplate3;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void use_crsbowstoneplate3()
{
	STONEPLATEITEM = CRSBOWSTONEPLATE;
	STONEPLATELEVEL = 3;
	if(c_schasstplskill() == FALSE)
	{
		CreateInvItem(hero,itwr_crsbowstoneplate3_addon);
	};
	use_stoneplate();
};

func int c_schasmagicstoneplate()
{
	if(Npc_HasItems(hero,itwr_strstoneplate1_addon) || Npc_HasItems(hero,itwr_strstoneplate2_addon) || Npc_HasItems(hero,itwr_strstoneplate3_addon) || Npc_HasItems(hero,itwr_dexstoneplate1_addon) || Npc_HasItems(hero,itwr_dexstoneplate2_addon) || Npc_HasItems(hero,itwr_dexstoneplate3_addon) || Npc_HasItems(hero,itwr_hitpointstoneplate1_addon) || Npc_HasItems(hero,itwr_hitpointstoneplate2_addon) || Npc_HasItems(hero,itwr_hitpointstoneplate3_addon) || Npc_HasItems(hero,itwr_manastoneplate1_addon) || Npc_HasItems(hero,itwr_manastoneplate2_addon) || Npc_HasItems(hero,itwr_manastoneplate3_addon) || Npc_HasItems(hero,itwr_onehstoneplate1_addon) || Npc_HasItems(hero,itwr_onehstoneplate2_addon) || Npc_HasItems(hero,itwr_onehstoneplate3_addon) || Npc_HasItems(hero,itwr_twohstoneplate1_addon) || Npc_HasItems(hero,itwr_twohstoneplate2_addon) || Npc_HasItems(hero,itwr_twohstoneplate3_addon) || Npc_HasItems(hero,itwr_bowstoneplate1_addon) || Npc_HasItems(hero,itwr_bowstoneplate2_addon) || Npc_HasItems(hero,itwr_bowstoneplate3_addon) || Npc_HasItems(hero,itwr_crsbowstoneplate1_addon) || Npc_HasItems(hero,itwr_crsbowstoneplate2_addon) || Npc_HasItems(hero,itwr_crsbowstoneplate3_addon))
	{
		return TRUE;
	};
};


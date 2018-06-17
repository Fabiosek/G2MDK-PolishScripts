
instance MOBSIBRIEF(C_ITEM)
{
	name = "MobsiBrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemobsibrief;
	scemename = "MAP";
	description = "MobsiBrief";
};


func void usemobsibrief()
{
	var int ndocid;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"StandardBrief");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Teraz znowu wszystko bêdzie w porz¹dku.");
	Doc_PrintLines(ndocid,0,"PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;");
	Doc_PrintLines(ndocid,0,"self.aivar[AIV_INVINCIBLE] = FALSE;");
	Doc_Show(ndocid);
};


instance ITSE_ADDON_SACK(C_ITEM)
{
	name = "W sakwie jest pe³no nowych broni!";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_sack;
	description = name;
	text[2] = "Wiele ró¿nych broni";
};


func void use_sack()
{
	Print("Znalaz³em stos nowej broni!");
	CreateInvItems(self,itmw_addon_knife01,1);
	CreateInvItems(self,itmw_addon_stab01,1);
	CreateInvItems(self,itmw_addon_stab02,1);
	CreateInvItems(self,itmw_addon_stab03,1);
	CreateInvItems(self,itmw_addon_stab04,1);
	CreateInvItems(self,itmw_addon_stab05,1);
	CreateInvItems(self,itmw_addon_hacker_1h_01,1);
	CreateInvItems(self,itmw_addon_hacker_2h_01,1);
	CreateInvItems(self,itmw_addon_hacker_2h_02,1);
	CreateInvItems(self,itmw_addon_hacker_1h_02,1);
	CreateInvItems(self,itmw_addon_keule_1h_01,1);
	CreateInvItems(self,itmw_addon_keule_2h_01,1);
};


instance ITFO_TESTTRIGGER(C_ITEM)
{
	name = "Trigger die Adw";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemename = "FOODHUGE";
	on_state[0] = use_testtrigger;
	description = name;
};


func void use_testtrigger()
{
	enter_addonworld_firsttime_trigger_func();
};


instance CH(NPC_DEFAULT)
{
	name[0] = "Characterhelper";
	guild = GIL_NONE;
	id = 0;
	voice = 15;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PLAYER,BODYTEX_PLAYER,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_0;
};


func void rtn_start_0()
{
	ta_stand_armscrossed(8,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,8,0,"XXX");
};

func void b_setheroexp()
{
	var string attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = hero.level * LP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = 40 + (10 * hero.level);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	attributes = "Nowy poziom! Punkty nauki:";
	attributes = ConcatStrings(attributes,IntToString(hero.lp));
	attributes = ConcatStrings(attributes," Punkty trafieñ:");
	attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(attributes,-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void b_setheroweapon()
{
	if(hero.level <= 6)
	{
		CreateInvItems(hero,itrw_crossbow_l_01,1);
	}
	else if(hero.level <= 12)
	{
		CreateInvItems(hero,itrw_bow_l_04,1);
		CreateInvItems(hero,itrw_crossbow_l_02,1);
	}
	else if(hero.level <= 18)
	{
		CreateInvItems(hero,itrw_bow_m_02,1);
		CreateInvItems(hero,itrw_crossbow_m_02,1);
	}
	else if(hero.level <= 24)
	{
		CreateInvItems(hero,itrw_bow_m_04,1);
		CreateInvItems(hero,itrw_crossbow_h_01,1);
	}
	else if(hero.level <= 30)
	{
		CreateInvItems(hero,itrw_bow_h_02,1);
		CreateInvItems(hero,itrw_crossbow_h_02,1);
	}
	else if(hero.level <= 36)
	{
		CreateInvItems(hero,itrw_bow_h_04,1);
		CreateInvItems(hero,itrw_bow_l_04,1);
	};
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
};

func void b_setheroequipment()
{
	CreateInvItems(hero,itrw_arrow,100);
	CreateInvItems(hero,itrw_bolt,100);
	CreateInvItems(hero,itlstorch,30);
	CreateInvItems(hero,itmi_gold,500);
	CreateInvItems(hero,itpo_health_03,5);
	CreateInvItems(hero,itpo_mana_03,5);
	CreateInvItems(hero,itke_lockpick,30);
};

func void b_setkdfrunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		CreateInvItems(hero,itru_light,1);
		CreateInvItems(hero,itru_firebolt,1);
		CreateInvItems(hero,itru_lightheal,1);
		CreateInvItems(hero,itru_sumgobskel,1);
		CreateInvItems(hero,itru_zap,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		CreateInvItems(hero,itru_instantfireball,1);
		CreateInvItems(hero,itru_icebolt,1);
		CreateInvItems(hero,itru_sumwolf,1);
		CreateInvItems(hero,itru_windfist,1);
		CreateInvItems(hero,itru_sleep,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		CreateInvItems(hero,itru_mediumheal,1);
		CreateInvItems(hero,itru_firestorm,1);
		CreateInvItems(hero,itru_thunderball,1);
		CreateInvItems(hero,itru_sumskel,1);
		CreateInvItems(hero,itru_fear,1);
		CreateInvItems(hero,itru_icecube,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		CreateInvItems(hero,itru_sumgol,1);
		CreateInvItems(hero,itru_harmundead,1);
		CreateInvItems(hero,itru_lightningflash,1);
		CreateInvItems(hero,itru_chargefireball,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		CreateInvItems(hero,itru_pyrokinesis,1);
		CreateInvItems(hero,itru_icewave,1);
		CreateInvItems(hero,itru_sumdemon,1);
		CreateInvItems(hero,itru_fullheal,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		CreateInvItems(hero,itru_firerain,1);
		CreateInvItems(hero,itru_breathofdeath,1);
		CreateInvItems(hero,itru_massdeath,1);
		CreateInvItems(hero,itru_armyofdarkness,1);
		CreateInvItems(hero,itru_shrink,1);
	};
};

func void b_setpaladinequipment()
{
	CreateInvItems(hero,itru_pallight,1);
	CreateInvItems(hero,itru_pallightheal,1);
	CreateInvItems(hero,itru_palholybolt,1);
	CreateInvItems(hero,itru_palmediumheal,1);
	CreateInvItems(hero,itru_palrepelevil,1);
	CreateInvItems(hero,itru_palfullheal,1);
	CreateInvItems(hero,itru_paldestroyevil,1);
	CreateInvItems(hero,itru_palteleportsecret,1);
};


instance CH_KRIEGEN(C_INFO)
{
	npc = ch;
	nr = 999;
	condition = ch_kriegen_condition;
	information = ch_kriegen_info;
	permanent = TRUE;
	description = "Daj 1 kawa³ek rudy";
};


func int ch_kriegen_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void ch_kriegen_info()
{
	b_giveinvitems(other,self,itmi_nugget,1);
};


instance CH_GEBEN(C_INFO)
{
	npc = ch;
	nr = 999;
	condition = ch_geben_condition;
	information = ch_geben_info;
	permanent = TRUE;
	description = "Daj jedzenie";
};


func int ch_geben_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void ch_geben_info()
{
	AI_PrintScreen("Odda³eœ miód",-1,34,FONT_SCREENSMALL,2);
	AI_PrintScreen("Odda³eœ chleb",-1,37,FONT_SCREENSMALL,2);
	AI_PrintScreen("Odda³eœ wino",-1,40,FONT_SCREENSMALL,2);
	AI_PrintScreen("Odda³eœ kie³basê",-1,43,FONT_SCREENSMALL,2);
};


instance CH_EXIT(C_INFO)
{
	npc = ch;
	nr = 999;
	condition = ch_exit_condition;
	information = ch_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int ch_exit_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void ch_exit_info()
{
	AI_StopProcessInfos(self);
};


instance CH_RESET(C_INFO)
{
	npc = ch;
	nr = 20;
	condition = ch_reset_condition;
	information = ch_reset_info;
	permanent = TRUE;
	description = "Ca³kowity reset postaci";
};


func int ch_reset_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_reset_info()
{
	hero.guild = GIL_NONE;
	Npc_SetTrueGuild(hero,GIL_NONE);
	hero.lp = 0;
	hero.level = 0;
	hero.exp = 0;
	hero.exp_next = 500;
	hero.attribute[ATR_STRENGTH] = 10;
	hero.attribute[ATR_DEXTERITY] = 10;
	hero.attribute[ATR_MANA_MAX] = 5;
	hero.attribute[ATR_MANA] = 5;
	hero.attribute[ATR_HITPOINTS] = 40;
	hero.attribute[ATR_HITPOINTS_MAX] = 40;
	Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_BOW,0);
	other.hitchance[NPC_TALENT_BOW] = 0;
	Npc_SetTalentSkill(hero,NPC_TALENT_CROSSBOW,0);
	other.hitchance[NPC_TALENT_CROSSBOW] = 0;
	Npc_SetTalentSkill(hero,NPC_TALENT_1H,0);
	other.hitchance[NPC_TALENT_1H] = 0;
	Npc_SetTalentSkill(hero,NPC_TALENT_2H,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	other.hitchance[NPC_TALENT_2H] = 0;
	AI_UnequipArmor(hero);
	PrintScreen("PC_Hero - postaæ wyzerowana",-1,-1,FONT_SCREEN,2);
};


instance CH_LANGUAGE(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = ch_language_condition;
	information = ch_language_info;
	important = 0;
	permanent = 1;
	description = "Nauka jêzyków";
};


func int ch_language_condition()
{
	if(MISCSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_language_info()
{
	Info_ClearChoices(ch_language);
	Info_AddChoice(ch_language,DIALOG_BACK,ch_language_back);
	Info_AddChoice(ch_language,"Jêzyk kap³anów (3)",ch_language_priest);
	Info_AddChoice(ch_language,"Jêzyk wojowników (2)",ch_language_warrior);
	Info_AddChoice(ch_language,"Jêzyk farmerów (1)",ch_language_peasant);
};

func void ch_language_back()
{
	Info_ClearChoices(ch_language);
};

func void ch_language_peasant()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
	Info_ClearChoices(ch_language);
};

func void ch_language_warrior()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
	Info_ClearChoices(ch_language);
};

func void ch_language_priest()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
	Info_ClearChoices(ch_language);
};


instance CH_GUILD(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = ch_guild_condition;
	information = ch_guild_info;
	important = 0;
	permanent = 1;
	description = "Wybór gildii";
};


func int ch_guild_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_guild_info()
{
	Info_ClearChoices(ch_guild);
	Info_AddChoice(ch_guild,DIALOG_BACK,ch_guild_back);
	Info_AddChoice(ch_guild,"Nowicjusz",ch_nov);
	Info_AddChoice(ch_guild,"Mag Ognia",ch_kdf);
	Info_AddChoice(ch_guild,"Najemnik",ch_sld);
	Info_AddChoice(ch_guild,"£owca smoków",ch_djg);
	Info_AddChoice(ch_guild,"Stra¿nik",ch_mil);
	Info_AddChoice(ch_guild,"Paladyn",ch_pal);
	Info_AddChoice(ch_guild,"Brak",ch_none);
	Info_AddChoice(ch_guild,"Udawany bandyta",ch_fakebandit);
};

func void ch_guild_back()
{
	Info_ClearChoices(ch_guild);
};

func void ch_fakebandit()
{
	CreateInvItems(hero,itar_bdt_m,1);
	CreateInvItems(hero,itar_bdt_h,1);
	CreateInvItems(hero,itar_thorus_addon,1);
	AI_EquipBestArmor(hero);
};

func void ch_nov()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	CreateInvItem(hero,itar_nov_l);
	AI_EquipArmor(hero,itar_nov_l);
};

func void ch_kdf()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_KDF;
	Npc_SetTrueGuild(other,GIL_KDF);
	CreateInvItem(hero,itar_kdf_l);
	AI_EquipArmor(hero,itar_kdf_l);
};

func void ch_sld()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_SLD;
	Npc_SetTrueGuild(other,GIL_SLD);
	CreateInvItem(hero,itar_sld_m);
	AI_EquipArmor(hero,itar_sld_m);
};

func void ch_djg()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_DJG;
	Npc_SetTrueGuild(other,GIL_DJG);
	CreateInvItem(hero,itar_djg_m);
	AI_EquipArmor(hero,itar_djg_m);
};

func void ch_mil()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_MIL;
	Npc_SetTrueGuild(other,GIL_MIL);
	CreateInvItem(hero,itar_mil_l);
	AI_EquipArmor(hero,itar_mil_l);
};

func void ch_pal()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	CreateInvItem(hero,itar_pal_m);
	AI_EquipArmor(hero,itar_pal_m);
	b_setpaladinequipment();
};

func void ch_none()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_NONE;
	Npc_SetTrueGuild(other,GIL_NONE);
	AI_UnequipArmor(hero);
};


var int levelstart;

instance CH_LEVEL_START(C_INFO)
{
	npc = ch;
	condition = ch_level_start_condition;
	information = ch_level_start_info;
	description = "Poziom, Punkty nauki i Gildia";
	permanent = TRUE;
};


func int ch_level_start_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void ch_level_start_info()
{
	LEVELSTART = TRUE;
};


instance CH_LEVEL_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = ch_level_stopper_condition;
	information = ch_level_stopper_info;
	description = "WRÓÆ";
	permanent = TRUE;
};


func int ch_level_stopper_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_level_stopper_info()
{
	Info_ClearChoices(ch_level_stopper);
	LEVELSTART = FALSE;
};


instance CH_LERNPUNKTE(C_INFO)
{
	npc = ch;
	nr = 5;
	condition = ch_lernpunkte_condition;
	information = ch_lernpunkte_info;
	description = "Punkty nauki";
	permanent = TRUE;
};


func int ch_lernpunkte_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_lernpunkte_info()
{
	Info_ClearChoices(ch_lernpunkte);
	Info_AddChoice(ch_lernpunkte,DIALOG_BACK,ch_lernpunkte_back);
	Info_AddChoice(ch_lernpunkte,"Punkty nauki + 50",ch_lernpunkte_50);
	Info_AddChoice(ch_lernpunkte,"Punkty nauki + 25",ch_lernpunkte_25);
	Info_AddChoice(ch_lernpunkte,"Punkty nauki + 10",ch_lernpunkte_10);
	Info_AddChoice(ch_lernpunkte,"Punkty nauki + 5",ch_lernpunkte_5);
};

func void ch_lernpunkte_back()
{
	Info_ClearChoices(ch_lernpunkte);
};

func void ch_lernpunkte_50()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 50;
	PrintScreen("+ 50 punktów nauki",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void ch_lernpunkte_25()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 25;
	PrintScreen("+ 25 punktów nauki",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void ch_lernpunkte_10()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 10;
	PrintScreen("+ 10 punktów nauki",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void ch_lernpunkte_5()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 5;
	PrintScreen("+ 5 punktów nauki",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};


instance CH_LEVEL_NIEDRIG(C_INFO)
{
	npc = ch;
	nr = 2;
	condition = ch_level_niedrig_condition;
	information = ch_level_niedrig_info;
	description = "Wybór poziomu 1 - 25";
	permanent = TRUE;
};


func int ch_level_niedrig_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_level_niedrig_info()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Poziom 21 - 25",ch_level21);
	Info_AddChoice(ch_level_niedrig,"Poziom 16 - 20",ch_level16);
	Info_AddChoice(ch_level_niedrig,"Poziom 11 - 15",ch_level11);
	Info_AddChoice(ch_level_niedrig,"Poziom  6 - 10",ch_level6);
	Info_AddChoice(ch_level_niedrig,"Poziom  1 -  5",ch_level1);
};


instance CH_LEVEL_HOCH(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = ch_level_hoch_condition;
	information = ch_level_hoch_info;
	description = "Wybór poziomu 26 - 50";
	permanent = TRUE;
};


func int ch_level_hoch_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_level_hoch_info()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Poziom 46 - 50",ch_level46);
	Info_AddChoice(ch_level_hoch,"Poziom 41 - 45",ch_level41);
	Info_AddChoice(ch_level_hoch,"Poziom 36 - 40",ch_level36);
	Info_AddChoice(ch_level_hoch,"Poziom 31 - 35",ch_level31);
	Info_AddChoice(ch_level_hoch,"Poziom 26 - 30",ch_level26);
};

func void ch_level46()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Poziom 50",ch_level_50);
	Info_AddChoice(ch_level_hoch,"Poziom 49",ch_level_49);
	Info_AddChoice(ch_level_hoch,"Poziom 48",ch_level_48);
	Info_AddChoice(ch_level_hoch,"Poziom 47",ch_level_47);
	Info_AddChoice(ch_level_hoch,"Poziom 46",ch_level_46);
};

func void ch_level41()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Poziom 45",ch_level_45);
	Info_AddChoice(ch_level_hoch,"Poziom 44",ch_level_44);
	Info_AddChoice(ch_level_hoch,"Poziom 43",ch_level_43);
	Info_AddChoice(ch_level_hoch,"Poziom 42",ch_level_42);
	Info_AddChoice(ch_level_hoch,"Poziom 41",ch_level_41);
};

func void ch_level36()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Poziom 40",ch_level_40);
	Info_AddChoice(ch_level_hoch,"Poziom 39",ch_level_39);
	Info_AddChoice(ch_level_hoch,"Poziom 38",ch_level_38);
	Info_AddChoice(ch_level_hoch,"Poziom 37",ch_level_37);
	Info_AddChoice(ch_level_hoch,"Poziom 36",ch_level_36);
};

func void ch_level31()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Poziom 35",ch_level_35);
	Info_AddChoice(ch_level_hoch,"Poziom 34",ch_level_34);
	Info_AddChoice(ch_level_hoch,"Poziom 33",ch_level_33);
	Info_AddChoice(ch_level_hoch,"Poziom 32",ch_level_32);
	Info_AddChoice(ch_level_hoch,"Poziom 31",ch_level_31);
};

func void ch_level26()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Poziom 30",ch_level_30);
	Info_AddChoice(ch_level_hoch,"Poziom 29",ch_level_29);
	Info_AddChoice(ch_level_hoch,"Poziom 28",ch_level_28);
	Info_AddChoice(ch_level_hoch,"Poziom 27",ch_level_27);
	Info_AddChoice(ch_level_hoch,"Poziom 26",ch_level_26);
};

func void ch_level21()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Poziom 25",ch_level_25);
	Info_AddChoice(ch_level_niedrig,"Poziom 24",ch_level_24);
	Info_AddChoice(ch_level_niedrig,"Poziom 23",ch_level_23);
	Info_AddChoice(ch_level_niedrig,"Poziom 22",ch_level_22);
	Info_AddChoice(ch_level_niedrig,"Poziom 21",ch_level_21);
};

func void ch_level16()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Poziom 20",ch_level_20);
	Info_AddChoice(ch_level_niedrig,"Poziom 19",ch_level_19);
	Info_AddChoice(ch_level_niedrig,"Poziom 18",ch_level_18);
	Info_AddChoice(ch_level_niedrig,"Poziom 17",ch_level_17);
	Info_AddChoice(ch_level_niedrig,"Poziom 16",ch_level_16);
};

func void ch_level11()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Poziom 15",ch_level_15);
	Info_AddChoice(ch_level_niedrig,"Poziom 14",ch_level_14);
	Info_AddChoice(ch_level_niedrig,"Poziom 13",ch_level_13);
	Info_AddChoice(ch_level_niedrig,"Poziom 12",ch_level_12);
	Info_AddChoice(ch_level_niedrig,"Poziom 11",ch_level_11);
};

func void ch_level6()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Poziom 10",ch_level_10);
	Info_AddChoice(ch_level_niedrig,"Poziom  9",ch_level_9);
	Info_AddChoice(ch_level_niedrig,"Poziom  8",ch_level_8);
	Info_AddChoice(ch_level_niedrig,"Poziom  7",ch_level_7);
	Info_AddChoice(ch_level_niedrig,"Poziom  6",ch_level_6);
};

func void ch_level1()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Poziom 5",ch_level_5);
	Info_AddChoice(ch_level_niedrig,"Poziom 4",ch_level_4);
	Info_AddChoice(ch_level_niedrig,"Poziom 3",ch_level_3);
	Info_AddChoice(ch_level_niedrig,"Poziom 2",ch_level_2);
	Info_AddChoice(ch_level_niedrig,"Poziom 1",ch_level_1);
};

func void ch_level_niedrig_back()
{
	Info_ClearChoices(ch_level_niedrig);
};

func void ch_level_hoch_back()
{
	Info_ClearChoices(ch_level_hoch);
};

func void ch_level_1()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 1;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_2()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 2;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_3()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 3;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_4()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 4;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_5()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 5;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_6()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 6;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_7()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 7;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_8()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 8;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_9()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 9;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_10()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 10;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_11()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 11;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_12()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 12;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_13()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 13;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_14()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 14;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_15()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 15;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_16()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 16;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_17()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 17;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_18()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 18;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_19()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 19;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_20()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 20;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_21()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 21;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_22()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 22;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_23()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 23;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_24()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 24;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_25()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 25;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_26()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 26;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_27()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 27;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_28()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 28;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_29()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 29;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_30()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 30;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_31()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 31;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_32()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 32;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_33()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 33;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_34()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 34;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_35()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 35;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_36()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 36;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_37()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 37;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_38()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 38;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_39()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 39;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_40()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 40;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_41()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 41;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_42()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 42;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_43()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 43;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_44()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 44;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_45()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 45;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_46()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 46;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_47()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 47;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_48()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 48;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_49()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 49;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_50()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 50;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};


var int attributestart;

instance DIA_CH_ATTRIBUTE_START(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_attribute_start_condition;
	information = dia_ch_attribute_start_info;
	permanent = TRUE;
	description = "Si³a i zrêcznoœæ";
};


func int dia_ch_attribute_start_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_attribute_start_info()
{
	ATTRIBUTESTART = TRUE;
};


instance DIA_CH_ATTRIBUTE_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_attribute_stopper_condition;
	information = dia_ch_attribute_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_attribute_stopper_condition()
{
	if(ATTRIBUTESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_attribute_stopper_info()
{
	ATTRIBUTESTART = FALSE;
};


instance DIA_CH_STRENGTH(C_INFO)
{
	npc = ch;
	nr = 2;
	condition = dia_ch_strength_condition;
	information = dia_ch_strength_info;
	permanent = TRUE;
	description = "Zwiêkszanie si³y";
};


func int dia_ch_strength_condition()
{
	if(ATTRIBUTESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_strength_info()
{
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 20",b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 10",b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 5",b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 1",b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_1);
};

func void dia_ch_strength_back()
{
	Info_ClearChoices(dia_ch_strength);
};

func void dia_ch_strength_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 20",b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 10",b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 5",b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 1",b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_1);
};

func void dia_ch_strength_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 20",b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 10",b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 5",b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 1",b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_1);
};

func void dia_ch_strength_10()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,10,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 20",b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 10",b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 5",b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 1",b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_1);
};

func void dia_ch_strength_20()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,20,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 20",b_getlearncostattribute(other,ATR_STRENGTH) * 20),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 10",b_getlearncostattribute(other,ATR_STRENGTH) * 10),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 5",b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Si³a + 1",b_getlearncostattribute(other,ATR_STRENGTH)),dia_ch_strength_1);
};


instance DIA_CH_DEX(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_dex_condition;
	information = dia_ch_dex_info;
	permanent = TRUE;
	description = "Zwiêkszanie zrêcznoœci";
};


func int dia_ch_dex_condition()
{
	if(ATTRIBUTESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dex_info()
{
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 20",b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 10",b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 5",b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 1",b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
};

func void dia_ch_dex_back()
{
	Info_ClearChoices(dia_ch_dex);
};

func void dia_ch_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 20",b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 10",b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 5",b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 1",b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
};

func void dia_ch_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 20",b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 10",b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 5",b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 1",b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
};

func void dia_ch_dex_10()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,10,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 20",b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 10",b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 5",b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 1",b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
};

func void dia_ch_dex_20()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,20,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 20",b_getlearncostattribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 10",b_getlearncostattribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 5",b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Zrêcznoœæ + 1",b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
};


var int magiestart;

instance DIA_CH_MAGIE(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_magie_condition;
	information = dia_ch_magie_info;
	permanent = TRUE;
	description = "MAGIA: mana, runy, krêgi";
};


func int dia_ch_magie_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_magie_info()
{
	MAGIESTART = TRUE;
};


instance DIA_CH_MAGIE_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_magie_stopper_condition;
	information = dia_ch_magie_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_magie_stopper_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_magie_stopper_info()
{
	MAGIESTART = FALSE;
};


instance DIA_CH_MANA(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_mana_condition;
	information = dia_ch_mana_info;
	permanent = TRUE;
	description = "Zwiêkszanie many";
};


func int dia_ch_mana_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_mana_info()
{
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 20",b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 10",b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 5",b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 1",b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
};

func void dia_ch_mana_back()
{
	Info_ClearChoices(dia_ch_mana);
};

func void dia_ch_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 20",b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 10",b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 5",b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 1",b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
};

func void dia_ch_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 20",b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 10",b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 5",b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 1",b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
};

func void dia_ch_mana_10()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,10,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 20",b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 10",b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 5",b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 1",b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
};

func void dia_ch_mana_20()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,20,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 20",b_getlearncostattribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 10",b_getlearncostattribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 5",b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana + 1",b_getlearncostattribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
};


instance DIA_CH_KREISE(C_INFO)
{
	npc = ch;
	nr = 4;
	condition = dia_ch_kreise_condition;
	information = dia_ch_kreise_info;
	permanent = TRUE;
	description = "Magiczne krêgi";
};


func int dia_ch_kreise_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kreise_info()
{
	Info_ClearChoices(dia_ch_kreise);
	Info_AddChoice(dia_ch_kreise,DIALOG_BACK,ch_kreise_back);
	Info_AddChoice(dia_ch_kreise,"Szósty kr¹g",ch_kreise_6);
	Info_AddChoice(dia_ch_kreise,"Pi¹ty kr¹g",ch_kreise_5);
	Info_AddChoice(dia_ch_kreise,"Czwarty kr¹g",ch_kreise_4);
	Info_AddChoice(dia_ch_kreise,"Trzeci kr¹g",ch_kreise_3);
	Info_AddChoice(dia_ch_kreise,"Drugi kr¹g",ch_kreise_2);
	Info_AddChoice(dia_ch_kreise,"Pierwszy kr¹g",ch_kreise_1);
};

func void ch_kreise_back()
{
	Info_ClearChoices(dia_ch_kreise);
};

func void ch_kreise_1()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,1);
	b_setkdfrunes();
};

func void ch_kreise_2()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,2);
	b_setkdfrunes();
};

func void ch_kreise_3()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,3);
	b_setkdfrunes();
};

func void ch_kreise_4()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,4);
	b_setkdfrunes();
};

func void ch_kreise_5()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,5);
	b_setkdfrunes();
};

func void ch_kreise_6()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,6);
	b_setkdfrunes();
};


instance DIA_CH_RUNEN(C_INFO)
{
	npc = ch;
	nr = 5;
	condition = dia_ch_runen_condition;
	information = dia_ch_runen_info;
	permanent = TRUE;
	description = "Runy";
};


func int dia_ch_runen_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_runen_info()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring("Szósty kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,6)),dia_ch_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring("Pi¹ty kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,5)),dia_ch_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring("Czwarty kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,4)),dia_ch_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring("Trzeci kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,3)),dia_ch_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring("Drugi kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,2)),dia_ch_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring("Pierwszy kr¹g magii",b_getlearncosttalent(other,NPC_TALENT_MAGE,1)),dia_ch_runen_1);
	};
};

func void dia_ch_runen_back()
{
	Info_ClearChoices(dia_ch_runen);
};

func void dia_ch_runen_1()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),ch_training_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),ch_training_runen_circle_1_spl_lightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),ch_training_runen_circle_1_spl_zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FIREBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIREBOLT)),ch_training_runen_circle_1_spl_firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),ch_training_runen_circle_1_spl_light);
	};
};

func void ch_training_runen_circle_1_spl_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void ch_training_runen_circle_1_spl_firebolt()
{
	b_teachplayertalentrunes(self,other,SPL_FIREBOLT);
};

func void ch_training_runen_circle_1_spl_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void ch_training_runen_circle_1_spl_lightheal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void ch_training_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_ch_runen_2()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),ch_training_runen_circle_2_spl_instantfireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),ch_training_runen_circle_2_spl_icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),ch_training_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),ch_training_runen_circle_2_spl_windfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),ch_training_runen_circle_2_spl_sleep);
	};
};

func void ch_training_runen_circle_2_spl_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void ch_training_runen_circle_2_spl_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void ch_training_runen_circle_2_spl_summonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void ch_training_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void ch_training_runen_circle_2_spl_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_ch_runen_3()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),ch_training_runen_circle_3_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),ch_training_runen_circle_4_spl_thunderball);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),ch_training_runen_circle_5_spl_firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),ch_training_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),ch_training_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),ch_training_runen_circle_3_spl_icecube);
	};
};

func void ch_training_runen_circle_3_spl_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void ch_training_runen_circle_3_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void ch_training_runen_circle_3_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void ch_training_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void ch_training_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void ch_training_runen_circle_3_spl_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_ch_runen_4()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),ch_training_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),ch_training_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),ch_training_runen_circle_3_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),ch_training_runen_circle_3_spl_chargefireball);
	};
};

func void ch_training_runen_circle_4_spl_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void ch_training_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void ch_training_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void ch_training_runen_circle_4_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_ch_runen_5()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),ch_training_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),ch_training_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),ch_training_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),ch_training_runen_circle_4_spl_pyrokinesis);
	};
};

func void ch_training_runen_circle_5_spl_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void ch_training_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void ch_training_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void ch_training_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_ch_runen_6()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),ch_training_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),ch_training_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),ch_training_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),ch_training_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),ch_training_runen_circle_6_spl_shrink);
	};
};

func void ch_training_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void ch_training_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void ch_training_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void ch_training_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void ch_training_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


var int kampfstart;

instance DIA_CH_KAMPF_START(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_kampf_start_condition;
	information = dia_ch_kampf_start_info;
	permanent = TRUE;
	description = "Umiejêtnoœci bojowe";
};


func int dia_ch_kampf_start_condition()
{
	if((KAMPFSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (LEVELSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_kampf_start_info()
{
	KAMPFSTART = TRUE;
};


instance DIA_CH_KAMPF_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_kampf_stopper_condition;
	information = dia_ch_kampf_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_kampf_stopper_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_stopper_info()
{
	KAMPFSTART = FALSE;
};


instance DIA_CH_KAMPF_EINHAND(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_kampf_einhand_condition;
	information = dia_ch_kampf_einhand_info;
	permanent = TRUE;
	description = "Bronie jednorêczne";
};


func int dia_ch_kampf_einhand_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_einhand_info()
{
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 20",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 20),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 10",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 10),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 5",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void dia_ch_kampf_einhand_back()
{
	Info_ClearChoices(dia_ch_kampf_einhand);
};

func void ch_training_combat_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 20",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 20),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 10",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 10),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 5",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void ch_training_combat_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 20",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 20),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 10",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 10),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 5",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void ch_training_combat_1h_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,10,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 20",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 20),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 10",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 10),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 5",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void ch_training_combat_1h_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,20,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 20",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 20),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 10",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 10),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 5",b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("Bronie jednorêczne + 1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};


instance DIA_CH_KAMPF_ZWEIHAND(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = dia_ch_kampf_zweihand_condition;
	information = dia_ch_kampf_zweihand_info;
	permanent = TRUE;
	description = "Bronie dwurêczne";
};


func int dia_ch_kampf_zweihand_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_zweihand_info()
{
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 20",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 20),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 10",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 10),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 5",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void dia_ch_kampf_zweihand_back()
{
	Info_ClearChoices(dia_ch_kampf_zweihand);
};

func void ch_training_combat_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 20",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 20),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 10",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 10),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 5",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void ch_training_combat_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 20",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 20),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 10",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 10),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 5",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void ch_training_combat_2h_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,10,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 20",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 20),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 10",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 10),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 5",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void ch_training_combat_2h_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,20,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 20",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 20),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 10",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 10),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 5",b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Bronie dwurêczne + 1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};


instance DIA_CH_KAMPF_BOGEN(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_kampf_bogen_condition;
	information = dia_ch_kampf_bogen_info;
	permanent = TRUE;
	description = "£uki";
};


func int dia_ch_kampf_bogen_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_bogen_info()
{
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 20",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 20),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 10",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 10),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 5",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void dia_ch_kampf_bogen_back()
{
	Info_ClearChoices(dia_ch_kampf_bogen);
};

func void ch_training_combat_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 20",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 20),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 10",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 10),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 5",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void ch_training_combat_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 20",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 20),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 10",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 10),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 5",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void ch_training_combat_bow_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,10,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 20",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 20),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 10",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 10),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 5",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void ch_training_combat_bow_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,20,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 20",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 20),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 10",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 10),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 5",b_getlearncosttalent(other,NPC_TALENT_BOW,1) * 5),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("£uki + 1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};


instance DIA_CH_KAMPF_ARMBRUST(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_kampf_armbrust_condition;
	information = dia_ch_kampf_armbrust_info;
	permanent = TRUE;
	description = "Kusze";
};


func int dia_ch_kampf_armbrust_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_armbrust_info()
{
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 20),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void dia_ch_kampf_armbrust_back()
{
	Info_ClearChoices(dia_ch_kampf_armbrust);
};

func void ch_training_combat_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 20),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void ch_training_combat_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 20),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void ch_training_combat_crossbow_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,10,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 20),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void ch_training_combat_crossbow_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,20,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 5),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 10),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Kusze + 20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1) * 20),ch_training_combat_crossbow_20);
};


var int diebstart;

instance DIA_CH_DIEB_START(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_dieb_start_condition;
	information = dia_ch_dieb_start_info;
	permanent = TRUE;
	description = "Umiejêtnoœci z³odziejskie";
};


func int dia_ch_dieb_start_condition()
{
	if((KAMPFSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (LEVELSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_dieb_start_info()
{
	DIEBSTART = TRUE;
};


instance DIA_CH_DIEB_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_dieb_stopper_condition;
	information = dia_ch_dieb_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_dieb_stopper_condition()
{
	if(DIEBSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dieb_stopper_info()
{
	DIEBSTART = FALSE;
};


instance DIA_CH_DIEB_STEAL(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = dia_ch_dieb_steal_condition;
	information = dia_ch_dieb_steal_info;
	permanent = TRUE;
	description = "Kradzie¿ kiesz.";
};


func int dia_ch_dieb_steal_condition()
{
	if(DIEBSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dieb_steal_info()
{
	Info_ClearChoices(dia_ch_dieb_steal);
	Info_AddChoice(dia_ch_dieb_steal,DIALOG_BACK,dia_ch_dieb_steal_back);
	Info_AddChoice(dia_ch_dieb_steal,b_buildlearnstring("Kradzie¿ kiesz.",b_getlearncosttalent(other,NPC_TALENT_PICKPOCKET,1)),ch_training_thief_pickpocket);
};


instance DIA_CH_DIEB_SCHLEICHEN(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_dieb_schleichen_condition;
	information = dia_ch_dieb_schleichen_info;
	permanent = TRUE;
	description = "Skradanie siê";
};


func int dia_ch_dieb_schleichen_condition()
{
	if(DIEBSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dieb_schleichen_info()
{
	Info_ClearChoices(dia_ch_dieb_schleichen);
	Info_AddChoice(dia_ch_dieb_schleichen,DIALOG_BACK,dia_ch_dieb_schleichen_back);
	Info_AddChoice(dia_ch_dieb_schleichen,b_buildlearnstring("Skradanie siê",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),ch_training_thief_sneak);
};


instance DIA_CH_DIEB_PICKLOCK(C_INFO)
{
	npc = ch;
	nr = 9;
	condition = dia_ch_dieb_picklock_condition;
	information = dia_ch_dieb_picklock_info;
	permanent = TRUE;
	description = "Otwieranie zamków";
};


func int dia_ch_dieb_picklock_condition()
{
	if(DIEBSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dieb_picklock_info()
{
	Info_ClearChoices(dia_ch_dieb_picklock);
	Info_AddChoice(dia_ch_dieb_picklock,DIALOG_BACK,dia_ch_dieb_picklock_back);
	Info_AddChoice(dia_ch_dieb_picklock,b_buildlearnstring("W³amywanie siê",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1)),ch_training_thief_picklock);
};


instance DIA_CH_DIEB_ALLE(C_INFO)
{
	npc = ch;
	nr = 12;
	condition = dia_ch_dieb_alle_condition;
	information = dia_ch_dieb_alle_info;
	permanent = TRUE;
	description = "Nauka wszystkich umiejêtnoœci z³odziejskich";
};


func int dia_ch_dieb_alle_condition()
{
	if(DIEBSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dieb_alle_info()
{
	var int kosten_alle;
	kosten_alle = b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1) + b_getlearncosttalent(other,NPC_TALENT_SNEAK,1) + b_getlearncosttalent(other,NPC_TALENT_PICKPOCKET,1);
	Info_ClearChoices(dia_ch_dieb_alle);
	Info_AddChoice(dia_ch_dieb_alle,DIALOG_BACK,dia_ch_dieb_alle_back);
	Info_AddChoice(dia_ch_dieb_alle,b_buildlearnstring("Wszystkie umiejêtnoœci z³odziejskie",kosten_alle),ch_training_thief_alle);
};

func void dia_ch_dieb_alle_back()
{
	Info_ClearChoices(dia_ch_dieb_alle);
	b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK);
	b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET);
	b_teachthieftalent(self,other,NPC_TALENT_SNEAK);
};

func void ch_training_thief_alle()
{
	Info_ClearChoices(dia_ch_dieb_alle);
};

func void dia_ch_dieb_steal_back()
{
	Info_ClearChoices(dia_ch_dieb_steal);
};

func void dia_ch_dieb_schleichen_back()
{
	Info_ClearChoices(dia_ch_dieb_schleichen);
};

func void dia_ch_dieb_picklock_back()
{
	Info_ClearChoices(dia_ch_dieb_picklock);
};

func void ch_training_thief_picklock()
{
	Info_ClearChoices(dia_ch_dieb_picklock);
	b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK);
};

func void ch_training_thief_pickpocket()
{
	Info_ClearChoices(dia_ch_dieb_steal);
	b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET);
};

func void ch_training_thief_sneak()
{
	Info_ClearChoices(dia_ch_dieb_schleichen);
	b_teachthieftalent(self,other,NPC_TALENT_SNEAK);
};


var int miscstart;

instance DIA_CH_MISC_START(C_INFO)
{
	npc = ch;
	nr = 20;
	condition = dia_ch_misc_start_condition;
	information = dia_ch_misc_start_info;
	permanent = TRUE;
	description = "Inne (Mikstury, Trofea, Kowalstwo, Runy Paladyna, Jêzyki)";
};


func int dia_ch_misc_start_condition()
{
	if((KAMPFSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (LEVELSTART == FALSE) && (DIEBSTART == FALSE) && (MISCSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_misc_start_info()
{
	MISCSTART = TRUE;
};


instance DIA_CH_MISC_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_misc_stopper_condition;
	information = dia_ch_misc_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_misc_stopper_condition()
{
	if((MISCSTART == TRUE) && (ALCHEMYSTART == FALSE) && (SMITHSTART == FALSE) && (ANIMALSTART == FALSE) && (PALADINSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_misc_stopper_info()
{
	MISCSTART = FALSE;
};


var int alchemystart;

instance DIA_CH_MISC_ALCHEMIE(C_INFO)
{
	npc = ch;
	nr = 10;
	condition = dia_ch_misc_alchemie_condition;
	information = dia_ch_misc_alchemie_info;
	permanent = TRUE;
	description = "Alchemia";
};


func int dia_ch_misc_alchemie_condition()
{
	if((MISCSTART == TRUE) && (ALCHEMYSTART == FALSE) && (SMITHSTART == FALSE) && (ANIMALSTART == FALSE) && (PALADINSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_misc_alchemie_info()
{
	ALCHEMYSTART = TRUE;
};


instance DIA_CH_MISC_ALCHEMIE_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_misc_alchemie_stopper_condition;
	information = dia_ch_misc_alchemie_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_misc_alchemie_stopper_condition()
{
	if(ALCHEMYSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_alchemie_stopper_info()
{
	ALCHEMYSTART = FALSE;
};


instance DIA_CH_MISC_HEALTH(C_INFO)
{
	npc = ch;
	nr = 5;
	condition = dia_ch_misc_health_condition;
	information = dia_ch_misc_health_info;
	permanent = TRUE;
	description = "Mikstury lecznicze";
};


func int dia_ch_misc_health_condition()
{
	if(ALCHEMYSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_health_info()
{
	Info_ClearChoices(dia_ch_misc_health);
	Info_AddChoice(dia_ch_misc_health,DIALOG_BACK,dia_ch_misc_health_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_health,b_buildlearnstring("Esencja lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),ch_training_alchemy_potion_health_01);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_health,b_buildlearnstring("Ekstrakt leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),ch_training_alchemy_potion_health_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_health,b_buildlearnstring("Eliksir leczniczy",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),ch_training_alchemy_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_health,b_buildlearnstring("Permanentna mikstura lecznicza",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),ch_training_alchemy_potion_perm_health);
	};
};

func void dia_ch_misc_health_back()
{
	Info_ClearChoices(dia_ch_misc_health);
};

func void ch_training_alchemy_potion_health_01()
{
	Info_ClearChoices(dia_ch_misc_health);
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void ch_training_alchemy_potion_health_02()
{
	Info_ClearChoices(dia_ch_misc_health);
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void ch_training_alchemy_potion_health_03()
{
	Info_ClearChoices(dia_ch_misc_health);
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void ch_training_alchemy_potion_perm_health()
{
	Info_ClearChoices(dia_ch_misc_health);
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};


instance DIA_CH_MISC_MANA(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_misc_mana_condition;
	information = dia_ch_misc_mana_info;
	permanent = TRUE;
	description = "Mikstury many";
};


func int dia_ch_misc_mana_condition()
{
	if(ALCHEMYSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_mana_info()
{
	Info_ClearChoices(dia_ch_misc_mana);
	Info_AddChoice(dia_ch_misc_mana,DIALOG_BACK,dia_ch_misc_mana_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_mana,b_buildlearnstring("Permanentna mikstura many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),ch_training_alchemy_potion_perm_mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_mana,b_buildlearnstring("Eliksir many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),ch_training_alchemy_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_mana,b_buildlearnstring("Ekstrakt many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),ch_training_alchemy_potion_mana_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_mana,b_buildlearnstring("Esencja many",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),ch_training_alchemy_potion_mana_01);
	};
};

func void dia_ch_misc_mana_back()
{
	Info_ClearChoices(dia_ch_misc_mana);
};

func void ch_training_alchemy_potion_mana_01()
{
	Info_ClearChoices(dia_ch_misc_mana);
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void ch_training_alchemy_potion_mana_02()
{
	Info_ClearChoices(dia_ch_misc_mana);
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void ch_training_alchemy_potion_mana_03()
{
	Info_ClearChoices(dia_ch_misc_mana);
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void ch_training_alchemy_potion_perm_mana()
{
	Info_ClearChoices(dia_ch_misc_mana);
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};


instance DIA_CH_MISC_SPECIAL(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_misc_special_condition;
	information = dia_ch_misc_special_info;
	permanent = TRUE;
	description = "Specjalne mikstury";
};


func int dia_ch_misc_special_condition()
{
	if(ALCHEMYSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_special_info()
{
	Info_ClearChoices(dia_ch_misc_special);
	Info_AddChoice(dia_ch_misc_special,DIALOG_BACK,dia_ch_misc_special_back);
	if(PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_special,b_buildlearnstring("Na³adowanie Oka",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,CHARGE_INNOSEYE)),ch_training_alchemy_charge_innoseye);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_special,b_buildlearnstring("Mikstura szybkoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),ch_training_alchemy_potion_speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_special,b_buildlearnstring("Eliksir si³y",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),ch_training_alchemy_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_special,b_buildlearnstring("Mikstura zrêcznoœci",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),ch_training_alchemy_potion_perm_dex);
	};
};

func void dia_ch_misc_special_back()
{
	Info_ClearChoices(dia_ch_misc_special);
};

func void ch_training_alchemy_potion_speed()
{
	Info_ClearChoices(dia_ch_misc_special);
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
};

func void ch_training_alchemy_potion_perm_str()
{
	Info_ClearChoices(dia_ch_misc_special);
	b_teachplayertalentalchemy(self,other,POTION_PERM_STR);
};

func void ch_training_alchemy_potion_perm_dex()
{
	Info_ClearChoices(dia_ch_misc_special);
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
};

func void ch_training_alchemy_charge_innoseye()
{
	Info_ClearChoices(dia_ch_misc_special);
	b_teachplayertalentalchemy(self,other,CHARGE_INNOSEYE);
};


var int smithstart;

instance DIA_CH_MISC_SMITHSTART(C_INFO)
{
	npc = ch;
	nr = 10;
	condition = dia_ch_misc_smithstart_condition;
	information = dia_ch_misc_smithstart_info;
	permanent = TRUE;
	description = "Kowalstwo";
};


func int dia_ch_misc_smithstart_condition()
{
	if((MISCSTART == TRUE) && (ALCHEMYSTART == FALSE) && (SMITHSTART == FALSE) && (ANIMALSTART == FALSE) && (PALADINSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_misc_smithstart_info()
{
	SMITHSTART = TRUE;
};


instance DIA_CH_MISC_SMITHSTOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_misc_smithstopper_condition;
	information = dia_ch_misc_smithstopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_misc_smithstopper_condition()
{
	if(SMITHSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_smithstopper_info()
{
	SMITHSTART = FALSE;
};


instance DIA_CH_MISC_SMITHNIEDRIG(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_misc_smithniedrig_condition;
	information = dia_ch_misc_smithniedrig_info;
	permanent = TRUE;
	description = "Pierwsze 5 broni";
};


func int dia_ch_misc_smithniedrig_condition()
{
	if(SMITHSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_smithniedrig_info()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
	Info_AddChoice(dia_ch_misc_smithniedrig,DIALOG_BACK,dia_ch_misc_smithniedrig_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithniedrig,b_buildlearnstring(NAME_ITMW_1H_COMMON_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_COMMON)),ch_training_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithniedrig,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),ch_training_smith_1hspecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithniedrig,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),ch_training_smith_2hspecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithniedrig,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),ch_training_smith_1hspecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithniedrig,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),ch_training_smith_2hspecial2);
	};
};


instance DIA_CH_MISC_SMITHHOCH(C_INFO)
{
	npc = ch;
	nr = 9;
	condition = dia_ch_misc_smithhoch_condition;
	information = dia_ch_misc_smithhoch_info;
	permanent = TRUE;
	description = "Ostatnie 4 bronie";
};


func int dia_ch_misc_smithhoch_condition()
{
	if(SMITHSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_smithhoch_info()
{
	Info_ClearChoices(dia_ch_misc_smithhoch);
	Info_AddChoice(dia_ch_misc_smithhoch,DIALOG_BACK,dia_ch_misc_smithhoch_back);
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithhoch,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_03)),ch_training_smith_1hspecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithhoch,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_03)),ch_training_smith_2hspecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithhoch,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_04)),ch_training_smith_1hspecial4);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_smithhoch,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_04)),ch_training_smith_2hspecial4);
	};
};

func void dia_ch_misc_smithniedrig_back()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
};

func void dia_ch_misc_smithhoch_back()
{
	Info_ClearChoices(dia_ch_misc_smithhoch);
};

func void ch_training_smith_common()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void ch_training_smith_1hspecial1()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void ch_training_smith_2hspecial1()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void ch_training_smith_1hspecial2()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void ch_training_smith_2hspecial2()
{
	Info_ClearChoices(dia_ch_misc_smithniedrig);
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void ch_training_smith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void ch_training_smith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void ch_training_smith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void ch_training_smith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


var int animalstart;

instance DIA_CH_MISC_ANIMAL_START(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_misc_animal_start_condition;
	information = dia_ch_misc_animal_start_info;
	permanent = TRUE;
	description = "Trofea zwierzêce";
};


func int dia_ch_misc_animal_start_condition()
{
	if((MISCSTART == TRUE) && (ALCHEMYSTART == FALSE) && (SMITHSTART == FALSE) && (ANIMALSTART == FALSE) && (PALADINSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_misc_animal_start_info()
{
	ANIMALSTART = TRUE;
};


instance DIA_CH_MISC_ANIMAL_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_misc_animal_stopper_condition;
	information = dia_ch_misc_animal_stopper_info;
	permanent = TRUE;
	description = "WRÓÆ";
};


func int dia_ch_misc_animal_stopper_condition()
{
	if(ANIMALSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_animal_stopper_info()
{
	ANIMALSTART = FALSE;
};


instance DIA_CH_MISC_ANIMAL_ALLG(C_INFO)
{
	npc = ch;
	nr = 5;
	condition = dia_ch_misc_animal_allg_condition;
	information = dia_ch_misc_animal_allg_info;
	permanent = TRUE;
	description = "Zêby, skóra, pazury, serca";
};


func int dia_ch_misc_animal_allg_condition()
{
	if(ANIMALSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_animal_allg_info()
{
	Info_ClearChoices(dia_ch_misc_animal_allg);
	Info_AddChoice(dia_ch_misc_animal_allg,DIALOG_BACK,dia_ch_misc_animal_allg_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_allg,b_buildlearnstring("Zêby",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),ch_training_trophys_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_allg,b_buildlearnstring("Pazury",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),ch_training_trophys_claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_allg,b_buildlearnstring("Skóra",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),ch_training_trophys_fur);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_allg,b_buildlearnstring("Serce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),ch_training_trophys_heart);
	};
};

func void ch_training_trophys_teeth()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
};

func void ch_training_trophys_claws()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS);
};

func void ch_training_trophys_fur()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR);
};

func void ch_training_trophys_heart()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART);
};

func void dia_ch_misc_animal_allg_back()
{
	Info_ClearChoices(dia_ch_misc_animal_allg);
};


instance DIA_CH_MISC_ANIMAL_SPEZIELL(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_misc_animal_speziell_condition;
	information = dia_ch_misc_animal_speziell_info;
	permanent = TRUE;
	description = "Skrzyd³o, ¿¹d³o, ¿uwaczki, p³yty";
};


func int dia_ch_misc_animal_speziell_condition()
{
	if(ANIMALSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_animal_speziell_info()
{
	Info_ClearChoices(dia_ch_misc_animal_speziell);
	Info_AddChoice(dia_ch_misc_animal_speziell,DIALOG_BACK,dia_ch_misc_animal_speziell_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_speziell,b_buildlearnstring("¯¹d³o krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),ch_training_trophys_bfsting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_speziell,b_buildlearnstring("Skrzyd³o krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),ch_training_trophys_bfwing);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_speziell,b_buildlearnstring("P³yty z pancerza pe³zacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),ch_training_trophys_crawlerplate);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_speziell,b_buildlearnstring("¯uwaczki",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),ch_training_trophys_mandibles);
	};
};

func void dia_ch_misc_animal_speziell_back()
{
	Info_ClearChoices(dia_ch_misc_animal_speziell);
};

func void ch_training_trophys_bfsting()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING);
};

func void ch_training_trophys_bfwing()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING);
};

func void ch_training_trophys_crawlerplate()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES);
};

func void ch_training_trophys_mandibles()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE);
};


instance DIA_CH_MISC_ANIMAL_OTHER(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = dia_ch_misc_animal_other_condition;
	information = dia_ch_misc_animal_other_info;
	permanent = TRUE;
	description = "Krew, ³uski, rogi, jêzyk";
};


func int dia_ch_misc_animal_other_condition()
{
	if(ANIMALSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_animal_other_info()
{
	Info_ClearChoices(dia_ch_misc_animal_other);
	Info_AddChoice(dia_ch_misc_animal_other,DIALOG_BACK,dia_ch_misc_animal_other_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_other,b_buildlearnstring("Róg cieniostwora",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),ch_training_trophys_shadowhorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_other,b_buildlearnstring("Jêzyk ognistego jaszczura",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FIRETONGUE)),ch_training_trophys_firetongue);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_other,b_buildlearnstring("Róg smoczego zêbacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),ch_training_trophys_drgsnapperhorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_other,b_buildlearnstring("Smocze ³uski",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),ch_training_trophys_dragonscale);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_animal_other,b_buildlearnstring("Smocza krew",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),ch_training_trophys_dragonblood);
	};
};

func void dia_ch_misc_animal_other_back()
{
	Info_ClearChoices(dia_ch_misc_animal_other);
};

func void ch_training_trophys_shadowhorn()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN);
};

func void ch_training_trophys_firetongue()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FIRETONGUE);
};

func void ch_training_trophys_drgsnapperhorn()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN);
};

func void ch_training_trophys_dragonscale()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE);
};

func void ch_training_trophys_dragonblood()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD);
};


var int paladinstart;

instance DIA_CH_MISC_PALADINSTART(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = dia_ch_misc_paladinstart_condition;
	information = dia_ch_misc_paladinstart_info;
	permanent = TRUE;
	description = "Runy paladyna";
};


func int dia_ch_misc_paladinstart_condition()
{
	if((MISCSTART == TRUE) && (ALCHEMYSTART == FALSE) && (SMITHSTART == FALSE) && (ANIMALSTART == FALSE) && (PALADINSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_misc_paladinstart_info()
{
	PALADINSTART = TRUE;
};


instance DIA_CH_MISC_PALADINSTOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_misc_paladinstopper_condition;
	information = dia_ch_misc_paladinstopper_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_ch_misc_paladinstopper_condition()
{
	if(PALADINSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_paladinstopper_info()
{
	PALADINSTART = FALSE;
};


instance DIA_CH_MISC_PALHEAL(C_INFO)
{
	npc = ch;
	nr = 5;
	condition = dia_ch_misc_palheal_condition;
	information = dia_ch_misc_palheal_info;
	permanent = TRUE;
	description = "Œwiat³o i leczenie";
};


func int dia_ch_misc_palheal_condition()
{
	if(PALADINSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_palheal_info()
{
	Info_ClearChoices(dia_ch_misc_palheal);
	Info_AddChoice(dia_ch_misc_palheal,DIALOG_BACK,dia_ch_misc_palheal_back);
	if(PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palheal,b_buildlearnstring(NAME_SPL_PALFULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALFULLHEAL)),ch_training_runen_paladin_spl_palfullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palheal,b_buildlearnstring(NAME_SPL_PALMEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALMEDIUMHEAL)),ch_training_runen_paladin_spl_palmediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palheal,b_buildlearnstring(NAME_SPL_PALLIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHTHEAL)),ch_training_runen_paladin_spl_pallightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palheal,b_buildlearnstring(NAME_SPL_PALLIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHT)),ch_training_runen_paladin_spl_pallight);
	};
};

func void dia_ch_misc_palheal_back()
{
	Info_ClearChoices(dia_ch_misc_palheal);
};

func void ch_training_runen_paladin_spl_pallight()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHT);
};

func void ch_training_runen_paladin_spl_pallightheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALLIGHTHEAL);
};

func void ch_training_runen_paladin_spl_palmediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALMEDIUMHEAL);
};

func void ch_training_runen_paladin_spl_palfullheal()
{
	b_teachplayertalentrunes(self,other,SPL_PALFULLHEAL);
};


instance DIA_CH_MISC_PALKAMPF(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_misc_palkampf_condition;
	information = dia_ch_misc_palkampf_info;
	permanent = TRUE;
	description = "Runy bojowe";
};


func int dia_ch_misc_palkampf_condition()
{
	if(PALADINSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_misc_palkampf_info()
{
	Info_ClearChoices(dia_ch_misc_palkampf);
	Info_AddChoice(dia_ch_misc_palkampf,DIALOG_BACK,dia_ch_misc_palkampf_back);
	if(PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palkampf,b_buildlearnstring(NAME_SPL_PALDESTROYEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALDESTROYEVIL)),ch_training_runen_paladin_spl_paldestroyevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palkampf,b_buildlearnstring(NAME_SPL_PALREPELEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALREPELEVIL)),ch_training_runen_paladin_spl_palrepelevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE)
	{
		Info_AddChoice(dia_ch_misc_palkampf,b_buildlearnstring(NAME_SPL_PALHOLYBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALHOLYBOLT)),ch_training_runen_paladin_spl_palholybolt);
	};
};

func void dia_ch_misc_palkampf_back()
{
	Info_ClearChoices(dia_ch_misc_palkampf);
};

func void ch_training_runen_paladin_spl_palholybolt()
{
	b_teachplayertalentrunes(self,other,SPL_PALHOLYBOLT);
};

func void ch_training_runen_paladin_spl_palrepelevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALREPELEVIL);
};

func void ch_training_runen_paladin_spl_paldestroyevil()
{
	b_teachplayertalentrunes(self,other,SPL_PALDESTROYEVIL);
};


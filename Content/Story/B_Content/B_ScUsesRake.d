

var int rakeplace[50];
const int GREG_FIRSTSECRET = 1;
const int RAKE_BUDDEL_DIST_MAX = 300;
const int RAKE_BUDDEL_DIST_MIN = 200;

func void raketreasuresuccess(var C_ITEM itm)
{
	Wld_PlayEffect("spellFX_ItemAusbuddeln",itm,itm,0,0,0,FALSE);
	b_say_overlay(self,self,"$FOUNDTREASURE");
	b_giveplayerxp(XP_AMBIENT);
};

func void b_scusesrake(var C_NPC slf)
{
};

func void b_scgettreasure_s1()
{
	var C_ITEM gregsarmor;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if((Npc_GetDistToWP(hero,"NW_BIGFARM_LAKE_CAVE_07") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[1] == FALSE))
		{
			Wld_InsertItem(itse_goldpocket25,"NW_BIGFARM_LAKE_CAVE_07");
			RAKEPLACE[1] = TRUE;
			raketreasuresuccess(itse_goldpocket25);
			gregsarmor = Npc_GetEquippedArmor(greg_nw);
			if(Hlp_IsItem(gregsarmor,itar_pir_h_addon) == FALSE)
			{
				AI_EquipArmor(greg_nw,itar_pir_h_addon);
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_LAKE_GREG_TREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[2] == FALSE))
		{
			Wld_InsertItem(itse_goldpocket100,"NW_LAKE_GREG_TREASURE_01");
			RAKEPLACE[2] = TRUE;
			raketreasuresuccess(itse_goldpocket100);
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_GREGTREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[3] == FALSE))
		{
			Wld_InsertItem(itmi_goldcup,"NW_FARM3_GREGTREASURE_01");
			RAKEPLACE[3] = TRUE;
			raketreasuresuccess(itmi_goldcup);
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_MOUNTAINLAKE_MONSTER_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[4] == FALSE))
		{
			Wld_InsertItem(itmi_silverchalice,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
			RAKEPLACE[4] = TRUE;
			raketreasuresuccess(itmi_silverchalice);
		}
		else if((Npc_GetDistToWP(hero,"NW_BIGMILL_FARM3_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[5] == FALSE))
		{
			Wld_InsertItem(itam_prot_point_01,"NW_BIGMILL_FARM3_01");
			RAKEPLACE[5] = TRUE;
			raketreasuresuccess(itam_prot_point_01);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[12] == FALSE))
		{
			Wld_InsertItem(itwr_stoneplatecommon_addon,"ADW_ENTRANCE_RAKEPLACE_01");
			RAKEPLACE[12] = TRUE;
			Wld_InsertItem(itmi_silverchalice,"ADW_ENTRANCE_RAKEPLACE_01");
			raketreasuresuccess(itmi_silverchalice);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[13] == FALSE))
		{
			Wld_InsertItem(itwr_dexstoneplate1_addon,"ADW_ENTRANCE_RAKEPLACE_02");
			RAKEPLACE[13] = TRUE;
			Wld_InsertItem(itmi_goldcup,"ADW_ENTRANCE_RAKEPLACE_02");
			raketreasuresuccess(itmi_goldcup);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[14] == FALSE))
		{
			Wld_InsertItem(itpo_perm_health,"ADW_ENTRANCE_RAKEPLACE_03");
			RAKEPLACE[14] = TRUE;
			Wld_InsertItem(itse_goldpocket100,"ADW_ENTRANCE_RAKEPLACE_03");
			raketreasuresuccess(itse_goldpocket100);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[15] == FALSE))
		{
			Wld_InsertItem(itmi_silverring,"ADW_ENTRANCE_RAKEPLACE_04");
			RAKEPLACE[15] = TRUE;
			Wld_InsertItem(itmw_schwert4,"ADW_ENTRANCE_RAKEPLACE_04");
			raketreasuresuccess(itmw_schwert4);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_GREGTREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[16] == FALSE))
		{
			Wld_InsertItem(itse_goldpocket100,"ADW_VALLEY_GREGTREASURE_01");
			RAKEPLACE[16] = TRUE;
			Wld_InsertItem(itpo_health_02,"ADW_VALLEY_GREGTREASURE_01");
			Wld_InsertItem(itpo_mana_03,"ADW_VALLEY_GREGTREASURE_01");
			raketreasuresuccess(itpo_mana_03);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[17] == FALSE))
		{
			Wld_InsertItem(itpo_mana_addon_04,"ADW_VALLEY_RAKEPLACE_01");
			RAKEPLACE[17] = TRUE;
			Wld_InsertItem(itpo_speed,"ADW_VALLEY_RAKEPLACE_01");
			Wld_InsertItem(itpo_mana_02,"ADW_VALLEY_RAKEPLACE_01");
			raketreasuresuccess(itpo_mana_02);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[18] == FALSE))
		{
			Wld_InsertItem(itpo_health_addon_04,"ADW_VALLEY_RAKEPLACE_02");
			RAKEPLACE[18] = TRUE;
			Wld_InsertItem(itwr_stoneplatecommon_addon,"ADW_VALLEY_RAKEPLACE_02");
			Wld_InsertItem(itse_lockpickfisch,"ADW_VALLEY_RAKEPLACE_02");
			raketreasuresuccess(itse_lockpickfisch);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[19] == FALSE))
		{
			Wld_InsertItem(itsc_firerain,"ADW_VALLEY_RAKEPLACE_03");
			RAKEPLACE[19] = TRUE;
			Wld_InsertItem(itse_goldpocket50,"ADW_VALLEY_RAKEPLACE_03");
			Wld_InsertItem(itwr_stoneplatecommon_addon,"ADW_VALLEY_RAKEPLACE_03");
			raketreasuresuccess(itse_goldpocket50);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[20] == FALSE))
		{
			Wld_InsertItem(itmi_honigtabak,"ADW_BANDITSCAMP_RAKEPLACE_01");
			RAKEPLACE[20] = TRUE;
			Wld_InsertItem(itwr_stoneplatecommon_addon,"ADW_BANDITSCAMP_RAKEPLACE_01");
			Wld_InsertItem(itam_addon_mana,"ADW_BANDITSCAMP_RAKEPLACE_01");
			raketreasuresuccess(itam_addon_mana);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[21] == FALSE))
		{
			Wld_InsertItem(itsc_sumgobskel,"ADW_BANDITSCAMP_RAKEPLACE_02");
			RAKEPLACE[21] = TRUE;
			Wld_InsertItem(itpo_mana_03,"ADW_BANDITSCAMP_RAKEPLACE_02");
			raketreasuresuccess(itpo_mana_03);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[22] == FALSE))
		{
			Wld_InsertItem(itsc_trfshadowbeast,"ADW_BANDITSCAMP_RAKEPLACE_03");
			RAKEPLACE[22] = TRUE;
			Wld_InsertItem(itsc_lightheal,"ADW_BANDITSCAMP_RAKEPLACE_03");
			raketreasuresuccess(itsc_lightheal);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[23] == FALSE))
		{
			Wld_InsertItem(itwr_stoneplatecommon_addon,"ADW_BANDITSCAMP_RAKEPLACE_04");
			RAKEPLACE[23] = TRUE;
			Wld_InsertItem(itri_hp_01,"ADW_BANDITSCAMP_RAKEPLACE_04");
			raketreasuresuccess(itri_hp_01);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_MINE1_11") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[24] == FALSE))
		{
			Wld_InsertItem(itse_addon_francischest,"ADW_CANYON_MINE1_11");
			RAKEPLACE[24] = TRUE;
			raketreasuresuccess(itse_addon_francischest);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[25] == FALSE))
		{
			Wld_InsertItem(itmi_runeblank,"ADW_CANYON_RAKEPLACE_01");
			RAKEPLACE[25] = TRUE;
			Wld_InsertItem(itse_goldpocket25,"ADW_CANYON_RAKEPLACE_01");
			raketreasuresuccess(itse_goldpocket25);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[26] == FALSE))
		{
			Wld_InsertItem(itmi_nugget,"ADW_CANYON_RAKEPLACE_02");
			RAKEPLACE[26] = TRUE;
			Wld_InsertItem(itsc_lightningflash,"ADW_CANYON_RAKEPLACE_02");
			Wld_InsertItem(itsc_chargefireball,"ADW_CANYON_RAKEPLACE_02");
			raketreasuresuccess(itsc_chargefireball);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[27] == FALSE))
		{
			Wld_InsertItem(itse_goldpocket25,"ADW_CANYON_RAKEPLACE_03");
			RAKEPLACE[27] = TRUE;
			Wld_InsertItem(itwr_manastoneplate1_addon,"ADW_CANYON_RAKEPLACE_03");
			Wld_InsertItem(itmi_pitch,"ADW_CANYON_RAKEPLACE_03");
			raketreasuresuccess(itmi_pitch);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[28] == FALSE))
		{
			Wld_InsertItem(itmi_silverring,"ADW_CANYON_RAKEPLACE_04");
			RAKEPLACE[28] = TRUE;
			Wld_InsertItem(itmi_sulfur,"ADW_CANYON_RAKEPLACE_04");
			Wld_InsertItem(itwr_twohstoneplate1_addon,"ADW_CANYON_RAKEPLACE_04");
			raketreasuresuccess(itwr_twohstoneplate1_addon);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_05") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[29] == FALSE))
		{
			Wld_InsertItem(itmi_goldring,"ADW_CANYON_RAKEPLACE_05");
			RAKEPLACE[29] = TRUE;
			Wld_InsertItem(itat_dragonblood,"ADW_CANYON_RAKEPLACE_05");
			raketreasuresuccess(itat_dragonblood);
		}
		else if((Npc_GetDistToWP(hero,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[30] == FALSE))
		{
			Wld_InsertItem(itmi_addon_kompass_mis,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS");
			RAKEPLACE[30] = TRUE;
			raketreasuresuccess(itmi_addon_kompass_mis);
		};
	};
};



func void b_addon_piratesgohome()
{
	skip.aivar[AIV_PARTYMEMBER] = FALSE;
	matt.aivar[AIV_PARTYMEMBER] = FALSE;
	brandon.aivar[AIV_PARTYMEMBER] = FALSE;
	roastpirate.aivar[AIV_PARTYMEMBER] = FALSE;
	benchpirate.aivar[AIV_PARTYMEMBER] = FALSE;
	alligatorjack.aivar[AIV_PARTYMEMBER] = FALSE;
	b_startotherroutine(skip,"START");
	b_startotherroutine(matt,"START");
	b_startotherroutine(brandon,"START");
	b_startotherroutine(roastpirate,"START");
	b_startotherroutine(benchpirate,"START");
	b_startotherroutine(alligatorjack,"START");
};

func int c_gregspiratestoofar()
{
	if((Npc_GetDistToWP(hero,"ADW_CANYON_MINE1_09") < 3000) || (Npc_GetDistToWP(hero,"ADW_CANYON_MINE2_04") < 2000) || (Npc_GetDistToWP(hero,"ADW_CANYON_LIBRARY_04") < 2000) || (Npc_GetDistToWP(hero,"ADW_CANYON_PATH_TO_BANDITS_25") < 6000) || (Npc_GetDistToWP(hero,"ADW_PIRATECAMP_WAY_16") < 8000))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_howmanypiratesinparty()
{
	return skip.aivar[AIV_PARTYMEMBER] + matt.aivar[AIV_PARTYMEMBER] + brandon.aivar[AIV_PARTYMEMBER] + roastpirate.aivar[AIV_PARTYMEMBER] + benchpirate.aivar[AIV_PARTYMEMBER] + alligatorjack.aivar[AIV_PARTYMEMBER];
};

func void b_addon_piratesfollowagain()
{
	if(Npc_GetDistToWP(hero,"STRAND") < 4000)
	{
		return;
	};
	if(c_howmanypiratesinparty() != 0)
	{
		return;
	};
	if((Npc_GetDistToNpc(hero,skip) <= 2000) && !Npc_IsDead(skip) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(skip)))
	{
		skip.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(skip);
		b_startotherroutine(skip,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,matt) <= 2000) && !Npc_IsDead(matt) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(matt)))
	{
		matt.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(matt);
		b_startotherroutine(matt,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,brandon) <= 2000) && !Npc_IsDead(brandon) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(brandon)))
	{
		brandon.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(brandon);
		b_startotherroutine(brandon,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,roastpirate) <= 2000) && !Npc_IsDead(roastpirate) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(roastpirate)))
	{
		roastpirate.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(roastpirate);
		b_startotherroutine(roastpirate,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,benchpirate) <= 2000) && !Npc_IsDead(benchpirate) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(benchpirate)))
	{
		benchpirate.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(benchpirate);
		b_startotherroutine(benchpirate,"FOLLOW");
	};
	if((Npc_GetDistToNpc(hero,alligatorjack) <= 2000) && !Npc_IsDead(alligatorjack) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(alligatorjack)))
	{
		alligatorjack.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_ClearAIQueue(alligatorjack);
		b_startotherroutine(alligatorjack,"FOLLOW");
	};
};

func int c_towerbanditsdead()
{
	var C_NPC towerbandit1;
	var C_NPC towerbandit2;
	var C_NPC towerbandit3;
	towerbandit1 = Hlp_GetNpc(bdt_10100_addon_towerbandit);
	towerbandit2 = Hlp_GetNpc(bdt_10101_addon_towerbandit);
	towerbandit3 = Hlp_GetNpc(bdt_10102_addon_towerbandit);
	if(Npc_IsDead(towerbandit1) && Npc_IsDead(towerbandit2) && Npc_IsDead(towerbandit3))
	{
		TOWERBANDITSDEAD = TRUE;
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};


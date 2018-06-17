
var int swapdragnisdead;
var int rckdragnisdead;
var int fredragnisdead;
var int icdragnisdead;

func int b_dragonkillcounter(var C_NPC current_dragon)
{
	var C_NPC ravn;
	var C_NPC swapdragn;
	var C_NPC rckdragn;
	var C_NPC fredragn;
	var C_NPC icdragn;
	ravn = Hlp_GetNpc(bdt_1090_addon_raven);
	if(Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(ravn))
	{
		if(RAVENISDEAD == FALSE)
		{
			PlayVideoEx("EXTRO_RAVEN.BIK",TRUE,FALSE);
			RAVENISDEAD = TRUE;
			b_removenpc(myxir_adw);
		};
	};
	if(current_dragon.guild == GIL_DRAGON)
	{
		swapdragn = Hlp_GetNpc(dragon_swamp);
		rckdragn = Hlp_GetNpc(dragon_rock);
		fredragn = Hlp_GetNpc(dragon_fire);
		icdragn = Hlp_GetNpc(dragon_ice);
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(swapdragn)) && (SWAPDRAGNISDEAD == FALSE))
		{
			MIS_KILLEDDRAGONS = MIS_KILLEDDRAGONS + 1;
			SWAPDRAGNISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(rckdragn)) && (RCKDRAGNISDEAD == FALSE))
		{
			MIS_KILLEDDRAGONS = MIS_KILLEDDRAGONS + 1;
			RCKDRAGNISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(fredragn)) && (FREDRAGNISDEAD == FALSE))
		{
			MIS_KILLEDDRAGONS = MIS_KILLEDDRAGONS + 1;
			FREDRAGNISDEAD = TRUE;
		};
		if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(icdragn)) && (ICDRAGNISDEAD == FALSE))
		{
			MIS_KILLEDDRAGONS = MIS_KILLEDDRAGONS + 1;
			ICDRAGNISDEAD = TRUE;
		};
	};
	if(MIS_KILLEDDRAGONS == 4)
	{
		MIS_ALLDRAGONSDEAD = TRUE;
		if((DJG_BIFFPARTY == TRUE) && (Npc_IsDead(biff) == FALSE))
		{
			DJG_BIFFSURVIVEDLASTDRAGON = TRUE;
		};
	};
	if(current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		UNDEADDRAGONISDEAD = TRUE;
		Log_CreateTopic(TOPIC_BACKTOSHIP,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BACKTOSHIP,LOG_RUNNING);
		b_logentry(TOPIC_BACKTOSHIP,PRINT_DRAGKILLCOUNT);
		AI_Teleport(hero,"UNDEAD_ENDTELEPORT");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx("EXTRO_PAL.BIK",TRUE,FALSE);
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx("EXTRO_DJG.BIK",TRUE,FALSE);
		}
		else
		{
			PlayVideoEx("EXTRO_KDF.BIK",TRUE,FALSE);
		};
	};
};


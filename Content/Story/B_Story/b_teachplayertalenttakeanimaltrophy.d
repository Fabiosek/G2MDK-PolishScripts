
func int b_teachplayertalenttakeanimaltrophy(var C_NPC slf,var C_NPC oth,var int trophy)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTANIMALTROPHY,LOG_NOTE);
	b_logentry(TOPIC_TALENTANIMALTROPHY,"Teraz mogê:");
	if(trophy == TROPHY_TEETH)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ zwierzêtom k³y.");
	};
	if(trophy == TROPHY_CLAWS)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ zwierzêtom pazury.");
	};
	if(trophy == TROPHY_FUR)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...oprawiaæ zwierzêta.");
	};
	if(trophy == TROPHY_REPTILESKIN)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_REPTILESKIN] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...zdejmowaæ skórê jaszczurów.");
	};
	if(trophy == TROPHY_HEART)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ serca golemom i demonom.");
	};
	if(trophy == TROPHY_SHADOWHORN)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ rogi cieniostworom.");
	};
	if(trophy == TROPHY_FIRETONGUE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FIRETONGUE] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ ognistym jaszczurom jêzyki.");
	};
	if(trophy == TROPHY_BFWING)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ krwiopijcom skrzyd³a.");
	};
	if(trophy == TROPHY_BFSTING)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ krwiopijcom ¿¹d³a.");
	};
	if(trophy == TROPHY_MANDIBLES)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ zwierzêtom ¿uwaczki.");
	};
	if(trophy == TROPHY_CRAWLERPLATE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ pe³zaczom pancerze.");
	};
	if(trophy == TROPHY_DRGSNAPPERHORN)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...usuwaæ smoczym zêbaczom rogi.");
	};
	if(trophy == TROPHY_DRAGONSCALE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] = TRUE;
		CreateInvItems(swampdragon,itat_dragonscale,12);
		CreateInvItems(rockdragon,itat_dragonscale,12);
		CreateInvItems(firedragon,itat_dragonscale,12);
		CreateInvItems(icedragon,itat_dragonscale,12);
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...zbieraæ smocze ³uski ze skór zabitych smoków.");
	};
	if(trophy == TROPHY_DRAGONBLOOD)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] = TRUE;
		CreateInvItems(swampdragon,itat_dragonblood,2);
		CreateInvItems(rockdragon,itat_dragonblood,2);
		CreateInvItems(firedragon,itat_dragonblood,2);
		CreateInvItems(icedragon,itat_dragonblood,2);
		b_logentry(TOPIC_TALENTANIMALTROPHY,"...magazynowaæ krew zabitych smoków.");
	};
	PrintScreen(PRINT_LEARNTAKEANIMALTROPHY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	return TRUE;
};


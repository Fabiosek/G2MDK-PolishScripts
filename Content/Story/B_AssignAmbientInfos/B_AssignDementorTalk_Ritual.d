
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//SpóŸni³eœ siê.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Zniszczyliœmy Oko Innosa. Ju¿ nigdy nie odzyska swojej dawnej mocy.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Za chwilê przekonasz siê, ¿e wszelkie próby pokonania naszego Pana i Mistrza s¹ z góry skazane na niepowodzenie.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"Te wredne draby zaczynaj¹ mnie denerwowaæ. Zniszczyli Oko Innosa. Nie mam zielonego pojêcia, jak je naprawiæ.");
		b_logentry(TOPIC_TRAITORPEDRO,"Znalaz³em Oko Innosa, ale nie natkn¹³em siê jak do tej pory na ¿aden œlad Pedra. Ci czarni magowie najwyraŸniej siê z nim jakoœ porozumieli.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Poznaj nasz¹ moc.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//Za Pana Ciemnoœci!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Nie uciekniesz nam!
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Zginiesz!
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void b_assigndementortalk_ritual_exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};


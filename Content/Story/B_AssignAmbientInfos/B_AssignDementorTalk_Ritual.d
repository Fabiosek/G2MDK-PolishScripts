
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Sp�ni�e� si�.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Zniszczyli�my Oko Innosa. Ju� nigdy nie odzyska swojej dawnej mocy.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Za chwil� przekonasz si�, �e wszelkie pr�by pokonania naszego Pana i Mistrza s� z g�ry skazane na niepowodzenie.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"Te wredne draby zaczynaj� mnie denerwowa�. Zniszczyli Oko Innosa. Nie mam zielonego poj�cia, jak je naprawi�.");
		b_logentry(TOPIC_TRAITORPEDRO,"Znalaz�em Oko Innosa, ale nie natkn��em si� jak do tej pory na �aden �lad Pedra. Ci czarni magowie najwyra�niej si� z nim jako� porozumieli.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Poznaj nasz� moc.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//Za Pana Ciemno�ci!
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


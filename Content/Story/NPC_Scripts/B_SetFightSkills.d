
func void b_setfightskills(var C_NPC slf,var int percent)
{
	b_raisefighttalent(slf,NPC_TALENT_1H,percent);
	b_raisefighttalent(slf,NPC_TALENT_2H,percent);
	b_raisefighttalent(slf,NPC_TALENT_BOW,percent);
	b_raisefighttalent(slf,NPC_TALENT_CROSSBOW,percent);
};


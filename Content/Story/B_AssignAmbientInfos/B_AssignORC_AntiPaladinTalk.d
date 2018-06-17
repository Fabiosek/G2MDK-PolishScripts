
var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//KHROKGNAR! Pan mówiæ, ¿e ty tera paladyn! Pan mieæ racjê. Pan mieæ zawsze racjê.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//My orki dowódce teraz same zabiæ wielki paladyn.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//My zgnieœæ Hagen i jego ludzie. Nawet ty nic nie pomóc.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Pan powiedzieæ orki dowódce, ¿eby przynieœæ wielka g³owa paladyna. Ty po¿egnaæ siê z ¿yciem. KHROKGNAR!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//My, orki dowódce przyjœæ ciê zabiæ, paladyn.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//KHROKGNAR! My ciê zabiæ, paladynie.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};



var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//KHROKGNAR! Pan m�wi�, �e ty tera paladyn! Pan mie� racj�. Pan mie� zawsze racj�.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//My orki dow�dce teraz same zabi� wielki paladyn.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//My zgnie�� Hagen i jego ludzie. Nawet ty nic nie pom�c.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Pan powiedzie� orki dow�dce, �eby przynie�� wielka g�owa paladyna. Ty po�egna� si� z �yciem. KHROKGNAR!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//My, orki dow�dce przyj�� ci� zabi�, paladyn.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//KHROKGNAR! My ci� zabi�, paladynie.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};



instance NONE_ADDON_112_RHADEMES(NPC_DEFAULT)
{
	name[0] = "Rademes";
	guild = GIL_NONE;
	id = 112;
	voice = 3;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	protection[PROT_POINT] = 99999999;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_setnpcvisual(self,MALE,"Ske_Head",0,BODYTEX_N,itar_raven_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	daily_routine = rtn_start_112;
};


func void rtn_start_112()
{
	ta_ghostwusel(8,0,20,0,"ADW_ADANOSTEMPEL_RHADEMES_02");
	ta_ghostwusel(20,0,8,0,"ADW_ADANOSTEMPEL_RHADEMES_02");
};

func void rtn_tot_112()
{
	ta_ghost(8,0,20,0,"TOT");
	ta_ghost(20,0,8,0,"TOT");
};


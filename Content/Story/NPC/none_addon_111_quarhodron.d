
instance NONE_ADDON_111_QUARHODRON(NPC_DEFAULT)
{
	name[0] = "Quarhodron";
	guild = GIL_NONE;
	id = 111;
	voice = 11;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_NOFIGHTPARKER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_CORRISTO,BODYTEX_N,itar_raven_addon);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	daily_routine = rtn_start_111;
};


func void rtn_start_111()
{
	ta_ghost(8,0,23,0,"ADW_ANCIENTGHOST");
	ta_ghost(23,0,8,0,"ADW_ANCIENTGHOST");
};

func void rtn_tot_111()
{
	ta_ghost(8,0,23,0,"TOT");
	ta_ghost(23,0,8,0,"TOT");
};



instance PIR_1301_ADDON_SKIP_NW(NPC_DEFAULT)
{
	name[0] = "Skip";
	guild = GIL_PIR;
	id = 1301;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_shortsword2);
	EquipItem(self,itrw_sld_bow);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PIRAT01,BODYTEX_N,itar_pir_l_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_1301;
};


func void rtn_start_1301()
{
	ta_sit_campfire(5,0,20,0,"NW_CITY_PIRATESCAMP_04");
	ta_sit_campfire(20,0,5,0,"NW_CITY_PIRATESCAMP_04");
};

func void rtn_tot_1301()
{
	ta_sit_campfire(5,0,20,0,"TOT");
	ta_sit_campfire(20,0,5,0,"TOT");
};


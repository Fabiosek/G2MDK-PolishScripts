
instance KDW_140300_ADDON_MYXIR_CITY(NPC_DEFAULT)
{
	name[0] = "Myxir";
	guild = GIL_KDW;
	id = 140300;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_P_NORMALBART_CRONOS,BODYTEX_P,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_140300;
};


func void rtn_start_140300()
{
	ta_pray_innos_fp(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_IN");
	ta_stand_wp(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_FRONT");
};


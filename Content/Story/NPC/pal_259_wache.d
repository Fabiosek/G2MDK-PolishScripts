
instance PAL_259_WACHE(NPC_DEFAULT)
{
	name[0] = NAME_WACHE;
	guild = GIL_PAL;
	id = 259;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_OCAMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_TOUGHBALD_NEK,BODYTEX_P,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_259;
};


func void rtn_start_259()
{
	ta_stand_guarding(8,0,23,0,"OC_OPEN_ROOM_GUARD_01");
	ta_stand_guarding(23,0,8,0,"OC_OPEN_ROOM_GUARD_01");
};


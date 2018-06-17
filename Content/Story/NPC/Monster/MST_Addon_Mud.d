
prototype MST_DEFAULT_MUD(C_NPC)
{
	name[0] = "B³otniak";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 0;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_mud()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Hum_Head_Pony",FACE_N_ZOMBIEMUD,0,NO_ARMOR);
};

func void b_createinvitems_mud()
{
	CreateInvItems(self,itfo_water,1);
	CreateInvItems(self,itmi_gold,5);
};


instance UNDEAD_MUD(MST_DEFAULT_MUD)
{
	name[0] = name_addon_undead_mud;
	b_setvisuals_mud();
	b_createinvitems_mud();
	Npc_SetToFistMode(self);
};

instance SUMMONED_MUD(MST_DEFAULT_MUD)
{
	name[0] = name_addon_summoned_mud;
	guild = GIL_SUMMONEDZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONEDZOMBIE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_mud();
	b_createinvitems_mud();
	Npc_SetToFistMode(self);
};


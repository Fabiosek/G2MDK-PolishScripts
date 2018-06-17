
prototype MST_DEFAULT_SHADOWBEAST_SKELETON(C_NPC)
{
	name[0] = "Szkielet-cieniostwór";
	guild = GIL_SHADOWBEAST_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST_SKELETON;
	level = 40;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_shadowbeast_skeleton()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHADOWBEAST_SKELETON(MST_DEFAULT_SHADOWBEAST_SKELETON)
{
	b_setvisuals_shadowbeast_skeleton();
	Npc_SetToFistMode(self);
};

instance SHADOWBEAST_SKELETON_ANGAR(MST_DEFAULT_SHADOWBEAST_SKELETON)
{
	b_setvisuals_shadowbeast_skeleton();
	Npc_SetToFistMode(self);
};



prototype MST_DEFAULT_LURKER(C_NPC)
{
	name[0] = "Topielec";
	guild = GIL_LURKER;
	aivar[AIV_MM_REAL_ID] = ID_LURKER;
	level = 12;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_LURKER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void b_setvisuals_lurker()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance LURKER(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
};

instance KERVO_LURKER1(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_LURKER;
};

instance KERVO_LURKER2(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_LURKER;
};

instance KERVO_LURKER3(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_LURKER;
};

instance KERVO_LURKER4(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_LURKER;
};

instance KERVO_LURKER5(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_LURKER;
};

instance KERVO_LURKER6(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_LURKER;
};

instance BEACHLURKER1(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
};

instance BEACHLURKER2(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
};

instance BEACHLURKER3(MST_DEFAULT_LURKER)
{
	b_setvisuals_lurker();
	Npc_SetToFistMode(self);
};


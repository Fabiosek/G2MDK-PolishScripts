
prototype MST_DEFAULT_ADDON_SWAMPGOLEM(C_NPC)
{
	name[0] = "Bagienny golem";
	guild = GIL_SWAMPGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPGOLEM;
	level = 25;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	protection[PROT_MAGIC] = 125;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_swampgolem()
{
	Mdl_SetVisual(self,"SwampGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Sumpf_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SWAMPGOLEM(MST_DEFAULT_ADDON_SWAMPGOLEM)
{
	b_setvisuals_swampgolem();
	Npc_SetToFistMode(self);
};

instance SWAMPGOLEM_VALLEY(MST_DEFAULT_ADDON_SWAMPGOLEM)
{
	b_setvisuals_swampgolem();
	Npc_SetToFistMode(self);
	aivar[AIV_MAXDISTTOWP] = 1500;
	aivar[AIV_ORIGINALFIGHTTACTIC] = FAI_STONEGOLEM;
};


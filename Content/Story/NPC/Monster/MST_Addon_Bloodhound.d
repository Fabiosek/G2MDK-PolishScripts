
prototype MST_DEFAULT_BLOODHOUND(C_NPC)
{
	name[0] = "Krwawy ogar";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_BLOODHOUND;
	level = 22;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FOLLOWTIME] = 10;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ROAMSTART] = ONLYROUTINE;
};

func void set_bloodhound_visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Bhd_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BLOODHOUND(MST_DEFAULT_BLOODHOUND)
{
	set_bloodhound_visuals();
	Npc_SetToFistMode(self);
};


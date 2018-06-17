
prototype MST_DEFAULT_RAZOR(C_NPC)
{
	name[0] = "Brzytwiak";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_RAZOR;
	level = 18;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 90;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FOLLOWTIME] = 10;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void set_razor_visuals()
{
	Mdl_SetVisual(self,"Razor.mds");
	Mdl_SetVisualBody(self,"Raz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance RAZOR(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR01(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR02(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR03(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR04(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR05(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR06(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR07(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR08(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR09(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};

instance CANYONRAZOR10(MST_DEFAULT_RAZOR)
{
	set_razor_visuals();
	Npc_SetToFistMode(self);
};


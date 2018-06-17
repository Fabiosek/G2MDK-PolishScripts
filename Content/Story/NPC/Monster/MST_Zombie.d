
prototype MST_DEFAULT_ZOMBIE(C_NPC)
{
	name[0] = "Zombie";
	guild = GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_ZOMBIE;
	level = 20;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,-1);
};

func void b_setvisuals_zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,-1);
};

func void b_setvisuals_zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,-1);
};

func void b_setvisuals_zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,-1);
};


instance ZOMBIE01(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie01();
	Npc_SetToFistMode(self);
};

instance ZOMBIE02(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie02();
	Npc_SetToFistMode(self);
};

instance ZOMBIE03(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie03();
	Npc_SetToFistMode(self);
};

instance ZOMBIE04(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_zombie04();
	Npc_SetToFistMode(self);
};

instance ZOMBIE_ADDON_KNECHT(MST_DEFAULT_ZOMBIE)
{
	name[0] = "S³uga Kruka";
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_thorus_addon);
	Npc_SetToFistMode(self);
};

instance ZOMBIE_ADDON_BLOODWYN(MST_DEFAULT_ZOMBIE)
{
	name[0] = "O¿ywiony Bloodwyn";
	level = 25;
	attribute[ATR_HITPOINTS_MAX] = 1600;
	attribute[ATR_HITPOINTS] = 1600;
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_thorus_addon);
	Npc_SetToFistMode(self);
};


func void zs_pal_zombie()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_pal_zombie_rise);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_pal_zombie_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DOWN");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_pal_zombie_end()
{
};

func void b_pal_zombie_rise()
{
	if(Npc_GetDistToNpc(self,hero) <= 1400)
	{
		AI_PlayAni(self,"T_RISE");
		AI_StartState(self,zs_mm_attack,0,"");
		self.bodystateinterruptableoverride = FALSE;
		self.start_aistate = zs_mm_allscheduler;
		self.aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	};
};

func void b_setvisuals_pal_zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_pal_skel);
};

func void b_setvisuals_pal_zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_pal_skel);
};

func void b_setvisuals_pal_zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,itar_pal_skel);
};

func void b_setvisuals_pal_zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,itar_pal_skel);
};


instance PAL_ZOMBIE01(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_pal_zombie01();
	Npc_SetToFistMode(self);
	start_aistate = zs_pal_zombie;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance PAL_ZOMBIE02(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_pal_zombie02();
	Npc_SetToFistMode(self);
	start_aistate = zs_pal_zombie;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance PAL_ZOMBIE03(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_pal_zombie03();
	Npc_SetToFistMode(self);
	start_aistate = zs_pal_zombie;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance PAL_ZOMBIE04(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_pal_zombie04();
	Npc_SetToFistMode(self);
	start_aistate = zs_pal_zombie;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};


func void b_setvisuals_maya_zombie01()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,itar_mayazombie_addon);
};

func void b_setvisuals_maya_zombie02()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,DEFAULT,itar_mayazombie_addon);
};

func void b_setvisuals_maya_zombie03()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,DEFAULT,itar_mayazombie_addon);
};

func void b_setvisuals_maya_zombie04()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,DEFAULT,itar_mayazombie_addon);
};


instance MAYAZOMBIE01(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_maya_zombie01();
	Npc_SetToFistMode(self);
	start_aistate = zs_pal_zombie;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance MAYAZOMBIE02(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_maya_zombie02();
	Npc_SetToFistMode(self);
};

instance MAYAZOMBIE03(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_maya_zombie03();
	Npc_SetToFistMode(self);
	start_aistate = zs_pal_zombie;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance MAYAZOMBIE04(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_maya_zombie04();
	Npc_SetToFistMode(self);
};

instance MAYAZOMBIE04_TOTENW(MST_DEFAULT_ZOMBIE)
{
	b_setvisuals_maya_zombie04();
	Npc_SetToFistMode(self);
};

instance SUMMONED_ZOMBIE(MST_DEFAULT_ZOMBIE)
{
	name[0] = name_addon_summoned_zombie;
	guild = GIL_SUMMONEDZOMBIE;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONEDZOMBIE;
	level = 0;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_maya_zombie04();
	Npc_SetToFistMode(self);
};


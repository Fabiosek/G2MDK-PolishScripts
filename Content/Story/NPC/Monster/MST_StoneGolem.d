
prototype MST_DEFAULT_STONEGOLEM(C_NPC)
{
	name[0] = "Kamienny golem";
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	level = 25;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_stonegolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance STONEGOLEM(MST_DEFAULT_STONEGOLEM)
{
	b_setvisuals_stonegolem();
	Npc_SetToFistMode(self);
};

instance SUMMONED_GOLEM(MST_DEFAULT_STONEGOLEM)
{
	name[0] = "Przyzwany golem";
	guild = gil_summoned_golem;
	aivar[AIV_MM_REAL_ID] = id_summoned_golem;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_stonegolem();
	Npc_SetToFistMode(self);
};


func void zs_golemdown()
{
	self.senses = SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_golemrise);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_golemdown_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_golemdown_end()
{
};

func void b_golemrise()
{
	if((Npc_GetDistToNpc(self,hero) <= 700) && (Mob_HasItems("NW_GOLEMCHEST",itse_golemchest_mis) == 0))
	{
		AI_PlayAni(self,"T_RISE");
		self.nofocus = FALSE;
		self.name[0] = "Kamienny golem";
		self.flags = 0;
		AI_StartState(self,zs_mm_attack,0,"");
		self.bodystateinterruptableoverride = FALSE;
		self.start_aistate = zs_mm_allscheduler;
		self.aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	};
};


instance SHATTERED_GOLEM(MST_DEFAULT_STONEGOLEM)
{
	name[0] = "";
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	level = 18;
	nofocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	bodystateinterruptableoverride = TRUE;
	b_setvisuals_stonegolem();
	Npc_SetToFistMode(self);
	start_aistate = zs_golemdown;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

instance MAGICGOLEM(MST_DEFAULT_STONEGOLEM)
{
	name[0] = "Magiczny golem";
	level = 10;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	b_setvisuals_stonegolem();
	Npc_SetToFistMode(self);
};


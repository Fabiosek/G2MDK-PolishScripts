
const int SPL_COST_SWARM = 20;
const int SPL_SWARM_DAMAGE = 80;
const int SPL_TIME_SWARM = 6;

instance SPELL_SWARM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
};


func int spell_logic_swarm(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_SWARM))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SWARM;
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_swarm()
{
	self.aivar[AIV_SELECTSPELL] += 1;
};


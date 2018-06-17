
const int SPL_COST_SUMMONGOBLINSKELETON = 20;

instance SPELL_SUMMONGOBLINSKELETON(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summongoblinskeleton(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONGOBLINSKELETON)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summongoblinskeleton()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONGOBLINSKELETON;
	};
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_gobbo_skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,gobbo_skeleton,1,500);
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


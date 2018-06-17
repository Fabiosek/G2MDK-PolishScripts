
const int SPL_COST_WATERFIST = 25;
const int SPL_DAMAGE_WATERFIST = 125;

instance SPELL_WATERFIST(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_WATERFIST;
	damagetype = DAM_MAGIC;
};


func int spell_logic_waterfist(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_WATERFIST)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_waterfist()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_WATERFIST;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


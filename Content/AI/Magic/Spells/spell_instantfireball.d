
const int SPL_COST_INSTANTFIREBALL = 15;
const int SPL_DAMAGE_INSTANTFIREBALL = 75;

instance SPELL_INSTANTFIREBALL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_INSTANTFIREBALL;
	damagetype = DAM_MAGIC;
};


func int spell_logic_instantfireball(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_INSTANTFIREBALL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_instantfireball()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_INSTANTFIREBALL;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


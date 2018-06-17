
const int SPL_COST_INSTANTFIRESTORM = 25;
const int SPL_DAMAGE_INSTANTFIRESTORM = 100;

instance SPELL_FIRESTORM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_INSTANTFIRESTORM;
	damagetype = DAM_MAGIC;
};


func int spell_logic_firestorm(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_INSTANTFIRESTORM)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_firestorm()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_INSTANTFIRESTORM;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


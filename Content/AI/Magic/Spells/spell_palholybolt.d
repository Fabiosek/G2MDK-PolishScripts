
const int SPL_COST_PALHOLYBOLT = 10;
const int SPL_DAMAGE_PALHOLYBOLT = 100;

instance SPELL_PALHOLYBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_PALHOLYBOLT;
};


func int spell_logic_palholybolt(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALHOLYBOLT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_palholybolt()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALHOLYBOLT;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


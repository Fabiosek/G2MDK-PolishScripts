
const int SPL_COST_ICEWAVE = 120;

instance SPELL_ICEWAVE(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = 60;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_icewave(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_ICEWAVE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_icewave()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_ICEWAVE;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};



const int SPL_COST_ICECUBE = 40;
const int SPL_FREEZE_DAMAGE = 2;
const int SPL_TIME_FREEZE = 19;

instance SPELL_ICECUBE(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = 60;
};


func int spell_logic_icecube(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_ICECUBE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_icecube()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_ICECUBE;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


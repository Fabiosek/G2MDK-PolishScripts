
const int SPL_COST_WHIRLWIND = 30;
const int SPL_WHIRLWIND_DAMAGE = 0;
const int SPL_TIME_WHIRLWIND = 10;

instance SPELL_WHIRLWIND(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	damage_per_level = 60;
};


func int spell_logic_whirlwind(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_WHIRLWIND)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_whirlwind()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_WHIRLWIND;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


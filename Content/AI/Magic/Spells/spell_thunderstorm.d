
const int SPL_COST_THUNDERSTORM = 100;
const int SPL_DAMAGE_THUNDERSTORM = 250;

instance SPELL_THUNDERSTORM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_THUNDERSTORM;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_thunderstorm(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_THUNDERSTORM)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_thunderstorm()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_THUNDERSTORM;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


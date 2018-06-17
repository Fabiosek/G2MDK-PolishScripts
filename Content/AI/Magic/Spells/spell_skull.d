
const int SPL_COST_SKULL = 250;
const int SPL_DAMAGE_SKULL = 666;

instance SPELL_SKULL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_SKULL;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
};


func int spell_logic_skull(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SKULL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_skull()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


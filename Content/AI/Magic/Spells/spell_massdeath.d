
const int SPL_COST_MASSDEATH = 150;
const int SPL_DAMAGE_MASSDEATH = 500;

instance SPELL_MASSDEATH(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_MASSDEATH;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_massdeath(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_MASSDEATH)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_massdeath()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MASSDEATH;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};



const int SPL_COST_FIRERAIN = 150;
const int SPL_DAMAGE_FIRERAIN = 500;

instance SPELL_FIRERAIN(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_FIRERAIN;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_firerain(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_FIRERAIN)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_firerain()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FIRERAIN;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


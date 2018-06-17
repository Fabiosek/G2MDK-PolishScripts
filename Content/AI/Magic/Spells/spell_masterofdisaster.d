
const int SPL_COST_MASTEROFDISASTER = 60;
const int SPL_DAMAGE_MASTEROFDISASTER = 300;

instance SPELL_MASTEROFDISASTER(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_MASTEROFDISASTER;
	damagetype = DAM_MAGIC;
};


func int spell_logic_masterofdisaster(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_MASTEROFDISASTER)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_masterofdisaster()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MASTEROFDISASTER;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


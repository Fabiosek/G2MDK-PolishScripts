
const int SPL_COST_FIREBOLT = 5;
const int SPL_DAMAGE_FIREBOLT = 25;

instance SPELL_FIREBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_FIREBOLT;
	damagetype = DAM_MAGIC;
};


func int spell_logic_firebolt(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_FIREBOLT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_firebolt()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FIREBOLT;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};



const int SPL_COST_ENERGYBALL = 100;
const int SPL_DAMAGE_ENERGYBALL = 200;

instance SPELL_ENERGYBALL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_ENERGYBALL;
	damagetype = DAM_MAGIC;
};


func int spell_logic_energyball(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_ENERGYBALL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_energyball()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_ENERGYBALL;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


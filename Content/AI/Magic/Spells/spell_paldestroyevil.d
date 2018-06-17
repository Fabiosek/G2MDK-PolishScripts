
const int SPL_COST_PALDESTROYEVIL = 60;
const int SPL_DAMAGE_PALDESTROYEVIL = 600;

instance SPELL_PALDESTROYEVIL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_PALDESTROYEVIL;
	spelltype = SPELL_NEUTRAL;
};


func int spell_logic_paldestroyevil(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALDESTROYEVIL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_paldestroyevil()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALDESTROYEVIL;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


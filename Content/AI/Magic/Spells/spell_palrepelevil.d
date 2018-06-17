
const int SPL_COST_PALREPELEVIL = 30;
const int SPL_DAMAGE_PALREPELEVIL = 300;

instance SPELL_PALREPELEVIL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_PALREPELEVIL;
};


func int spell_logic_palrepelevil(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALREPELEVIL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_palrepelevil()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALREPELEVIL;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


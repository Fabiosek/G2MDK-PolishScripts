
const int SPL_COST_DESTROYUNDEAD = 100;
const int SPL_DAMAGE_DESTROYUNDEAD = 1000;

instance SPELL_DESTROYUNDEAD(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_DESTROYUNDEAD;
	spelltype = SPELL_NEUTRAL;
};


func int spell_logic_destroyundead(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_DESTROYUNDEAD)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_destroyundead()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_DESTROYUNDEAD;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


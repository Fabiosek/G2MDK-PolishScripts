
const int SPL_COST_GREENTENTACLE = 50;
const int SPL_TIME_GREENTENTACLE = 20;

instance SPELL_GREENTENTACLE(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1500;
	spelltype = SPELL_NEUTRAL;
};


func int spell_logic_greententacle(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_GREENTENTACLE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_greententacle()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_GREENTENTACLE;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


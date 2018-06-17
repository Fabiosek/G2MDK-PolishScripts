
const int SPL_COST_SUCKENERGY = 30;
const int SPL_SUCKENERGY_DAMAGE = 100;
const int SPL_TIME_SUCKENERGY = 9;

instance SPELL_SUCKENERGY(C_SPELL_PROTO)
{
	time_per_mana = 50;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
};


func int spell_logic_suckenergy(var int manainvested)
{
	if(manainvested == 0)
	{
		return SPL_RECEIVEINVEST;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUCKENERGY)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_suckenergy()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUCKENERGY;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


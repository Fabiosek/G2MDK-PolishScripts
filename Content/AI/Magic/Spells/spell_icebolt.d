
const int SPL_COST_ICEBOLT = 10;
const int SPL_DAMAGE_ICEBOLT = 50;

instance SPELL_ICEBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_ICEBOLT;
};


func int spell_logic_icebolt(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_ICEBOLT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_icebolt()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_ICEBOLT;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


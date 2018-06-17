
const int SPL_COST_BREATHOFDEATH = 100;
const int SPL_DAMAGE_BREATHOFDEATH = 500;

instance SPELL_BREATHOFDEATH(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_BREATHOFDEATH;
	targetcollectrange = 1000;
};


func int spell_logic_breathofdeath(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_BREATHOFDEATH)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_breathofdeath(var int spelllevel)
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_BREATHOFDEATH;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


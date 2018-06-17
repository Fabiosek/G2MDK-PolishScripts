
const int SPL_COST_CONCUSSIONBOLT = 40;
const int SPL_DAMAGE_CONCUSSIONBOLT = 200;

instance SPELL_CONCUSSIONBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_CONCUSSIONBOLT;
};


func int spell_logic_concussionbolt(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_CONCUSSIONBOLT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_concussionbolt()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_CONCUSSIONBOLT;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


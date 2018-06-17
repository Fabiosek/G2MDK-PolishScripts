
const int SPL_COST_FEAR = 50;
const int SPL_TIME_FEAR = 5;

instance SPELL_FEAR(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_fear(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_FEAR)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_fear()
{
	if(other.guild != GIL_DRAGON)
	{
		AI_SetNpcsToState(self,zs_magicflee,1000);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FEAR;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


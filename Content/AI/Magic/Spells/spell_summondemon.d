
const int SPL_COST_SUMMONDEMON = 120;

instance SPELL_SUMMONDEMON(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summondemon(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONDEMON)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summondemon()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONDEMON;
	};
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_demon,1,1000);
	}
	else
	{
		Wld_SpawnNpcRange(self,demon,1,1000);
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


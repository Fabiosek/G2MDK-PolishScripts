
const int SPL_COST_SUMMONZOMBIE = 80;

instance SPELL_SUMMONZOMBIE(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonzombie(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONZOMBIE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonzombie()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONZOMBIE;
	};
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_zombie,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,zombie01,1,500);
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


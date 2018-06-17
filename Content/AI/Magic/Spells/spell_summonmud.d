
const int SPL_COST_SUMMONMUD = 10;

instance SPELL_SUMMONMUD(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonmud(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONMUD)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonmud()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONMUD;
	};
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_mud,1,1000);
	}
	else
	{
		Wld_SpawnNpcRange(self,undead_mud,1,1000);
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


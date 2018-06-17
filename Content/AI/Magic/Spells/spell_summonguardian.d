
const int SPL_COST_SUMMONGUARDIAN = 60;

instance SPELL_SUMMONGUARDIAN(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonguardian(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONGUARDIAN)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonguardian()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONGUARDIAN;
	};
	self.aivar[AIV_SELECTSPELL] = self.aivar[AIV_SELECTSPELL] + 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_guardian,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,stoneguardian,1,500);
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


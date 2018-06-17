
const int SPL_COST_PALLIGHTHEAL = 10;
const int SPL_COST_PALMEDIUMHEAL = 25;
const int SPL_COST_PALFULLHEAL = 50;
const int SPL_COST_LIGHTHEAL = 10;
const int SPL_COST_MEDIUMHEAL = 25;
const int SPL_COST_FULLHEAL = 50;
const int SPL_HEAL_PALLIGHTHEAL = 200;
const int SPL_HEAL_PALMEDIUMHEAL = 400;
const int SPL_HEAL_PALFULLHEAL = 800;
const int SPL_HEAL_LIGHTHEAL = 200;
const int SPL_HEAL_MEDIUMHEAL = 400;
const int SPL_HEAL_FULLHEAL = 800;

instance SPELL_HEAL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
};

instance SPELL_PALHEAL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_CASTER;
	canturnduringinvest = 0;
};


func int spell_logic_pallightheal(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALLIGHTHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_palmediumheal(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALMEDIUMHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_palfullheal(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALFULLHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_lightheal(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_LIGHTHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_mediumheal(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_MEDIUMHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_fullheal(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_FULLHEAL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_heal()
{
	if(Npc_GetActiveSpell(self) == SPL_LIGHTHEAL)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_LIGHTHEAL;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_LIGHTHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_MEDIUMHEAL)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MEDIUMHEAL;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_MEDIUMHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_FULLHEAL)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FULLHEAL;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_FULLHEAL);
		return;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};

func void spell_cast_palheal()
{
	if(Npc_GetActiveSpell(self) == SPL_PALLIGHTHEAL)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALLIGHTHEAL;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_PALLIGHTHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PALMEDIUMHEAL)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALMEDIUMHEAL;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_PALMEDIUMHEAL);
		return;
	};
	if(Npc_GetActiveSpell(self) == SPL_PALFULLHEAL)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALFULLHEAL;
		};
		Npc_ChangeAttribute(self,ATR_HITPOINTS,SPL_HEAL_PALFULLHEAL);
		return;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};



const int SPL_COST_TRFSHEEP = 10;
const int SPL_COST_TRFSCAVENGER = 10;
const int SPL_COST_TRFGIANTRAT = 10;
const int SPL_COST_TRFGIANTBUG = 10;
const int SPL_COST_TRFWOLF = 10;
const int SPL_COST_TRFWARAN = 10;
const int SPL_COST_TRFSNAPPER = 10;
const int SPL_COST_TRFWARG = 10;
const int SPL_COST_TRFFIREWARAN = 10;
const int SPL_COST_TRFLURKER = 10;
const int SPL_COST_TRFSHADOWBEAST = 10;
const int SPL_COST_TRFDRAGONSNAPPER = 10;

instance SPELL_TRANSFORM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	canturnduringinvest = 0;
};


func int spell_logic_trfsheep(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSHEEP))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSHEEP;
		Npc_SetActiveSpellInfo(self,sheep);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfscavenger(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSCAVENGER))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSCAVENGER;
		Npc_SetActiveSpellInfo(self,scavenger);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfgiantrat(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFGIANTRAT))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFGIANTRAT;
		Npc_SetActiveSpellInfo(self,giant_rat);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfgiantbug(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFGIANTBUG))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFGIANTBUG;
		Npc_SetActiveSpellInfo(self,giant_bug);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfwolf(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFWOLF))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFWOLF;
		Npc_SetActiveSpellInfo(self,wolf);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfwaran(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFWARAN))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFWARAN;
		Npc_SetActiveSpellInfo(self,waran);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfsnapper(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSNAPPER))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSNAPPER;
		Npc_SetActiveSpellInfo(self,snapper);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfwarg(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFWARG))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFWARG;
		Npc_SetActiveSpellInfo(self,warg);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trffirewaran(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFFIREWARAN))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFFIREWARAN;
		Npc_SetActiveSpellInfo(self,firewaran);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trflurker(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFLURKER))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFLURKER;
		Npc_SetActiveSpellInfo(self,lurker);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfshadowbeast(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSHADOWBEAST))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSHADOWBEAST;
		Npc_SetActiveSpellInfo(self,shadowbeast);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfdragonsnapper(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFDRAGONSNAPPER))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFDRAGONSNAPPER;
		Npc_SetActiveSpellInfo(self,dragonsnapper);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};


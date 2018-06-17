
const int SPL_COST_PALLIGHT = 10;
const int SPL_COST_LIGHT = 10;
const int SPL_DURATION_PALLIGHT = 5;
const int SPL_DURATION_LIGHT = 5;

instance SPELL_LIGHT(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_PALLIGHT(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};


func int spell_logic_pallight(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_PALLIGHT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_pallight()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALLIGHT;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};

func int spell_logic_light(var int manainvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_LIGHT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_light()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_LIGHT;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


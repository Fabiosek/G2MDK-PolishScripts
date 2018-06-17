
const int SPL_COST_WINDFIST = 80;
const int STEP_WINDFIST = 20;
const int SPL_DAMAGE_WINDFIST = 50;

instance SPELL_WINDFIST(C_SPELL_PROTO)
{
	time_per_mana = 30;
	damage_per_level = SPL_DAMAGE_WINDFIST;
	damagetype = DAM_FLY;
	canturnduringinvest = TRUE;
	targetcollectalgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetcollectrange = 1000;
	targetcollecttype = TARGET_TYPE_NPCS;
};


func int spell_logic_windfist(var int manainvested)
{
	if(self.attribute[ATR_MANA] < STEP_WINDFIST)
	{
		return SPL_DONTINVEST;
	};
	if(manainvested <= (STEP_WINDFIST * 1))
	{
		self.aivar[AIV_SPELLLEVEL] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manainvested > (STEP_WINDFIST * 1)) && (self.aivar[AIV_SPELLLEVEL] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WINDFIST;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_WINDFIST * 2)) && (self.aivar[AIV_SPELLLEVEL] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WINDFIST;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_WINDFIST * 3)) && (self.aivar[AIV_SPELLLEVEL] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WINDFIST;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_WINDFIST * 3)) && (self.aivar[AIV_SPELLLEVEL] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void spell_cast_windfist(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_WINDFIST;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


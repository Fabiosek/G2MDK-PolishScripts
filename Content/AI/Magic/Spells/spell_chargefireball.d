
const int SPL_COST_CHARGEFIREBALL = 160;
const int STEP_CHARGEFIREBALL = 40;
const int SPL_DAMAGE_CHARGEFIREBALL = 75;

instance SPELL_CHARGEFIREBALL(C_SPELL_PROTO)
{
	time_per_mana = 30;
	damage_per_level = SPL_DAMAGE_CHARGEFIREBALL;
	damagetype = DAM_MAGIC;
	canturnduringinvest = TRUE;
};


func int spell_logic_chargefireball(var int manainvested)
{
	if(self.attribute[ATR_MANA] < STEP_CHARGEFIREBALL)
	{
		return SPL_DONTINVEST;
	};
	if(manainvested <= (STEP_CHARGEFIREBALL * 1))
	{
		self.aivar[AIV_SPELLLEVEL] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manainvested > (STEP_CHARGEFIREBALL * 1)) && (self.aivar[AIV_SPELLLEVEL] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEFIREBALL;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_CHARGEFIREBALL * 2)) && (self.aivar[AIV_SPELLLEVEL] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEFIREBALL;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_CHARGEFIREBALL * 3)) && (self.aivar[AIV_SPELLLEVEL] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEFIREBALL;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_CHARGEFIREBALL * 3)) && (self.aivar[AIV_SPELLLEVEL] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void spell_cast_chargefireball(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEFIREBALL;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


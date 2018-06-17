
const int SPL_COST_FIRESTORM = 200;
const int STEP_FIRESTORM = 50;
const int SPL_DAMAGE_FIRESTORM = 75;
const int SPL_PYRO_DAMAGE_PER_SEC = 20;

instance SPELL_PYROKINESIS(C_SPELL_PROTO)
{
	time_per_mana = 30;
	damage_per_level = SPL_DAMAGE_FIRESTORM;
	damagetype = DAM_MAGIC;
	canturnduringinvest = TRUE;
};


func int spell_logic_pyrokinesis(var int manainvested)
{
	if(self.attribute[ATR_MANA] < STEP_FIRESTORM)
	{
		return SPL_DONTINVEST;
	};
	if(manainvested <= (STEP_FIRESTORM * 1))
	{
		self.aivar[AIV_SPELLLEVEL] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manainvested > (STEP_FIRESTORM * 1)) && (self.aivar[AIV_SPELLLEVEL] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_FIRESTORM;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_FIRESTORM * 2)) && (self.aivar[AIV_SPELLLEVEL] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_FIRESTORM;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_FIRESTORM * 3)) && (self.aivar[AIV_SPELLLEVEL] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_FIRESTORM;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_FIRESTORM * 3)) && (self.aivar[AIV_SPELLLEVEL] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void spell_cast_pyrokinesis(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_FIRESTORM;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


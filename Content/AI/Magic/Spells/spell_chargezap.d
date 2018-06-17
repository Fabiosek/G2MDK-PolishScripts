
const int SPL_COST_CHARGEZAP = 40;
const int STEP_CHARGEZAP = 10;
const int SPL_DAMAGE_CHARGEZAP = 30;

instance SPELL_CHARGEZAP(C_SPELL_PROTO)
{
	time_per_mana = 100;
	damage_per_level = SPL_DAMAGE_CHARGEZAP;
	damagetype = DAM_MAGIC;
	canturnduringinvest = TRUE;
};


func int spell_logic_chargezap(var int manainvested)
{
	if(self.attribute[ATR_MANA] < STEP_CHARGEZAP)
	{
		return SPL_DONTINVEST;
	};
	if(manainvested <= (STEP_CHARGEZAP * 1))
	{
		self.aivar[AIV_SPELLLEVEL] = 1;
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if((manainvested > (STEP_CHARGEZAP * 1)) && (self.aivar[AIV_SPELLLEVEL] <= 1))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEZAP;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 2;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_CHARGEZAP * 2)) && (self.aivar[AIV_SPELLLEVEL] <= 2))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEZAP;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 3;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_CHARGEZAP * 3)) && (self.aivar[AIV_SPELLLEVEL] <= 3))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEZAP;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
		self.aivar[AIV_SPELLLEVEL] = 4;
		return SPL_NEXTLEVEL;
	}
	else if((manainvested > (STEP_CHARGEZAP * 3)) && (self.aivar[AIV_SPELLLEVEL] == 4))
	{
		return SPL_DONTINVEST;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void spell_cast_chargezap(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - STEP_CHARGEZAP;
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.aivar[AIV_SELECTSPELL] += 1;
};


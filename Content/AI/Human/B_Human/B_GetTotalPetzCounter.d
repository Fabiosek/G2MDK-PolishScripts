
func int b_gettotalpetzcounter(var C_NPC slf)
{
	if(c_npcbelongstooldcamp(slf))
	{
		return PETZCOUNTER_OLDCAMP_MURDER + PETZCOUNTER_OLDCAMP_THEFT + PETZCOUNTER_OLDCAMP_ATTACK + PETZCOUNTER_OLDCAMP_SHEEPKILLER;
	};
	if(c_npcbelongstocity(slf))
	{
		return PETZCOUNTER_CITY_MURDER + PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER;
	};
	if(c_npcbelongstomonastery(slf))
	{
		return PETZCOUNTER_MONASTERY_MURDER + PETZCOUNTER_MONASTERY_THEFT + PETZCOUNTER_MONASTERY_ATTACK + PETZCOUNTER_MONASTERY_SHEEPKILLER;
	};
	if(c_npcbelongstofarm(slf))
	{
		return PETZCOUNTER_FARM_MURDER + PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER;
	};
	if(c_npcbelongstobl(slf))
	{
		return PETZCOUNTER_BL_MURDER + PETZCOUNTER_BL_THEFT + PETZCOUNTER_BL_ATTACK;
	};
	return 0;
};


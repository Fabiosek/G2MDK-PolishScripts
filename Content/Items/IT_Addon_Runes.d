
const int VALUE_RU_ICELANCE = 1000;
const int VALUE_RU_WHIRLWIND = 1000;
const int VALUE_RU_THUNDERSTORM = 1500;
const int VALUE_RU_GEYSER = 1500;
const int VALUE_RU_WATERFIST = 2000;
const int VALUE_RU_GREENTENTACLE = 2500;
const int VALUE_RU_SWARM = 1500;
const int VALUE_RU_ENERGYBALL = 3500;
const int VALUE_RU_SUCKENERGY = 3500;
const int VALUE_RU_SKULL = 2000;
const int VALUE_RU_SUMMONGUARDIAN = 2000;
const int VALUE_RU_SUMMONZOMBIE = 2000;
const int VALUE_RU_BELIAR = 100;
const int VALUE_RU_WATER = 200;

instance ITRU_THUNDERSTORM(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_THUNDERSTORM;
	visual = "ItRu_Water05.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERSTORM;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_THUNDERSTORM;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_THUNDERSTORM;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_THUNDERSTORM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_WHIRLWIND(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_WHIRLWIND;
	visual = "ItRu_Water02.3DS";
	material = MAT_STONE;
	spell = SPL_WHIRLWIND;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_WHIRLWIND;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_WHIRLWIND;
	text[2] = NAME_SEC_DURATION;
	count[2] = SPL_TIME_WHIRLWIND;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_GEYSER(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_GEYSER;
	visual = "ItRu_Water01.3DS";
	material = MAT_STONE;
	spell = SPL_GEYSER;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_GEYSER;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_GEYSER;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_GEYSER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_WATERFIST(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_WATERFIST;
	visual = "ItRu_Water03.3DS";
	material = MAT_STONE;
	spell = SPL_WATERFIST;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_WATERFIST;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_WATERFIST;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_WATERFIST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_ICELANCE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ICELANCE;
	visual = "ItRu_Water04.3DS";
	material = MAT_STONE;
	spell = SPL_ICELANCE;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	description = NAME_SPL_ICELANCE;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ICELANCE;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_ICELANCE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_BELIARSRAGE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_ENERGYBALL;
	visual = "ItRu_Beliar04.3DS";
	material = MAT_STONE;
	spell = SPL_ENERGYBALL;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_BELIARSRAGE;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_ENERGYBALL;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_ENERGYBALL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUCKENERGY(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUCKENERGY;
	visual = "ItRu_Beliar01.3DS";
	material = MAT_STONE;
	spell = SPL_SUCKENERGY;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SUCKENERGY;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUCKENERGY;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_SUCKENERGY_DAMAGE;
	text[3] = NAME_SEC_DURATION;
	count[3] = SPL_TIME_SUCKENERGY;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_GREENTENTACLE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_GREENTENTACLE;
	visual = "ItRu_Beliar03.3DS";
	material = MAT_STONE;
	spell = SPL_GREENTENTACLE;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_GREENTENTACLE;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_GREENTENTACLE;
	text[2] = NAME_SEC_DURATION;
	count[2] = SPL_TIME_GREENTENTACLE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SWARM(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SWARM;
	visual = "ItRu_Beliar02.3DS";
	material = MAT_STONE;
	spell = SPL_SWARM;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SWARM;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SWARM;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_SWARM_DAMAGE;
	text[3] = NAME_SEC_DURATION;
	count[3] = SPL_TIME_SWARM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SKULL(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SKULL;
	visual = "ItRu_Beliar05.3DS";
	material = MAT_STONE;
	spell = SPL_SKULL;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SKULL;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MINMANAKOSTEN;
	count[1] = SPL_COST_SKULL;
	text[2] = NAME_ADDON_NEEDSALLMANA;
	text[4] = NAME_DAMAGE;
	count[4] = SPL_DAMAGE_SKULL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMMONZOMBIE(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMMONZOMBIE;
	visual = "ItRu_Beliar07.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONZOMBIE;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SUMMONZOMBIE;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONZOMBIE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRU_SUMMONGUARDIAN(C_ITEM)
{
	name = NAME_RUNE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = VALUE_RU_SUMMONGUARDIAN;
	visual = "ItRu_Beliar06.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONGUARDIAN;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = NAME_SPL_SUMMONGUARDIAN;
	text[0] = NAME_MAG_CIRCLE;
	count[0] = mag_circle;
	text[1] = NAME_MANAKOSTEN;
	count[1] = SPL_COST_SUMMONGUARDIAN;
	text[5] = NAME_VALUE;
	count[5] = value;
};


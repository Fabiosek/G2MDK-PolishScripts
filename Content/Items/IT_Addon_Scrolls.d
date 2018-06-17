
const int VALUE_SC_WATER = 1;
const int VALUE_SC_ICELANCE = 100;
const int VALUE_SC_WHIRLWIND = 200;
const int VALUE_SC_GEYSER = 100;
const int VALUE_SC_THUNDERSTORM = 200;
const int VALUE_SC_WATERFIST = 100;

instance ITSC_GEYSER(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_GEYSER;
	visual = "ItSc_Water01.3DS";
	material = MAT_LEATHER;
	spell = SPL_GEYSER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_GEYSER;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_GEYSER;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_ICELANCE(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_ICELANCE;
	visual = "ItSc_Water04.3DS";
	material = MAT_LEATHER;
	spell = SPL_ICELANCE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_ICELANCE;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_ICELANCE;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_WATERFIST(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_WATERFIST;
	visual = "ItSc_Water03.3DS";
	material = MAT_LEATHER;
	spell = SPL_WATERFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_WATERFIST;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_WATERFIST;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_THUNDERSTORM(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_THUNDERSTORM;
	visual = "ItSc_Water05.3DS";
	material = MAT_LEATHER;
	spell = SPL_THUNDERSTORM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_THUNDERSTORM;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAMAGE;
	count[2] = SPL_DAMAGE_THUNDERSTORM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_WHIRLWIND(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_WHIRLWIND;
	visual = "ItSc_Water02.3DS";
	material = MAT_LEATHER;
	spell = SPL_WHIRLWIND;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_WHIRLWIND;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_SEC_DURATION;
	count[2] = SPL_TIME_WHIRLWIND;
	text[5] = NAME_VALUE;
	count[5] = value;
};


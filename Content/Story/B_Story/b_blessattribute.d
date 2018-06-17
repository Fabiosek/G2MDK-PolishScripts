
func void b_blessattribute(var C_NPC oth,var int attrib,var int points)
{
	var string concattext;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
		concattext = ConcatStrings(PRINT_BLESSSTR,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
		concattext = ConcatStrings(PRINT_BLESSDEX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		concattext = ConcatStrings(PRINT_BLESSMANA_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concattext = ConcatStrings(PRINT_BLESSHITPOINTS_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_HITPOINTS)
	{
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_BLESSHITPOINTS,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_MANA)
	{
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		PrintScreen(PRINT_BLESSMANA,-1,-1,FONT_SCREEN,2);
	};
};


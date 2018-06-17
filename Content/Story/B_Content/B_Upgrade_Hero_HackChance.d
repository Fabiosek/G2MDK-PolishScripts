
func void b_upgrade_hero_hackchance(var int wert)
{
	var string concattext;
	concattext = ConcatStrings(PRINT_ADDON_HACKCHANCE,IntToString(wert));
	concattext = ConcatStrings(concattext,")");
	PrintScreen(concattext,-1,34,FONT_SCREENSMALL,2);
	HERO_HACKCHANCE = HERO_HACKCHANCE + wert;
	Snd_Play("Geldbeutel");
};


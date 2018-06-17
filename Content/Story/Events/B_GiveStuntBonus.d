
func void b_givestuntbonus_func()
{
	if(STUNTBONUS_ONCE == FALSE)
	{
		PrintScreen(PRINT_ADDON_STUNTBONUS,-1,45,FONT_SCREEN,2);
		b_giveplayerxp(XP_STUNTBONUS);
		STUNTBONUS_ONCE = TRUE;
		Snd_Play("THRILLJINGLE_01");
	}
	else
	{
		PrintScreen(PRINT_ADDON_EXPLOITBONUS,-1,45,FONT_SCREEN,2);
		b_giveplayerxp(XP_EXPLOITBONUS);
		STUNTBONUS_ONCE = FALSE;
		Snd_Play("MFX_BELIARWEAP");
	};
	SC_MADESTUNT = TRUE;
};

